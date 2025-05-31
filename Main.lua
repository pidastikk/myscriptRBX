local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local TextService = game:GetService("TextService")

local ChamsFillColor
local ChamsOutlineColor
local ChamsUpdaterRunning = false
local CharacterConnections = {}
local PlayerConnection

local ESPEnabled = false
local ESPDistanceEnabled = false
local ESPHealthEnabled = false
local ESPNameEnabled = false
local ESPHealthGradientStart = Color3.fromRGB(255, 0, 0)
local ESPHealthGradientEnd = Color3.fromRGB(0, 255, 0)
local ESPDistanceMax = 1000
local ESPPlayers = {}

local Window = Fluent:CreateWindow({
    Title = "TRIVIAL " .. Fluent.Version,
    SubTitle = "by wienn",
    TabWidth = 130,
    Size = UDim2.fromOffset(1000, 600),
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.K
})

local Tabs = {
    Combat = Window:AddTab({ Title = "Combat", Icon = "swords" }),
    Visuals = Window:AddTab({ Title = "Visuals", Icon = "paintbrush" }),
    Movement = Window:AddTab({ Title = "Movement", Icon = "accessibility" }),
    World = Window:AddTab({ Title = "World", Icon = "tree-pine" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "puzzle" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "user-cog" })
}

local Options = Fluent.Options

local aimbotEnabled = false
local aimFOV = 100
local aimStrength = 1
local aimSmoothness = 0.1
local aimPart = "HumanoidRootPart" -- Изменено с Head на HumanoidRootPart для лучшего таргета
local aimColor = Color3.fromRGB(255, 0, 0)
local aiming = false

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.NumSides = 100
FOVCircle.Filled = false
FOVCircle.Transparency = 0.5
FOVCircle.Visible = false

Tabs.Combat:AddToggle("T_Aimbot", { Title = "Enable Aimbot", Default = false }):OnChanged(function(val)
    aimbotEnabled = val
    FOVCircle.Visible = val
    if not val then aiming = false end
end)

Tabs.Combat:AddSlider("S_FOV", {
    Title = "FOV",
    Description = "FOV radius",
    Default = 100,
    Min = 10,
    Max = 500,
    Rounding = 0
}):OnChanged(function(val)
    aimFOV = val
    FOVCircle.Radius = val
end)

local aimPrediction = 0.165

Tabs.Combat:AddSlider("S_Predict", {
    Title = "Prediction",
    Description = "Aim lead prediction factor",
    Default = 0.165,
    Min = 0,
    Max = 1,
    Rounding = 3
}):OnChanged(function(val)
    aimPrediction = val
end)

Tabs.Combat:AddSlider("S_Strength", {
    Title = "Strength",
    Description = "Cursor speed",
    Default = 1,
    Min = 0.1,
    Max = 5,
    Rounding = 1
}):OnChanged(function(val)
    aimStrength = val
end)

Tabs.Combat:AddSlider("S_Smooth", {
    Title = "Smoothness",
    Description = "Aiming smoothness",
    Default = 0.1,
    Min = 0.01,
    Max = 1,
    Rounding = 2
}):OnChanged(function(val)
    aimSmoothness = val
end)

Tabs.Combat:AddColorpicker("Color_AimFOV", {
    Title = "FOV Color",
    Default = Color3.fromRGB(50, 19, 100)
}):OnChanged(function(val)
    aimColor = val
    FOVCircle.Color = val
end)

Tabs.Combat:AddDropdown("Drop_AimPart", {
    Title = "AimPoint",
    Values = {"Head", "HumanoidRootPart", "UpperTorso"},
    Multi = false,
    Default = "HumanoidRootPart"
}):OnChanged(function(val)
    aimPart = val
end)

local function getActualAimPart(character)
    if not character then return nil end
    
    if aimPart == "UpperTorso" then
        return character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso") or character:FindFirstChild("HumanoidRootPart")
    else
        return character:FindFirstChild(aimPart) or character:FindFirstChild("HumanoidRootPart")
    end
end

local function getClosestPlayer()
    local closest = nil
    local shortest = aimFOV
    local mousePos = UserInputService:GetMouseLocation()

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local part = getActualAimPart(plr.Character)
            if part then
                local pos, visible = Camera:WorldToViewportPoint(part.Position)
                if visible then
                    local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(mousePos.X, mousePos.Y)).Magnitude
                    if dist < shortest then
                        shortest = dist
                        closest = plr
                    end
                end
            end
        end
    end
    return closest
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.V and Options.T_Aimbot.Value then
        aiming = not aiming
        FOVCircle.Visible = aiming
    end
end)

RunService.RenderStepped:Connect(function()
    if not aimbotEnabled or not aiming then return end

    local mousePos = UserInputService:GetMouseLocation()
    FOVCircle.Position = mousePos

    local target = getClosestPlayer()
    if target and target.Character then
        local part = getActualAimPart(target.Character)
        if part then
            local distance = (Camera.CFrame.Position - part.Position).Magnitude
            local dynamicPrediction = distance / 1000 * aimPrediction
            local predictedPos = part.Position + part.Velocity * dynamicPrediction
            local aimPos = Camera:WorldToViewportPoint(predictedPos)
            local delta = (Vector2.new(aimPos.X, aimPos.Y) - mousePos) * aimSmoothness
            mousemoverel(delta.X * aimStrength, delta.Y * aimStrength)
        end
    end
end)

local function createESP(player)
    if ESPPlayers[player] then return end
    
    local esp = {
        name = Drawing.new("Text"),
        distance = Drawing.new("Text"),
        healthBar = Drawing.new("Line"),
        healthText = Drawing.new("Text"),
        box = Drawing.new("Quad")
    }
    
    ESPPlayers[player] = esp
    
    esp.name.Visible = false
    esp.name.Center = true
    esp.name.Outline = true
    esp.name.Font = 2
    esp.name.Size = 13
    
    esp.distance.Visible = false
    esp.distance.Center = true
    esp.distance.Outline = true
    esp.distance.Font = 2
    esp.distance.Size = 13
    
    esp.healthBar.Visible = false
    esp.healthBar.Thickness = 1
    
    esp.healthText.Visible = false
    esp.healthText.Center = true
    esp.healthText.Outline = true
    esp.healthText.Font = 2
    esp.healthText.Size = 13
    
    esp.box.Visible = false
    esp.box.Thickness = 1
    esp.box.Filled = false
    
    return esp
end

