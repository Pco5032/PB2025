﻿$PBExportHeader$w_creance_taux.srw
$PBExportComments$Créances : taux des points et indemnités
forward
global type w_creance_taux from w_ancestor_dataentry
end type
type dw_ft from uo_datawindow_multiplerow within w_creance_taux
end type
type dw_interim from uo_datawindow_multiplerow within w_creance_taux
end type
type st_1 from uo_statictext within w_creance_taux
end type
type st_2 from uo_statictext within w_creance_taux
end type
type gb_2 from uo_groupbox within w_creance_taux
end type
type gb_1 from uo_groupbox within w_creance_taux
end type
end forward

global type w_creance_taux from w_ancestor_dataentry
string tag = "TEXT_00827"
integer width = 3109
integer height = 1924
string title = "Déclarations de créances : paramétrage des divers taux"
long backcolor = 16777215
dw_ft dw_ft
dw_interim dw_interim
st_1 st_1
st_2 st_2
gb_2 gb_2
gb_1 gb_1
end type
global w_creance_taux w_creance_taux

forward prototypes
public function integer wf_init ()
end prototypes

public function integer wf_init ();IF dw_ft.retrieve() < 0 THEN
	return(-1)
END IF
IF dw_interim.retrieve() < 0 THEN
	return(-1)
END IF

wf_actif(true)
return(1)
end function

on w_creance_taux.create
int iCurrent
call super::create
this.dw_ft=create dw_ft
this.dw_interim=create dw_interim
this.st_1=create st_1
this.st_2=create st_2
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_ft
this.Control[iCurrent+2]=this.dw_interim
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.gb_2
this.Control[iCurrent+6]=this.gb_1
end on

on w_creance_taux.destroy
call super::destroy
destroy(this.dw_ft)
destroy(this.dw_interim)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event ue_init_menu;call super::ue_init_menu;f_menuaction({"m_ajouter", "m_supprimer", "m_enregistrer", "m_abandonner", "m_fermer"})
end event

event ue_init_win;call super::ue_init_win;IF wf_init() = -1 THEN
	post Close(this)
	return
END IF
end event

event ue_open;call super::ue_open;// icône(s) à rendre visible(s) dans le menu
wf_SetItemsToShow({"m_ajouter", "m_supprimer"})

// initialiser liste des DW modifiables
wf_SetDWList({dw_ft, dw_interim})

// divers settings des DW
dw_ft.uf_autoselectrow(FALSE)
dw_interim.uf_autoselectrow(FALSE)
dw_ft.uf_createwhenlastdeleted(FALSE)
dw_interim.uf_createwhenlastdeleted(FALSE)


end event

event ue_enregistrer;call super::ue_enregistrer;long	ll_row, ll_found

// contrôle de validité de tous les champs
IF dw_ft.event ue_checkall() < 0 THEN
	dw_ft.SetFocus()
	return(-1)
END IF
IF dw_interim.event ue_checkall() < 0 THEN
	dw_interim.SetFocus()
	return(-1)
END IF

IF gu_dwservices.uf_updatetransact(dw_ft, dw_interim) = 1 THEN
	// rafraîchir affichage
	wf_init()
	wf_message("Taux enregistré avec succès")
	return(1)
ELSE
	populateerror(20000, "")
	gu_message.uf_unexp("CAL_FERIES : Erreur lors de la mise à jour de la base de données")
	return(-1)
END IF

end event

event ue_ajouter;call super::ue_ajouter;CHOOSE CASE wf_GetActivecontrolname()
	CASE "dw_ft"
		dw_ft.event ue_addrow()
	CASE "dw_interim"
		dw_interim.event ue_addrow()
	CASE ELSE
		gu_message.uf_info("Veuillez d'abord placer le curseur sur l'entité à ajouter")
END CHOOSE
end event

event ue_supprimer;call super::ue_supprimer;CHOOSE CASE wf_GetActivecontrolname()
	CASE "dw_ft"
		dw_ft.event ue_delete()
	CASE "dw_interim"
		dw_interim.event ue_delete()
	CASE ELSE
		gu_message.uf_info("Veuillez d'abord placer le curseur sur l'entité à ajouter")
END CHOOSE
end event

type ddlb_message from w_ancestor_dataentry`ddlb_message within w_creance_taux
integer x = 37
integer y = 1744
end type

type dw_ft from uo_datawindow_multiplerow within w_creance_taux
integer x = 649
integer y = 176
integer width = 1792
integer height = 640
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_taux_ft"
boolean vscrollbar = true
boolean border = true
end type

event ue_itemvalidated;call super::ue_itemvalidated;this.object.datemaj[al_row] = f_today()
this.object.auteur[al_row] = gs_username
end event

type dw_interim from uo_datawindow_multiplerow within w_creance_taux
integer x = 18
integer y = 1024
integer width = 3054
integer height = 640
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_taux_interim"
boolean vscrollbar = true
boolean border = true
end type

event ue_itemvalidated;call super::ue_itemvalidated;this.object.datemaj[al_row] = f_today()
this.object.auteur[al_row] = gs_username
end event

type st_1 from uo_statictext within w_creance_taux
integer x = 923
integer y = 64
integer width = 1243
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 700
long textcolor = 8388608
long backcolor = 16777215
string text = "Taux du point des frais de tournée"
end type

type st_2 from uo_statictext within w_creance_taux
integer x = 1097
integer y = 912
integer width = 896
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 700
long textcolor = 8388608
long backcolor = 16777215
string text = "Taux indexé des intérims"
end type

type gb_2 from uo_groupbox within w_creance_taux
integer width = 3090
integer height = 880
integer taborder = 10
long backcolor = 16777215
end type

type gb_1 from uo_groupbox within w_creance_taux
integer y = 848
integer width = 3090
integer height = 880
integer taborder = 20
long backcolor = 16777215
end type

