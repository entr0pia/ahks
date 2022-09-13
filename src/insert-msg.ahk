#InstallKeybdHook
#SingleInstance

title := "Insert-Tip"
insert_on := "Insert-Key Enabled"
insert_off := "Insert-Key Diasbled"

Loop {
    KeyWait Insert, "D"
    is_enabled := GetKeyState("Insert", "T")
    if is_enabled {
        TrayTip, %title%, %insert_on%, 1, 0x11
    } else {
        TrayTip, %title%, %insert_off%, 1, 0x11
    }
}

return