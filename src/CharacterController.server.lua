-- CharacterController.server.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function onPlayerAdded(player)
    -- Create character
    local character = Instance.new("Model")
    character.Name = player.Name
    character.Parent = workspace

    -- Set up character properties
    local humanoid = Instance.new("Humanoid")
    humanoid.Parent = character

    -- Add Phoenix powers
    local phoenixPower = Instance.new("Script")
    phoenixPower.Name = "PhoenixPower"
    phoenixPower.Parent = character

    -- Set up character appearance
    local characterMesh = Instance.new("Part")
    characterMesh.Name = "Head"
    characterMesh.Size = Vector3.new(2, 1, 1)
    characterMesh.Anchored = false
    characterMesh.CanCollide = false
    characterMesh.Parent = character

    -- Add character to player
    player.Character = character
end

Players.PlayerAdded:Connect(onPlayerAdded)