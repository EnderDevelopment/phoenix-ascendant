-- Achievement System for Phoenix Character

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local AchievementSystem = {}

-- Define achievements
AchievementSystem.Achievements = {
    {
        Name = "First Steps",
        Description = "Reach level 1",
        Reward = 50,
        Unlocked = false
    },
    {
        Name = "Phoenix Beginner",
        Description = "Reach level 5",
        Reward = 100,
        Unlocked = false
    },
    {
        Name = "Phoenix Master",
        Description = "Reach level 10",
        Reward = 200,
        Unlocked = false
    }
}

-- Initialize player achievements
function AchievementSystem:InitializePlayer(player)
    local achievements = Instance.new("Folder")
    achievements.Name = "Achievements"
    achievements.Parent = player

    for _, achievement in ipairs(self.Achievements) do
        local ach = Instance.new("BoolValue")
        ach.Name = achievement.Name
        ach.Value = achievement.Unlocked
        ach.Parent = achievements
    end
end

-- Check and unlock achievements
function AchievementSystem:CheckAchievements(player)
    local leaderstats = player:FindFirstChild("leaderstats")
    local achievements = player:FindFirstChild("Achievements")

    if leaderstats and achievements then
        local level = leaderstats:FindFirstChild("Level")

        if level then
            for _, achievement in ipairs(self.Achievements) do
                local ach = achievements:FindFirstChild(achievement.Name)

                if ach and not ach.Value then
                    if achievement.Name == "First Steps" and level.Value >= 1 then
                        ach.Value = true
                        self:GrantReward(player, achievement)
                    elseif achievement.Name == "Phoenix Beginner" and level.Value >= 5 then
                        ach.Value = true
                        self:GrantReward(player, achievement)
                    elseif achievement.Name == "Phoenix Master" and level.Value >= 10 then
                        ach.Value = true
                        self:GrantReward(player, achievement)
                    end
                end
            end
        end
    end
end

-- Grant reward for achievement
function AchievementSystem:GrantReward(player, achievement)
    -- Implement your reward system here
    print(player.Name .. " unlocked achievement: " .. achievement.Name)
    print("Reward: " .. achievement.Reward .. " XP")

    -- Add reward XP to player
    local levelSystem = require(script.Parent.LevelSystem)
    levelSystem:AddXP(player, achievement.Reward)
end

-- Player added event
Players.PlayerAdded:Connect(function(player)
    AchievementSystem:InitializePlayer(player)

    -- Check achievements when player joins
    AchievementSystem:CheckAchievements(player)

    -- Connect to level changes
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local level = leaderstats:FindFirstChild("Level")
        if level then
            level.Changed:Connect(function()
                AchievementSystem:CheckAchievements(player)
            end)
        end
    end
end)

return AchievementSystem