#Requires AutoHotkey v2.0
#SingleInstance Force

; Same App Window Switcher
;
; Mimics the macOS Cmd+` behavior on Windows.
; Press Alt+` to switch between windows belonging to the currently active app.
;
; SC029 is the physical ` / ~ key on a standard US keyboard.
; ! means Alt in AutoHotkey, so !SC029 = Alt+`

!SC029::
{
    ; Get the executable name of the currently active application.
    ; Example: chrome.exe, explorer.exe, code.exe
    exe := WinGetProcessName("A")

    ; Find all open windows belonging to that application.
    windows := WinGetList("ahk_exe " exe)

    ; Only do anything when the application has multiple windows.
    if windows.Length > 1 {
        ; Activate another window belonging to the same application.
        hwnd := windows[windows.Length]
        WinActivate(hwnd)

        ; Get the position and dimensions of the newly activated window.
        ; This allows the visual indicator to follow the window across monitors.
        WinGetPos(&x, &y, &w, &h, hwnd)

        ; Create the temporary "ACTIVE WINDOW" indicator.
        indicator := Gui("+AlwaysOnTop -Caption +ToolWindow")

        ; CUSTOMIZE: Indicator font size.
        ; Increase 28 to make the indicator larger, e.g. "s40 Bold".
        indicator.SetFont("s28 Bold")

        ; CUSTOMIZE: Indicator text.
        ; Change this string to display anything you want.
        indicator.AddText("Center", "  ★ ACTIVE WINDOW ★  ")

        ; Render it hidden first so we can determine its actual dimensions.
        indicator.Show("Hide AutoSize")
        indicator.GetPos(,, &iw, &ih)

        ; Center the indicator horizontally within the active window.
        ix := x + (w - iw) / 2

        ; CUSTOMIZE: Vertical position.
        ; 80 means 80 pixels below the top of the active window.
        ; Increase this number to move the indicator farther down.
        iy := y + 80

        ; Display without stealing focus from the window we just activated.
        indicator.Show("NA x" ix " y" iy)

        ; CUSTOMIZE: How long the indicator stays visible.
        ; The value is in milliseconds:
        ;   -1000 = 1 second
        ;   -1500 = 1.5 seconds
        ;   -2000 = 2 seconds
        ;
        ; The negative value tells SetTimer to run only once.
        SetTimer(() => indicator.Destroy(), -1500)
    }
}