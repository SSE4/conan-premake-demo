conan install . ^
  -s os="Windows" ^
  -s arch="x86_64" ^
  -s compiler="Visual Studio" ^
  -s compiler.runtime="MD" ^
  -s compiler.version="15" ^
  -s build_type="Release"

call activate.bat
premake5 vs2017

call "%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe" -version 15 -property installationPath > .VSINSTALLATION
set /p VSINSTALLATION= < .VSINSTALLATION
del /S /Q .VSINSTALLATION

call "%VSINSTALLATION%\VC\Auxiliary\Build\vcvarsall.bat" amd64

msbuild ConanPremakeDemo.sln /m /property:Configuration=Release
