--variables
local Prefix = ';'
local playersService = game:GetService("Players")
local replicatedStorage = game:GetService("ReplicatedStorage")
local starterGui = game:GetService("StarterGui")
local runService = game:GetService("RunService")
local localPlr = playersService.LocalPlayer.Name

--player lists
local modList = {}
local adminList = {}
local banList = {}
local loopKillList = {}
local toolBanList = {}

--get players
function getTarget(target, sender)
    local foundPlayers = {}
    local targetl = target:lower()
    if targetl == "all" then
        for i,plr in pairs(playersService:GetPlayers()) do
            table.insert(foundPlayers,plr)
        end
    elseif targetl == "other" or targetl == "others" then
        for i,plr in pairs(playersService:GetPlayers()) do
            if plr.Name ~= sender.Name then
                table.insert(foundPlayers,plr)
            end
        end  
    elseif targetl == "me" then
        for i,plr in pairs(playersService:GetPlayers()) do
            if plr.Name == sender.Name then
                table.insert(foundPlayers,plr)
            end
        end  
    else
        for i,plr in pairs(playersService:GetPlayers()) do
            if plr.Name:lower():sub(1, #target) == target:lower() then
                table.insert(foundPlayers,plr)
            end
        end    
    end
    return foundPlayers    
end

function inTable(val,table)
    if table.find(table,val) then
        return true
    else
        return false
    end
end
--check rank
function isMod(plr)
    for i, mod in pairs(modList) do
        if string.lower(mod) == string.lower(plr.Name) then
            return true
        end
    end
end

function isAdmin(plr)
    for i, admin in pairs(adminList) do
        if string.lower(admin) == string.lower(plr.Name) then
            return true
        end
    end
end

function isOwner(plr)
    if string.lower(localPlr) == string.lower(plr.Name) then
        return true
    end
end

--cmds
function modCommand(plr,msg)
	if msg:lower():sub(1,5+Prefix:len()) == Prefix.."cash " then
        for i,v in pairs(getTarget(string.split(msg, " ")[2],plr)) do
            cash = string.split(msg, " ")[3]
            replicatedStorage.Events.changeValue:InvokeServer(replicatedStorage.plrData[v.Name].cash, cash)
        end
    elseif msg:lower():sub(1,10+Prefix:len()) == Prefix.."unpackage " then
        for i,v in pairs(getTarget(string.sub(msg,11+Prefix:len()),plr)) do
            for j,k in pairs(v.Character:GetChildren()) do
                if k:IsA("CharacterMesh") then
                    replicatedStorage.events.destroyObject:FireServer(k)
                end
            end
        end
    elseif msg:lower():sub(1,7+Prefix:len()) == Prefix.."rlimbs " then
        for i,v in pairs(getTarget(string.sub(msg,8+Prefix:len()),plr)) do
            if v.Character:FindFirstChild("Left Arm") then
                replicatedStorage.events.destroyObject:FireServer(v.Character["Left Arm"])
            end
            if v.Character:FindFirstChild("Right Arm") then
                replicatedStorage.events.destroyObject:FireServer(v.Character["Right Arm"])
            end
            if v.Character:FindFirstChild("Left Leg") then
                replicatedStorage.events.destroyObject:FireServer(v.Character["Left Leg"])
            end
            if v.Character:FindFirstChild("Right Leg") then
                replicatedStorage.events.destroyObject:FireServer(v.Character["Right Leg"])
            end
        end
    elseif msg:lower():sub(1,6+Prefix:len()) == Prefix.."rarms " then
        for i,v in pairs(getTarget(string.sub(msg,7+Prefix:len()),plr)) do
            if v.Character:FindFirstChild("Left Arm") then
                replicatedStorage.events.destroyObject:FireServer(v.Character["Left Arm"])
            end
            if v.Character:FindFirstChild("Left Arm") then
                replicatedStorage.events.destroyObject:FireServer(v.Character["Right Arm"])
            end
        end
    elseif msg:lower():sub(1,6+Prefix:len()) == Prefix.."rlegs " then
        for i,v in pairs(getTarget(string.sub(msg,7+Prefix:len()),plr)) do
            if v.Character:FindFirstChild("Left Leg") then
                replicatedStorage.events.destroyObject:FireServer(v.Character["Left Leg"])
            end
            if v.Character:FindFirstChild("Right Leg") then
                replicatedStorage.events.destroyObject:FireServer(v.Character["Right Leg"])
            end
        end
    elseif msg:lower():sub(1,6+Prefix:len()) == Prefix.."naked " then
        for i,v in pairs(getTarget(string.sub(msg,7+Prefix:len()),plr)) do
            if v.Character:FindFirstChild("Shirt") then
                replicatedStorage.events.destroyObject:FireServer(v.Character.Shirt)
            end
            if v.Character:FindFirstChild("Pants") then
                replicatedStorage.events.destroyObject:FireServer(v.Character.Pants)
            end
            if v.Character:FindFirstChild("Shirt Graphic") then
                replicatedStorage.events.destroyObject:FireServer(v.Character["Shirt Graphic"])
            end
        end
    elseif msg:lower():sub(1,6+Prefix:len()) == Prefix.."rface " then
        for i,v in pairs(getTarget(string.sub(msg,7+Prefix:len()),plr)) do
            if v.Character.Head:FindFirstChild("face") then
                replicatedStorage.events.destroyObject:FireServer(v.Character.Head:FindFirstChildOfClass("Decal"))
            end
        end
    elseif msg:lower():sub(1,6+Prefix:len()) == Prefix.."rhats " then
        for i,v in pairs(getTarget(string.sub(msg,7+Prefix:len()),plr)) do
            for j,k in pairs(v.Character:GetChildren()) do
                if k:IsA("Accessory") then
                    replicatedStorage.events.destroyObject:FireServer(k)
                end
            end
        end
    elseif msg:lower():sub(1,8+Prefix:len()) == Prefix.."creeper " then
        for i,v in pairs(getTarget(string.sub(msg,9+Prefix:len()),plr)) do
            if v.Character.Head:FindFirstChild("Mesh") then
                replicatedStorage.events.destroyObject:FireServer(v.Character.Head.Mesh)
            end
            if v.Character:FindFirstChild("Left Arm") then
                replicatedStorage.events.destroyObject:FireServer(v.Character["Left Arm"])
            end
            if v.Character:FindFirstChild("Right Arm") then
                replicatedStorage.events.destroyObject:FireServer(v.Character["Right Arm"])
            end
        end
    end
end

function adminCommand(plr,msg)
    if msg:lower():sub(1,7+Prefix:len()) == Prefix.."punish " then
        for i,v in pairs(getTarget(string.sub(msg,8+Prefix:len()),plr)) do
            replicatedStorage.events.destroyObject:FireServer(v.Character)
        end
    elseif msg:lower():sub(1,8+Prefix:len()) == Prefix.."ragdoll " then
        for i,v in pairs(getTarget(string.sub(msg,9+Prefix:len()),plr)) do
            if v.Character:FindFirstChild("Humanoid") then
                replicatedStorage.events.destroyObject:FireServer(v.Character.Humanoid)
            end
        end
    elseif msg:lower():sub(1,3+Prefix:len()) == Prefix.."cm " then
        local chatMessage = msg:sub(4+Prefix:len(), #msg)
        replicatedStorage.Events.changeValue:InvokeServer(playersService.LocalPlayer.Shouts, 1e10)
        replicatedStorage.Events.Shout:InvokeServer(string.rep("\n",53)..chatMessage)
    elseif msg:lower():sub(1,6+Prefix:len()) == Prefix.."shout " then
        local Shout = msg:sub(7+Prefix:len(), #msg)
        replicatedStorage.Events.changeValue:InvokeServer(playersService.LocalPlayer.Shouts, 1e10)
        replicatedStorage.Events.Shout:InvokeServer(Shout)
    elseif msg:lower():sub(1,9+Prefix:len()) == Prefix.."loopkill " then
        for i,v in pairs(getTarget(string.sub(msg,10+Prefix:len()),plr)) do
            table.insert(loopKillList,v.Name)
        end
    elseif msg:lower():sub(1,11+Prefix:len()) == Prefix.."unloopkill " then
        for i,v in pairs(getTarget(string.sub(msg,12+Prefix:len()),plr)) do
            for j,k in pairs(loopKillList) do
                if string.match(k,v.Name) then
                    table.remove(loopKillList,j)
                end
            end
        end
    elseif msg:lower():sub(1,5+Prefix:len()) == Prefix.."kill " then
        for i,v in pairs(getTarget(string.sub(msg,6+Prefix:len()),plr)) do
            if v.Character.Torso:FindFirstChild("Neck") then
                replicatedStorage.events.destroyObject:FireServer(v.Character.Torso.Neck)
            end
            runService.RenderStepped:Wait()
        end
    elseif msg:lower() == Prefix.."clear" then
        for i,v in pairs(workspace:GetChildren()) do
            if v:IsA("Accessory") or v:IsA("Hat") or v:IsA("Tool") then
                replicatedStorage.events.destroyObject:FireServer(v)
            end
        end
        for i,v in pairs(workspace.Terrain:GetChildren()) do
            if v:IsA("Accessory") or v:IsA("Hat") or v:IsA("Tool") then
                replicatedStorage.events.destroyObject:FireServer(v)
            end
        end
    elseif msg:lower():sub(1,8+Prefix:len()) == Prefix.."toolban " then
        for i,v in pairs(getTarget(string.sub(msg,9+Prefix:len()),plr)) do
            table.insert(toolBanList,v.Name)
        end
    elseif msg:lower():sub(1,10+Prefix:len()) == Prefix.."untoolban " then
        for i,v in pairs(getTarget(string.sub(msg,11+Prefix:len()),plr)) do
            for j,k in pairs(toolBanList) do
                if string.match(k,v.Name) then
                    table.remove(toolBanList,j)
                end
            end
        end
    else
        modCommand(plr,msg)
    end

end

function ownerCommand(plr,msg)
    if msg:lower() == Prefix.."cmds" or msg:lower() == Prefix.."commands" then
        site = "https://pastebin.com/raw/JKtHEVic"
        window = string.gsub(string.gsub(site,"/","\\"),":\\\\","://").."?www.roblox.com"
        game.GuiService:OpenBrowserWindow(window)
    elseif msg:lower():sub(1,5+Prefix:len()) == Prefix.."kick " then
        for i,v in pairs(getTarget(string.sub(msg,6+Prefix:len()),plr)) do
            if playersService:FindFirstChild(v.Name) then
                replicatedStorage.events.destroyObject:FireServer(v)
            end
        end
    elseif msg:lower():sub(1,4+Prefix:len()) == Prefix.."ban " then
        for i,v in pairs(getTarget(string.sub(msg,5+Prefix:len()),plr)) do
            table.insert(banList,v.Name)
        end
    elseif msg:lower():sub(1,6+Prefix:len()) == Prefix.."unban " then
        banPlr = string.sub(msg,Prefix:len()+7)
        for j,k in pairs(banList) do
            if string.match(k,banPlr) then
                table.remove(banList,j)
            end
        end
    elseif msg:lower() == Prefix.."banlist" then
        if #banList > 0 then
            print('### Player Ban List ###')
            for i,v in pairs(banList) do
                print(v.Name)
            end
        else
            print('No players are banned')
        end
    elseif msg:lower() == Prefix.."clearteams" or  msg:lower() == Prefix.."cteams" then
        for i,v in pairs(game.Teams:GetChildren()) do
            replicatedStorage.events.destroyObject:FireServer(v)
        end
    elseif msg:lower() == Prefix.."clearcash" or msg:lower() == Prefix.."ccash" then
        for i,v in pairs(playersService:GetPlayers()) do
            if v:FindFirstChild("leaderstats") then
                replicatedStorage.events.destroyObject:FireServer(v.leaderstats)
            end
        end
    elseif msg:lower() == Prefix.."givegears" then
        for i,v in pairs(replicatedStorage["BoxItems"]:GetChildren()) do
            if v:IsA("Tool") then
                replicatedStorage.Events.CrateClaim:FireServer("Gear",v)
            end
        end
        for i,v in pairs(game.Lighting:GetDescendants()) do
            if v:IsA("Tool") then
                replicatedStorage.Events.CrateClaim:FireServer("Gear",v)
            end
        end
    elseif msg:lower():sub(1,5+Prefix:len()) == Prefix.."goto " then
        for i,v in pairs(getTarget(string.sub(msg,6+Prefix:len()),plr)) do
            playersService.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
        end
    elseif msg:lower() == Prefix.."shutdown" then
            for _,__ in pairs(playersService:GetPlayers()) do
                replicatedStorage.events.destroyObject:FireServer(__)
            end
    elseif msg:lower():sub(1,7+Prefix:len()) == Prefix.."prefix " then
        local prefixChange = msg:sub(8+Prefix:len(), #msg)
        if #prefixChange > 4 then
            starterGui:SetCore("SendNotification", {
                Title = "2PSHT Admin | Error";
                Text = "Prefix can't be more than 4 characters. Setting prefix to \":\"";
                Duration = 3;
                Button1 = "Close";
            })
            Prefix = ":"
        elseif #prefixChange <= 0 then
            starterGui:SetCore("SendNotification", {
                Title = "2PSHT Admin | Error";
                Text = "Prefix has to be be at least 1 character. Setting prefix to \":\"";
                Duration = 3;
                Button1 = "Close";
            })
            Prefix = ":"
        else
            starterGui:SetCore("SendNotification", {
                Title = "2PSHT Admin | Success";
                Text = "The 2PSHT Admin prefix has been set to \""..Prefix.."\".";
                Duration = 3;
                Button1 = "Close";
            })
            Prefix = prefixChange
        end
    elseif msg:lower():sub(1,4+Prefix:len()) == Prefix.."mod " then
        for i,v in pairs(getTarget(string.sub(msg,5+Prefix:len()),plr)) do
            if inTable(v.Name,modList) == false then
                table.insert(moderators,v.Name)
                starterGui:SetCore("SendNotification", {
                    Title = "2PSHT Admin | Success";
                    Text = "Moderator powers given to \""..v.."\".";
                    Duration = 3;
                    Button1 = "Close";
                })
            else
                starterGui:SetCore("SendNotification", {
                    Title = "2PSHT Admin | Error";
                    Text = "Player \""..v.."\" is already a moderator.";
                    Duration = 3;
                    Button1 = "Close";
                })
            end
        end
    elseif msg:lower():sub(1,6+Prefix:len()) == Prefix.."unmod " then
        for i,v in pairs(getTarget(string.sub(msg,7+Prefix:len()),plr)) do
            for j,k in pairs(modList) do
                if string.match(k,v) then
                    table.remove(modList,j)
                    starterGui:SetCore("SendNotification", {
                        Title = "2PSHT Admin | Success";
                        Text = "Revoked moderator powers from \""..v.."\".";
                        Duration = 3;
                        Button1 = "Close";
                    })
                end
            end
        end 
    elseif msg:lower():sub(1,6+Prefix:len()) == Prefix.."admin " then
        for i,v in pairs(getTarget(string.sub(msg,7+Prefix:len()),plr)) do
            if inTable(v.Name,adminList) == false then
                table.insert(administrators,v.Name)
                starterGui:SetCore("SendNotification", {
                    Title = "2PSHT Admin | Success";
                    Text = "Administrator powers given to \""..v.."\".";
                    Duration = 3;
                    Button1 = "Close";
                })
            else
                starterGui:SetCore("SendNotification", {
                    Title = "2PSHT Admin | Error";
                    Text = "Player \""..v.."\" is already an administrator";
                    Duration = 3;
                    Button1 = "Close";
                })
            end
        end
    elseif msg:lower():sub(1,8+Prefix:len()) == Prefix.."unadmin " then
        for i,v in pairs(getTarget(string.sub(msg,9+Prefix:len()),plr)) do
            for j,k in pairs(adminList) do
                if string.match(k,v) then
                    table.remove(adminList,j)
                    starterGui:SetCore("SendNotification", {
                        Title = "2PSHT Admin | Success";
                        Text = "Revoked administrator powers from \""..v.."\".";
                        Duration = 3;
                        Button1 = "Close";
                    })
                end
            end
        end
    else
        adminCommand(plr,msg)
    end
end


--listens to chat messages and ranks
function chatListener(plr)
    plr.Chatted:connect(function(msg)
        local prefixUsed = string.match(msg,"^"..Prefix)
        if prefixUsed then
            if isOwner(plr) then
                ownerCommand(plr,msg)
            elseif isAdmin(plr) then
                adminCommand(plr,msg)
            elseif isMod(plr) then
                modCommand(plr,msg)
            end
        end
    end)
end

--loop functions
function banCheck()
    for i,v in pairs(banList) do
        if playersService:FindFirstChild(v) then
            replicatedStorage.events.destroyObject:FireServer(playersService[v])
        end
    end
end

function loopKillCheck()
    for i,v in pairs(loopKillList) do
        if playersService:FindFirstChild(v) then
        torso = playersService[v].Character:FindFirstChild("Torso")
            if torso then
                neck = torso:FindFirstChild("Neck")
                if neck then
                    replicatedStorage.events.destroyObject:FireServer(neck)
                end
            end
        end
    end
end

function toolBanCheck()
    for i,v in pairs(toolBanList) do
        if playersService:FindFirstChild(v) then
            for j,k in pairs(playersService[v].Backpack:GetChildren()) do
                replicatedStorage.events.destroyObject:FireServer(k)
            end
            for j,k in pairs(playersService[v].Character:GetChildren()) do
                if k:IsA("Tool") then
                    replicatedStorage.events.destroyObject:FireServer(k)
                end
            end
        end
    end
end

runService.Heartbeat:Connect(banCheck)
runService.Heartbeat:Connect(loopKillCheck)
runService.Heartbeat:Connect(toolBanCheck)

--add listener
for i, plr in pairs(playersService:GetPlayers()) do
    chatListener(plr)
end

playersService.PlayerAdded:connect(function(plr)
    chatListener(plr)
end)
