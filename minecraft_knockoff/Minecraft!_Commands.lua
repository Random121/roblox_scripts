--Function and variables

local locplayer = game.Players.LocalPlayer

local find_player = function(input)
    for i,v in next, game.Players:GetPlayers() do
        if v.Name:lower():sub(1, #input) == input:lower() then
            return v
        end
    end
end

--Commands

locplayer.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 6) == ">kill " then
        local killinp = string.sub(msg, 7)
        if killinp == 'all' then
            for i,c in pairs(game.Players:GetPlayers()) do
                local plrhead = c.Character["Head"]
                game:GetService("ReplicatedStorage").axe:FireServer(plrhead)
            end
        else
            local killplr =  find_player(killinp)
            local plrhead = killplr.Character["Head"]
            game:GetService("ReplicatedStorage").axe:FireServer(plrhead)
        end
    end
end)

locplayer.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 6) == ">btool" then
        local mouse = game.Players.LocalPlayer:GetMouse()
        tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Delete Tool"
        tool.Activated:connect(function()
        local obj = mouse.Target
        game:GetService("ReplicatedStorage").axe:FireServer(obj)
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
end)

locplayer.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 6) == ">kick " then
        local kickinp = string.sub(msg, 7)
        if kickinp == 'all' then
            for _, child in pairs(game.Players:GetChildren()) do
                game:GetService("ReplicatedStorage").axe:FireServer(child)
            end
        else
            local kickplr =  find_player(kickinp)
            game:GetService("ReplicatedStorage").axe:FireServer(kickplr)
        end
    end
end)

locplayer.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 5) == ">snap" then
        for _, child in pairs(game.Workspace:GetChildren()) do
            game:GetService("ReplicatedStorage").axe:FireServer(child)
        end
        for _, child in pairs(game.Players:GetChildren()) do
            game:GetService("ReplicatedStorage").axe:FireServer(child)
        end
    end
end)
locplayer.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 5) == ">clear" then
        for i,v in pairs(game.Workspace.Map:GetChildren()) do
            game:GetService("ReplicatedStorage").axe:FireServer(v)        
        end
    end
end)
