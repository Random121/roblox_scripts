-- Instances:

local KholsV2 = Instance.new("ScreenGui")
local Topframe = Instance.new("Frame")
local Nameframe = Instance.new("Frame")
local MainOrg = Instance.new("UIListLayout")
local Storage = Instance.new("Frame")
local SampleButton = Instance.new("TextButton")
local SampleText = Instance.new("TextLabel")
local Title = Instance.new("TextLabel")
local Buttonframe = Instance.new("Frame")
local MiniGUI = Instance.new("TextButton")
local DeleteGUI = Instance.new("TextButton")
local Playerframe = Instance.new("Frame")
local tpadmin = Instance.new("TextButton")
local tpregen = Instance.new("TextButton")
local punish = Instance.new("TextButton")
local punon = Instance.new("Frame")
local punoff = Instance.new("Frame")
local Vanish = Instance.new("TextButton")
local commandexe = Instance.new("TextButton")
local Nextpg = Instance.new("TextButton")
local commandenter = Instance.new("TextBox")
local Serverframe = Instance.new("Frame")
local unlockspace = Instance.new("TextButton")
local Crash = Instance.new("TextButton")
local Blackinp = Instance.new("TextBox")
local Shutdown = Instance.new("TextButton")
local Blacklist = Instance.new("TextButton")
local Slock = Instance.new("TextButton")
local lockon = Instance.new("Frame")
local lockoff = Instance.new("Frame")
local Prevpg = Instance.new("TextButton")
local Unblacklist = Instance.new("TextButton")

--Properties:

KholsV2.Name = "KholsV2"
KholsV2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
KholsV2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Topframe.Name = "Topframe"
Topframe.Parent = KholsV2
Topframe.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Topframe.BorderColor3 = Color3.fromRGB(27, 42, 53)
Topframe.Position = UDim2.new(0.183457673, 0, 0.264030606, 0)
Topframe.Size = UDim2.new(0, 400, 0, 30)

Nameframe.Name = "Nameframe"
Nameframe.Parent = Topframe
Nameframe.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Nameframe.BorderSizePixel = 0
Nameframe.Position = UDim2.new(0, -1, 0.996999979, 0)
Nameframe.Size = UDim2.new(0, 170, 0, 250)

MainOrg.Name = "MainOrg"
MainOrg.Parent = Nameframe
MainOrg.HorizontalAlignment = Enum.HorizontalAlignment.Center
MainOrg.SortOrder = Enum.SortOrder.LayoutOrder

Storage.Name = "Storage"
Storage.Parent = Topframe
Storage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Storage.BackgroundTransparency = 1.000
Storage.Position = UDim2.new(0, 0, 1, 0)
Storage.Size = UDim2.new(0, 221, 0, 250)

SampleButton.Name = "SampleButton"
SampleButton.Parent = Storage
SampleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
SampleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SampleButton.Position = UDim2.new(0.281999946, 110, 0.0309999995, 0)
SampleButton.Size = UDim2.new(0, 40, 0, 25)
SampleButton.Visible = false
SampleButton.Font = Enum.Font.GothamSemibold
SampleButton.Text = "BAN"
SampleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SampleButton.TextScaled = true
SampleButton.TextSize = 20.000
SampleButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
SampleButton.TextWrapped = true

SampleText.Name = "SampleText"
SampleText.Parent = Storage
SampleText.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
SampleText.BackgroundTransparency = 1.000
SampleText.BorderSizePixel = 0
SampleText.Position = UDim2.new(-0.00408155192, 0, 0, 0)
SampleText.Size = UDim2.new(0, 172, 0, 42)
SampleText.Font = Enum.Font.Gotham
SampleText.Text = ""
SampleText.TextColor3 = Color3.fromRGB(255, 255, 255)
SampleText.TextScaled = true
SampleText.TextSize = 14.000
SampleText.TextWrapped = true

