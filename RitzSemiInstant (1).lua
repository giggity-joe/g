-- Ritz Semi Instant GUI
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer
local pg = lp:WaitForChild("PlayerGui")

-- CONFIG
local BASE1 = Vector3.new(0, 5, 0)   -- Change to your TP Base 1
local BASE2 = Vector3.new(100, 5, 0) -- Change to your TP Base 2
local SPEED = 50

-- Clean old
if pg:FindFirstChild("RitzGUI") then pg.RitzGUI:Destroy() end

local sg = Instance.new("ScreenGui")
sg.Name = "RitzGUI"
sg.ResetOnSpawn = false
sg.IgnoreGuiInset = true
sg.Parent = pg

-- RED BORDER BACKGROUND (fake border using a slightly bigger red frame behind)
local border = Instance.new("Frame")
border.Size = UDim2.new(0, 296, 0, 416)
border.Position = UDim2.new(0, 47, 0, 47)
border.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
border.BorderSizePixel = 0
border.Active = true
border.Draggable = false
border.Parent = sg
Instance.new("UICorner", border).CornerRadius = UDim.new(0, 20)

-- MAIN BLACK WINDOW on top of border
local win = Instance.new("Frame")
win.Size = UDim2.new(0, 284, 0, 404)
win.Position = UDim2.new(0, 53, 0, 53)
win.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
win.BorderSizePixel = 0
win.Active = true
win.Draggable = true
win.Parent = sg
Instance.new("UICorner", win).CornerRadius = UDim.new(0, 17)

-- TITLE LABEL
local titleLbl = Instance.new("TextLabel")
titleLbl.Parent = win
titleLbl.Size = UDim2.new(0, 180, 0, 36)
titleLbl.Position = UDim2.new(0, 12, 0, 4)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "Ritz semi instant"
titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLbl.Font = Enum.Font.GothamItalic
titleLbl.TextSize = 17
titleLbl.TextXAlignment = Enum.TextXAlignment.Left

-- MINUS BUTTON
local minBtn = Instance.new("TextButton")
minBtn.Parent = win
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(0, 218, 0, 4)
minBtn.BackgroundTransparency = 1
minBtn.BorderSizePixel = 0
minBtn.Text = "-"
minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 28

-- X BUTTON
local xBtn = Instance.new("TextButton")
xBtn.Parent = win
xBtn.Size = UDim2.new(0, 30, 0, 30)
xBtn.Position = UDim2.new(0, 250, 0, 4)
xBtn.BackgroundTransparency = 1
xBtn.BorderSizePixel = 0
xBtn.Text = "X"
xBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
xBtn.Font = Enum.Font.GothamBoldItalic
xBtn.TextSize = 20

-- RED INNER BORDER (fake, behind content)
local innerBorder = Instance.new("Frame")
innerBorder.Parent = win
innerBorder.Size = UDim2.new(0, 268, 0, 358)
innerBorder.Position = UDim2.new(0, 8, 0, 40)
innerBorder.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
innerBorder.BorderSizePixel = 0
Instance.new("UICorner", innerBorder).CornerRadius = UDim.new(0, 14)

local innerBlack = Instance.new("Frame")
innerBlack.Parent = win
innerBlack.Size = UDim2.new(0, 262, 0, 352)
innerBlack.Position = UDim2.new(0, 11, 0, 43)
innerBlack.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
innerBlack.BorderSizePixel = 0
Instance.new("UICorner", innerBlack).CornerRadius = UDim.new(0, 12)

-- INSTANT STEAL LABEL
local stealLbl = Instance.new("TextLabel")
stealLbl.Parent = win
stealLbl.Size = UDim2.new(0, 260, 0, 44)
stealLbl.Position = UDim2.new(0, 12, 0, 48)
stealLbl.BackgroundTransparency = 1
stealLbl.Text = "Instant steal"
stealLbl.TextColor3 = Color3.fromRGB(255, 25, 25)
stealLbl.Font = Enum.Font.GothamBoldItalic
stealLbl.TextSize = 30
stealLbl.TextXAlignment = Enum.TextXAlignment.Center

-- TP BASE 1
local tp1bg = Instance.new("Frame")
tp1bg.Parent = win
tp1bg.Size = UDim2.new(0, 246, 0, 48)
tp1bg.Position = UDim2.new(0, 19, 0, 98)
tp1bg.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
tp1bg.BorderSizePixel = 0
Instance.new("UICorner", tp1bg).CornerRadius = UDim.new(0, 8)

