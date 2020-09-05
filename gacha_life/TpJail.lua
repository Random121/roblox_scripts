spawn(function()
    while wait(0.01) do
        for i,v in pairs(game.Players:GetChildren()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
        local A_1 = game:GetService("Workspace")[v.Name].HumanoidRootPart

        local A_2 = game:GetService("Workspace").TownTeleports.Door1
        local Event = game:GetService("ReplicatedStorage").TeleportPlayer
        Event:FireServer(A_1, A_2)
        end
        end
    end
end)

