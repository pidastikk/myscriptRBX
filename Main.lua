-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local MENU = Instance.new("Frame")
local TABS = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TAB_VISUAL = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local TAB_MOVEMENT = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local TOP = Instance.new("Frame")
local CheatName = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local Version = Instance.new("TextLabel")
local Version_2 = Instance.new("TextLabel")
local UICorner_5 = Instance.new("UICorner")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UICorner_6 = Instance.new("UICorner")
local Movement = Instance.new("Folder")
local BTN_NOCLIP = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local Visual = Instance.new("Folder")
local BTN_ITEMESP = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local BTN_PLAYERESP = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local BTN_ALWAYSDAY = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local BTN_FOVCHANGE = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local FOVInput = Instance.new("TextBox")
local UICorner_12 = Instance.new("UICorner")
local BTN_TIMECHANGE = Instance.new("TextButton")
local UICorner_13 = Instance.new("UICorner")
local TimeInput = Instance.new("TextBox")
local UICorner_14 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MENU.Name = "MENU"
MENU.Parent = ScreenGui
MENU.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MENU.BackgroundTransparency = 1.000
MENU.BorderColor3 = Color3.fromRGB(20, 20, 20)
MENU.BorderSizePixel = 0
MENU.Position = UDim2.new(0.211723641, 0, 0.18837063, 0)
MENU.Size = UDim2.new(0.575999975, 0, 0.623000026, 0)
MENU.ZIndex = 0

TABS.Name = "TABS"
TABS.Parent = MENU
TABS.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TABS.BackgroundTransparency = 0.100
TABS.BorderColor3 = Color3.fromRGB(0, 0, 0)
TABS.BorderSizePixel = 0
TABS.Position = UDim2.new(0, 0, 0.0289999992, 0)
TABS.Size = UDim2.new(0.225549668, 0, 0.971381068, 0)

UICorner.CornerRadius = UDim.new(0, 25)
UICorner.Parent = TABS

TAB_VISUAL.Name = "TAB_VISUAL"
TAB_VISUAL.Parent = TABS
TAB_VISUAL.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
TAB_VISUAL.BorderColor3 = Color3.fromRGB(0, 0, 0)
TAB_VISUAL.BorderSizePixel = 0
TAB_VISUAL.Position = UDim2.new(0.0250000004, 0, 0.0780000016, 0)
TAB_VISUAL.Size = UDim2.new(0.949999988, 0, 0.120999999, 0)
TAB_VISUAL.ZIndex = 2
TAB_VISUAL.Font = Enum.Font.Jura
TAB_VISUAL.Text = "Visual"
TAB_VISUAL.TextColor3 = Color3.fromRGB(190, 190, 190)
TAB_VISUAL.TextSize = 34.000

UICorner_2.CornerRadius = UDim.new(0, 10)
UICorner_2.Parent = TAB_VISUAL

TAB_MOVEMENT.Name = "TAB_MOVEMENT"
TAB_MOVEMENT.Parent = TABS
TAB_MOVEMENT.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
TAB_MOVEMENT.BorderColor3 = Color3.fromRGB(0, 0, 0)
TAB_MOVEMENT.BorderSizePixel = 0
TAB_MOVEMENT.Position = UDim2.new(0.0250000004, 0, 0.206, 0)
TAB_MOVEMENT.Size = UDim2.new(0.949999988, 0, 0.120999999, 0)
TAB_MOVEMENT.ZIndex = 2
TAB_MOVEMENT.Font = Enum.Font.Jura
TAB_MOVEMENT.Text = "Movement"
TAB_MOVEMENT.TextColor3 = Color3.fromRGB(190, 190, 190)
TAB_MOVEMENT.TextSize = 34.000

UICorner_3.CornerRadius = UDim.new(0, 10)
UICorner_3.Parent = TAB_MOVEMENT

