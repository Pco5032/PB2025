forward
global type w_ws from window
end type
type cb_1 from commandbutton within w_ws
end type
type dw_1 from datawindow within w_ws
end type
end forward

global type w_ws from window
integer width = 3520
integer height = 1980
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
dw_1 dw_1
end type
global w_ws w_ws

on w_ws.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_1,&
this.dw_1}
end on

on w_ws.destroy
destroy(this.cb_1)
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_ws
integer y = 176
integer width = 3456
integer height = 1664
integer taborder = 10
string title = "none"
string dataobject = "d_ws"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_ws
integer x = 128
integer y = 16
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

event clicked;dw_1.insertrow(0)
end event

