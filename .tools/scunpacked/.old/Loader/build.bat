@echo off

powershell write-host -fore DarkYellow building loader...
dotnet build --no-self-contained --no-incremental -o .tools\scunpacked\Loader\output .tools\scunpacked\Loader

powershell write-host -fore Green successfully builded loader

powershell write-host -fore DarkYellow moving files to .tools directory...
move .tools\scunpacked\Loader\output\* .tools

powershell write-host -fore Green successfully moved files

powershell write-host -fore DarkYellow delete output folder...

powershell write-host
rmdir .tools\scunpacked\Loader\output

powershell write-host
powershell write-host -fore Green successfully finished