TOP.Name = "TOP"
TOP.Parent = MENU
TOP.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TOP.BorderColor3 = Color3.fromRGB(0, 0, 0)
TOP.BorderSizePixel = 0
TOP.Position = UDim2.new(-9.98270625e-05, 0, -0.00129097071, 0)
TOP.Size = UDim2.new(0.99999994, 0, 0.100000061, 0)
TOP.ZIndex = 2

CheatName.Name = "CheatName"
CheatName.Parent = TOP
CheatName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CheatName.BackgroundTransparency = 1.000
CheatName.BorderColor3 = Color3.fromRGB(0, 0, 0)
CheatName.BorderSizePixel = 0
CheatName.Position = UDim2.new(1.00627512e-05, 0, 0.079491362, 0)
CheatName.Size = UDim2.new(0, 180, 0, 45)
CheatName.Font = Enum.Font.Jura
CheatName.Text = "Arcide.cc"
CheatName.TextColor3 = Color3.fromRGB(190, 190, 190)
CheatName.TextSize = 45.000
CheatName.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0, 15)
UICorner_4.Parent = TOP

Version.Name = "Version"
Version.Parent = TOP
Version.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Version.BackgroundTransparency = 1.000
Version.BorderColor3 = Color3.fromRGB(0, 0, 0)
Version.BorderSizePixel = 0
Version.Position = UDim2.new(0.85307765, 0, 0.299099565, 0)
Version.Size = UDim2.new(0, 180, 0, 45)
Version.Font = Enum.Font.Michroma
Version.Text = "v1.2.0"
Version.TextColor3 = Color3.fromRGB(190, 190, 190)
Version.TextSize = 14.000
Version.TextWrapped = true

Version_2.Name = "Version"
Version_2.Parent = TOP
Version_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Version_2.BackgroundTransparency = 1.000
Version_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Version_2.BorderSizePixel = 0
Version_2.Position = UDim2.new(0.875559688, 0, -0.000366168038, 0)
Version_2.Size = UDim2.new(0, 99, 0, 34)
Version_2.Font = Enum.Font.Michroma
Version_2.Text = "[U] Menu Bind"
Version_2.TextColor3 = Color3.fromRGB(190, 190, 190)
Version_2.TextSize = 14.000
Version_2.TextWrapped = true

UICorner_5.CornerRadius = UDim.new(0, 25)
UICorner_5.Parent = MENU

ScrollingFrame.Parent = MENU
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
ScrollingFrame.BackgroundTransparency = 0.200
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.224730387, 0, 0.0286190156, 0)
ScrollingFrame.Size = UDim2.new(0.77516973, 0, 0.971381068, 0)
ScrollingFrame.ZIndex = 0
ScrollingFrame.ScrollBarThickness = 10

UICorner_6.CornerRadius = UDim.new(0, 25)
UICorner_6.Parent = ScrollingFrame

Movement.Name = "Movement"
Movement.Parent = ScrollingFrame

BTN_NOCLIP.Name = "BTN_NOCLIP"
BTN_NOCLIP.Parent = Movement
BTN_NOCLIP.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
BTN_NOCLIP.BorderColor3 = Color3.fromRGB(0, 0, 0)
BTN_NOCLIP.BorderSizePixel = 0
BTN_NOCLIP.Position = UDim2.new(0.0109999999, 0, 0.0390000008, 0)
BTN_NOCLIP.Size = UDim2.new(0, 100, 0, 50)
BTN_NOCLIP.Visible = false
BTN_NOCLIP.ZIndex = 2
BTN_NOCLIP.Font = Enum.Font.Jura
BTN_NOCLIP.Text = "NoClip"
BTN_NOCLIP.TextColor3 = Color3.fromRGB(190, 190, 190)
BTN_NOCLIP.TextSize = 16.000

UICorner_7.Parent = BTN_NOCLIP

Visual.Name = "Visual"
Visual.Parent = ScrollingFrame

