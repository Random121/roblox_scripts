local playersService = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local starterGui = game:GetService("StarterGui")
local localPlr = playersService.LocalPlayer

local banList = {}
local whitelist = {}

--ban
function ban(plr)
    table.insert(banList,plr)
    print('Death banned:',plr)
    replicatedStorage.events.destroyObject:FireServer(plr)
end

--ban checker
function banCheck(plr)
    for i,v in pairs(banList) do
        if plr == v then
            replicatedStorage.events.destroyObject:FireServer(plr)
        end
    end
end

--respawn listener
function checkRespawn(plr)
    plr.CharacterAdded:Connect(function()
        ban(plr)
    end)
end

--add death listener
for _,plr in pairs(playersService:GetPlayers()) do
    if plr ~= localPlr then
        checkRespawn(plr)
    end
end

playersService.PlayerAdded:Connect(function(plr)
    banCheck(plr)
    plr.CharacterAdded:Connect(function()
        checkRespawn(plr)
    end)
end)

--starter notification
starterGui:SetCore("SendNotification", {
    Title = "2PSHT Permadeath | Loaded";
    Text = "Every player who dies now will be banned.";
    Duration = 3;
    Button1 = "Close";
})
