-- Level System for Phoenix Character

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LevelSystem = {}

-- Initialize player data
function LevelSystem:InitializePlayer(player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local level = Instance.new("IntValue")
    level.Name = "Level"
    level.Value = 1
    level.Parent = leaderstats

    local xp = Instance.new("IntValue")
    xp.Name = "XP"
    xp.Value = 0
    xp.Parent = leaderstats

    local xpRequired = Instance.new("IntValue")
    xpRequired.Name = "XPRequired"
    xpRequired.Value = 100
    xpRequired.Parent = leaderstats
end

-- Add XP to player
function LevelSystem:AddXP(player, amount)
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local xp = leaderstats:FindFirstChild("XP")
        local level = leaderstats:FindFirstChild("Level")
        local xpRequired = leaderstats:FindFirstChild("XPRequired")

        if xp and level and xpRequired then
            xp.Value = xp.Value + amount

            -- Check for level up
            while xp.Value >= xpRequired.Value do
                xp.Value = xp.Value - xpRequired.Value
                level.Value = level.Value + 1
                xpRequired.Value = math.floor(xpRequired.Value * 1.5)

                -- Grant rewards for leveling up
                self:GrantLevelRewards(player, level.Value)
            end
        end
    end
end

-- Grant rewards for leveling up
function LevelSystem:GrantLevelRewards(player, level)
    -- Implement your reward system here
    print(player.Name .. " leveled up to " .. level .. "!")
end

-- Player added event
Players.PlayerAdded:Connect(function(player)
    LevelSystem:InitializePlayer(player)

    -- Example: Add XP when player joins
    LevelSystem:AddXP(player, 10)
end)

return LevelSystem