Title.Name = "Title"
Title.Parent = Topframe
Title.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Title.BorderColor3 = Color3.fromRGB(255, 255, 255)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.100000001, 0, 0.0590001419, 0)
Title.Size = UDim2.new(0, 236, 0, 25)
Title.Font = Enum.Font.GothamSemibold
Title.Text = "Khollateral Damage GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Buttonframe.Name = "Buttonframe"
Buttonframe.Parent = Topframe
Buttonframe.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Buttonframe.BorderColor3 = Color3.fromRGB(255, 255, 255)
Buttonframe.BorderSizePixel = 0
Buttonframe.Position = UDim2.new(0.419999987, 0, 0.996999979, 0)
Buttonframe.Size = UDim2.new(0, 50, 0, 250)

MiniGUI.Name = "MiniGUI"
MiniGUI.Parent = Topframe
MiniGUI.BackgroundColor3 = Color3.fromRGB(255, 106, 0)
MiniGUI.Position = UDim2.new(0.837500095, 0, 0.0666666031, 0)
MiniGUI.Size = UDim2.new(0, 25, 0, 25)
MiniGUI.Font = Enum.Font.Code
MiniGUI.Text = "-"
MiniGUI.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniGUI.TextSize = 35.000
MiniGUI.TextWrapped = true

DeleteGUI.Name = "DeleteGUI"
DeleteGUI.Parent = Topframe
DeleteGUI.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
DeleteGUI.Position = UDim2.new(0.922500014, 0, 0.0666666031, 0)
DeleteGUI.Size = UDim2.new(0, 25, 0, 25)
DeleteGUI.Font = Enum.Font.GothamBold
DeleteGUI.Text = "X"
DeleteGUI.TextColor3 = Color3.fromRGB(255, 255, 255)
DeleteGUI.TextScaled = true
DeleteGUI.TextSize = 14.000
DeleteGUI.TextWrapped = true

Playerframe.Name = "Playerframe"
Playerframe.Parent = Topframe
Playerframe.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Playerframe.BorderColor3 = Color3.fromRGB(255, 255, 255)
Playerframe.Position = UDim2.new(0.547500014, 0, 1.03233337, 0)
Playerframe.Size = UDim2.new(0, 181, 0, 248)

tpadmin.Name = "tpadmin"
tpadmin.Parent = Playerframe
tpadmin.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
tpadmin.BorderColor3 = Color3.fromRGB(0, 0, 0)
tpadmin.Position = UDim2.new(0.218579173, 0, 0.164000034, 0)
tpadmin.Size = UDim2.new(0, 100, 0, 25)
tpadmin.Font = Enum.Font.Highway
tpadmin.Text = "Tp to Admin"
tpadmin.TextColor3 = Color3.fromRGB(255, 255, 255)
tpadmin.TextSize = 20.000
tpadmin.TextWrapped = true

tpregen.Name = "tpregen"
tpregen.Parent = Playerframe
tpregen.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
tpregen.BorderColor3 = Color3.fromRGB(0, 0, 0)
tpregen.Position = UDim2.new(0.222677588, 0, 0.0309999995, 0)
tpregen.Size = UDim2.new(0, 100, 0, 25)
tpregen.Font = Enum.Font.Highway
tpregen.Text = "Tp to Regen"
tpregen.TextColor3 = Color3.fromRGB(255, 255, 255)
tpregen.TextSize = 20.000
tpregen.TextWrapped = true

punish.Name = "punish"
punish.Parent = Playerframe
punish.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
punish.BorderColor3 = Color3.fromRGB(0, 0, 0)
punish.Position = UDim2.new(0.0928961188, 0, 0.296999991, 0)
punish.Size = UDim2.new(0, 100, 0, 25)
punish.Font = Enum.Font.Highway
punish.Text = "Punish Others"
punish.TextColor3 = Color3.fromRGB(255, 255, 255)
punish.TextScaled = true
punish.TextSize = 20.000
punish.TextWrapped = true

punon.Name = "punon"
punon.Parent = Playerframe
punon.BackgroundColor3 = Color3.fromRGB(0, 255, 17)
punon.BorderColor3 = Color3.fromRGB(0, 0, 0)
punon.Position = UDim2.new(0.737704992, 0, 0.296000004, 0)
punon.Size = UDim2.new(0, 25, 0, 25)
punon.Visible = false

