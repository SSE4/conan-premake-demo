-- premake5.lua

require 'conanpremake'

workspace "ConanPremakeDemo"
   configurations { "Debug", "Release" }
   platforms { "Win32", "x64" }

   filter { "platforms:Win32" }
    system "Windows"
    architecture "x32"

   filter { "platforms:x64" }
    system "Windows"
    architecture "x64"

   includedirs { conan_includedirs }
   libdirs { conan_libdirs }
   links { conan_libs }

project "ConanPremakeDemo"
   kind "ConsoleApp"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"

   files { "**.h", "**.cpp" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
