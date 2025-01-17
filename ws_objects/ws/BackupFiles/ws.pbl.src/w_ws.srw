$PBExportHeader$w_ws.srw
forward
global type w_ws from window
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
dw_1 dw_1
end type
global w_ws w_ws

event open;dw_1.insertrow(0)
end event

on w_ws.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_ws.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_ws
integer y = 16
integer width = 3456
integer height = 1664
integer taborder = 10
string title = "none"
string dataobject = "d_ws"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

