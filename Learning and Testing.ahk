;; Learning and Testing ;;

::ts::
MsgBox, 4, , Would you like to open baidu?
IfMsgBox, No
    Return
Run http://www.baidu.com
MsgBox You pressed YES.
return

;$F3::
while(getkeystate("F3","p"))
{
    MsgBox, You had press F3 to active 'devmgmt.msc'.{enter}
    do_normal_invoke("devmgmt.msc")
    click
}

return

;$F2::
loop
{
    SendInput Just For Test .{enter}
    getkeystate("F2","p")
        break
    click
}
return

;:://var::
MyVar1 = 123
MyVar2 = my string

If MyVar2 = my string
{
MsgBox MyVar2 contains the string ¡°my string¡±.
}
If MyVar1 >= 100
{
MsgBox MyVar1 contains %MyVar1%, which is a number greater than or equal to 100.
}
return

:://tst::
RunWait Notepad
MsgBox The user has finished (Notepad has been closed).
return

:*:]d::
FormatTime, CurrentDateTime,, yyyy/MM/dd HH:mm:ss
SendInput %CurrentDateTime%
return