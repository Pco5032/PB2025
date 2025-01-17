forward
global type w_testmdi from window
end type
type mdi_1 from mdiclient within w_testmdi
end type
type mdirbb_1 from ribbonbar within w_testmdi
end type
type mditbb_1 from tabbedbar within w_testmdi
end type
end forward

global type w_testmdi from window
integer width = 3680
integer height = 1932
boolean titlebar = true
string title = "Test mdi"
string menuname = "m_testmenu"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
mdirbb_1 mdirbb_1
mditbb_1 mditbb_1
end type
global w_testmdi w_testmdi

on w_testmdi.create
if this.MenuName = "m_testmenu" then this.MenuID = create m_testmenu
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.mdirbb_1=create mdirbb_1
this.Control[]={this.mdi_1,&
this.mditbb_1,&
this.mdirbb_1}
end on

on w_testmdi.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mdirbb_1)
destroy(this.mditbb_1)
end on

type mdi_1 from mdiclient within w_testmdi
long BackColor=268435456
end type

type mdirbb_1 from ribbonbar within w_testmdi
int X=0
int Y=0
int Width=0
int Height=596
end type

type mditbb_1 from tabbedbar within w_testmdi
int X=0
int Y=0
int Width=0
int Height=104
end type

