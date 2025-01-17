$PBExportHeader$w_testwindow.srw
forward
global type w_testwindow from window
end type
type cb_1 from commandbutton within w_testwindow
end type
end forward

global type w_testwindow from window
integer width = 2213
integer height = 952
boolean titlebar = true
string title = "Test 2025"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
end type
global w_testwindow w_testwindow

on w_testwindow.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_testwindow.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_testwindow
integer x = 750
integer y = 320
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;messagebox("", "test")
end event