local function updateESP()
    if not ESPEnabled then return end
    
    for player, esp in pairs(ESPPlayers) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = player.Character.HumanoidRootPart
            local head = player.Character:FindFirstChild("Head")
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            
            if rootPart and head then
                local position, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
                
                if onScreen then
                    local distance = (rootPart.Position - Camera.CFrame.Position).Magnitude
                    if distance > ESPDistanceMax then
                        esp.name.Visible = false
                        esp.distance.Visible = false
                        esp.healthBar.Visible = false
                        esp.healthText.Visible = false
                        esp.box.Visible = false
                        continue
                    end
                    
                    local headPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                    local rootPos = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))
                    
                    local height = math.abs(headPos.Y - rootPos.Y)
                    local width = height * 0.5
                    
                    -- Box ESP
                    esp.box.PointA = Vector2.new(headPos.X - width, headPos.Y)
                    esp.box.PointB = Vector2.new(headPos.X + width, headPos.Y)
                    esp.box.PointC = Vector2.new(rootPos.X + width, rootPos.Y)
                    esp.box.PointD = Vector2.new(rootPos.X - width, rootPos.Y)
                    esp.box.Color = Color3.fromRGB(255, 255, 255)
                    esp.box.Visible = ESPEnabled
                    
                    -- Name ESP
                    esp.name.Position = Vector2.new(headPos.X, headPos.Y - 20)
                    esp.name.Text = player.Name
                    esp.name.Color = Color3.fromRGB(255, 255, 255)
                    esp.name.Visible = ESPNameEnabled and ESPEnabled
                    
                    -- Distance ESP
                    esp.distance.Position = Vector2.new(headPos.X, rootPos.Y + 10)
                    esp.distance.Text = tostring(math.floor(distance)) .. "m"
                    esp.distance.Color = Color3.fromRGB(255, 255, 255)
                    esp.distance.Visible = ESPDistanceEnabled and ESPEnabled
                    
                    -- Health ESP
                    if humanoid then
                        local healthPercent = humanoid.Health / humanoid.MaxHealth
                        local healthColor = ESPHealthGradientStart:Lerp(ESPHealthGradientEnd, healthPercent)
                        
                        -- Health Bar
                        esp.healthBar.From = Vector2.new(rootPos.X - width - 5, rootPos.Y)
                        esp.healthBar.To = Vector2.new(rootPos.X - width - 5, rootPos.Y - height * healthPercent)
                        esp.healthBar.Color = healthColor
                        esp.healthBar.Visible = ESPHealthEnabled and ESPEnabled
                        
                        -- Health Text
                        esp.healthText.Position = Vector2.new(rootPos.X - width - 15, rootPos.Y - height * healthPercent)
                        esp.healthText.Text = tostring(math.floor(humanoid.Health))
                        esp.healthText.Color = healthColor
                        esp.healthText.Visible = ESPHealthEnabled and ESPEnabled
                    end
                else
                    esp.name.Visible = false
                    esp.distance.Visible = false
                    esp.healthBar.Visible = false
                    esp.healthText.Visible = false
                    esp.box.Visible = false
                end
            else
                esp.name.Visible = false
                esp.distance.Visible = false
                esp.healthBar.Visible = false
                esp.healthText.Visible = false
                esp.box.Visible = false
            end
        else
            esp.name.Visible = false
            esp.distance.Visible = false
            esp.healthBar.Visible = false
            esp.healthText.Visible = false
            esp.box.Visible = false
        end
    end
end

local SectionESP = Tabs.Visuals:AddSection("ESP Settings")

SectionESP:AddToggle("T_ESP", {
    Title = "Enable ESP",
    Default = false
}):OnChanged(function(val)
    ESPEnabled = val
    if not val then
        for _, esp in pairs(ESPPlayers) do
            esp.name.Visible = false
            esp.distance.Visible = false
            esp.healthBar.Visible = false
            esp.healthText.Visible = false
            esp.box.Visible = false
        end
    end
end)

SectionESP:AddToggle("T_ESPNames", {
    Title = "Show Names",
    Default = false
}):OnChanged(function(val)
    ESPNameEnabled = val
end)

SectionESP:AddToggle("T_ESPDistance", {
    Title = "Show Distance",
    Default = false
}):OnChanged(function(val)
    ESPDistanceEnabled = val
end)

SectionESP:AddToggle("T_ESPHealth", {
    Title = "Show Health",
    Default = false
}):OnChanged(function(val)
    ESPHealthEnabled = val
end)

SectionESP:AddSlider("S_ESPDistance", {
    Title = "Max Distance",
    Description = "Maximum ESP render distance",
    Default = 1000,
    Min = 50,
    Max = 5000,
    Rounding = 0
}):OnChanged(function(val)
    ESPDistanceMax = val
end)

SectionESP:AddColorpicker("CP_ESPHealthStart", {
    Title = "Health Start Color",
    Default = Color3.fromRGB(255, 0, 0)
}):OnChanged(function(val)
    ESPHealthGradientStart = val
end)

