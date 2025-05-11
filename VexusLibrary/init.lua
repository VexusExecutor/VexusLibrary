-- Init.lua
-- Entry point for Vexus Library, designed for Executor use

-- Function to load modules dynamically from the file system
local function loadModule(moduleName)
    local success, module = pcall(function()
        -- Change the path based on where you store the modules on your PC
        return loadfile("C:\\Users\\Up24t\\OneDrive\\Desktop\\VexusLibrary\\Modules\\" .. moduleName .. ".lua")()
    end)

    if not success then
        warn("Failed to load module: " .. moduleName)
    end
    return module
end

-- Load all necessary modules
local Window = loadModule("Window")
local CustomButton = loadModule("CustomButton")
local CustomInput = loadModule("CustomInput")
-- Add more modules as needed

-- Initialize the UI components
if Window and Window.init then
    Window.init()  -- Initialize the window
end

if CustomButton and CustomButton.init then
    CustomButton.init()  -- Initialize the custom button
end

if CustomInput and CustomInput.init then
    CustomInput.init()  -- Initialize the custom input
end

-- Add initialization calls for other modules here

-- Optional: Add any setup or customization for your UI here
print("Vexus Library Initialized")
