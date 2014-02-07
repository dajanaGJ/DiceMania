#!Nsis Installer Command Script
#
# This is an NSIS Installer Command Script generated automatically
# by the Fedora nsiswrapper program.  For more information see:
#
#   http://fedoraproject.org/wiki/MinGW
#
# To build an installer from the script you would normally do:
#
#   makensis this_script
#
# which will generate the output file 'installer.exe' which is a Windows
# installer containing your program.

# Modern UI
!include MUI2.nsh

Name "DiceMania"
InstallDir "$PROGRAMFILES\DiceMania"
InstallDirRegKey HKLM SOFTWARE\DiceMania "Install_Dir"

VIAddVersionKey "ProductName" "DiceMania"
VIAddVersionKey "CompanyName" "DiceMania"
VIAddVersionKey "LegalCopyright" "Copyright DiceMania 2013"
VIAddVersionKey "FileDescription" "DiceMania installer"
VIAddVersionKey "FileVersion" "VERSIONDATA1"

VIProductVersion "VERSIONDATA2"

ShowInstDetails hide
ShowUninstDetails hide

SetCompressor /FINAL /SOLID lzma
SetCompressorDictSize 64
CRCCheck force

XPStyle on

RequestExecutionLevel admin

!define MUI_COMPONENTSPAGE_NODESC

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "license.txt"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

ComponentText "Select which optional components you want to install."

DirText "Please select the installation folder."

Section "DiceMania program"
  SectionIn RO

  SetOutPath "$INSTDIR"
  File /r "*.*"

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\DiceMania" \
                 "DisplayName" "DiceMania"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\DiceMania" \
                 "Publisher" "DiceMania"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\DiceMania" \
                 "DisplayIcon" "$\"$INSTDIR\chrome\icons\default\default.ico$\""
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\DiceMania" \
                 "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\DiceMania" \
                 "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"
SectionEnd

Section "Start Menu Shortcuts"
  CreateDirectory "$SMPROGRAMS\DiceMania"
  CreateShortCut "$SMPROGRAMS\DiceMania\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\DiceMania\DiceMania.lnk" "$INSTDIR\DiceMania.exe" "" "$INSTDIR\chrome\icons\default\main.ico" 0
SectionEnd

Section "Desktop Icons"
  CreateShortCut "$DESKTOP\DiceMania.lnk" "$INSTDIR\DiceMania.exe" "" "$INSTDIR\chrome\icons\default\main.ico" 0
SectionEnd

Section "Uninstall"
  Delete /rebootok "$DESKTOP\DiceMania.lnk"
  RMDir /r "$SMPROGRAMS\DiceMania"
  RMDir /r "$INSTDIR"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\DiceMania"
SectionEnd

Section -post
  WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd
