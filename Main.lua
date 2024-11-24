-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DolphinPcUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.6, 0, 0.8, 0)
mainFrame.Position = UDim2.new(0.2, 0, 0.1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0.1, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(173, 216, 230) -- Light blue
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

-- Title Text
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 1, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Dolphin-Pc"
titleText.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
titleText.TextScaled = true
titleText.Font = Enum.Font.GothamBold
titleText.Parent = titleBar

-- Tab Buttons Frame
local tabButtonsFrame = Instance.new("Frame")
tabButtonsFrame.Size = UDim2.new(1, 0, 0.1, 0)
tabButtonsFrame.Position = UDim2.new(0, 0, 0.1, 0)
tabButtonsFrame.BackgroundTransparency = 1
tabButtonsFrame.Parent = mainFrame

-- Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 0.8, 0)
contentFrame.Position = UDim2.new(0, 0, 0.2, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Black background
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

-- Function to create a tab button
local function createTabButton(name, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.3, -5, 1, 0)
    button.Position = UDim2.new(position, 0, 0, 0)
    button.BackgroundColor3 = Color3.fromRGB(173, 216, 230) -- Light blue
    button.Text = name
    button.TextScaled = true
    button.Font = Enum.Font.GothamBold
    button.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
    button.Parent = tabButtonsFrame
    return button
end

-- Create Tabs
local localPlayerTab = createTabButton("Local-Player", 0)
local movesetsTab = createTabButton("Movesets", 0.35)
local opTab = createTabButton("Op", 0.7)

-- Create Frames for Each Tab
local localPlayerFrame = Instance.new("Frame")
localPlayerFrame.Size = UDim2.new(1, 0, 1, 0)
localPlayerFrame.BackgroundTransparency = 1
localPlayerFrame.Parent = contentFrame

local movesetsFrame = Instance.new("Frame")
movesetsFrame.Size = UDim2.new(1, 0, 1, 0)
movesetsFrame.BackgroundTransparency = 1
movesetsFrame.Visible = false
movesetsFrame.Parent = contentFrame

local opFrame = Instance.new("Frame")
opFrame.Size = UDim2.new(1, 0, 1, 0)
opFrame.BackgroundTransparency = 1
opFrame.Visible = false
opFrame.Parent = contentFrame

-- Add Placeholder Text to Each Tab
local function addPlaceholderText(parent, text)
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = Color3.fromRGB(173, 216, 230) -- Light blue text
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.Gotham
    textLabel.Parent = parent
end

addPlaceholderText(localPlayerFrame, "Local-Player Content")
addPlaceholderText(movesetsFrame, "Movesets Content")
addPlaceholderText(opFrame, "Op Content")

-- Tab Switching Logic
local function switchTab(tabName)
    -- Hide all frames
    localPlayerFrame.Visible = false
    movesetsFrame.Visible = false
    opFrame.Visible = false

    -- Show the selected frame
    if tabName == "Local-Player" then
        localPlayerFrame.Visible = true
    elseif tabName == "Movesets" then
        movesetsFrame.Visible = true
    elseif tabName == "Op" then
        opFrame.Visible = true
    end
end

-- Connect Tab Buttons to Switching Logic
localPlayerTab.MouseButton1Click:Connect(function()
    switchTab("Local-Player")
end)

movesetsTab.MouseButton1Click:Connect(function()
    switchTab("Movesets")
end)

opTab.MouseButton1Click:Connect(function()
    switchTab("Op")
end)
