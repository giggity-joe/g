-- Ritz Semi Instant GUI
-- Paste into your Roblox executor

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- CONFIG --
local BASE_1_POSITION = Vector3.new(0, 5, 0)    -- Change me!
local BASE_2_POSITION = Vector3.new(100, 5, 0)  -- Change me!
local SPEED_BOOST_AMOUNT = 50

-- STATE --
local speedOn = false
local kickOn = false
local potionOn = false

-- Clean up old GUI --
if PlayerGui:FindFirstChild("RitzGUI") then
    PlayerGui.RitzGUI:Destroy()
end

-- SCREEN GUI --
local sg = Instance.new("ScreenGui")
sg.Name = "RitzGUI"
sg.ResetOnSpawn = false
sg.IgnoreGuiInset = true
sg.Parent = PlayerGui

-------------------------------------------------
-- MAIN WINDOW
-------------------------------------------------
local win = Instance.new("Frame")
win.Size = UDim2.new(0, 290, 0, 410)
win.Position = UDim2.new(0, 50, 0, 50)
win.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
win.BorderSizePixel = 0
win.Active = true
win.Draggable = true
win.Parent = sg

local winCorner = Instance.new("UICorner")
winCorner.CornerRadius = UDim.new(0, 20)
winCorner.Parent = win

local winStroke = Instance.new("UIStroke")
winStroke.Color = Color3.fromRGB(220, 0, 0)
winStroke.Thickness = 6
winStroke.Parent = win

-------------------------------------------------
-- TITLE: "Ritz semi instant"
-------------------------------------------------
local titleLbl = Instance.new("TextLabel")
titleLbl.Size = UDim2.new(1, -80, 0, 36)
titleLbl.Position = UDim2.new(0, 12, 0, 4)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "Ritz semi instant"
titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLbl.Font = Enum.Font.GothamItalic
titleLbl.TextSize = 17
titleLbl.TextXAlignment = Enum.TextXAlignment.Left
titleLbl.Parent = win

-- Minimize button
local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 28, 0, 28)
minBtn.Position = UDim2.new(1, -62, 0, 6)
minBtn.BackgroundTransparency = 1
minBtn.Text = "-"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 26
minBtn.BorderSizePixel = 0
minBtn.Parent = win

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -32, 0, 6)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.BorderSizePixel = 0
closeBtn.Parent = win

-------------------------------------------------
-- INNER RED BORDER BOX
-------------------------------------------------
local inner = Instance.new("Frame")
inner.Size = UDim2.new(1, -20, 1, -50)
inner.Position = UDim2.new(0, 10, 0, 44)
inner.BackgroundTransparency = 1
inner.BorderSizePixel = 0
inner.Parent = win

local innerCorner = Instance.new("UICorner")
innerCorner.CornerRadius = UDim.new(0, 14)
innerCorner.Parent = inner

local innerStroke = Instance.new("UIStroke")
innerStroke.Color = Color3.fromRGB(220, 0, 0)
innerStroke.Thickness = 3
innerStroke.Parent = inner

-------------------------------------------------
-- "Instant steal" heading
-------------------------------------------------
local stealLbl = Instance.new("TextLabel")
stealLbl.Size = UDim2.new(1, 0, 0, 44)
stealLbl.Position = UDim2.new(0, 0, 0, 6)
stealLbl.BackgroundTransparency = 1
stealLbl.Text = "Instant steal"
stealLbl.TextColor3 = Color3.fromRGB(255, 25, 25)
stealLbl.Font = Enum.Font.GothamBoldItalic
stealLbl.TextSize = 28
stealLbl.TextXAlignment = Enum.TextXAlignment.Center
stealLbl.Parent = inner

-------------------------------------------------
-- TP BASE 1 BUTTON
-------------------------------------------------
local tp1 = Instance.new("TextButton")
tp1.Size = UDim2.new(1, -24, 0, 46)
tp1.Position = UDim2.new(0, 12, 0, 56)
tp1.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
tp1.BorderSizePixel = 0
tp1.Text = "TP Base 1"
tp1.TextColor3 = Color3.fromRGB(255, 255, 255)
tp1.Font = Enum.Font.GothamBoldItalic
tp1.TextSize = 20
tp1.AutoButtonColor = false
tp1.Parent = inner

local tp1c = Instance.new("UICorner")
tp1c.CornerRadius = UDim.new(0, 8)
tp1c.Parent = tp1

