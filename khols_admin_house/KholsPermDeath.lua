local locplr = game.Players.LocalPlayer
local Players = game:GetService("Players")

function checkdeath(player)
    player.CharacterAdded:Connect(function(character)
        character:WaitForChild("Humanoid").Died:Connect(function()
            wait(5)
            game.Workspace.Delete.delete:FireServer(player)
        end)
    end)
end  

for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= locplr then
        checkdeath(player)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    checkdeath(player)
end)

