local BASE_URL = "https://raw.githubusercontent.com/VexusExecutor/VexusLibrary/main/modules/"

local function loadModule(moduleName)
    return loadstring(game:HttpGet(BASE_URL .. moduleName .. ".lua", true))()
end

-- Load modules
local TweenUtil = loadModule("TweenUtil")
local Window = loadModule("Window")
local CustomButton = loadModule("CustomButton")
local Input = loadModule("Input")

-- Initialize
local Vexus = {}
Vexus.TweenUtil = TweenUtil
Vexus.Window = Window
Vexus.CustomButton = CustomButton
Vexus.Input = Input

-- Example usage
local mainWindow = Window:Create({
    Title = "Vexus UI Library",
    Size = UDim2.new(0, 600, 0, 400),
    Theme = "Dark",
})

return Vexus
