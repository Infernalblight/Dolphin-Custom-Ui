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

-- State to control if WalkSpeed and JumpPower should repeat
local walkSpeedActive = false
local jumpPowerActive = false
local lastWalkSpeed = 16  -- Default WalkSpeed value
local lastJumpPower = 50  -- Default JumpPower value

-- Create the slider for WalkSpeed
LocalPlayerTab:CreateSlider("WalkSpeed", 0, 600, function(arg)
    -- Update WalkSpeed only if the repeat feature is active
    if walkSpeedActive then
        print("WalkSpeed is set to:", arg)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = arg
            lastWalkSpeed = arg
        end
    else
        -- If repeat is not active, just update the last WalkSpeed value
        lastWalkSpeed = arg
    end
end)

-- Create the toggle for enabling/disabling WalkSpeed repeating
LocalPlayerTab:CreateToggle("Enable WalkSpeed Repeat", function(arg)
    if arg then
        -- Enable WalkSpeed repeat and start repeating the current WalkSpeed value
        walkSpeedActive = true
        print("WalkSpeed repeat is now enabled.")
        
        -- Set WalkSpeed to the last slider value (if available)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = lastWalkSpeed
        end
    else
        -- Disable WalkSpeed repeat and set WalkSpeed back to 16
        walkSpeedActive = false
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 16
        end
        print("WalkSpeed repeat is now disabled, WalkSpeed set to 16.")
    end
end)

-- Create the slider for JumpPower
LocalPlayerTab:CreateSlider("JumpPower", 0, 200, function(arg)
    -- Update JumpPower only if the repeat feature is active
    if jumpPowerActive then
        print("JumpPower is set to:", arg)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = arg
            lastJumpPower = arg
        end
    else
        -- If repeat is not active, just update the last JumpPower value
        lastJumpPower = arg
    end
end)

-- Create the toggle for enabling/disabling JumpPower repeating
LocalPlayerTab:CreateToggle("Enable JumpPower Repeat", function(arg)
    if arg then
        -- Enable JumpPower repeat and start repeating the current JumpPower value
        jumpPowerActive = true
        print("JumpPower repeat is now enabled.")
        
        -- Set JumpPower to the last slider value (if available)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = lastJumpPower
        end
    else
        -- Disable JumpPower repeat and set JumpPower back to default value (50)
        jumpPowerActive = false
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = 50
        end
        print("JumpPower repeat is now disabled, JumpPower set to 50.")
    end
end)
