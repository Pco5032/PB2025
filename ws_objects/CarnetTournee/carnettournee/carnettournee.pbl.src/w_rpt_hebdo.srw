﻿$PBExportHeader$w_rpt_hebdo.srw
$PBExportComments$Déclaration hebdomadaire
forward
global type w_rpt_hebdo from w_ancestor_rptpreview
end type
end forward

global type w_rpt_hebdo from w_ancestor_rptpreview
string tag = "TEXT_00696"
string title = "Déclaration hebdomadaire"
end type
global w_rpt_hebdo w_rpt_hebdo

type variables
string	is_matricule
integer	ii_annee, ii_semaine
end variables

on w_rpt_hebdo.create
call super::create
end on

on w_rpt_hebdo.destroy
call super::destroy
end on

event ue_init;call super::ue_init;str_params	lstr_params

// attribuer un nom de modèle
wf_setmodel("HEBDO")

// Choix du matricule, année et semaine
Open(w_options_dec_hebdo)
IF Message.DoubleParm = -1 THEN
	post close(this)
	return
END IF
lstr_params = Message.PowerObjectParm
IF upperbound(lstr_params.a_param) = 3 THEN
	is_matricule = string(lstr_params.a_param[1])
	ii_annee = integer(lstr_params.a_param[2])
	ii_semaine = integer(lstr_params.a_param[3])
ELSE
	gu_message.uf_unexp("Erreur d'initialisation")
	post close(this)
END IF

// pas de critères par défaut
wf_ResetDefaults()
wf_ShowSelection(FALSE)
wf_SQLFromDW(FALSE)

end event

event ue_manualsql;call super::ue_manualsql;string	ls_sql, ls_where

ls_sql = dw_1.GetSqlselect()
ls_where = "realise.matricule='" + is_matricule + "' and realise.annee=" + string(ii_annee) + &
			  " and realise.semaine=" + string(ii_semaine)
ls_sql = f_modifysql(ls_sql, ls_where, "", "")
dw_1.SetSqlselect(ls_sql)
return(1)
end event

event ue_retrieve;call super::ue_retrieve;long	ll_rows

ll_rows = AncestorReturnValue

IF ll_rows <= 0 THEN 
	gu_message.uf_info(gu_translate.uf_getlabel(is_tag_nodata, "Aucune donnée ne correspond à votre requête"))
	return(ll_rows)
END IF

// traduction après le retrieve sinon les nested reports ne sont pas disponibles
this.setredraw(FALSE)
event ue_translate()
this.setredraw(TRUE)

return(ll_rows)
end event

event ue_before_ueopen;call super::ue_before_ueopen;// Report avec nested : reporter traduction après lecture des données (voir ue_retrieve)
wf_deferTranslate(TRUE)
end event

type cb_defaults from w_ancestor_rptpreview`cb_defaults within w_rpt_hebdo
end type

type st_2 from w_ancestor_rptpreview`st_2 within w_rpt_hebdo
end type

type st_1 from w_ancestor_rptpreview`st_1 within w_rpt_hebdo
end type

type dw_papersize from w_ancestor_rptpreview`dw_papersize within w_rpt_hebdo
end type

type cb_next from w_ancestor_rptpreview`cb_next within w_rpt_hebdo
end type

type cb_prev from w_ancestor_rptpreview`cb_prev within w_rpt_hebdo
end type

type dw_1 from w_ancestor_rptpreview`dw_1 within w_rpt_hebdo
string dataobject = "d_rpt_hebdo"
end type

type em_zoom from w_ancestor_rptpreview`em_zoom within w_rpt_hebdo
end type

type st_zoom from w_ancestor_rptpreview`st_zoom within w_rpt_hebdo
end type

type gb_1 from w_ancestor_rptpreview`gb_1 within w_rpt_hebdo
end type

type dw_paperorient from w_ancestor_rptpreview`dw_paperorient within w_rpt_hebdo
end type

