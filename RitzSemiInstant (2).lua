-- RITZ SEMI INSTANT GUI
-- Put this in StarterPlayerScripts as a LocalScript

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- CHANGE THESE TO YOUR BASE POSITIONS
local TP1_POS = Vector3.new(0, 5, 0)
local TP2_POS = Vector3.new(100, 5, 0)

-- Remove old GUI
if playerGui:FindFirstChild("RitzGui") then
	playerGui:FindFirstChild("RitzGui"):Destroy()
end

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RitzGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = playerGui

--[[
	MAIN FRAME
]]

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0, 100, 0, 100)
MainFrame.Size = UDim2.new(0, 300, 0, 430)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainFrameCorner = Instance.new("UICorner")
MainFrameCorner.CornerRadius = UDim.new(0, 24)
MainFrameCorner.Parent = MainFrame

local MainFrameStroke = Instance.new("UIStroke")
MainFrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MainFrameStroke.Color = Color3.fromRGB(220, 0, 0)
MainFrameStroke.LineJoinMode = Enum.LineJoinMode.Round
MainFrameStroke.Thickness = 7
MainFrameStroke.Parent = MainFrame

-- Title: "Ritz semi instant"
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 10, 0, 6)
TitleLabel.Size = UDim2.new(1, -80, 0, 36)
TitleLabel.Font = Enum.Font.GothamItalic
TitleLabel.Text = "Ritz semi instant"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.Parent = MainFrame

-- Minus button
local MinusBtn = Instance.new("TextButton")
MinusBtn.Name = "MinusBtn"
MinusBtn.BackgroundTransparency = 1
MinusBtn.Position = UDim2.new(1, -64, 0, 4)
MinusBtn.Size = UDim2.new(0, 28, 0, 32)
MinusBtn.Font = Enum.Font.GothamBold
MinusBtn.Text = "−"
MinusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusBtn.TextSize = 22
MinusBtn.Parent = MainFrame

-- X button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.BackgroundTransparency = 1
CloseBtn.Position = UDim2.new(1, -34, 0, 4)
CloseBtn.Size = UDim2.new(0, 28, 0, 32)
CloseBtn.Font = Enum.Font.GothamBoldItalic
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 20
CloseBtn.Parent = MainFrame

--[[
	INNER BORDER FRAME (red outline box)
]]

local InnerBorder = Instance.new("Frame")
InnerBorder.Name = "InnerBorder"
InnerBorder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InnerBorder.BorderSizePixel = 0
InnerBorder.Position = UDim2.new(0, 12, 0, 44)
InnerBorder.Size = UDim2.new(1, -24, 1, -56)
InnerBorder.Parent = MainFrame

local InnerBorderCorner = Instance.new("UICorner")
InnerBorderCorner.CornerRadius = UDim.new(0, 14)
InnerBorderCorner.Parent = InnerBorder

local InnerBorderStroke = Instance.new("UIStroke")
InnerBorderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
InnerBorderStroke.Color = Color3.fromRGB(220, 0, 0)
InnerBorderStroke.LineJoinMode = Enum.LineJoinMode.Round
InnerBorderStroke.Thickness = 4
InnerBorderStroke.Parent = InnerBorder

-- "Instant steal" heading
local InstantStealLabel = Instance.new("TextLabel")
InstantStealLabel.Name = "InstantStealLabel"
InstantStealLabel.BackgroundTransparency = 1
InstantStealLabel.Position = UDim2.new(0, 0, 0, 8)
InstantStealLabel.Size = UDim2.new(1, 0, 0, 46)
InstantStealLabel.Font = Enum.Font.GothamBoldItalic
InstantStealLabel.Text = "Instant steal"
InstantStealLabel.TextColor3 = Color3.fromRGB(255, 20, 20)
InstantStealLabel.TextSize = 30
InstantStealLabel.TextXAlignment = Enum.TextXAlignment.Center
InstantStealLabel.Parent = InnerBorder

-- TP Base 1 Button
local TP1Button = Instance.new("TextButton")
TP1Button.Name = "TP1Button"
TP1Button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
TP1Button.BorderSizePixel = 0
TP1Button.Position = UDim2.new(0, 14, 0, 60)
TP1Button.Size = UDim2.new(1, -28, 0, 48)
TP1Button.AutoButtonColor = false
TP1Button.Font = Enum.Font.GothamBoldItalic
TP1Button.Text = "TP Base 1"
TP1Button.TextColor3 = Color3.fromRGB(255, 255, 255)
TP1Button.TextSize = 20
TP1Button.Parent = InnerBorder