BTN_ITEMESP.Name = "BTN_ITEMESP"
BTN_ITEMESP.Parent = Visual
BTN_ITEMESP.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
BTN_ITEMESP.BorderColor3 = Color3.fromRGB(0, 0, 0)
BTN_ITEMESP.BorderSizePixel = 0
BTN_ITEMESP.Position = UDim2.new(0.0109999999, 0, 0.0390000008, 0)
BTN_ITEMESP.Size = UDim2.new(0, 100, 0, 50)
BTN_ITEMESP.ZIndex = 2
BTN_ITEMESP.Font = Enum.Font.Jura
BTN_ITEMESP.Text = "Item ESP"
BTN_ITEMESP.TextColor3 = Color3.fromRGB(190, 190, 190)
BTN_ITEMESP.TextSize = 16.000

UICorner_8.Parent = BTN_ITEMESP

BTN_PLAYERESP.Name = "BTN_PLAYERESP"
BTN_PLAYERESP.Parent = Visual
BTN_PLAYERESP.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
BTN_PLAYERESP.BorderColor3 = Color3.fromRGB(0, 0, 0)
BTN_PLAYERESP.BorderSizePixel = 0
BTN_PLAYERESP.Position = UDim2.new(0.155000001, 0, 0.0390000008, 0)
BTN_PLAYERESP.Size = UDim2.new(0, 100, 0, 50)
BTN_PLAYERESP.ZIndex = 2
BTN_PLAYERESP.Font = Enum.Font.Jura
BTN_PLAYERESP.Text = "Player ESP"
BTN_PLAYERESP.TextColor3 = Color3.fromRGB(190, 190, 190)
BTN_PLAYERESP.TextSize = 16.000

UICorner_9.Parent = BTN_PLAYERESP

BTN_ALWAYSDAY.Name = "BTN_ALWAYSDAY"
BTN_ALWAYSDAY.Parent = Visual
BTN_ALWAYSDAY.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
BTN_ALWAYSDAY.BorderColor3 = Color3.fromRGB(0, 0, 0)
BTN_ALWAYSDAY.BorderSizePixel = 0
BTN_ALWAYSDAY.Position = UDim2.new(0.298999995, 0, 0.0390000008, 0)
BTN_ALWAYSDAY.Size = UDim2.new(0, 100, 0, 50)
BTN_ALWAYSDAY.ZIndex = 2
BTN_ALWAYSDAY.Font = Enum.Font.Jura
BTN_ALWAYSDAY.Text = "Always Day"
BTN_ALWAYSDAY.TextColor3 = Color3.fromRGB(190, 190, 190)
BTN_ALWAYSDAY.TextSize = 16.000

UICorner_10.Parent = BTN_ALWAYSDAY

BTN_FOVCHANGE.Name = "BTN_FOVCHANGE"
BTN_FOVCHANGE.Parent = Visual
BTN_FOVCHANGE.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
BTN_FOVCHANGE.BorderColor3 = Color3.fromRGB(0, 0, 0)
BTN_FOVCHANGE.BorderSizePixel = 0
BTN_FOVCHANGE.Position = UDim2.new(0.442999989, 0, 0.0979999974, 0)
BTN_FOVCHANGE.Size = UDim2.new(0, 100, 0, 50)
BTN_FOVCHANGE.ZIndex = 2
BTN_FOVCHANGE.Font = Enum.Font.Jura
BTN_FOVCHANGE.Text = "Fov Change"
BTN_FOVCHANGE.TextColor3 = Color3.fromRGB(190, 190, 190)
BTN_FOVCHANGE.TextSize = 16.000

UICorner_11.Parent = BTN_FOVCHANGE

