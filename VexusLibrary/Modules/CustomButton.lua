local TweenUtil = require(script.Parent.Parent.utils.TweenUtil)

local CustomButton = {}
CustomButton.__index = CustomButton

function CustomButton.new(parent, text, position, size)
	local self = setmetatable({}, CustomButton)

	-- Create button
	self.Button = Instance.new("TextButton")
	self.Button.Text = text or "Button"
	self.Button.Size = size or UDim2.new(0, 150, 0, 40)
	self.Button.Position = position or UDim2.new(0, 0, 0, 0)
	self.Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	self.Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	self.Button.Font = Enum.Font.GothamBold
	self.Button.TextSize = 16
	self.Button.Parent = parent

	-- Add hover effect
	self.Button.MouseEnter:Connect(function()
		TweenUtil:Tween(self.Button, { BackgroundColor3 = Color3.fromRGB(80, 80, 80) }, 0.3)
	end)

	self.Button.MouseLeave:Connect(function()
		TweenUtil:Tween(self.Button, { BackgroundColor3 = Color3.fromRGB(50, 50, 50) }, 0.3)
	end)

	-- Add click effect
	self.Button.MouseButton1Click:Connect(function()
		TweenUtil:Tween(self.Button, { BackgroundColor3 = Color3.fromRGB(120, 120, 120) }, 0.1)
		wait(0.1)
		TweenUtil:Tween(self.Button, { BackgroundColor3 = Color3.fromRGB(50, 50, 50) }, 0.2)
	end)

	return self
end

return CustomButton