SectionESP:AddColorpicker("CP_ESPHealthEnd", {
    Title = "Health End Color",
    Default = Color3.fromRGB(0, 255, 0)
}):OnChanged(function(val)
    ESPHealthGradientEnd = val
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    createESP(player)
    
    player.CharacterAdded:Connect(function(character)
        task.wait(1)
        if ESPEnabled then
            createESP(player)
        end
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPPlayers[player] then
        for _, drawing in pairs(ESPPlayers[player]) do
            drawing:Remove()
        end
        ESPPlayers[player] = nil
    end
end)

RunService.RenderStepped:Connect(updateESP)

local CP_ChamsFill = Tabs.Visuals:AddColorpicker("ColorpickerFill", {
    Title = "Chams Fill Color",
    Default = Color3.fromRGB(105, 76, 175)
})
CP_ChamsFill:OnChanged(function()
    ChamsFillColor = CP_ChamsFill.Value
end)

local CP_ChamsOutline = Tabs.Visuals:AddColorpicker("ColorpickerOutline", {
    Title = "Chams Outline Color",
    Default = Color3.fromRGB(150, 138, 224)
})
CP_ChamsOutline:OnChanged(function()
    ChamsOutlineColor = CP_ChamsOutline.Value
end)

local function applyChamsToPlayer(plr)
    if plr ~= LocalPlayer and plr.Character then
        local highlight = plr.Character:FindFirstChild("Chams")
        if highlight then
            highlight.Enabled = true
        else
            local highlight = Instance.new("Highlight")
            highlight.Name = "Chams"
            highlight.FillColor = ChamsFillColor or Color3.fromRGB(0, 255, 140)
            highlight.OutlineColor = ChamsOutlineColor or Color3.fromRGB(0, 255, 140)
            highlight.FillTransparency = 0.3
            highlight.OutlineTransparency = 0
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Adornee = plr.Character
            highlight.Parent = plr.Character
        end
    end
end

local function removeChamsFromPlayer(plr)
    if plr.Character then
        local highlight = plr.Character:FindFirstChild("Chams")
        if highlight then
            highlight:Destroy()
        end
    end
end

local function updateAllChams()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            removeChamsFromPlayer(plr)
            applyChamsToPlayer(plr)
        end
    end
end

local function updateChamsColors()
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local highlight = plr.Character:FindFirstChild("Chams")
            if highlight then
                highlight.FillColor = ChamsFillColor or Color3.fromRGB(0, 255, 140)
                highlight.OutlineColor = ChamsOutlineColor or Color3.fromRGB(0, 255, 140)
            end
        end
    end
end

local T_Chams = Tabs.Visuals:AddToggle("T_Chams", {Title = "Chams", Default = false})
T_Chams:OnChanged(function(enabled)
    ChamsUpdaterRunning = enabled

    if enabled then
        for _, plr in pairs(Players:GetPlayers()) do
            applyChamsToPlayer(plr)
            local conn = plr.CharacterAdded:Connect(function()
                task.wait(1)
                applyChamsToPlayer(plr)
            end)
            CharacterConnections[plr] = conn
        end

        PlayerConnection = Players.PlayerAdded:Connect(function(plr)
            local conn = plr.CharacterAdded:Connect(function()
                task.wait(1)
                applyChamsToPlayer(plr)
            end)
            CharacterConnections[plr] = conn
        end)

        task.spawn(function()
            while ChamsUpdaterRunning do
                updateChamsColors()
                task.wait(0.5)
            end
        end)
    else
        for _, plr in pairs(Players:GetPlayers()) do
            removeChamsFromPlayer(plr)
            if CharacterConnections[plr] then
                CharacterConnections[plr]:Disconnect()
                CharacterConnections[plr] = nil
            end
        end
        if PlayerConnection then
            PlayerConnection:Disconnect()
            PlayerConnection = nil
        end
    end
end)

-- SaveManager
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)

Fluent:Notify({
    Title = "TRIVIAL",
    Content = "The script has been injected.",
    Duration = 3
})

SaveManager:LoadAutoloadConfig()