local TP1Corner = Instance.new("UICorner")
TP1Corner.CornerRadius = UDim.new(0, 10)
TP1Corner.Parent = TP1Button

-- TP Base 2 Button
local TP2Button = Instance.new("TextButton")
TP2Button.Name = "TP2Button"
TP2Button.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
TP2Button.BorderSizePixel = 0
TP2Button.Position = UDim2.new(0, 14, 0, 116)
TP2Button.Size = UDim2.new(1, -28, 0, 48)
TP2Button.AutoButtonColor = false
TP2Button.Font = Enum.Font.GothamBoldItalic
TP2Button.Text = "TP Base 2"
TP2Button.TextColor3 = Color3.fromRGB(255, 255, 255)
TP2Button.TextSize = 20
TP2Button.Parent = InnerBorder

local TP2Corner = Instance.new("UICorner")
TP2Corner.CornerRadius = UDim.new(0, 10)
TP2Corner.Parent = TP2Button

-- Speed boost label
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Position = UDim2.new(0, 14, 0, 180)
SpeedLabel.Size = UDim2.new(0, 160, 0, 36)
SpeedLabel.Font = Enum.Font.GothamBoldItalic
SpeedLabel.Text = "Speed boost"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 20, 20)
SpeedLabel.TextSize = 18
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = InnerBorder

-- Speed boost toggle
local SpeedToggle = Instance.new("TextButton")
SpeedToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
SpeedToggle.BorderSizePixel = 0
SpeedToggle.Position = UDim2.new(1, -84, 0, 182)
SpeedToggle.Size = UDim2.new(0, 70, 0, 32)
SpeedToggle.Text = ""
SpeedToggle.AutoButtonColor = false
SpeedToggle.Parent = InnerBorder

local SpeedToggleCorner = Instance.new("UICorner")
SpeedToggleCorner.CornerRadius = UDim.new(0, 8)
SpeedToggleCorner.Parent = SpeedToggle

-- Auto Kick label
local KickLabel = Instance.new("TextLabel")
KickLabel.BackgroundTransparency = 1
KickLabel.Position = UDim2.new(0, 14, 0, 228)
KickLabel.Size = UDim2.new(0, 160, 0, 50)
KickLabel.Font = Enum.Font.GothamBoldItalic
KickLabel.Text = "Auto Kick\nwhen stolen"
KickLabel.TextColor3 = Color3.fromRGB(255, 20, 20)
KickLabel.TextSize = 18
KickLabel.TextXAlignment = Enum.TextXAlignment.Left
KickLabel.Parent = InnerBorder

-- Auto Kick toggle
local KickToggle = Instance.new("TextButton")
KickToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
KickToggle.BorderSizePixel = 0
KickToggle.Position = UDim2.new(1, -84, 0, 237)
KickToggle.Size = UDim2.new(0, 70, 0, 32)
KickToggle.Text = ""
KickToggle.AutoButtonColor = false
KickToggle.Parent = InnerBorder

local KickToggleCorner = Instance.new("UICorner")
KickToggleCorner.CornerRadius = UDim.new(0, 8)
KickToggleCorner.Parent = KickToggle

-- Auto potion label
local PotionLabel = Instance.new("TextLabel")
PotionLabel.BackgroundTransparency = 1
PotionLabel.Position = UDim2.new(0, 14, 0, 292)
PotionLabel.Size = UDim2.new(0, 160, 0, 36)
PotionLabel.Font = Enum.Font.GothamBoldItalic
PotionLabel.Text = "Auto potion"
PotionLabel.TextColor3 = Color3.fromRGB(255, 20, 20)
PotionLabel.TextSize = 18
PotionLabel.TextXAlignment = Enum.TextXAlignment.Left
PotionLabel.Parent = InnerBorder

-- Auto potion toggle
local PotionToggle = Instance.new("TextButton")
PotionToggle.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
PotionToggle.BorderSizePixel = 0
PotionToggle.Position = UDim2.new(1, -84, 0, 294)
PotionToggle.Size = UDim2.new(0, 70, 0, 32)
PotionToggle.Text = ""
PotionToggle.AutoButtonColor = false
PotionToggle.Parent = InnerBorder

