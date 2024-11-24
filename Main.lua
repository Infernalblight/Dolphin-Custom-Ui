-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DolphinPcUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.7, 0, 0.8, 0)
mainFrame.Position = UDim2.new(0.15, 0, 0.1, 0)
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
local function createTabButton(name, position, width)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(width, -5, 1, 0)
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
local localPlayerTab = createTabButton("Local-Player", 0, 0.25)
local movesetsTab = createTabButton("Movesets", 0.25, 0.25)
local opTab = createTabButton("Op", 0.5, 0.25)
local infoMiscTab = createTabButton("Info-Misc", 0.75, 0.25)

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

local infoMiscFrame = Instance.new("Frame")
infoMiscFrame.Size = UDim2.new(1, 0, 1, 0)
infoMiscFrame.BackgroundTransparency = 1
infoMiscFrame.Visible = false
infoMiscFrame.Parent = contentFrame

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

-- Create "Un-Inject" Button in Info-Misc Tab
local unInjectButton = Instance.new("TextButton")
unInjectButton.Size = UDim2.new(0.3, 0, 0.1, 0)
unInjectButton.Position = UDim2.new(0.35, 0, 0.45, 0)
unInjectButton.BackgroundColor3 = Color3.fromRGB(173, 216, 230) -- Light blue
unInjectButton.Text = "Un-Inject"
unInjectButton.TextScaled = true
unInjectButton.Font = Enum.Font.GothamBold
unInjectButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
unInjectButton.Parent = infoMiscFrame

unInjectButton.MouseButton1Click:Connect(function()
    screenGui:Destroy() -- Closes the UI by deleting the ScreenGui
end)

-- Tab Switching Logic
local function switchTab(tabName)
    -- Hide all frames
    localPlayerFrame.Visible = false
    movesetsFrame.Visible = false
    opFrame.Visible = false
    infoMiscFrame.Visible = false

    -- Show the selected frame
    if tabName == "Local-Player" then
        localPlayerFrame.Visible = true
    elseif tabName == "Movesets" then
        movesetsFrame.Visible = true
    elseif tabName == "Op" then
        opFrame.Visible = true
    elseif tabName == "Info-Misc" then
        infoMiscFrame.Visible = true
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

infoMiscTab.MouseButton1Click:Connect(function()
    switchTab("Info-Misc")
end)