punoff.Name = "punoff"
punoff.Parent = Playerframe
punoff.BackgroundColor3 = Color3.fromRGB(255, 8, 0)
punoff.BorderColor3 = Color3.fromRGB(0, 0, 0)
punoff.Position = UDim2.new(0.737704933, 0, 0.296000004, 0)
punoff.Size = UDim2.new(0, 25, 0, 25)

Vanish.Name = "Vanish"
Vanish.Parent = Playerframe
Vanish.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Vanish.BorderColor3 = Color3.fromRGB(0, 0, 0)
Vanish.Position = UDim2.new(0.218579173, 0, 0.429999977, 0)
Vanish.Size = UDim2.new(0, 100, 0, 25)
Vanish.Font = Enum.Font.Highway
Vanish.Text = "Vanish Mode"
Vanish.TextColor3 = Color3.fromRGB(255, 255, 255)
Vanish.TextScaled = true
Vanish.TextSize = 20.000
Vanish.TextWrapped = true

commandexe.Name = "commandexe"
commandexe.Parent = Playerframe
commandexe.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
commandexe.BorderColor3 = Color3.fromRGB(0, 0, 0)
commandexe.Position = UDim2.new(0.218579173, 0, 0.767580628, 0)
commandexe.Size = UDim2.new(0, 100, 0, 25)
commandexe.Font = Enum.Font.Highway
commandexe.Text = "Execute Cmd"
commandexe.TextColor3 = Color3.fromRGB(255, 255, 255)
commandexe.TextScaled = true
commandexe.TextSize = 20.000
commandexe.TextWrapped = true

Nextpg.Name = "Nextpg"
Nextpg.Parent = Playerframe
Nextpg.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Nextpg.BorderColor3 = Color3.fromRGB(255, 255, 255)
Nextpg.Position = UDim2.new(0.668508291, 0, 0.919354737, 0)
Nextpg.Size = UDim2.new(0, 60, 0, 20)
Nextpg.Font = Enum.Font.GothamSemibold
Nextpg.Text = "Next >"
Nextpg.TextColor3 = Color3.fromRGB(255, 255, 255)
Nextpg.TextScaled = true
Nextpg.TextSize = 14.000
Nextpg.TextWrapped = true

commandenter.Name = "commandenter"
commandenter.Parent = Playerframe
commandenter.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
commandenter.BorderColor3 = Color3.fromRGB(0, 0, 0)
commandenter.Position = UDim2.new(0.0928357989, 0, 0.575645149, 0)
commandenter.Size = UDim2.new(0, 144, 0, 40)
commandenter.Font = Enum.Font.SourceSans
commandenter.PlaceholderColor3 = Color3.fromRGB(188, 188, 188)
commandenter.PlaceholderText = "Enter Silent Command"
commandenter.Text = ""
commandenter.TextColor3 = Color3.fromRGB(255, 255, 255)
commandenter.TextScaled = true
commandenter.TextSize = 14.000
commandenter.TextWrapped = true

Serverframe.Name = "Serverframe"
Serverframe.Parent = Topframe
Serverframe.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Serverframe.BorderColor3 = Color3.fromRGB(255, 255, 255)
Serverframe.BorderSizePixel = 0
Serverframe.Position = UDim2.new(-1, 399, 0.996999979, 0)
Serverframe.Size = UDim2.new(0, 402, 0, 250)
Serverframe.Visible = false

unlockspace.Name = "unlockspace"
unlockspace.Parent = Serverframe
unlockspace.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
unlockspace.BorderColor3 = Color3.fromRGB(0, 0, 0)
unlockspace.Position = UDim2.new(0.0746268928, 0, 0.0599999949, 0)
unlockspace.Size = UDim2.new(0, 150, 0, 50)
unlockspace.Font = Enum.Font.Highway
unlockspace.Text = "Unlock Workspace"
unlockspace.TextColor3 = Color3.fromRGB(255, 255, 255)
unlockspace.TextScaled = true
unlockspace.TextSize = 14.000
unlockspace.TextWrapped = true

