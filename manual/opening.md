---
title: Opening Files
layout: page 
pager: true
---

# Opening Files from the Command Line {: #files-command-line}

You can call Sigasi from the command line to open files. Just run
`sigasi yourFile.vhd`. You can also drag and drop files on the Sigasi
icon to open them.

You can specify a linenumber by appending `+yourLineNumber` to the
command line. For example: `sigasi test.vhd +10` will open `test.vhd` at
line 10.

You can also specify the project location with the `-p <project path>` parameter.
If the specified project was not open in the workspace yet, this will import
and open the project in the workspace.

Note that the VHDL file you specify on the command line has to be in an
*open Sigasi project* to enjoy all of Sigasi’s powerful editing and
navigation features. If the file you open from the command line is not
in a Sigasi project, Sigasi opens the file as an [external
file](#files-external). This is nevertheless really handy for quick
edits.

This feature enables you to configure Sigasi as default editor for other
EDA tools.

**Note** You could get a firewall warning when you start Sigasi because
Sigasi opens and listens to a port (4444 by default). This is necessary
for the communication between the running Sigasi instance and the
command line executable. Configure your firewall to allow Sigasi access
for opening this port.

## Eclipse Plugin

Eclipse plugin users can also use this feature but need to specify a few
more command line options. You have to type
`eclipse -application com.sigasi.runner.open` instead of `sigasi`. For
example: `eclipse -application com.sigasi.runner.open test.vhd +10` will
open `test.vhd` at line 10.

## Other command line options

You can add some extra parameters to Sigasi to modify the behavior.

* `-help` : show simple command line usage information
* `-data <location>` : specifies the workspace location
* `-noSplash` : do not show the splash screen at startup
* `-application org.eclipse.ui.ide.workbench` : to use the default Eclipse workbench launcher instead of the Sigasi workbench launcher
* `-consoleLog` : log all debug information in the console (in addition to the regular log file)
* `-refresh` : force refresh of workspace
* `-showLocation` : show workspace location in title bar

# External Files

You can edit VHDL files without setting up a project. This feature is
called editing *external files* or *single file mode*. There are several
ways to open VHDL files:

* Drag the files to the editor window.
* Open the file [from the command line](#files-command-line)
* Drag the files to the Sigasi icon
* Click **File \> Open File…**

If the file belongs to a project, Sigasi will open the file as part of
that project. If not Sigasi opens the file as *external file*. **Not all
Sigasi features are available** for external files. Navigation only
works within a file. For the same reason, missing declaration are not
flagged as errors. In general, if you want to benefit from all of the
Sigasi features, you should set up a proper project.

# Setting up Sigasi as Default Editor

## Windows

To configure Sigasi as default VHDL editor in Windows:

* Find a VHDL file in the File Explorer
* Right-click and select **Open with > Choose default program…**
  ![](images/windows_1.png)
* Next click the **Browse** button and select the Sigasi executable (`<path to Sigasi>/sigasi.exe`)
  ![](images/windows_2.png)
* Next Sigasi will appear in the list of programs
* Verify that **"Always use the selected program to open this kind of file"** is enabled
* Confirm with **OK**

Repeat this procedure for `*.vhd` files and for `*.vhdl` files.

## Linux

### KDE

* Find a VHDL file in Dolpin or Konqueror
* Right-click and select **Open with > Other…**
* Enter the path of the Sigasi executable (or use the browse button)
* Click the **Remember application association for this type of file** so that all other VHDL files will also get opened with Sigasi.
* Click **OK**

![Sigasi as default editor in KDE](images/kde.png)

### Gnome

* Find a VHDL file in Nautilus
* Right-click and select **Open with > Other Application…**
* In Use a custom command: Enter the path of the Sigasi executable (or use the **browse** button)
* Click the **Remember this appliation for "VHDL document" files** so that all other VHDL files will also get opened with Sigasi.
* **Click Open**

![Sigasi as default editor in Gnome](images/gnome.png)

## Mac OS X

When I double-click a VHDL file, I want it to open with my favorite VHDL editor. Sigasi Studio, obviously.

Here is how to set this up in Mac OS X:

* Find a VHDL file in the Finder
* Right-click and select **Get Info**
* Select **Open with > Other…** and find your Sigasi Studio application
* Click **Change All…** so that all other VHDL files will also get opened with Sigasi.

Repeat this procedure for `*.vhd` files and for `*.vhdl` files.

![Setting the default application for VHDL files](images/default_application_for_mac.png)

## Altera Quartus II

In Altera Quartus II, open the preferences page in **Tools \> Options \>
General \> Preferred Text Editor**.

![Configuring Sigasi as default VHDL editor in Altera Quartus](images/sigasieditorquartus.png "Configuring Sigasi as default VHDL editor in Altera Quartus")

As command-line options, you should have `%f +%l -p %p`. Optionally you
could add `-noSplash` to skip the splash dialog.

## Xilinx Vivado

You can configure Sigasi to be the preferred editor for Xilinx Vivado.

1. In Xilinx Vivado, Click **Tools > Options...**
2. Open the **General** tab (selected by default)
3. Look for the **Text Editor** section and replace the '**Vivado Text Editor** (default)' with '**Custom Editor...**'
4. Next click the **...** (Custom editor)  button and enter:
    `<path to Sigasi>/sigasi.exe [file name] +[line number]`
5. Click **OK** to close the dialog

![Configuring Sigasi as default editor in Xilinx Vivado menu](images/vivado_a1.png "Configuring Sigasi as default editor in Xilinx Vivado menu")
![Configuring Sigasi as default editor in Xilinx Vivado](images/vivado_a2.png "Configuring Sigasi as default editor in Xilinx Vivado")

## Xilinx ISE

To configure Sigasi as default VHDL editor in Xilinx ISE:

1. In Xilinx ISE, Click **Edit \> Preferences** and **ISE General \> Editors**
2. Select **Custom** instead of **ISE Text Editor**
3. If Sigasi is on your path enter `sigasi.exe $1 +$2` (Windows) or `sigasi $1 +$2` (Linux).
   If Sigasi is not on your path, use the absolute path instead. If there are spaces in this
path, you need to enclose the path in curly braces . For example:`c:\\My\ Applications\sigasi\sigasi.exe $1 +$2`.

![Configuring Sigasi as default VHDL editor in Xilinx ISE](images/xilinxeditor.png "Configuring Sigasi as default VHDL editor in Xilinx ISE")

If you now open any VHDL file in Xilinx ISE, Sigasi will automatically open the selected file.

You can find more info on configuring Xilinx ISE to work with external editors in the [Xilinx documentation](http://www.xilinx.com/support/documentation/sw_manuals/xilinx12_2/pn_db_editor_options.htm).
