# Windows Automation

Small Windows productivity utilities written in [AutoHotkey v2](https://www.autohotkey.com/).

## Scripts

### Same App Window Switcher

`scripts/same-app-window-switcher.ahk`

Adds macOS-style switching between windows belonging to the currently active application.

On macOS, `Cmd + ~` cycles through windows of the current application. Windows does not provide an equivalent global shortcut, so this script adds one.

Press:

```text
Alt + `
```

The `` ` `` key is normally directly below `Esc` on a US keyboard.

When switching windows, the newly activated window briefly displays a large **ACTIVE WINDOW** indicator. This is especially useful when working across multiple monitors.

## Requirements

* Windows
* AutoHotkey v2

Download and install AutoHotkey from:

https://www.autohotkey.com/

This project uses **AutoHotkey v2**, not v1.

## Setup

### 1. Clone the repository

```bash
git clone git@github.com:tucaz/ahk.git
cd ahk
```

Or simply download the repository and extract it somewhere permanent.

For example:

```text
C:\Tools\ahk
```

### 2. Install AutoHotkey v2

Download AutoHotkey from:

https://www.autohotkey.com/

Install AutoHotkey v2 using the normal installer.

### 3. Run the script

Open:

```text
scripts\same-app-window-switcher.ahk
```

Double-click the file.

AutoHotkey should appear in the Windows system tray.

Open multiple windows of the same application and press:

```text
Alt + `
```

The script should switch to another window belonging to that application.

## Start Automatically With Windows

The easiest setup is to let Windows run the `.ahk` script directly at login.

Press:

```text
Win + R
```

Enter:

```text
shell:startup
```

Press Enter.

Windows will open your Startup folder.

Create a shortcut in that folder pointing to:

```text
C:\Tools\ahk\scripts\same-app-window-switcher.ahk
```

Use the actual location where you cloned the repository.

The script will now start automatically whenever you sign in to Windows.

## Compiling to an EXE

Compiling is optional. AutoHotkey can run the `.ahk` file directly.

If you want a standalone executable, right-click:

```text
scripts\same-app-window-switcher.ahk
```

and select:

```text
Compile Script
```

If that option is unavailable, make sure the AutoHotkey script compiler, **Ahk2Exe**, is installed.

Move the resulting executable to:

```text
dist\same-app-window-switcher.exe
```

You can then put a shortcut to the executable in the Windows Startup folder instead of the `.ahk` file.

Compiled executables are intentionally excluded from Git.

## Customization

### Indicator size

Change:

```ahk
indicator.SetFont("s28 Bold")
```

For example:

```ahk
indicator.SetFont("s40 Bold")
```

### Indicator duration

The value is expressed in milliseconds:

```ahk
SetTimer(() => indicator.Destroy(), -1500)
```

For a 2-second indicator:

```ahk
SetTimer(() => indicator.Destroy(), -2000)
```

### Indicator vertical position

This controls how far below the top of the active window the indicator appears:

```ahk
iy := y + 80
```

Increase `80` to move it farther down.

## Updating

Because the Startup shortcut points to the script inside the repository, updating the script is simple:

```bash
git pull
```

The next time the script starts, it will use the updated version.

If it is already running, exit the AutoHotkey script from the system tray and launch it again.

