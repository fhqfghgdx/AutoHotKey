;字符串替换

:*:f163::（邮箱）
:*:120::（身份证号）
:*:189::（手机号）
:O:tyl::（姓名）

:*:   ::{space}{space}{space}{space}{space}{space}{space}{space}
:O:ks::kernel skills：

;IP相关
:*:1112::192.168.1.201
:*:p1112::ping 192.168.1.2 -t {enter}

;Microsoft Office
do_office_invoke(exe)
{
    if (A_ComputerName = "Work-PC Name")
        run "D:\Microsoft Office\Office15\%exe%"
    else
        run "D:\office 2016\Office16\%exe%"
}

^!e:: do_office_invoke("EXCEL.EXE")
^!w:: do_office_invoke("WINWORD.EXE")
^!p:: do_office_invoke("POWERPNT.EXE")
;^!o:: do_office_invoke("ONENOTE.EXE")        ; for OnetasticInstaller
^!v:: do_office_invoke("VISIO.EXE")

;软件快速打开
do_normal_invoke(exe)
{
    if (A_ComputerName = "Work-PC Name")
        run "E:\NS-SYN\Work-PC\Software shortcut\%exe%.lnk"
    else if (A_ComputerName = "Home-PC Name")
        run "E:\NS-SYN\Home-PC\Software shortcut\%exe%.lnk"
    else
        SendInput Unknown PC.
}

^!c::do_normal_invoke("win32calc.exe")
#n::do_normal_invoke("notepad++.exe")
!q::do_normal_invoke("QTranslate.exe")
#c::Run cmd

~/::
Input, UserInput, V T2 C, , /ns,/xm,/snip,/seer,/fdm,/tv,/netmail,/wsk,/kp,/netmusic,/ls,/si,/ahk,/ditto,/svn,/sc,/mstsc,/date,/time,/tima,/wb,/bt,/tm,/dm,/sys,/csdn,/gfs,/bdy,/bc,/fb,/le,/pp,/wx,/yk,/181,/od,/ie,/md,/py,/qt,/xh
if (ErrorLevel != "Match")
    return
if (ErrorLevel = "NewInput")
    return

StringLength := StrLen(UserInput) + 1
SendInput {BackSpace %StringLength%}

;;; Work&Home-PC Similar ;;;
if (UserInput = "/ns")
    do_normal_invoke("Nutstore.exe")
else if (UserInput = "/xm")
    do_normal_invoke("XMind.exe")
else if (UserInput = "/snip")
    do_normal_invoke("Snipaste.exe")
else if (UserInput = "/seer")
    do_normal_invoke("Seer.exe")
else if (UserInput = "/fdm")
    do_normal_invoke("fdm.exe")
else if (UserInput = "/tv")
    do_normal_invoke("TeamViewer.exe")
else if (UserInput = "/netmail")
    do_normal_invoke("mailmaster.exe")
else if (UserInput = "/wsk")
    do_normal_invoke("Wireshark.exe")
else if (UserInput = "/kp")
    do_normal_invoke("KeePass.exe")
else if (UserInput = "/netmusic")
    do_normal_invoke("cloudmusic.exe")
else if (UserInput = "/ls")
    do_normal_invoke("Listary.exe")
else if (UserInput = "/si")
    do_normal_invoke("sourceinsight4.exe")
else if (UserInput = "/bc")
    do_normal_invoke("BCompare.exe")
else if (UserInput = "/ahk")
    do_normal_invoke("AutoHotkey_cn.chm")
else if (UserInput = "/ditto")
    do_normal_invoke("Ditto.exe")
else if (UserInput = "/pp")
    do_normal_invoke("PotPlayerMini64.exe")
else if (UserInput = "/od")
    do_normal_invoke("OneDrive.exe")
else if (UserInput = "/date")
    SendInput %A_YYYY%/%A_MM%/%A_DD%
else if (UserInput = "/time")
    SendInput %A_YYYY%/%A_MM%/%A_DD% %A_Hour%:%A_Min%:%A_Sec%
else if (UserInput = "/tima")
    SendInput %A_YYYY%%A_MM%%A_DD%-%A_Hour%%A_Min%%A_Sec%
else if (UserInput = "/csdn")
    Run http://www.csdn.net/
else if (UserInput = "/gfs")
    Run http://gufenso.huizhanzhang.com/
else if (UserInput = "/tm")                ;打开任务管理器
    do_normal_invoke("taskmgr.exe")
else if (UserInput = "/dm")                ;打开设备管理器
    do_normal_invoke("devmgmt.msc")
else if (UserInput = "/sys")                 ;打开系统信息
    do_normal_invoke("msinfo32.exe")
else if (UserInput = "/md")
    do_normal_invoke("MarkdownPad 2")
else if (UserInput = "/py")
    do_normal_invoke("IDLE (Python 3.6 64-bit)")
else if (UserInput = "/qt")
    do_normal_invoke("QTranslate.exe")
;;; Work&Home-PC Difference ;;;
else if (A_ComputerName = "Work-PC Name")
{
    if (UserInput  = "/svn")
        do_normal_invoke("TortoiseSVN Repository Browser")
    else if (UserInput = "/181")
        Run \\192.168.1.181\XXX
    else if (UserInput = "/sc")
        SendInput [修改记录]{enter}{enter}{enter}[提交人]{enter}XXX{enter}{enter}[提交日期]{enter}%A_YYYY%-%A_MM%-%A_DD%
    else if (UserInput = "/mstsc")        ;打开远程连接
        do_normal_invoke("mstsc.exe")
    else if (UserInput = "/ie") {
        do_normal_invoke("Internet Explorer")
    }
    else if (UserInput = "/bt")
        SendInput 周工作总结-XXX-%A_YYYY%-%A_MM%-%A_DD%
    else if (UserInput = "/wb")
        SendInput %A_YYYY%-%A_MM%-%A_DD% 日总结：{enter}1.{space}
    else if (UserInput = "/xh")
        do_normal_invoke("Xshell.exe")
}
else if (A_ComputerName = "Home-PC Name")
{
    if (UserInput = "/bdy")
        do_normal_invoke("baidunetdisk.exe")
    else if (UserInput = "/fb")
        do_normal_invoke("foobar2000.exe")
    else if (UserInput = "/le")
        do_normal_invoke("LeTVLoader.exe")
    else if (UserInput = "/wx")
        do_normal_invoke("WeChat.exe")
    else if (UserInput = "/yk")
        do_normal_invoke("YoukuDesktop.exe")
}
return


;快速搜索
;一键百度
!b::
Run http://www.baidu.com/s?wd=%clipboard%
return

;一键淘宝
!t::
Run http://s.taobao.com/search?q=%clipboard%
return

;一键京东
!j::
Run http://search.jd.com/Search?keyword=%clipboard%
return

;一键谷歌
!g::
run https://d.ggkai.men/search?ie=utf-8&shb=1&q=%clipboard%
return

;一键Bing
!+b::
run https://www.bing.com/search?q=%clipboard%&qs=n&form=QBLH&sp=-1&pq=%clipboard%&sc=8-7&sk=&cvid=F692AEB409BF4B9BBC088D606ABFC00E
return