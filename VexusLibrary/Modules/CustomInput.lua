local TweenUtil = require(script.Parent.Parent.utils.TweenUtil)

local CustomInput = {}
CustomInput.__index = CustomInput

function CustomInput.new(parent, placeholder, position, size)
	local self = setmetatable({}, CustomInput)

	-- Create the input box
	self.InputBox = Instance.new("TextBox")
	self.InputBox.PlaceholderText = placeholder or "Enter text..."
	self.InputBox.Size = size or UDim2.new(0, 200, 0, 40)
	self.InputBox.Position = position or UDim2.new(0, 0, 0, 0)
	self.InputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	self.InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	self.InputBox.Font = Enum.Font.Gotham
	self.InputBox.TextSize = 16
	self.InputBox.ClearTextOnFocus = false
	self.InputBox.Parent = parent

	-- Focus animation
	self.InputBox.Focused:Connect(function()
		TweenUtil:Tween(self.InputBox, { BackgroundColor3 = Color3.fromRGB(80, 80, 80) }, 0.3)
	end)

	-- Blur animation
	self.InputBox.FocusLost:Connect(function()
		TweenUtil:Tween(self.InputBox, { BackgroundColor3 = Color3.fromRGB(40, 40, 40) }, 0.3)
	end)

	return self
end

return CustomInput
