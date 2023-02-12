@echo off
cls


type .tools\arisbanner.txt

if "%1" == "" (
  powershell write-host -fore Red You must specify a version number!
  echo Please type: "run.bat <VERSION / FOLDER NAME>"
) else (
  echo %1 > %1\version.txt

  powershell write-host -fore DarkYellow unpacking .ini files from %1\Data.p4k...
  .tools\unp4k.exe .\%1\Data.p4k *.ini

  powershell write-host -fore DarkYellow unpacking .json files from %1\Data.p4k...
  .tools\unp4k.exe .\%1\Data.p4k *.json

  powershell write-host -fore DarkYellow unpacking .xml files from %1\Data.p4k...
  .tools\unp4k.exe .\%1\Data.p4k *.xml

  powershell write-host -fore DarkYellow moving data and engine folder...
  move .\Data .\%1
  move .\Engine .\%1

  powershell write-host -fore DarkYellow unforging files...
  .tools\unforge.exe .\%1

  powershell write-host -fore DarkYellow running loader and extracting json files...
  .tools\Loader.exe --input=.\%1 --output=.\%1\json

  powershell write-host -fore Green succesfully extracted files from Data.p4k

  powershell write-host -fore Green succesfully cleaned temp files

  powershell write-host

  if exist latest\ (
    powershell write-host -fore DarkYellow changing latest version...

    set /p Build=<latest\version.txt
    rename latest %Build%
  ) else (
    powershell write-host -fore DarkYellow creating latest version...
  )

  rename %1 latest

  powershell write-host -fore Green succesfully finished script
)