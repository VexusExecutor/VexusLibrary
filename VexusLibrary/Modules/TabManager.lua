local TweenUtil = require(script.Parent.Parent.utils.TweenUtil)

local TabManager = {}
TabManager.__index = TabManager

-- TabManager constructor
function TabManager.new(parent)
	local self = setmetatable({}, TabManager)
	self.Parent = parent
	self.TabButtons = {}
	self.TabPages = {}
	self.CurrentTab = nil

	-- Create the container for tab buttons and tab content
	self.Container = Instance.new("Frame")
	self.Container.Name = "TabContainer"
	self.Container.Size = UDim2.new(1, 0, 1, 0)
	self.Container.Position = UDim2.new(0, 0, 0, 45)
	self.Container.BackgroundTransparency = 1
	self.Container.Parent = self.Parent

	-- Tab Button Bar
	self.ButtonBar = Instance.new("Frame")
	self.ButtonBar.Size = UDim2.new(1, 0, 0, 40)
	self.ButtonBar.Position = UDim2.new(0, 0, 0, 0)
	self.ButtonBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	self.ButtonBar.BorderSizePixel = 0
	self.ButtonBar.Parent = self.Container

	return self
end

-- Add a tab to the TabManager
function TabManager:AddTab(tabName, tabContent)
	local index = #self.TabButtons + 1

	-- Create the tab button
	local button = Instance.new("TextButton")
	button.Text = tabName
	button.Size = UDim2.new(0, 100, 0, 30)
	button.Position = UDim2.new(0, (index - 1) * 110, 0, 5)
	button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.GothamBold
	button.TextSize = 16
	button.Parent = self.ButtonBar

	-- Add hover effect
	button.MouseEnter:Connect(function()
		TweenUtil:Tween(button, { BackgroundColor3 = Color3.fromRGB(100, 100, 100) }, 0.3)
	end)

	button.MouseLeave:Connect(function()
		TweenUtil:Tween(button, { BackgroundColor3 = Color3.fromRGB(55, 55, 55) }, 0.3)
	end)

	-- Create the tab content
	local tabPage = Instance.new("Frame")
	tabPage.Name = tabName
	tabPage.Size = UDim2.new(1, 0, 1, 0)
	tabPage.BackgroundTransparency = 1
	tabPage.Visible = false
	tabPage.Parent = self.Container

	-- Add the provided content to the tab page
	tabContent.Parent = tabPage

	-- Store the button and content for later use
	self.TabButtons[tabName] = button
	self.TabPages[tabName] = tabPage

	-- Set up button click to switch tabs
	button.MouseButton1Click:Connect(function()
		self:SwitchTab(tabName)
	end)

	-- If this is the first tab, activate it
	if #self.TabButtons == 1 then
		self:SwitchTab(tabName)
	end
end

-- Switch the active tab
function TabManager:SwitchTab(tabName)
	-- Hide all tabs
	for _, tabPage in pairs(self.TabPages) do
		tabPage.Visible = false
	end

	-- Show the selected tab
	local selectedTab = self.TabPages[tabName]
	if selectedTab then
		selectedTab.Visible = true
		-- Add a nice transition effect when switching
		TweenUtil:FadeIn(selectedTab, 0.3)
	end

	-- Update button colors
	for tabName, button in pairs(self.TabButtons) do
		if tabName == tabName then
			button.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
		else
			button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
		end
	end
end

return TabManager
