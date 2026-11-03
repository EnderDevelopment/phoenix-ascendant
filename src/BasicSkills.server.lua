-- BasicSkills.server.lua

local Players = game:GetService("Players")

local function onPlayerAdded(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Basic skill: Fire Blast
    local fireBlast = Instance.new("Script")
    fireBlast.Name = "FireBlast"
    fireBlast.Parent = character

    -- Basic skill: Phoenix Dive
    local phoenixDive = Instance.new("Script")
    phoenixDive.Name = "PhoenixDive"
    phoenixDive.Parent = character

    -- Basic skill: Flame Shield
    local flameShield = Instance.new("Script")
    flameShield.Name = "FlameShield"
    flameShield.Parent = character
end

Players.PlayerAdded:Connect(onPlayerAdded)