Crash.Name = "Crash"
Crash.Parent = Serverframe
Crash.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Crash.BorderColor3 = Color3.fromRGB(0, 0, 0)
Crash.Position = UDim2.new(0.0746269152, 0, 0.319999903, 0)
Crash.Size = UDim2.new(0, 150, 0, 50)
Crash.Font = Enum.Font.Highway
Crash.Text = "Crash All"
Crash.TextColor3 = Color3.fromRGB(255, 255, 255)
Crash.TextScaled = true
Crash.TextSize = 14.000
Crash.TextWrapped = true

Blackinp.Name = "Blackinp"
Blackinp.Parent = Serverframe
Blackinp.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Blackinp.BorderColor3 = Color3.fromRGB(0, 0, 0)
Blackinp.Position = UDim2.new(0.549751282, 0, 0.315999985, 0)
Blackinp.Size = UDim2.new(0, 150, 0, 50)
Blackinp.Font = Enum.Font.SourceSans
Blackinp.PlaceholderColor3 = Color3.fromRGB(188, 188, 188)
Blackinp.PlaceholderText = "Enter Word"
Blackinp.Text = ""
Blackinp.TextColor3 = Color3.fromRGB(255, 255, 255)
Blackinp.TextScaled = true
Blackinp.TextSize = 14.000
Blackinp.TextWrapped = true

Shutdown.Name = "Shutdown"
Shutdown.Parent = Serverframe
Shutdown.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Shutdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
Shutdown.Position = UDim2.new(0.550000012, 0, 0.0599999987, 0)
Shutdown.Size = UDim2.new(0, 150, 0, 50)
Shutdown.Font = Enum.Font.Highway
Shutdown.Text = "Shutdown Server"
Shutdown.TextColor3 = Color3.fromRGB(255, 255, 255)
Shutdown.TextScaled = true
Shutdown.TextSize = 14.000
Shutdown.TextWrapped = true

Blacklist.Name = "Blacklist"
Blacklist.Parent = Serverframe
Blacklist.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Blacklist.BorderColor3 = Color3.fromRGB(0, 0, 0)
Blacklist.Position = UDim2.new(0.549751222, 0, 0.555999935, 0)
Blacklist.Size = UDim2.new(0, 150, 0, 20)
Blacklist.Font = Enum.Font.Highway
Blacklist.Text = "Blacklist Word"
Blacklist.TextColor3 = Color3.fromRGB(255, 255, 255)
Blacklist.TextScaled = true
Blacklist.TextSize = 14.000
Blacklist.TextWrapped = true

Slock.Name = "Slock"
Slock.Parent = Serverframe
Slock.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Slock.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slock.Position = UDim2.new(0.074626863, 0, 0.555999875, 0)
Slock.Size = UDim2.new(0, 110, 0, 50)
Slock.Font = Enum.Font.Highway
Slock.Text = "Slock"
Slock.TextColor3 = Color3.fromRGB(255, 255, 255)
Slock.TextScaled = true
Slock.TextSize = 14.000
Slock.TextWrapped = true

lockon.Name = "lockon"
lockon.Parent = Serverframe
lockon.BackgroundColor3 = Color3.fromRGB(0, 255, 17)
lockon.BorderColor3 = Color3.fromRGB(0, 0, 0)
lockon.Position = UDim2.new(0.375621885, 0, 0.555999994, 0)
lockon.Size = UDim2.new(0, 29, 0, 50)
lockon.Visible = false

lockoff.Name = "lockoff"
lockoff.Parent = Serverframe
lockoff.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
lockoff.BorderColor3 = Color3.fromRGB(0, 0, 0)
lockoff.Position = UDim2.new(0.375621885, 0, 0.555999994, 0)
lockoff.Size = UDim2.new(0, 29, 0, 50)

Prevpg.Name = "Prevpg"
Prevpg.Parent = Serverframe
Prevpg.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Prevpg.BorderColor3 = Color3.fromRGB(255, 255, 255)
Prevpg.Position = UDim2.new(0.00300000003, 0, 0.917999983, 0)
Prevpg.Size = UDim2.new(0, 60, 0, 20)
Prevpg.Font = Enum.Font.GothamSemibold
Prevpg.Text = "< Prev"
Prevpg.TextColor3 = Color3.fromRGB(255, 255, 255)
Prevpg.TextScaled = true
Prevpg.TextSize = 14.000
Prevpg.TextWrapped = true

