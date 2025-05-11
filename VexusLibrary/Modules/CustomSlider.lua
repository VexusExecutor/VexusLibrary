local TweenUtil = require(script.Parent.Parent.utils.TweenUtil)

local CustomSlider = {}
CustomSlider.__index = CustomSlider

function CustomSlider.new(parent, minValue, maxValue, initialValue, position, size)
	local self = setmetatable({}, CustomSlider)

	-- Create the slider bar
	self.SliderBar = Instance.new("Frame")
	self.SliderBar.Size = size or UDim2.new(0, 300, 0, 20)
	self.SliderBar.Position = position or UDim2.new(0, 0, 0, 0)
	self.SliderBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	self.SliderBar.BorderSizePixel = 0
	self.SliderBar.Parent = parent

	-- Create the slider knob
	self.SliderKnob = Instance.new("Frame")
	self.SliderKnob.Size = UDim2.new(0, 10, 0, 20)
	self.SliderKnob.Position = UDim2.new(0, (initialValue - minValue) / (maxValue - minValue) * 300, 0, 0)
	self.SliderKnob.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
	self.SliderKnob.BorderSizePixel = 0
	self.SliderKnob.Parent = self.SliderBar

	-- Add drag functionality
	local dragging = false
	self.SliderKnob.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
		end
	end)

	self.SliderKnob.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	self.SliderKnob.InputChanged:Connect(function(input)
		if dragging then
			local newPos = math.clamp(input.Position.X - self.SliderBar.AbsolutePosition.X, 0, 300)
			self.SliderKnob.Position = UDim2.new(0, newPos, 0, 0)
		end
	end)

	return self
end

return CustomSlider