-------------------------------------------------
-- TP BASE 2 BUTTON
-------------------------------------------------
local tp2 = Instance.new("TextButton")
tp2.Size = UDim2.new(1, -24, 0, 46)
tp2.Position = UDim2.new(0, 12, 0, 110)
tp2.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
tp2.BorderSizePixel = 0
tp2.Text = "TP Base 2"
tp2.TextColor3 = Color3.fromRGB(255, 255, 255)
tp2.Font = Enum.Font.GothamBoldItalic
tp2.TextSize = 20
tp2.AutoButtonColor = false
tp2.Parent = inner

local tp2c = Instance.new("UICorner")
tp2c.CornerRadius = UDim.new(0, 8)
tp2c.Parent = tp2

-------------------------------------------------
-- SPEED BOOST ROW
-------------------------------------------------
local speedLbl = Instance.new("TextLabel")
speedLbl.Size = UDim2.new(0, 150, 0, 36)
speedLbl.Position = UDim2.new(0, 12, 0, 172)
speedLbl.BackgroundTransparency = 1
speedLbl.Text = "Speed boost"
speedLbl.TextColor3 = Color3.fromRGB(255, 25, 25)
speedLbl.Font = Enum.Font.GothamBoldItalic
speedLbl.TextSize = 17
speedLbl.TextXAlignment = Enum.TextXAlignment.Left
speedLbl.Parent = inner

local speedBox = Instance.new("TextButton")
speedBox.Size = UDim2.new(0, 68, 0, 34)
speedBox.Position = UDim2.new(1, -80, 0, 174)
speedBox.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
speedBox.BorderSizePixel = 0
speedBox.Text = ""
speedBox.AutoButtonColor = false
speedBox.Parent = inner

local speedBoxC = Instance.new("UICorner")
speedBoxC.CornerRadius = UDim.new(0, 7)
speedBoxC.Parent = speedBox

-------------------------------------------------
-- AUTO KICK ROW
-------------------------------------------------
local kickLbl = Instance.new("TextLabel")
kickLbl.Size = UDim2.new(0, 150, 0, 46)
kickLbl.Position = UDim2.new(0, 12, 0, 218)
kickLbl.BackgroundTransparency = 1
kickLbl.Text = "Auto Kick\nwhen stolen"
kickLbl.TextColor3 = Color3.fromRGB(255, 25, 25)
kickLbl.Font = Enum.Font.GothamBoldItalic
kickLbl.TextSize = 17
kickLbl.TextXAlignment = Enum.TextXAlignment.Left
kickLbl.Parent = inner

local kickBox = Instance.new("TextButton")
kickBox.Size = UDim2.new(0, 68, 0, 34)
kickBox.Position = UDim2.new(1, -80, 0, 224)
kickBox.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
kickBox.BorderSizePixel = 0
kickBox.Text = ""
kickBox.AutoButtonColor = false
kickBox.Parent = inner

local kickBoxC = Instance.new("UICorner")
kickBoxC.CornerRadius = UDim.new(0, 7)
kickBoxC.Parent = kickBox

-------------------------------------------------
-- AUTO POTION ROW
-------------------------------------------------
local potionLbl = Instance.new("TextLabel")
potionLbl.Size = UDim2.new(0, 150, 0, 36)
potionLbl.Position = UDim2.new(0, 12, 0, 276)
potionLbl.BackgroundTransparency = 1
potionLbl.Text = "Auto potion"
potionLbl.TextColor3 = Color3.fromRGB(255, 25, 25)
potionLbl.Font = Enum.Font.GothamBoldItalic
potionLbl.TextSize = 17
potionLbl.TextXAlignment = Enum.TextXAlignment.Left
potionLbl.Parent = inner

local potionBox = Instance.new("TextButton")
potionBox.Size = UDim2.new(0, 68, 0, 34)
potionBox.Position = UDim2.new(1, -80, 0, 278)
potionBox.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
potionBox.BorderSizePixel = 0
potionBox.Text = ""
potionBox.AutoButtonColor = false
potionBox.Parent = inner

local potionBoxC = Instance.new("UICorner")
potionBoxC.CornerRadius = UDim.new(0, 7)
potionBoxC.Parent = potionBox

