#RequireAdmin
Global $tooltip = True, $Current_Version = 1.10
Dim $Win_Key[6] = [ 0, "i", "p", "m", "c", "k"]


HotKeySet("{F10}", "_toggle_tooltip")
HotKeySet("{F11}", "_exit")
AdlibRegister("_Send_key",30000)


$timer = TimerInit()
While 1
    $timer_diff = TimerDiff($timer)
    If $timer_diff > 1000 And $tooltip = True Then
        _tooltip()
        $timer = TimerInit()
    ElseIf $tooltip = False Then
        ToolTip("",0,0)
    EndIf
WEnd

Func _Send_key()
    Sleep(Random(2000,8000,1))
    $title = WinGetTitle("[CLASS:ArcheAge]", "")
    ControlSend($title, "", "", "{space down}")
    Sleep(Random(110,140,1))
    ControlSend($title, "", "", "{space up}")
    Sleep(Random(11000,24000,1))
    _Open_Random_Window()
    Sleep(Random(2000,14000,1))
    _Open_Random_Window()
EndFunc

Func _Open_Random_Window()
    $rnd = Random(1,5,1)
    $title = WinGetTitle("[CLASS:ArcheAge]", "")
    ControlSend($title, "", "", "{" & $Win_Key[$rnd] & " down}")
    Sleep(Random(110,140,1))
    ControlSend($title, "", "", "{" & $Win_Key[$rnd] & " up}")
EndFunc

Func _toggle_tooltip()
    $tooltip = Not $tooltip
EndFunc

Func _tooltip()
    ToolTip("F10: Toggle Tooltip" & @CRLF & "F11: Quit Anti-AFK" & @CRLF & "© Paraly",0,0,"Archeage Anti-AFK " & $Current_Version)
EndFunc

Func _exit()
    Exit
EndFunc