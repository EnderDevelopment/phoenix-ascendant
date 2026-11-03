-- UltimateSkill.server.lua

local Players = game:GetService("Players")

local function onPlayerAdded(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Ultimate skill: Phoenix Sword
    local phoenixSword = Instance.new("Script")
    phoenixSword.Name = "PhoenixSword"
    phoenixSword.Parent = character

    -- Ultimate skill: Phoenix Wings
    local phoenixWings = Instance.new("Script")
    phoenixWings.Name = "PhoenixWings"
    phoenixWings.Parent = character

    -- Ultimate skill: Phoenix Fire
    local phoenixFire = Instance.new("Script")
    phoenixFire.Name = "PhoenixFire"
    phoenixFire.Parent = character
end

Players.PlayerAdded:Connect(onPlayerAdded)