Unblacklist.Name = "Unblacklist"
Unblacklist.Parent = Serverframe
Unblacklist.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Unblacklist.BorderColor3 = Color3.fromRGB(0, 0, 0)
Unblacklist.Position = UDim2.new(0.549751222, 0, 0.675999939, 0)
Unblacklist.Size = UDim2.new(0, 150, 0, 20)
Unblacklist.Font = Enum.Font.Highway
Unblacklist.Text = "Un-Blacklist Word"
Unblacklist.TextColor3 = Color3.fromRGB(255, 255, 255)
Unblacklist.TextScaled = true
Unblacklist.TextSize = 14.000
Unblacklist.TextWrapped = true

KholsV2.ResetOnSpawn = false

Topframe.Active = true
Topframe.Draggable = true

--Variables:

local Players = game:GetService("Players")
local plrlist = {}
local locplr = Players.LocalPlayer
local plrbanned = {}
local blacklistedwords = {}
local vanish = false
local Minimize = false
_G.slock = false

--Functions:

for i, player in pairs(Players:GetPlayers()) do
    table.insert(plrlist, player.Name)
end

function Ban(plr)
	table.insert(plrbanned,plr)
	game.Players.LocalPlayer.Backpack.Delete.delete:FireServer(game.Players[plr])
end

function Bancheck(plr)
	for i=1, #plrbanned do
		if plrbanned[i] == plr.Name then
			game.Players.LocalPlayer.Backpack.Delete.delete:FireServer(plr)
		end
	end
end

function tablefind(tab,val)
	for index, value in pairs(tab) do
		if value == val then
			return index
		end
	end
end

function Serverlock(plr)
    if slock == true then
		game.Players.LocalPlayer.Backpack.Delete.delete:FireServer(plr)
    end
end

function blcheck(player)
    player.Chatted:Connect(function(msg)
        for _, blacklist in pairs(blacklistedwords) do
            if msg:lower():match(blacklist:lower()) then
                game.Players.LocalPlayer.Backpack.Delete.delete:FireServer(player)
            end
        end
    end)
end

--PlrList:

function clearList()
	for _, item in pairs(Nameframe:GetChildren()) do
		if item:IsA("TextLabel") then
			item:Destroy()
		end
	end
	for _, item in pairs(Buttonframe:GetChildren()) do
		if item:IsA("TextButton") then
			item:Destroy()
		end
	end
end
 
function fillList()
	clearList()
	local ButName = 0
	local Butpos = 0
	for index, player in pairs(plrlist) do
		if player ~= locplr.Name then
			ButName = ButName + 1
			Butpos = (index-2)*.168+0.0309999883 
			local NewText = SampleText:Clone()
			local NewButton = SampleButton:Clone()
			NewText.Text = player
			NewText.Parent = Nameframe        
			NewText.Name = player
			NewButton.Visible = true
			NewButton.Parent = Buttonframe
			NewButton.Name = 'Button'..ButName
			NewButton.Position = UDim2.new(0.1, 0, Butpos, 0)
			NewButton.MouseButton1Click:Connect(function()
				Ban(player)
			end)
		end
	end
end

--Update PlrList:

fillList()

Players.PlayerAdded:Connect(function(player)
	table.insert(plrlist,player.Name)
	fillList()
end)
 
Players.PlayerRemoving:Connect(function(player)
	local plrleave = tablefind(plrlist, player.Name)
	table.remove(plrlist, plrleave)
	fillList()             
end)

--Tp:

tpadmin.MouseButton1Click:Connect(function()
	now = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	wait()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	=
	game.Workspace.Terrain.GameFolder.Admin.Pads['Touch to get admin'].Head.CFrame
	wait(0.2)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = now
end)


tpregen.MouseButton1Click:Connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	=
	game.Workspace.Terrain.GameFolder.Admin.Regen.CFrame
	wait()
	game.Players.LocalPlayer.Character.Head.Anchored = true
	wait(3)
	game.Players.LocalPlayer.Character.Head.Anchored = false
end)

--Punish:

punish.MouseButton1Click:Connect(function()
	_G.Punish = not _G.Punish
	if _G.Punish == true then
		punoff.Visible = false
		punon.Visible = true
	else
		punoff.Visible = true
		punon.Visible = false
	end
end)

