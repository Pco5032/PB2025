$PBExportHeader$test2025.sra
$PBExportComments$Generated Application Object
forward
global type test2025 from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type test2025 from application
string appname = "test2025"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 22.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = ""
string appruntimeversion = "22.1.0.2819"
boolean manualsession = false
boolean unsupportedapierror = false
boolean ultrafast = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
long webview2distribution = 0
boolean webview2checkx86 = false
boolean webview2checkx64 = false
string webview2url = "https://developer.microsoft.com/en-us/microsoft-edge/webview2/"
end type
global test2025 test2025

on test2025.create
appname="test2025"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on test2025.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_mdi)
end event

