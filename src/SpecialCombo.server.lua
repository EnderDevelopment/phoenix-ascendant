-- SpecialCombo.server.lua

local Players = game:GetService("Players")

local function onPlayerAdded(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Special combo: Ultimate Fire Combo
    local ultimateFireCombo = Instance.new("Script")
    ultimateFireCombo.Name = "UltimateFireCombo"
    ultimateFireCombo.Parent = character

    -- Special combo: Ultimate Phoenix Combo
    local ultimatePhoenixCombo = Instance.new("Script")
    ultimatePhoenixCombo.Name = "UltimatePhoenixCombo"
    ultimatePhoenixCombo.Parent = character

    -- Special combo: Ultimate Flame Combo
    local ultimateFlameCombo = Instance.new("Script")
    ultimateFlameCombo.Name = "UltimateFlameCombo"
    ultimateFlameCombo.Parent = character
end

Players.PlayerAdded:Connect(onPlayerAdded)