FOVInput.Name = "FOVInput"
FOVInput.Parent = BTN_FOVCHANGE
FOVInput.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
FOVInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
FOVInput.BorderSizePixel = 0
FOVInput.Position = UDim2.new(1.08287776, 0, 0.187064514, 0)
FOVInput.Size = UDim2.new(0, 60, 0, 30)
FOVInput.Font = Enum.Font.Michroma
FOVInput.Text = "FOV"
FOVInput.TextColor3 = Color3.fromRGB(190, 190, 190)
FOVInput.TextSize = 23.000

UICorner_12.Parent = FOVInput

BTN_TIMECHANGE.Name = "BTN_TIMECHANGE"
BTN_TIMECHANGE.Parent = Visual
BTN_TIMECHANGE.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
BTN_TIMECHANGE.BorderColor3 = Color3.fromRGB(0, 0, 0)
BTN_TIMECHANGE.BorderSizePixel = 0
BTN_TIMECHANGE.Position = UDim2.new(0.442999989, 0, 0.0390000008, 0)
BTN_TIMECHANGE.Size = UDim2.new(0, 100, 0, 50)
BTN_TIMECHANGE.ZIndex = 2
BTN_TIMECHANGE.Font = Enum.Font.Jura
BTN_TIMECHANGE.Text = "Time Change"
BTN_TIMECHANGE.TextColor3 = Color3.fromRGB(190, 190, 190)
BTN_TIMECHANGE.TextSize = 16.000

UICorner_13.Parent = BTN_TIMECHANGE

TimeInput.Name = "TimeInput"
TimeInput.Parent = BTN_TIMECHANGE
TimeInput.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
TimeInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
TimeInput.BorderSizePixel = 0
TimeInput.Position = UDim2.new(1.08287776, 0, 0.187064514, 0)
TimeInput.Size = UDim2.new(0, 60, 0, 30)
TimeInput.Font = Enum.Font.Michroma
TimeInput.Text = "TIME"
TimeInput.TextColor3 = Color3.fromRGB(190, 190, 190)
TimeInput.TextSize = 20.000

UICorner_14.Parent = TimeInput

-- Scripts:

local function RMSDVU_fake_script() -- TAB_VISUAL.VisualSCRIPT 
	local script = Instance.new('LocalScript', TAB_VISUAL)

	local VisualTab = script.Parent
	local MainGui = script.Parent.Parent.Parent -- это MENU
	local ScrollingFrame = MainGui:FindFirstChild("ScrollingFrame")
	
	local VisualFolder = ScrollingFrame:FindFirstChild("Visual")
	local MovementFolder = ScrollingFrame:FindFirstChild("Movement")
	
	VisualTab.MouseButton1Click:Connect(function()
		if VisualFolder and MovementFolder then
			-- Показываем Visual
			for _, uiElement in pairs(VisualFolder:GetDescendants()) do
				if uiElement:IsA("GuiObject") then
					uiElement.Visible = true
				end
			end
	
			-- Скрываем Movement
			for _, uiElement in pairs(MovementFolder:GetDescendants()) do
				if uiElement:IsA("GuiObject") then
					uiElement.Visible = false
				end
			end
		end
	end)
	
end
coroutine.wrap(RMSDVU_fake_script)()
local function STLJYVI_fake_script() -- TAB_MOVEMENT.MovementSCRIPT 
	local script = Instance.new('LocalScript', TAB_MOVEMENT)

	local VisualTab = script.Parent
	local MainGui = script.Parent.Parent.Parent -- это MENU
	local ScrollingFrame = MainGui:FindFirstChild("ScrollingFrame")
	
	local VisualFolder = ScrollingFrame:FindFirstChild("Visual")
	local MovementFolder = ScrollingFrame:FindFirstChild("Movement")
	
	VisualTab.MouseButton1Click:Connect(function()
		if VisualFolder and MovementFolder then
			-- Показываем Visual
			for _, uiElement in pairs(VisualFolder:GetDescendants()) do
				if uiElement:IsA("GuiObject") then
					uiElement.Visible = false
				end
			end
	
			-- Скрываем Movement
			for _, uiElement in pairs(MovementFolder:GetDescendants()) do
				if uiElement:IsA("GuiObject") then
					uiElement.Visible = true
				end
			end
		end
	end)
	