local tp1 = Instance.new("TextButton")
tp1.Parent = win
tp1.Size = UDim2.new(0, 246, 0, 48)
tp1.Position = UDim2.new(0, 19, 0, 98)
tp1.BackgroundTransparency = 1
tp1.BorderSizePixel = 0
tp1.Text = "TP Base 1"
tp1.TextColor3 = Color3.fromRGB(255, 255, 255)
tp1.Font = Enum.Font.GothamBoldItalic
tp1.TextSize = 20

-- TP BASE 2
local tp2bg = Instance.new("Frame")
tp2bg.Parent = win
tp2bg.Size = UDim2.new(0, 246, 0, 48)
tp2bg.Position = UDim2.new(0, 19, 0, 154)
tp2bg.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
tp2bg.BorderSizePixel = 0
Instance.new("UICorner", tp2bg).CornerRadius = UDim.new(0, 8)

local tp2 = Instance.new("TextButton")
tp2.Parent = win
tp2.Size = UDim2.new(0, 246, 0, 48)
tp2.Position = UDim2.new(0, 19, 0, 154)
tp2.BackgroundTransparency = 1
tp2.BorderSizePixel = 0
tp2.Text = "TP Base 2"
tp2.TextColor3 = Color3.fromRGB(255, 255, 255)
tp2.Font = Enum.Font.GothamBoldItalic
tp2.TextSize = 20

-- SPEED BOOST LABEL
local speedLbl = Instance.new("TextLabel")
speedLbl.Parent = win
speedLbl.Size = UDim2.new(0, 170, 0, 36)
speedLbl.Position = UDim2.new(0, 19, 0, 216)
speedLbl.BackgroundTransparency = 1
speedLbl.Text = "Speed boost"
speedLbl.TextColor3 = Color3.fromRGB(255, 25, 25)
speedLbl.Font = Enum.Font.GothamBoldItalic
speedLbl.TextSize = 18
speedLbl.TextXAlignment = Enum.TextXAlignment.Left

-- SPEED BOOST TOGGLE
local speedBox = Instance.new("TextButton")
speedBox.Parent = win
speedBox.Size = UDim2.new(0, 68, 0, 34)
speedBox.Position = UDim2.new(0, 200, 0, 218)
speedBox.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
speedBox.BorderSizePixel = 0
speedBox.Text = ""
speedBox.AutoButtonColor = false
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0, 7)

-- AUTO KICK LABEL
local kickLbl = Instance.new("TextLabel")
kickLbl.Parent = win
kickLbl.Size = UDim2.new(0, 170, 0, 50)
kickLbl.Position = UDim2.new(0, 19, 0, 262)
kickLbl.BackgroundTransparency = 1
kickLbl.Text = "Auto Kick\nwhen stolen"
kickLbl.TextColor3 = Color3.fromRGB(255, 25, 25)
kickLbl.Font = Enum.Font.GothamBoldItalic
kickLbl.TextSize = 18
kickLbl.TextXAlignment = Enum.TextXAlignment.Left

-- AUTO KICK TOGGLE
local kickBox = Instance.new("TextButton")
kickBox.Parent = win
kickBox.Size = UDim2.new(0, 68, 0, 34)
kickBox.Position = UDim2.new(0, 200, 0, 270)
kickBox.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
kickBox.BorderSizePixel = 0
kickBox.Text = ""
kickBox.AutoButtonColor = false
Instance.new("UICorner", kickBox).CornerRadius = UDim.new(0, 7)

-- AUTO POTION LABEL
local potionLbl = Instance.new("TextLabel")
potionLbl.Parent = win
potionLbl.Size = UDim2.new(0, 170, 0, 36)
potionLbl.Position = UDim2.new(0, 19, 0, 320)
potionLbl.BackgroundTransparency = 1
potionLbl.Text = "Auto potion"
potionLbl.TextColor3 = Color3.fromRGB(255, 25, 25)
potionLbl.Font = Enum.Font.GothamBoldItalic
potionLbl.TextSize = 18
potionLbl.TextXAlignment = Enum.TextXAlignment.Left

-- AUTO POTION TOGGLE
local potionBox = Instance.new("TextButton")
potionBox.Parent = win
potionBox.Size = UDim2.new(0, 68, 0, 34)
potionBox.Position = UDim2.new(0, 200, 0, 322)
potionBox.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
potionBox.BorderSizePixel = 0
potionBox.Text = ""
potionBox.AutoButtonColor = false
Instance.new("UICorner", potionBox).CornerRadius = UDim.new(0, 7)

