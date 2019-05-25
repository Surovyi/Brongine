workspace "Brongine"
    architecture "x64"

    configurations {
        "Debug",
        "Release",
        "Distribution"
    }

    startproject "Brongine"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "Brongine/vendor/GLFW/include"
-- IncludeDir["GLAD"] = "Brongine/vendor/glad/include"
-- IncludeDir["ImGui"] = "Brongine/vendor/imgui"
-- IncludeDir["glm"] = "Brongine/vendor/glm"

-- group "Dependencies"
    include "Brongine/vendor/GLFW"
--     include "Brongine/vendor/glad"
--     include "Brongine/vendor/imgui"
-- group ""

project "Brongine"
    location "Brongine"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "bropch.h"
    pchsource "Brongine/src/bropch.cpp"

    files {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        -- "%{prj.name}/vendor/glm/glm/**.hpp",
        -- "%{prj.name}/vendor/glm/glm/**.inl"
    }

    defines {
        "_CRT_SECURE_NO_WARNINGS"
    }

    includedirs {
        "%{prj.name}/src",
        -- "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
        -- "%{IncludeDir.GLAD}",
        -- "%{IncludeDir.ImGui}",
        -- "%{IncludeDir.glm}"
    }

    -- links {
    --     "GLFW",
    --     "GLAD",
    --     "ImGui",
    --     "opengl32.lib"
    -- }


    filter "system:windows"
        systemversion "latest"

        defines {
            "BRO_PLATFORM_WINDOWS",
            "BRO_BUILD_DLL",
            "GLFW_INCLUDE_NONE"
        }

    filter "configurations:Debug"
        defines "BRO_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "BRO_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Distribution"
        defines "BRO_DIST"
        runtime "Release"
        symbols "on"

project "GameBox"
    location "GameBox"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
    }

    includedirs {
        -- "Engine/vendor/spdlog/include",
        "Brongine/src",
        "Brongine/vendor/",
        -- "%{IncludeDir.glm}"
    }

    links {
        "Brongine"
    }

    filter "system:windows"
        systemversion "latest"

        defines {
            "BRO_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "BRO_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "BRO_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Distribution"
        defines "BRO_DIST"
        runtime "Release"
        symbols "on"
