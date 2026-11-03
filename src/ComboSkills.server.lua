-- ComboSkills.server.lua

local Players = game:GetService("Players")

local function onPlayerAdded(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Combo skill: Fire Combo
    local fireCombo = Instance.new("Script")
    fireCombo.Name = "FireCombo"
    fireCombo.Parent = character

    -- Combo skill: Phoenix Combo
    local phoenixCombo = Instance.new("Script")
    phoenixCombo.Name = "PhoenixCombo"
    phoenixCombo.Parent = character

    -- Combo skill: Flame Combo
    local flameCombo = Instance.new("Script")
    flameCombo.Name = "FlameCombo"
    flameCombo.Parent = character
end

Players.PlayerAdded:Connect(onPlayerAdded)