end
coroutine.wrap(STLJYVI_fake_script)()
local function SYZCMA_fake_script() -- BTN_NOCLIP.FUNC_NOCLIP 
	local script = Instance.new('LocalScript', BTN_NOCLIP)

	local UIS = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	
	local button = script.Parent
	
	local noclip = false
	local toggleActive = false
	local connection
	
	local function enableNoclip()
		noclip = true
		connection = RunService.Stepped:Connect(function()
			if noclip then
				local character = game.Players.LocalPlayer.Character
				if character then
					for _, part in pairs(character:GetDescendants()) do
						if part:IsA("BasePart") and part.CanCollide == true then
							part.CanCollide = false
						end
					end
				end
			end
		end)
	end
	
	local function disableNoclip()
		noclip = false
		if connection then
			connection:Disconnect()
			connection = nil
		end
		local character = game.Players.LocalPlayer.Character
		if character then
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = true
				end
			end
		end
	end
	
	button.MouseButton1Click:Connect(function()
		toggleActive = not toggleActive
		if toggleActive then
		else
			disableNoclip()
		end
	end)
	
	UIS.InputBegan:Connect(function(input, gpe)
		if gpe then return end
		if input.KeyCode == Enum.KeyCode.N and toggleActive then
			if noclip then
				disableNoclip()
			else
				enableNoclip()
			end
		end
	end)
	
	-- Отключаем noclip после смерти, чтобы избежать багов
	game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
		disableNoclip()
	end)
	task.spawn(function()
		local btn = script.Parent
		if not btn:IsA("TextButton") then return end
	
		local enabled = false
	
		btn.MouseButton1Click:Connect(function()
			enabled = not enabled
			btn.TextColor3 = enabled and Color3.fromRGB(31, 181, 94) or Color3.fromRGB(223, 85, 85)
		end)
	
		-- начальный цвет (выключено — красный)
		btn.TextColor3 = Color3.fromRGB(223, 85, 85)
	end)
	
	
