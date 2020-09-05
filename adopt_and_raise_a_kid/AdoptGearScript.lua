--Variables

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
_G.acttoggle = false
_G.geartoggle = false
actbind = "r"
gearbind = "f"
dropbind = "t"

--Activate

mouse.KeyDown:connect(function(key)
    if key == actbind then
        _G.acttoggle = true
        while _G.acttoggle == true do
            wait()
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool")then
                    v:Activate()
                end
            end
        end
    end
end)

mouse.KeyUp:connect(function(key)
    if key == actbind then
        _G.acttoggle = false
    end
end)

--Give gears

player.Chatted:Connect(function(msg)
    if string.sub(msg, 1, 8) == "gearid: " then
        local chatid = string.sub(msg, 9)
        print(chatid)
        if tonumber(chatid) ~= nil then
            gearid = tonumber(chatid)
        else
            print('Invalid gear ID')
        end
    end
end)

mouse.KeyDown:connect(function(key)
    if key == gearbind then
        _G.geartoggle = true
        while _G.geartoggle == true do
            wait()
            game.ReplicatedStorage.WearItem:FireServer("Shirt", gearid, false)
        end
    end
end)

mouse.KeyUp:connect(function(key)
    if key == gearbind then
        _G.geartoggle = false
    end
end)

--Clear tools

mouse.KeyDown:connect(function(key)
    if key == dropbind then
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.ClassName == "Tool" then
                v.CanBeDropped = true
                v.Parent = workspace
            end
        end
    end
end)