----------------------------------------------------
-- MINIMIZED BAR
----------------------------------------------------
local barBorder = Instance.new("Frame")
barBorder.Size = UDim2.new(0, 276, 0, 50)
barBorder.Position = UDim2.new(0, 47, 0, 47)
barBorder.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
barBorder.BorderSizePixel = 0
barBorder.Visible = false
barBorder.Parent = sg
Instance.new("UICorner", barBorder).CornerRadius = UDim.new(0, 12)

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 270, 0, 44)
bar.Position = UDim2.new(0, 50, 0, 50)
bar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bar.BorderSizePixel = 0
bar.Active = true
bar.Draggable = true
bar.Visible = false
bar.Parent = sg
Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 10)

local barLbl = Instance.new("TextLabel")
barLbl.Parent = bar
barLbl.Size = UDim2.new(0, 160, 1, 0)
barLbl.Position = UDim2.new(0, 12, 0, 0)
barLbl.BackgroundTransparency = 1
barLbl.Text = "Ritz semi instant"
barLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
barLbl.Font = Enum.Font.GothamItalic
barLbl.TextSize = 16
barLbl.TextXAlignment = Enum.TextXAlignment.Left

local plusBtn = Instance.new("TextButton")
plusBtn.Parent = bar
plusBtn.Size = UDim2.new(0, 30, 1, 0)
plusBtn.Position = UDim2.new(0, 204, 0, 0)
plusBtn.BackgroundTransparency = 1
plusBtn.BorderSizePixel = 0
plusBtn.Text = "+"
plusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
plusBtn.Font = Enum.Font.GothamBold
plusBtn.TextSize = 24

local xBarBtn = Instance.new("TextButton")
xBarBtn.Parent = bar
xBarBtn.Size = UDim2.new(0, 30, 1, 0)
xBarBtn.Position = UDim2.new(0, 236, 0, 0)
xBarBtn.BackgroundTransparency = 1
xBarBtn.BorderSizePixel = 0
xBarBtn.Text = "X"
xBarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
xBarBtn.Font = Enum.Font.GothamBoldItalic
xBarBtn.TextSize = 18

----------------------------------------------------
-- LOGIC
----------------------------------------------------
local speedOn, kickOn, potionOn = false, false, false

local function toggle(box, on)
    TweenService:Create(box, TweenInfo.new(0.15), {
        BackgroundColor3 = on and Color3.fromRGB(0, 210, 0) or Color3.fromRGB(180, 0, 0)
    }):Play()
end

speedBox.MouseButton1Click:Connect(function()
    speedOn = not speedOn
    toggle(speedBox, speedOn)
    local c = lp.Character
    if c then
        local h = c:FindFirstChildOfClass("Humanoid")
        if h then h.WalkSpeed = speedOn and SPEED or 16 end
    end
end)

kickBox.MouseButton1Click:Connect(function()
    kickOn = not kickOn
    toggle(kickBox, kickOn)
end)

potionBox.MouseButton1Click:Connect(function()
    potionOn = not potionOn
    toggle(potionBox, potionOn)
end)

tp1.MouseButton1Click:Connect(function()
    local c = lp.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        c.HumanoidRootPart.CFrame = CFrame.new(BASE1)
    end
end)

tp2.MouseButton1Click:Connect(function()
    local c = lp.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        c.HumanoidRootPart.CFrame = CFrame.new(BASE2)
    end
end)

-- Window controls
local function showMain()
    border.Visible = true
    win.Visible = true
    barBorder.Visible = false
    bar.Visible = false
end

local function showBar()
    border.Visible = false
    win.Visible = false
    barBorder.Visible = true
    bar.Visible = true
end

local function hideAll()
    border.Visible = false
    win.Visible = false
    barBorder.Visible = false
    bar.Visible = false
end

minBtn.MouseButton1Click:Connect(showBar)
plusBtn.MouseButton1Click:Connect(showMain)
xBtn.MouseButton1Click:Connect(hideAll)
xBarBtn.MouseButton1Click:Connect(hideAll)

lp.CharacterAdded:Connect(function(c)
    if speedOn then
        local h = c:WaitForChild("Humanoid")
        h.WalkSpeed = SPEED
    end
end)

print("[Ritz GUI] Loaded!")