end
coroutine.wrap(SYZCMA_fake_script)()
local function KBEKSD_fake_script() -- BTN_ITEMESP.FUNC_ITEMESP 
	local script = Instance.new('LocalScript', BTN_ITEMESP)

	local button = script.Parent
	local itemNames = {
		"Bond",
		"RevolverAmmo",
		"Bandage",
		"GoldBar",
		"SilverBar",
		"RifleAmmo",
		"Coal",
		"Snake Oil",
		"MoneyBag",
		"Revolver",
		"Rifle",
		"ShotGun",
		"Navy Revolver",
		"Dynamite",
		"SheetMetal",
	}
	local function addNameTag(item)
		if item:FindFirstChild("ItemNameGui") then return end
	
		local adorneePart = item:FindFirstChildWhichIsA("BasePart")
		if not adorneePart then return end -- если нет части, не создаём GUI
	
		local billboard = Instance.new("BillboardGui")
		billboard.Name = "ItemNameGui"
		billboard.Adornee = adorneePart
		billboard.Size = UDim2.new(0, 100, 0, 40)
		billboard.StudsOffset = Vector3.new(0, 3, 0)
		billboard.AlwaysOnTop = true
		billboard.Parent = item
	
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = item.Name
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.TextStrokeTransparency = 0
		textLabel.Font = Enum.Font.SourceSansBold
		textLabel.TextScaled = true
		textLabel.Parent = billboard
	end
	local fillColor = Color3.fromRGB(77, 78, 118)
	local outlineColor = Color3.fromRGB(144, 161, 255)
	local highlightEnabled = false
	local function updateHighlights()
		for _, item in pairs(workspace.RuntimeItems:GetChildren()) do
			if table.find(itemNames, item.Name) and item:IsA("Model") then
				addNameTag(item)
			end
		end
	
		local folder = workspace:FindFirstChild("RuntimeItems")
		if not folder then return end
	
		for _, item in pairs(folder:GetChildren()) do
			-- Проверяем, есть ли имя этого предмета в списке нужных имён
			if table.find(itemNames, item.Name) then
				local existing = item:FindFirstChildOfClass("Highlight")
				if highlightEnabled then
					if not existing then
						local highlight = Instance.new("Highlight")
						highlight.Adornee = item
						highlight.FillColor = fillColor
						highlight.OutlineColor = outlineColor
						highlight.Parent = item
					else
						existing.FillColor = fillColor
						existing.OutlineColor = outlineColor
					end
				else
					if existing then
						existing:Destroy()
					end
					local billboard = item:FindFirstChild("ItemNameGui")
					if billboard then
						billboard:Destroy()
					end
				end
			end
		end
	end
	
	local RunService = game:GetService("RunService")
	local elapsed = 0
	
	RunService.Heartbeat:Connect(function(dt)
		if highlightEnabled then
			elapsed = elapsed + dt
			if elapsed >= 0.5 then
				elapsed = 0
				updateHighlights()
			end
		end
	end)
	
	button.MouseButton1Click:Connect(function()
		highlightEnabled = not highlightEnabled
		updateHighlights()
	end)
	task.spawn(function()
		local btn = script.Parent
		if not btn:IsA("TextButton") then return end
	
		local enabled = false
	
		btn.MouseButton1Click:Connect(function()
			enabled = not enabled
			btn.TextColor3 = enabled and Color3.fromRGB(31, 181, 94) or Color3.fromRGB(223, 85, 85)
		end)
	
		-- начальный цвет (выключено — красный)
		btn.TextColor3 = Color3.fromRGB(223, 85, 85)
	end)
	
	
end
coroutine.wrap(KBEKSD_fake_script)()
local function TXHNC_fake_script() -- BTN_PLAYERESP.FUNC_PLAYERESP 
	local script = Instance.new('LocalScript', BTN_PLAYERESP)

	local RunService = game:GetService("RunService")
	local playerChamsButton = script.Parent
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	local playerHighlightEnabled = false
	
	local function addPlayerTag(target)
		if target:FindFirstChild("Head") and not target.Head:FindFirstChild("PlayerNameGui") then
			local billboard = Instance.new("BillboardGui")
			billboard.Name = "PlayerNameGui"
			billboard.Adornee = target.Head
			billboard.Size = UDim2.new(0, 100, 0, 40)
			billboard.StudsOffset = Vector3.new(0, 2.5, 0)
			billboard.AlwaysOnTop = true
			billboard.Parent = target.Head
	
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = target.Name
			textLabel.TextColor3 = Color3.new(1, 1, 1)
			textLabel.TextStrokeTransparency = 0
			textLabel.Font = Enum.Font.SourceSansBold
			textLabel.TextScaled = true
			textLabel.Parent = billboard
		end
	end
	
	local function updatePlayerChams()
		for _, plr in pairs(Players:GetPlayers()) do
			if plr ~= player and plr.Character then
				local char = plr.Character
				local highlight = char:FindFirstChildOfClass("Highlight")
	
				if playerHighlightEnabled then
					addPlayerTag(char)
					if not highlight then
						local h = Instance.new("Highlight")
						h.Adornee = char
						h.FillColor = Color3.fromRGB(77, 78, 118)
						h.OutlineColor = Color3.fromRGB(144, 161, 255)
						h.Parent = char
					end
				else
					if highlight then highlight:Destroy() end
					local head = char:FindFirstChild("Head")
					if head and head:FindFirstChild("PlayerNameGui") then
						head.PlayerNameGui:Destroy()
					end
				end
			end
		end
	end
	
	RunService.Heartbeat:Connect(function(dt)
		if playerHighlightEnabled then
			updatePlayerChams()
		end
	end)
	
	playerChamsButton.MouseButton1Click:Connect(function()
		playerHighlightEnabled = not playerHighlightEnabled
		updatePlayerChams()
	end)
	task.spawn(function()
		local btn = script.Parent
		if not btn:IsA("TextButton") then return end
	
		local enabled = false
	
		btn.MouseButton1Click:Connect(function()
			enabled = not enabled
			btn.TextColor3 = enabled and Color3.fromRGB(31, 181, 94) or Color3.fromRGB(223, 85, 85)
		end)
	
		-- начальный цвет (выключено — красный)
		btn.TextColor3 = Color3.fromRGB(223, 85, 85)
	end)
	