local PotionToggleCorner = Instance.new("UICorner")
PotionToggleCorner.CornerRadius = UDim.new(0, 8)
PotionToggleCorner.Parent = PotionToggle

--[[
	MINIMIZED BAR
]]

local MinBar = Instance.new("Frame")
MinBar.Name = "MinBar"
MinBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MinBar.BorderSizePixel = 0
MinBar.Position = UDim2.new(0, 100, 0, 100)
MinBar.Size = UDim2.new(0, 280, 0, 46)
MinBar.Active = true
MinBar.Draggable = true
MinBar.Visible = false
MinBar.Parent = ScreenGui

local MinBarCorner = Instance.new("UICorner")
MinBarCorner.CornerRadius = UDim.new(0, 10)
MinBarCorner.Parent = MinBar

local MinBarStroke = Instance.new("UIStroke")
MinBarStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
MinBarStroke.Color = Color3.fromRGB(220, 0, 0)
MinBarStroke.LineJoinMode = Enum.LineJoinMode.Round
MinBarStroke.Thickness = 4
MinBarStroke.Parent = MinBar

local MinBarLabel = Instance.new("TextLabel")
MinBarLabel.BackgroundTransparency = 1
MinBarLabel.Position = UDim2.new(0, 12, 0, 0)
MinBarLabel.Size = UDim2.new(1, -90, 1, 0)
MinBarLabel.Font = Enum.Font.GothamItalic
MinBarLabel.Text = "Ritz semi instant"
MinBarLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBarLabel.TextSize = 17
MinBarLabel.TextXAlignment = Enum.TextXAlignment.Left
MinBarLabel.Parent = MinBar

local RestoreBtn = Instance.new("TextButton")
RestoreBtn.BackgroundTransparency = 1
RestoreBtn.Position = UDim2.new(1, -62, 0, 0)
RestoreBtn.Size = UDim2.new(0, 28, 1, 0)
RestoreBtn.Font = Enum.Font.GothamBold
RestoreBtn.Text = "+"
RestoreBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RestoreBtn.TextSize = 26
RestoreBtn.Parent = MinBar

local MinBarCloseBtn = Instance.new("TextButton")
MinBarCloseBtn.BackgroundTransparency = 1
MinBarCloseBtn.Position = UDim2.new(1, -32, 0, 0)
MinBarCloseBtn.Size = UDim2.new(0, 28, 1, 0)
MinBarCloseBtn.Font = Enum.Font.GothamBoldItalic
MinBarCloseBtn.Text = "X"
MinBarCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBarCloseBtn.TextSize = 20
MinBarCloseBtn.Parent = MinBar

--[[
	FUNCTIONALITY
]]

local speedOn = false
local kickOn = false
local potionOn = false

local GREEN = Color3.fromRGB(0, 220, 0)
local RED   = Color3.fromRGB(180, 0, 0)

local function setToggle(btn, state)
	TweenService:Create(btn, TweenInfo.new(0.15), {
		BackgroundColor3 = state and GREEN or RED
	}):Play()
end

SpeedToggle.MouseButton1Click:Connect(function()
	speedOn = not speedOn
	setToggle(SpeedToggle, speedOn)
	local char = player.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then hum.WalkSpeed = speedOn and 50 or 16 end
	end
end)

KickToggle.MouseButton1Click:Connect(function()
	kickOn = not kickOn
	setToggle(KickToggle, kickOn)
	-- Add your kick logic here
end)

PotionToggle.MouseButton1Click:Connect(function()
	potionOn = not potionOn
	setToggle(PotionToggle, potionOn)
	-- Add your potion logic here
end)

TP1Button.MouseButton1Click:Connect(function()
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = CFrame.new(TP1_POS)
	end
end)

TP2Button.MouseButton1Click:Connect(function()
	local char = player.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = CFrame.new(TP2_POS)
	end
end)

MinusBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	MinBar.Visible = true
end)

RestoreBtn.MouseButton1Click:Connect(function()
	MinBar.Visible = false
	MainFrame.Visible = true
end)

local function closeAll()
	MainFrame.Visible = false
	MinBar.Visible = false
end

CloseBtn.MouseButton1Click:Connect(closeAll)
MinBarCloseBtn.MouseButton1Click:Connect(closeAll)

player.CharacterAdded:Connect(function(char)
	if speedOn then
		char:WaitForChild("Humanoid").WalkSpeed = 50
	end
end)
