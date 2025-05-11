local TweenUtil = require(script.Parent.utils.TweenUtil)
local CustomButton = require(script.Parent.Modules.CustomButton)
local CustomInput = require(script.Parent.Modules.CustomInput)
local CustomSlider = require(script.Parent.Modules.CustomSlider)
local CustomToggle = require(script.Parent.Modules.CustomToggle)
local ProgressBar = require(script.Parent.Modules.ProgressBar)

local Window = {}
Window.__index = Window

-- Window setup
function Window.new(config)
    local self = setmetatable({}, Window)

    -- Create the main window frame
    self.MainWindow = Instance.new("Frame")
    self.MainWindow.Size = UDim2.new(0, 600, 0, 500)
    self.MainWindow.Position = UDim2.new(0.5, -300, 0.5, -250)
    self.MainWindow.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    self.MainWindow.BorderSizePixel = 0
    self.MainWindow.Parent = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
    self.MainWindow.ZIndex = 10

    -- Loading Screen
    self.LoadingScreen = Instance.new("Frame")
    self.LoadingScreen.Size = UDim2.new(1, 0, 1, 0)
    self.LoadingScreen.Position = UDim2.new(0, 0, 0, 0)
    self.LoadingScreen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    self.LoadingScreen.BackgroundTransparency = 0.5
    self.LoadingScreen.BorderSizePixel = 0
    self.LoadingScreen.Parent = self.MainWindow

    -- Loading text
    self.LoadingText = Instance.new("TextLabel")
    self.LoadingText.Text = "Vexus Library"
    self.LoadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.LoadingText.TextSize = 30
    self.LoadingText.Font = Enum.Font.GothamBold
    self.LoadingText.BackgroundTransparency = 1
    self.LoadingText.Size = UDim2.new(1, 0, 1, 0)
    self.LoadingText.TextScaled = true
    self.LoadingText.Parent = self.LoadingScreen

    -- Add smooth fade-in animation for loading screen
    TweenUtil:Tween(self.LoadingScreen, { BackgroundTransparency = 0 }, 1)

    -- Add main window content after a short delay
    wait(2)  -- Wait for the loading screen to be visible

    -- Hide loading screen
    TweenUtil:Tween(self.LoadingScreen, { BackgroundTransparency = 1 }, 0.5)

    -- Create window content
    self.Title = Instance.new("TextLabel")
    self.Title.Text = config.Title or "Vexus Exploit UI"
    self.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.Title.TextSize = 25
    self.Title.Font = Enum.Font.GothamBold
    self.Title.Size = UDim2.new(0, 600, 0, 50)
    self.Title.Position = UDim2.new(0, 0, 0, 0)
    self.Title.BackgroundTransparency = 1
    self.Title.Parent = self.MainWindow

    -- Add custom button
    local button = CustomButton.new(self.MainWindow, "Click Me", UDim2.new(0, 10, 0, 100), UDim2.new(0, 150, 0, 40))
    button.Button.MouseButton1Click:Connect(function()
        print("Button clicked!")
    end)

    -- Add custom input field
    local input = CustomInput.new(self.MainWindow, "Enter Command", UDim2.new(0, 10, 0, 160), UDim2.new(0, 250, 0, 40))

    -- Add custom slider
    local slider = CustomSlider.new(self.MainWindow, 0, 100, 50, UDim2.new(0, 10, 0, 220), UDim2.new(0, 300, 0, 20))

    -- Add custom toggle switch
    local toggle = CustomToggle.new(self.MainWindow, "Enable Feature", UDim2.new(0, 10, 0, 260), UDim2.new(0, 150, 0, 40))

    -- Add a progress bar
    local progressBar = ProgressBar.new(self.MainWindow, UDim2.new(0, 10, 0, 300), UDim2.new(0, 300, 0, 20))
    progressBar:StartProgress(100)

    -- Add a popup dialog
    local function showPopup()
        local popup = Instance.new("Frame")
        popup.Size = UDim2.new(0, 400, 0, 200)
        popup.Position = UDim2.new(0.5, -200, 0.5, -100)
        popup.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        popup.BorderSizePixel = 0
        popup.Parent = self.MainWindow

        local popupText = Instance.new("TextLabel")
        popupText.Text = "Are you sure you want to continue?"
        popupText.TextColor3 = Color3.fromRGB(255, 255, 255)
        popupText.TextSize = 18
        popupText.Font = Enum.Font.GothamBold
        popupText.BackgroundTransparency = 1
        popupText.Size = UDim2.new(1, 0, 0.6, 0)
        popupText.TextScaled = true
        popupText.Position = UDim2.new(0, 0, 0, 20)
        popupText.Parent = popup

        local yesButton = Instance.new("TextButton")
        yesButton.Text = "Yes"
        yesButton.Size = UDim2.new(0, 150, 0, 40)
        yesButton.Position = UDim2.new(0, 20, 0, 140)
        yesButton.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
        yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        yesButton.Font = Enum.Font.GothamBold
        yesButton.Parent = popup

        local noButton = Instance.new("TextButton")
        noButton.Text = "No"
        noButton.Size = UDim2.new(0, 150, 0, 40)
        noButton.Position = UDim2.new(0, 230, 0, 140)
        noButton.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
        noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        noButton.Font = Enum.Font.GothamBold
        noButton.Parent = popup

        -- Add button click actions
        yesButton.MouseButton1Click:Connect(function()
            popup:Destroy()
            print("User clicked Yes")
        end)

        noButton.MouseButton1Click:Connect(function()
            popup:Destroy()
            print("User clicked No")
        end)
    end

    -- Trigger popup after a delay
    wait(4)
    showPopup()

    return self
end

return Window