end
coroutine.wrap(TXHNC_fake_script)()
local function XQEVE_fake_script() -- BTN_ALWAYSDAY.FUNC_ALWAYSDAY 
	local script = Instance.new('LocalScript', BTN_ALWAYSDAY)

	local btn = script.Parent
	local run = game:GetService("RunService")
	local active = false
	local conn
	
	btn.MouseButton1Click:Connect(function()
		active = not active
	
		if active then
			conn = run.Heartbeat:Connect(function()
				if game.Lighting.ClockTime ~= 14 then
					game.Lighting.ClockTime = 14
				end
			end)
		else
			if conn then conn:Disconnect() end
		end
	end)
	local textbox = btn.Parent:FindFirstChild("TextBox")
	local cam = workspace.CurrentCamera
	
	btn.MouseButton1Click:Connect(function()
		local fov = tonumber(textbox.Text)
		if fov then
			cam.FieldOfView = math.clamp(fov, 1, 120)
		end
	end)
	task.spawn(function()
		local btn = script.Parent
		if not btn:IsA("TextButton") then return end
	
		local enabled = false
	
		btn.MouseButton1Click:Connect(function()
			enabled = not enabled
			btn.TextColor3 = enabled and Color3.fromRGB(31, 181, 94) or Color3.fromRGB(223, 85, 85)
		end)
	
		-- начальный цвет (выключено — красный)
		btn.TextColor3 = Color3.fromRGB(223, 85, 85)
	end)
	
end
coroutine.wrap(XQEVE_fake_script)()
local function FKXKYOW_fake_script() -- BTN_FOVCHANGE.FUNC_FOVCHANGE 
	local script = Instance.new('LocalScript', BTN_FOVCHANGE)

	local btn = script.Parent
	local textbox = btn:FindFirstChild("FOVInput")
	local cam = workspace.Camera
	
	btn.MouseButton1Click:Connect(function()
		local fov = tonumber(textbox.Text)
		if fov then
			cam.FieldOfView = math.clamp(fov, 1, 120)
		end
	end)
	
end
coroutine.wrap(FKXKYOW_fake_script)()
local function MKZCFJG_fake_script() -- BTN_TIMECHANGE.FUNC_TIMECHANGE 
	local script = Instance.new('LocalScript', BTN_TIMECHANGE)

	local btn = script.Parent
	local textbox = btn:FindFirstChild("TimeInput")
	local time = game.Lighting
	
	btn.MouseButton1Click:Connect(function()
		local textbox = tonumber(textbox.Text)
		if time then
			time.ClockTime = textbox
		end
	end)
	
end
coroutine.wrap(MKZCFJG_fake_script)()
local function ULHO_fake_script() -- ScreenGui.MENUKEYBIND 
	local script = Instance.new('LocalScript', ScreenGui)

	local UIS = game:GetService("UserInputService")
	local player = game.Players.LocalPlayer
	local gui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
	
		UIS.InputBegan:Connect(function(input, gpe)
			if gpe then return end
			if input.KeyCode == Enum.KeyCode.U then
				gui.Enabled = not gui.Enabled
			end
		end)
end
coroutine.wrap(ULHO_fake_script)()
