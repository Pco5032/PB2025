$PBExportHeader$w_crypt.srw
forward
global type w_crypt from w_ancestor
end type
type st_3 from uo_statictext within w_crypt
end type
type sle_key from uo_sle within w_crypt
end type
type cb_1 from uo_cb within w_crypt
end type
type cb_encrypt from uo_cb within w_crypt
end type
type st_2 from uo_statictext within w_crypt
end type
type st_1 from uo_statictext within w_crypt
end type
type sle_crypt from uo_sle within w_crypt
end type
type sle_data from uo_sle within w_crypt
end type
end forward

global type w_crypt from w_ancestor
integer width = 2053
integer height = 484
string title = "Encrypte - Décrypte"
st_3 st_3
sle_key sle_key
cb_1 cb_1
cb_encrypt cb_encrypt
st_2 st_2
st_1 st_1
sle_crypt sle_crypt
sle_data sle_data
end type
global w_crypt w_crypt

type variables
uo_encrypt	iu_encrypt
end variables

on w_crypt.create
int iCurrent
call super::create
this.st_3=create st_3
this.sle_key=create sle_key
this.cb_1=create cb_1
this.cb_encrypt=create cb_encrypt
this.st_2=create st_2
this.st_1=create st_1
this.sle_crypt=create sle_crypt
this.sle_data=create sle_data
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.sle_key
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_encrypt
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.sle_crypt
this.Control[iCurrent+8]=this.sle_data
end on

on w_crypt.destroy
call super::destroy
destroy(this.st_3)
destroy(this.sle_key)
destroy(this.cb_1)
destroy(this.cb_encrypt)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_crypt)
destroy(this.sle_data)
end on

event ue_open;call super::ue_open;iu_encrypt = CREATE uo_encrypt

sle_key.text = gs_CryptKey
end event

event ue_close;call super::ue_close;DESTROY iu_encrypt
end event

type st_3 from uo_statictext within w_crypt
integer x = 805
integer y = 280
integer width = 146
integer textsize = -9
string text = "Key"
alignment alignment = center!
end type

type sle_key from uo_sle within w_crypt
integer x = 951
integer y = 272
integer width = 256
integer height = 80
integer taborder = 10
integer textsize = -9
end type

type cb_1 from uo_cb within w_crypt
integer x = 805
integer y = 192
integer height = 80
string text = "<-- Décrypte"
end type

event clicked;call super::clicked;sle_data.text = iu_encrypt.of_decrypt(sle_crypt.text, sle_key.text)
end event

type cb_encrypt from uo_cb within w_crypt
integer x = 805
integer y = 112
integer height = 80
string text = "Encrypte -->"
end type

event clicked;call super::clicked;sle_crypt.text = iu_encrypt.of_encrypt(sle_data.text, sle_key.text)
end event

type st_2 from uo_statictext within w_crypt
integer x = 1262
integer y = 80
integer width = 713
string text = "Valeur cryptée"
alignment alignment = center!
end type

type st_1 from uo_statictext within w_crypt
integer x = 37
integer y = 80
integer width = 713
string text = "Valeur en clair"
alignment alignment = center!
end type

type sle_crypt from uo_sle within w_crypt
integer x = 1243
integer y = 144
integer width = 731
integer height = 80
integer taborder = 20
integer textsize = -9
end type

type sle_data from uo_sle within w_crypt
integer x = 37
integer y = 144
integer width = 731
integer height = 80
integer taborder = 10
integer textsize = -9
end type

