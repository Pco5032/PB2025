forward
global type w_testwindow from window
end type
type st_1 from statictext within w_testwindow
end type
type gb_1 from groupbox within w_testwindow
end type
end forward

global type w_testwindow from window
integer width = 2446
integer height = 980
boolean titlebar = true
string title = "Test main Window"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
gb_1 gb_1
end type
global w_testwindow w_testwindow

on w_testwindow.create
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.gb_1}
end on

on w_testwindow.destroy
destroy(this.st_1)
destroy(this.gb_1)
end on

type st_1 from statictext within w_testwindow
integer x = 896
integer y = 320
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TEST"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_testwindow
integer x = 658
integer y = 160
integer width = 914
integer height = 480
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
end type