spawn(function()
	while wait(2) do
		if _G.Punish == true then
			game:GetService'Players':Chat(":skydive others")
			game:GetService'Players':Chat(":punish others")
			game:GetService'Players':Chat(":blind others")
		end
	end
end)

--Vanish:

Vanish.MouseButton1Click:Connect(function()
	vanish = not vanish
	if vanish == true then
		game:GetService'Players':Chat(":invis me")
		game:GetService'Players':Chat(":fly me")
		game:GetService'Players':Chat(":god me")
	else
		game:GetService'Players':Chat(":unfly me")
		game:GetService'Players':Chat(":vis me")
	end
end)

--Silent Command:

commandexe.MouseButton1Click:Connect(function()
	local cmdmes = commandenter.Text
	game:GetService'Players':Chat(":"..cmdmes)
end)

--Unlock WS:

function unlock(instance)
	for i,v in pairs(instance:GetChildren()) do
		if v:IsA("BasePart") then
			v.Locked = false
		end
		unlock(v)
	end
end

unlockspace.MouseButton1Click:Connect(function()
	unlock(workspace)
end)

--Shutdown:

Shutdown.MouseButton1Down:connect(function()
	for i,v in pairs(game.Players:GetChildren()) do
		game.Workspace.Delete.delete:FireServer(v)
	end
end)

--Crash:

Crash.MouseButton1Down:connect(function()
	local runtimes = 0
	while runtimes < 20 do
		runtimes = runtimes + 1
		wait()
		game:GetService'Players':Chat(":swagify all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all")
		game:GetService'Players':Chat(":swagify all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all all")
	end
end)

--Slock:

Slock.MouseButton1Down:connect(function()
	_G.slock = not _G.slock
	if _G.slock == true then
		lockoff.Visible = false
		lockon.Visible = true
	else
		lockoff.Visible = true
		lockon.Visible = false
	end
end)

--Blacklist:

Blacklist.MouseButton1Down:connect(function()
	local blword = Blackinp.Text
	table.insert(blacklistedwords, blword)
	local blposcheck = tablefind(blacklistedwords, blword)
	if blposcheck == nil then
		table.insert(blacklistedwords, blword)
	end
end)

Unblacklist.MouseButton1Down:connect(function()
    local blwordpos = tablefind(blacklistedwords, Blackinp.Text)
	table.remove(blacklistedwords, blwordpos)
end)

--Buttons:

Nextpg.MouseButton1Down:connect(function()
	Playerframe.Visible = false
	Nameframe.Visible = false
	Buttonframe.Visible = false
	Serverframe.Visible = true
end)

Prevpg.MouseButton1Down:connect(function()
	Playerframe.Visible = true
	Nameframe.Visible = true
	Buttonframe.Visible = true
	Serverframe.Visible = false
end)

MiniGUI.MouseButton1Down:connect(function()
	Minimize = not Minimize
	if Minimize == false then
		Playerframe.Visible = true
		Nameframe.Visible = true
		Buttonframe.Visible = true
		Serverframe.Visible = false
	else
		Playerframe.Visible = false
		Nameframe.Visible = false
		Buttonframe.Visible = false
		Serverframe.Visible = false
	end
end)

DeleteGUI.MouseButton1Down:connect(function()
	KholsV2:Destroy()
end)

--Check Players:

for _, plr in pairs(game.Players:GetPlayers()) do
    if plr ~= game.Players.LocalPlayer then
        blcheck(plr)
    end
end

game.Players.PlayerAdded:connect(function(plr)
    Bancheck(plr)
    Serverlock(plr)
    blcheck(plr)
end)

--Btools:

spawn(function()
	while true do
		wait(1)
		if not game.Players.LocalPlayer.Backpack:FindFirstChild("Delete") then
			game:GetService'Players':Chat(":btools me")
		end
	end
end)

game:GetService('RunService').Stepped:connect(function()
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Delete") then
		game.Players.LocalPlayer.Backpack.Delete.CanBeDropped = true
	else
		game.Workspace.FilteringEnabled = true
	end
end)