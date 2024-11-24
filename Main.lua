local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()

_G.CustomTheme = {
    Tab_Color = Color3.fromRGB(255, 255, 255),
    Tab_Text_Color = Color3.fromRGB(0, 0, 0),
    Description_Color = Color3.fromRGB(255, 255, 255),
    Description_Text_Color = Color3.fromRGB(0, 0, 0),
    Container_Color = Color3.fromRGB(255, 255, 255),
    Container_Text_Color = Color3.fromRGB(0, 0, 0),
    Button_Text_Color = Color3.fromRGB(0, 0, 0),
    Toggle_Box_Color = Color3.fromRGB(243, 243, 243),
    Toggle_Inner_Color = Color3.fromRGB(94, 255, 180),
    Toggle_Text_Color = Color3.fromRGB(0, 0, 0),
    Toggle_Border_Color = Color3.fromRGB(225, 225, 225),
    Slider_Bar_Color = Color3.fromRGB(243, 243, 243),
    Slider_Inner_Color = Color3.fromRGB(94, 255, 180),
    Slider_Text_Color = Color3.fromRGB(0, 0, 0),
    Slider_Border_Color = Color3.fromRGB(255, 255, 255),
    Dropdown_Text_Color = Color3.fromRGB(0, 0, 0),
    Dropdown_Option_BorderSize = 1,
    Dropdown_Option_BorderColor = Color3.fromRGB(235, 235, 235),
    Dropdown_Option_Color = Color3.fromRGB(255, 255, 255),
    Dropdown_Option_Text_Color = Color3.fromRGB(0, 0, 0)
}

local LocalPlayerTab = Library:CreateTab("Local-Player", "", true)

-- State to control if WalkSpeed should repeat
local walkSpeedActive = false
local lastWalkSpeed = 16 -- Default walk speed value

-- Create the slider for WalkSpeed
LocalPlayerTab:CreateSlider("WalkSpeed", 0, 600, function(arg)
    -- Only change WalkSpeed if the repeat feature is active
    if walkSpeedActive then
        print("WalkSpeed is set to:", arg)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = arg
            lastWalkSpeed = arg
        end
    end
end)

-- Create the toggle for enabling/disabling WalkSpeed repeating
LocalPlayerTab:CreateToggle("Enable WalkSpeed Repeat", function(arg)
    if arg then
        walkSpeedActive = true
        print("WalkSpeed repeat is now enabled.")
    else
        walkSpeedActive = false
        -- Set WalkSpeed back to the default value (16)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 16
        end
        print("WalkSpeed repeat is now disabled, WalkSpeed set to 16.")
    end
end)