-------------------------------------------------
-- MINIMIZED BAR
-------------------------------------------------
local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 270, 0, 44)
bar.Position = UDim2.new(0, 50, 0, 50)
bar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bar.BorderSizePixel = 0
bar.Active = true
bar.Draggable = true
bar.Visible = false
bar.Parent = sg

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 10)
barCorner.Parent = bar

local barStroke = Instance.new("UIStroke")
barStroke.Color = Color3.fromRGB(220, 0, 0)
barStroke.Thickness = 3
barStroke.Parent = bar

local barLbl = Instance.new("TextLabel")
barLbl.Size = UDim2.new(1, -90, 1, 0)
barLbl.Position = UDim2.new(0, 12, 0, 0)
barLbl.BackgroundTransparency = 1
barLbl.Text = "Ritz semi instant"
barLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
barLbl.Font = Enum.Font.GothamItalic
barLbl.TextSize = 16
barLbl.TextXAlignment = Enum.TextXAlignment.Left
barLbl.Parent = bar

local restoreBtn = Instance.new("TextButton")
restoreBtn.Size = UDim2.new(0, 28, 1, 0)
restoreBtn.Position = UDim2.new(1, -62, 0, 0)
restoreBtn.BackgroundTransparency = 1
restoreBtn.Text = "+"
restoreBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
restoreBtn.Font = Enum.Font.GothamBold
restoreBtn.TextSize = 24
restoreBtn.BorderSizePixel = 0
restoreBtn.Parent = bar

local closeBarBtn = Instance.new("TextButton")
closeBarBtn.Size = UDim2.new(0, 28, 1, 0)
closeBarBtn.Position = UDim2.new(1, -32, 0, 0)
closeBarBtn.BackgroundTransparency = 1
closeBarBtn.Text = "X"
closeBarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBarBtn.Font = Enum.Font.GothamBold
closeBarBtn.TextSize = 18
closeBarBtn.BorderSizePixel = 0
closeBarBtn.Parent = bar

-------------------------------------------------
-- TOGGLE FUNCTION
-------------------------------------------------
local function setToggle(box, on)
    TweenService:Create(box, TweenInfo.new(0.2), {
        BackgroundColor3 = on and Color3.fromRGB(0, 210, 0) or Color3.fromRGB(180, 0, 0)
    }):Play()
end

-------------------------------------------------
-- BUTTON LOGIC
-------------------------------------------------
speedBox.MouseButton1Click:Connect(function()
    speedOn = not speedOn
    setToggle(speedBox, speedOn)
    local char = LocalPlayer.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = speedOn and SPEED_BOOST_AMOUNT or 16
        end
    end
end)

kickBox.MouseButton1Click:Connect(function()
    kickOn = not kickOn
    setToggle(kickBox, kickOn)
    -- Add your auto kick logic here
end)

potionBox.MouseButton1Click:Connect(function()
    potionOn = not potionOn
    setToggle(potionBox, potionOn)
    -- Add your auto potion logic here
end)

tp1.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(BASE_1_POSITION)
    end
end)

tp2.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(BASE_2_POSITION)
    end
end)

-- TP button hover effects
tp1.MouseEnter:Connect(function() tp1.BackgroundColor3 = Color3.fromRGB(255, 30, 30) end)
tp1.MouseLeave:Connect(function() tp1.BackgroundColor3 = Color3.fromRGB(200, 0, 0) end)
tp2.MouseEnter:Connect(function() tp2.BackgroundColor3 = Color3.fromRGB(255, 30, 30) end)
tp2.MouseLeave:Connect(function() tp2.BackgroundColor3 = Color3.fromRGB(200, 0, 0) end)

-------------------------------------------------
-- WINDOW CONTROLS
-------------------------------------------------
minBtn.MouseButton1Click:Connect(function()
    win.Visible = false
    bar.Visible = true
end)

restoreBtn.MouseButton1Click:Connect(function()
    bar.Visible = false
    win.Visible = true
end)

local function closeAll()
    win.Visible = false
    bar.Visible = false
end

closeBtn.MouseButton1Click:Connect(closeAll)
closeBarBtn.MouseButton1Click:Connect(closeAll)

-- Reapply speed boost on respawn
LocalPlayer.CharacterAdded:Connect(function(char)
    if speedOn then
        local hum = char:WaitForChild("Humanoid")
        hum.WalkSpeed = SPEED_BOOST_AMOUNT
    end
end)

print("[Ritz Semi Instant] Loaded!")
