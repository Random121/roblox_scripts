-- Objects

local PlatesCommandUI = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Close = Instance.new("TextButton")
local Title = Instance.new("TextLabel")
local Minimize = Instance.new("TextButton")
local CommandUI = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local Clear = Instance.new("TextButton")
local Command = Instance.new("TextBox")
local Animation = Instance.new("Frame")



local UseMask = Instance.new("BoolValue", game.ReplicatedStorage)
game.ReplicatedStorage.Value.Name = "UseMask"
game.ReplicatedStorage.UseMask.Value = true

local EffectColor = Instance.new("Color3Value", game.ReplicatedStorage)
game.ReplicatedStorage.Value.Name = "EffectColor"


local XOffset = Instance.new("IntValue", game.ReplicatedStorage)
game.ReplicatedStorage.Value.Name = "X-Offset"

local YOffset = Instance.new("IntValue", game.ReplicatedStorage)
game.ReplicatedStorage.Value.Name = "Y-Offset"
game.ReplicatedStorage["Y-Offset"].Value = -36

local Lifetime = Instance.new("NumberValue", game.ReplicatedStorage)
game.ReplicatedStorage.Value.Name = "Lifetime"
game.ReplicatedStorage.Lifetime.Value = .5

local EffectScale = Instance.new("IntValue", game.ReplicatedStorage)
game.ReplicatedStorage.Value.Name = "EffectScale"
game.ReplicatedStorage.EffectScale.Value = 200

local EffectTransparency = Instance.new("NumberValue", game.ReplicatedStorage)
game.ReplicatedStorage.Value.Name = "EffectTransparency"
game.ReplicatedStorage.EffectTransparency.Value = .5

local SelectionTransparency = Instance.new("NumberValue", game.ReplicatedStorage)
game.ReplicatedStorage.Value.Name = "SelectionTransparency"
game.ReplicatedStorage.SelectionTransparency.Value = .75
local TweenService = game:GetService("TweenService")
local Setting_EnableMask = game.ReplicatedStorage.UseMask.Value
local Setting_Color = game.ReplicatedStorage.EffectColor.Value
local Setting_xoffset = game.ReplicatedStorage["X-Offset"].Value
local Setting_yoffset = game.ReplicatedStorage["Y-Offset"].Value
local Setting_Lifetime = game.ReplicatedStorage.Lifetime.Value
local Setting_Scale = game.ReplicatedStorage.EffectScale.Value
local Setting_RippleAlpha = game.ReplicatedStorage.EffectTransparency.Value
local Setting_SelectionAlpha = game.ReplicatedStorage.SelectionTransparency.Value
local down = false
local dc = Instance.new("Frame")

-- Properties

PlatesCommandUI.Name = "PlatesCommandUI"
PlatesCommandUI.Parent = game.CoreGui

Main.Name = "Main"
Main.Parent = PlatesCommandUI
Main.BackgroundColor3 = Color3.new(0.615686, 0.615686, 0.615686)
Main.BackgroundTransparency = 0.30000001192093
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.17209588, 0, 0.43154034, 0)
Main.Size = UDim2.new(0, 543, 0, 297)
Main.Draggable = true
Main.Active = true

Close.Name = "Close"
Close.Parent = Main
Close.BackgroundColor3 = Color3.new(0.968628, 0.0862745, 0.0862745)
Close.BackgroundTransparency = 0.30000001192093
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.902394116, 0, 0, 0)
Close.Size = UDim2.new(0, 53, 0, 31)
Close.Font = Enum.Font.SourceSans
Close.FontSize = Enum.FontSize.Size14
Close.Text = ""
Close.TextSize = 14

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 200, 0, 31)
Title.Font = Enum.Font.SciFi
Title.FontSize = Enum.FontSize.Size32
Title.Text = "Plates Of Fate command line"
Title.TextSize = 30
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextYAlignment = Enum.TextYAlignment.Bottom

Minimize.Name = "Minimize"
Minimize.Parent = Main
Minimize.BackgroundColor3 = Color3.new(1, 0.541176, 0.137255)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.804788232, 0, 0, 0)
Minimize.Size = UDim2.new(0, 53, 0, 31)
Minimize.Font = Enum.Font.SourceSans
Minimize.FontSize = Enum.FontSize.Size14
Minimize.Text = ""
Minimize.TextSize = 14

CommandUI.Name = "CommandUI"
CommandUI.Parent = Main
CommandUI.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
CommandUI.BackgroundTransparency = 0.30000001192093
CommandUI.BorderSizePixel = 0
CommandUI.Position = UDim2.new(0, 0, 0.115374848, 0)
CommandUI.Size = UDim2.new(0, 543, 0, 263)

TextButton.Parent = CommandUI
TextButton.BackgroundColor3 = Color3.new(0.345098, 0.690196, 0.368627)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.176795587, 0, 0.46938777, 0)
TextButton.Size = UDim2.new(0, 364, 0, 50)
TextButton.Font = Enum.Font.SciFi
TextButton.FontSize = Enum.FontSize.Size14
TextButton.Text = "Execute"
TextButton.TextSize = 14

Clear.Name = "Clear"
Clear.Parent = CommandUI
Clear.BackgroundColor3 = Color3.new(0.329412, 0.329412, 0.329412)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0.176795587, 0, 0.680272102, 0)
Clear.Size = UDim2.new(0, 364, 0, 50)
Clear.Font = Enum.Font.SciFi
Clear.FontSize = Enum.FontSize.Size14
Clear.Text = "Clear"
Clear.TextColor3 = Color3.new(0.827451, 0.827451, 0.827451)
Clear.TextSize = 14

Command.Name = "Command"
Command.Parent = Main
Command.BackgroundColor3 = Color3.new(1, 1, 1)
Command.BackgroundTransparency = 1
Command.Position = UDim2.new(0.176795587, 0, 0.23469387, 0)
Command.Size = UDim2.new(0, 364, 0, 50)
Command.Font = Enum.Font.SciFi
Command.FontSize = Enum.FontSize.Size18
Command.Text = "Enter your command"
Command.TextSize = 18

Animation.Name = "Animation"
Animation.Parent = Command
Animation.BackgroundColor3 = Color3.new(0.00392157, 0.00392157, 0.00392157)
Animation.BorderSizePixel = 0
Animation.Position = UDim2.new(0, 0, 1.03999996, 0)
Animation.Size = UDim2.new(0, 364, 0, 4)


-- DESIGN
function MainButn()
for i,v in pairs(PlatesCommandUI.Main:GetChildren()) do
	
dc.Name = "MaterialSelectedColor"
dc.Size = UDim2.new(1, 0, 1, 0)
dc.BorderSizePixel = 0
dc.BackgroundColor3 = Setting_Color
dc.BackgroundTransparency = 1
dc.ZIndex = v.ZIndex
dc.Visible = Setting_EnableMask
dc.Parent = v
local dc_colorguitween = Instance.new("Frame")
dc_colorguitween.Visible = false
dc_colorguitween.Name = "ColorTween"
dc_colorguitween.Position = UDim2.new(1, 0, 0, 0)
dc_colorguitween.Parent = dc
dc_colorguitween.Changed:connect(function()
  dc.BackgroundTransparency = dc_colorguitween.Position.X.Scale
end)
local rippletweengoal = {}
rippletweengoal.ImageTransparency = 1
local maskf = Instance.new("Frame")
maskf.Name = "RippleMask"
maskf.Size = UDim2.new(1, 0, 1, 0)
maskf.ClipsDescendants = true
maskf.BackgroundTransparency = 1
maskf.Parent = v
local upevent = Instance.new("BindableEvent")
upevent.Name = "MouseButton1UpEvent"
function ripplemask(x, y)
  local a = Instance.new("ImageLabel")
  a.Name = "MaterialRipple"
  a.Position = UDim2.new(0, x + Setting_xoffset - v.AbsolutePosition.X, 0, y + Setting_yoffset - v.AbsolutePosition.Y)
  a.Size = UDim2.new(0, 0, 0, 0)
  a.BackgroundTransparency = 1
  a.Image = "rbxasset://textures/whiteCircle.png"
  a.ImageColor3 = Setting_Color
  a.ImageTransparency = Setting_RippleAlpha
  a.AnchorPoint = Vector2.new(0.5, 0.5)
  a.ZIndex = v.ZIndex
  a.Parent = maskf
  a:TweenSize(UDim2.new(0, Setting_Scale, 0, Setting_Scale), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, Setting_Lifetime, true)
  local tween = TweenService:Create(a, TweenInfo.new(Setting_Lifetime), rippletweengoal)
  tween:Play()
  wait(Setting_Lifetime)
  a:Destroy()
end
function ripple(x, y)
  local a = Instance.new("ImageLabel")
  a.Name = "MaterialRipple"
  a.Position = UDim2.new(0, x + Setting_xoffset - v.AbsolutePosition.X, 0, y + Setting_yoffset - v.AbsolutePosition.Y)
  a.Size = UDim2.new(0, 0, 0, 0)
  a.BackgroundTransparency = 1
  a.Image = "rbxasset://textures/whiteCircle.png"
  a.ImageColor3 = Setting_Color
  a.ImageTransparency = Setting_RippleAlpha
  a.AnchorPoint = Vector2.new(0.5, 0.5)
  a.ZIndex = v.ZIndex - 1
  a.Parent = v
  a:TweenSizeAndPosition(UDim2.new(0, Setting_Scale, 0, Setting_Scale), UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, Setting_Lifetime, true)
  upevent.Event:connect(function()
    local tween = TweenService:Create(a, TweenInfo.new(Setting_Lifetime), rippletweengoal)
    tween:Play()
    wait(Setting_Lifetime)
    a:Destroy()
  end)
end
v.MouseButton1Down:connect(function(x, y)
  down = true
  dc_colorguitween:TweenPosition(UDim2.new(Setting_SelectionAlpha, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.75, true)
  if Setting_EnableMask ~= true then
    ripple(x, y)
  end
end)
v.MouseButton1Up:connect(function(x, y)
  if game:GetService("ReplicatedStorage"):FindFirstChild("MaterialClickSound") then
    game:GetService("ReplicatedStorage"):FindFirstChild("MaterialClickSound"):Play()
  end
  if down == true then
    down = false
    dc_colorguitween:TweenPosition(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.3, true)
    if Setting_EnableMask == true then
      ripplemask(x, y)
    end
  end
  upevent:Fire()
end)
v.MouseLeave:connect(function(x, y)
  down = false
  dc_colorguitween:TweenPosition(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.3, true)
  upevent:Fire()
end)
function upd()
  Setting_EnableMask = game.ReplicatedStorage.UseMask.Value
  Setting_Color = game.ReplicatedStorage.EffectColor.Value
  Setting_xoffset = game.ReplicatedStorage["X-Offset"].Value
  Setting_yoffset = game.ReplicatedStorage["Y-Offset"].Value
  Setting_Lifetime = game.ReplicatedStorage.Lifetime.Value
  Setting_Scale = game.ReplicatedStorage.EffectScale.Value
  Setting_RippleAlpha = game.ReplicatedStorage.EffectTransparency.Value
  Setting_SelectionAlpha = game.ReplicatedStorage.SelectionTransparency.Value
  dc.BackgroundColor3 = Setting_Color
  dc.Visible = Setting_EnableMask
end
game.ReplicatedStorage.UseMask.Changed:connect(upd)
game.ReplicatedStorage.EffectColor.Changed:connect(upd)
game.ReplicatedStorage["X-Offset"].Changed:connect(upd)
game.ReplicatedStorage["Y-Offset"].Changed:connect(upd)
game.ReplicatedStorage.Lifetime.Changed:connect(upd)
game.ReplicatedStorage.EffectScale.Changed:connect(upd)
game.ReplicatedStorage.EffectTransparency.Changed:connect(upd)

end
end




function CommandBtn()
for i,v in pairs(PlatesCommandUI.Main.CommandUI:GetChildren()) do
	
dc.Name = "MaterialSelectedColor"
dc.Size = UDim2.new(1, 0, 1, 0)
dc.BorderSizePixel = 0
dc.BackgroundColor3 = Setting_Color
dc.BackgroundTransparency = 1
dc.ZIndex = v.ZIndex
dc.Visible = Setting_EnableMask
dc.Parent = v
local dc_colorguitween = Instance.new("Frame")
dc_colorguitween.Visible = false
dc_colorguitween.Name = "ColorTween"
dc_colorguitween.Position = UDim2.new(1, 0, 0, 0)
dc_colorguitween.Parent = dc
dc_colorguitween.Changed:connect(function()
  dc.BackgroundTransparency = dc_colorguitween.Position.X.Scale
end)
local rippletweengoal = {}
rippletweengoal.ImageTransparency = 1
local maskf = Instance.new("Frame")
maskf.Name = "RippleMask"
maskf.Size = UDim2.new(1, 0, 1, 0)
maskf.ClipsDescendants = true
maskf.BackgroundTransparency = 1
maskf.Parent = v
local upevent = Instance.new("BindableEvent")
upevent.Name = "MouseButton1UpEvent"
function ripplemask(x, y)
  local a = Instance.new("ImageLabel")
  a.Name = "MaterialRipple"
  a.Position = UDim2.new(0, x + Setting_xoffset - v.AbsolutePosition.X, 0, y + Setting_yoffset - v.AbsolutePosition.Y)
  a.Size = UDim2.new(0, 0, 0, 0)
  a.BackgroundTransparency = 1
  a.Image = "rbxasset://textures/whiteCircle.png"
  a.ImageColor3 = Setting_Color
  a.ImageTransparency = Setting_RippleAlpha
  a.AnchorPoint = Vector2.new(0.5, 0.5)
  a.ZIndex = v.ZIndex
  a.Parent = maskf
  a:TweenSize(UDim2.new(0, Setting_Scale, 0, Setting_Scale), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, Setting_Lifetime, true)
  local tween = TweenService:Create(a, TweenInfo.new(Setting_Lifetime), rippletweengoal)
  tween:Play()
  wait(Setting_Lifetime)
  a:Destroy()
end
function ripple(x, y)
  local a = Instance.new("ImageLabel")
  a.Name = "MaterialRipple"
  a.Position = UDim2.new(0, x + Setting_xoffset - v.AbsolutePosition.X, 0, y + Setting_yoffset - v.AbsolutePosition.Y)
  a.Size = UDim2.new(0, 0, 0, 0)
  a.BackgroundTransparency = 1
  a.Image = "rbxasset://textures/whiteCircle.png"
  a.ImageColor3 = Setting_Color
  a.ImageTransparency = Setting_RippleAlpha
  a.AnchorPoint = Vector2.new(0.5, 0.5)
  a.ZIndex = v.ZIndex - 1
  a.Parent = v
  a:TweenSizeAndPosition(UDim2.new(0, Setting_Scale, 0, Setting_Scale), UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, Setting_Lifetime, true)
  upevent.Event:connect(function()
    local tween = TweenService:Create(a, TweenInfo.new(Setting_Lifetime), rippletweengoal)
    tween:Play()
    wait(Setting_Lifetime)
    a:Destroy()
  end)
end
v.MouseButton1Down:connect(function(x, y)
  down = true
  dc_colorguitween:TweenPosition(UDim2.new(Setting_SelectionAlpha, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.75, true)
  if Setting_EnableMask ~= true then
    ripple(x, y)
  end
end)
v.MouseButton1Up:connect(function(x, y)
  if game:GetService("ReplicatedStorage"):FindFirstChild("MaterialClickSound") then
    game:GetService("ReplicatedStorage"):FindFirstChild("MaterialClickSound"):Play()
  end
  if down == true then
    down = false
    dc_colorguitween:TweenPosition(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.3, true)
    if Setting_EnableMask == true then
      ripplemask(x, y)
    end
  end
  upevent:Fire()
end)
v.MouseLeave:connect(function(x, y)
  down = false
  dc_colorguitween:TweenPosition(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.3, true)
  upevent:Fire()
end)
function upd()
  Setting_EnableMask = game.ReplicatedStorage.UseMask.Value
  Setting_Color = game.ReplicatedStorage.EffectColor.Value
  Setting_xoffset = game.ReplicatedStorage["X-Offset"].Value
  Setting_yoffset = game.ReplicatedStorage["Y-Offset"].Value
  Setting_Lifetime = game.ReplicatedStorage.Lifetime.Value
  Setting_Scale = game.ReplicatedStorage.EffectScale.Value
  Setting_RippleAlpha = game.ReplicatedStorage.EffectTransparency.Value
  Setting_SelectionAlpha = game.ReplicatedStorage.SelectionTransparency.Value
  dc.BackgroundColor3 = Setting_Color
  dc.Visible = Setting_EnableMask
end
game.ReplicatedStorage.UseMask.Changed:connect(upd)
game.ReplicatedStorage.EffectColor.Changed:connect(upd)
game.ReplicatedStorage["X-Offset"].Changed:connect(upd)
game.ReplicatedStorage["Y-Offset"].Changed:connect(upd)
game.ReplicatedStorage.Lifetime.Changed:connect(upd)
game.ReplicatedStorage.EffectScale.Changed:connect(upd)
game.ReplicatedStorage.EffectTransparency.Changed:connect(upd)

end
end
-- END

Minimize.MouseButton1Down:connect(function()
	if CommandUI.Visible == false then
		Main:TweenSize(UDim2.new(0, 543,0, 297), "Out", "Quad", .5, false)
		wait(.5)
		CommandUI.Visible = true
		Command.Visible = true
	else
		Main:TweenSize(UDim2.new(0, 543,0, 31), "Out", "Quad", .5, false)
		CommandUI.Visible = false
		Command.Visible = false
	end
end)


local xx = math.random(-69.25, 147.75)
local zz = math.random(113.75, 330.75)
local yy = math.random(-20.5,45.5)
local plat = math.random(-10,10)
plr = game.Players.LocalPlayer
local player
local all = "all"
local others = "others"
local me = "me"
local pos
local mine = "minefield"
local bana = "bananarain"
local pla = "plates"
local mon = "moneyrain"
local mega = "megafield"
local size = "platesize"
local point = "points"
local yata = "yatagarasu"
local wati = true
did = "s"
mem = "s"

local swrd = "sword"
local pot = "potato"
local pie = "pie"
local gracoil = "gravcoil"
local specoil = "speedcoil"
local regcoil = "regencoil"
local cola = "cola"
local banan = "banana"
local para = "parachute"
local firew = "firework"
local plate = "plate"
local burg = "burger"
local plamine = "mine"
local treer = "tree"
local telep = "teleport"
local mbag = "bag"

local on = "on"
local off = "off"
local status = "s"

local fire = "fire"
local black = "blackhole"
local ls = "lavaspinner"
local bmb = "bomb"
local pri = "prison"
local spk = "spike"
local zomb = "zombie"
local bmbc = "bombcloud"
local tor = "tornado"
local fen = "fence"
local dis = "disco"
local pbmb = "plrbomb"
local cac = "cactus"
local wal = "wall"
local frz = "freeze"
local vol = "volcano"
local mun = "moon"
local nuk = "nuke"
local min = "landmine"
local marbl = "marble"

local coin = "coin"
local chest = "chest"

function layer(y)
	local xx = math.random(-111.6, 111.6)
	local zz = math.random(-108.2, 108.2)
	for i = 1,5 do
	for i = 1,100 do
		print("Layered!")
		workspace.RemoteEvents.PlaceMineEvent:FireServer(Vector3.new(xx,y,zz), "D=9Vb7aMuZt!8aMH")
		xx = math.random(-111.6, 111.6)
		zz = math.random(-108.2, 108.2)
	end
	end
end

function addplates(stage)
	local xx = math.random(-111.6, 111.6)
	local zz = math.random(-108.2, 108.2)
	local yy = math.random(stage, stage*3)
	for i = 1,60 do
		workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(xx,yy,zz),"D=9Vb7aMuZt!8aMH")
		xx = math.random(-111.6, 111.6)
		zz = math.random(-108.2, 108.2)
		yy = math.random(stage, stage*3)
	end
end

function utsuho()
	workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(55.8,90,54.1),"D=9Vb7aMuZt!8aMH")
	for i,v in pairs (workspace.Plates:GetChildren()) do
		if v.Plate.Position == Vector3.new(55.8,90,54.1) then
			workspace.RemoteEvents.AddDecal:FireServer(148020567, v, "D=9Vb7aMuZt!8aMH")
			for i = 1,3 do
			workspace.RemoteEvents.AddParticles:FireServer(148020567, v, "D=9Vb7aMuZt!8aMH")
			end
			v.Plate.Touched:Connect(function(who)
				if who.Name == "Right Leg" or who.Name == "Left Leg" or who.Name == "Right Arm" or who.Name == "Left Arm" or who.Name == "Torso" or who.Name == "Head" or who.Name == "HumanoidRootPart" then
					local winner = who.Parent.Name
					for i,b in pairs (game.Players:GetChildren()) do
						if b.Team == game.Teams.Playing and b.Name ~= winner then
							workspace.RemoteEvents.TakeDamageEvent:FireServer(b.Character.Humanoid, 99999, "D=9Vb7aMuZt!8aMH")
						end
					end
				end
			end)
		end
	end
	layer(-5)
	wait(10)
	addplates(5)
	wait(5)
	layer(2)
	layer(5)
	layer(7)
	wait(5)
	addplates(20)
	wait(10)
	layer(10)
	layer(13)
	layer(16)
	layer(19)
	wait(5)
	addplates(30)
	wait(5)
end

Clear.MouseButton1Down:connect(function()
	CommandBtn()
	Command.Text = ""
end)

Close.MouseButton1Down:connect(function()
	
	PlatesCommandUI:Destroy()
end)

Command.Focused:connect(function()
	Animation.BackgroundTransparency = .5
	Command.ClearTextOnFocus = false
end)

Command.FocusLost:connect(function()
	Animation.BackgroundTransparency = 0
end)


TextButton.MouseButton1Down:connect(function()
	
	if string.sub(tostring(Command.Text), 1, 5) == "kill/" then
if not all:match(string.sub(tostring(Command.Text), 6)) or others:match(string.sub(tostring(Command.Text), 6)) or me:match(string.sub(tostring(Command.Text), 6)) then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name ~= "XxCreeperStalkerz" or v.Name ~= "Apostasla" then
if v.Name:match(string.sub(tostring(Command.Text), 6)) then
player = v.Character.Humanoid
workspace.RemoteEvents.TakeDamageEvent:FireServer(player, 99999, "D=9Vb7aMuZt!8aMH")
elseif all:match(string.sub(tostring(Command.Text), 6)) then
player = v.Character.Humanoid
workspace.RemoteEvents.TakeDamageEvent:FireServer(player, 99999, "D=9Vb7aMuZt!8aMH")
elseif others:match(string.sub(tostring(Command.Text), 6)) then
if v ~= game.Players.LocalPlayer then
player = v.Character.Humanoid
workspace.RemoteEvents.TakeDamageEvent:FireServer(player, 99999, "D=9Vb7aMuZt!8aMH")
elseif me:match(string.sub(tostring(Command.Text), 6)) then
if v == game.Players.LocalPlayer then
player = v.Character.Humanoid
workspace.RemoteEvents.TakeDamageEvent:FireServer(player, 99999, "D=9Vb7aMuZt!8aMH")
end
end
end
end
end
end
end
if string.sub(tostring(Command.Text), 1, 9) == "loopkill/" then
if not all:match(string.sub(tostring(Command.Text), 10)) or others:match(string.sub(tostring(Command.Text), 10)) or me:match(string.sub(tostring(Command.Text), 10)) then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name ~= "XxCreeperStalkerz" or v.Name ~= "Apostasla" then
if v.Name:match(string.sub(tostring(Command.Text), 10)) then
while wait(1) do
player = v.Character.Humanoid
workspace.RemoteEvents.TakeDamageEvent:FireServer(player, 99999, "D=9Vb7aMuZt!8aMH")
end
elseif all:match(string.sub(tostring(Command.Text), 10)) then
while wait(1) do
player = v.Character.Humanoid
workspace.RemoteEvents.TakeDamageEvent:FireServer(player, 99999, "D=9Vb7aMuZt!8aMH")
end
elseif others:match(string.sub(tostring(Command.Text), 10)) then
if v ~= game.Players.LocalPlayer then
while wait(1) do
player = v.Character.Humanoid
workspace.RemoteEvents.TakeDamageEvent:FireServer(player, 99999, "D=9Vb7aMuZt!8aMH")
end
elseif me:match(string.sub(tostring(Command.Text), 10)) then
if v == game.Players.LocalPlayer then
while wait(1) do
player = v.Character.Humanoid
workspace.RemoteEvents.TakeDamageEvent:FireServer(player, 99999, "D=9Vb7aMuZt!8aMH")
end
end
end
end
end
end
end
end
if string.sub(tostring(Command.Text), 1, 8) == "explode/" then
if not all:match(string.sub(tostring(Command.Text), 9)) or others:match(string.sub(tostring(Command.Text), 9)) or me:match(string.sub(tostring(Command.Text), 9)) then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name ~= "XxCreeperStalkerz" or v.Name ~= "Apostasla" then
if v.Name:match(string.sub(tostring(Command.Text), 9)) then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlaceMineEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
elseif all:match(string.sub(tostring(Command.Text), 9)) then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlaceMineEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
elseif others:match(string.sub(tostring(Command.Text), 9)) then
if v ~= game.Players.LocalPlayer then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlaceMineEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
elseif me:match(string.sub(tostring(Command.Text), 9)) then
if v == game.Players.LocalPlayer then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlaceMineEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
end
end
end
end
end
end
end
if string.sub(tostring(Command.Text), 1, 6) == "plate/" then
if not all:match(string.sub(tostring(Command.Text), 7)) or others:match(string.sub(tostring(Command.Text), 7)) or me:match(string.sub(tostring(Command.Text), 7)) then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 7)) then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
elseif all:match(string.sub(tostring(Command.Text), 7)) then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
elseif others:match(string.sub(tostring(Command.Text), 7)) then
if v ~= game.Players.LocalPlayer then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
elseif me:match(string.sub(tostring(Command.Text), 7)) then
if v == game.Players.LocalPlayer then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
end
end
end
end
end
end
if string.sub(tostring(Command.Text), 1, 5) == "tree/" then
if not all:match(string.sub(tostring(Command.Text), 6)) or others:match(string.sub(tostring(Command.Text), 6)) or me:match(string.sub(tostring(Command.Text), 6)) then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 6)) then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlaceTreeEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
elseif all:match(string.sub(tostring(Command.Text), 6)) then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlaceTreeEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
elseif others:match(string.sub(tostring(Command.Text), 6)) then
if v ~= game.Players.LocalPlayer then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlaceTreeEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
elseif me:match(string.sub(tostring(Command.Text), 6)) then
if v == game.Players.LocalPlayer then
pos = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.PlaceTreeEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
end
end
end
end
end
end
if string.sub(tostring(Command.Text), 1, 7) == "banana/" then
if not all:match(string.sub(tostring(Command.Text), 8)) or others:match(string.sub(tostring(Command.Text), 8)) or me:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 8)) then
pos = v.Character.HumanoidRootPart.Position
for i = 1,3 do
workspace.RemoteEvents.BananaEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
end
elseif all:match(string.sub(tostring(Command.Text), 8)) then
pos = v.Character.HumanoidRootPart.Position
for i = 1,3 do
workspace.RemoteEvents.BananaEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
end
elseif others:match(string.sub(tostring(Command.Text), 8)) then
if v ~= game.Players.LocalPlayer then
pos = v.Character.HumanoidRootPart.Position
for i = 1,3 do
workspace.RemoteEvents.BananaEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
end
elseif me:match(string.sub(tostring(Command.Text), 8)) then
if v == game.Players.LocalPlayer then
pos = v.Character.HumanoidRootPart.Position
for i = 1,3 do
workspace.RemoteEvents.BananaEvent:FireServer(Vector3.new(pos.X,pos.Y,pos.Z),"D=9Vb7aMuZt!8aMH")
end
end
end
end
end
end
end
if string.sub(tostring(Command.Text), 1, 7) == "potato/" then
if not all:match(string.sub(tostring(Command.Text), 8)) or others:match(string.sub(tostring(Command.Text), 8)) or me:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name ~= "XxCreeperStalkerz" or v.Name ~= "Apostasla" then
if v.Name:match(string.sub(tostring(Command.Text), 8)) then
for i = 1,3 do
workspace.RemoteEvents.PotatoEvent:FireServer(""..v.Name,"D=9Vb7aMuZt!8aMH")
end
elseif all:match(string.sub(tostring(Command.Text), 8)) then
for i = 1,3 do
workspace.RemoteEvents.PotatoEvent:FireServer(""..v.Name,"D=9Vb7aMuZt!8aMH")
end
elseif others:match(string.sub(tostring(Command.Text), 8)) then
if v ~= game.Players.LocalPlayer then
for i = 1,3 do
workspace.RemoteEvents.PotatoEvent:FireServer(""..v.Name,"D=9Vb7aMuZt!8aMH")
end
elseif me:match(string.sub(tostring(Command.Text), 8)) then
if v == game.Players.LocalPlayer then
for i = 1,3 do
workspace.RemoteEvents.BananaEvent:FireServer(""..v.Name,"D=9Vb7aMuZt!8aMH")
end
end
end
end
end
end
end
end
if string.sub(tostring(Command.Text), 1, 7) == "kawaii/" then
local decals = {305103891,148020056,426868863,51193582,147906004,496638309,253197559,148020132,147905960,481751303,493330460,147905379,148020283,149874244,149874205,149874142,149874121,149874091,149874074,149874053,149874019,149873976,149873926,148021078,148021043,148020947,148020932,148020914,148020831,148020602,148020411,148020366,148020343,148020177,148020092,148020028,148019993,147906126,147906096,147906037,147905917,147905713,147905608,147905537,147905513,147905447,147905405,147905353,147905331,147905274,147905257,147905207,147905183,135796114,135795749,135795807,135795953,135795910,135795616,135795592,135795638,135795523}
local decal = math.random(#decals)
local c = decals[ decal ]

local songs = {747000636,919270364,155880750,225557046,919256199,919236601,590243700,235201055,155880750,730013942,737043670,379240208,343508984,383056380,911777530,747000636,920219269,168337558,171222847,363553876,227488587,665015838}
local song = math.random(#songs)
local b = songs[ song ]

for i,v in pairs (workspace.Plates:GetChildren()) do
workspace.RemoteEvents.AddDecal:FireServer(c, v, "D=9Vb7aMuZt!8aMH")
for i = 1,3 do
workspace.RemoteEvents.AddParticles:FireServer(c, v, "D=9Vb7aMuZt!8aMH")
end
workspace.RemoteEvents.AddSound:FireServer("rbxassetid://"..b, v, "D=9Vb7aMuZt!8aMH")
song = math.random(#songs)
b = songs[ song ]
decal = math.random(#decals)
c = decals[ decal ]
end
end
if string.sub(tostring(Command.Text), 1, 7) == "health/" then
	for i,v in pairs (game.Players:GetChildren()) do
		if v.Name:match(string.sub(tostring(Command.Text), 8)) then
			workspace.RemoteEvents.TakeDamageEvent:FireServer(v.Character.Humanoid, v.Character.Humanoid.Health-v.Character.Humanoid.MaxHealth, "D=9Vb7aMuZt!8aMH")
		end
	end
end
if string.sub(tostring(Command.Text), 1, 4) == "god/" then
	for i,v in pairs (game.Players:GetChildren()) do
		if v.Name:match(string.sub(tostring(Command.Text), 5)) then
			repeat wait() workspace.RemoteEvents.TakeDamageEvent:FireServer(v.Character.Humanoid, -999999999, "D=9Vb7aMuZt!8aMH") until v.Character.Humanoid.Health == 0
		end
	end
end
if string.sub(tostring(Command.Text), 1, 6) == "anime/" then
for i,v in pairs (workspace.Plates:GetChildren()) do
if v.Owner.Value:match(string.sub(tostring(Command.Text), 7)) then
player = v.Owner.Value
end
end
local z
local n
local decals
local decal
local chooser = math.random(1,75)
local songs = {747000636,919270364,155880750,225557046,919256199,919236601,590243700,235201055,155880750,730013942,737043670,379240208,343508984,383056380,911777530,747000636,920219269,168337558,171222847,363553876,227488587,298226253}
local song = math.random(#songs)
local x = songs[ song ]

if chooser ~= 1 then
decals = {305103891,148020056,426868863,51193582,147906004,496638309,253197559,148020132,147905960,481751302,147905379,148020283,149874244,149874204,149874142,149874121,149874091,149874074,149874054,149874019,149873976,149873926,148021078,148021043,148020947,148020932,148020914,148020831,148020602,148020411,148020366,148020343,148020177,148020092,148020028,148019993,147906126,147906096,147906037,147905917,147905713,147905608,147905537,147905513,147905447,147905403,147905353,147905331,147905274,147905257,147905207,147905183,135796113,135795749,135795807,135795953,135795910,135795616,135795592,135795638,135795523}
decal = math.random(#decals)
z = decals[ decal ]
else
z = 148020567
x = 156401749
end

print("Decal is "..z)
print("Audio is "..x)
for i,b in pairs (workspace.Plates:GetChildren()) do
if b.Owner.Value == player and wati == true then
workspace.RemoteEvents.AddDecal:FireServer(z, b, "D=9Vb7aMuZt!8aMH")
for i = 1,3 do
workspace.RemoteEvents.AddParticles:FireServer(z, b, "D=9Vb7aMuZt!8aMH")
end
workspace.RemoteEvents.AddSound:FireServer("rbxassetid://"..x, b, "D=9Vb7aMuZt!8aMH")
wati = false
wait(3)
wati = true
end
end
end
if string.sub(tostring(Command.Text), 1, 7) == "utsuho/" then
	for i,v in pairs (workspace.Plates:GetChildren()) do
		if v.Owner.Value:match(string.sub(tostring(Command.Text), 8)) then
			z = 148020567
			x = 156401749
			workspace.RemoteEvents.AddDecal:FireServer(z, v, "D=9Vb7aMuZt!8aMH")
			for i = 1,3 do
				workspace.RemoteEvents.AddParticles:FireServer(z, v, "D=9Vb7aMuZt!8aMH")
			end
			workspace.RemoteEvents.AddSound:FireServer("rbxassetid://"..x, v, "D=9Vb7aMuZt!8aMH")
		end
	end
end
if string.sub(tostring(Command.Text), 1, 14) == "destroy/server" then
local xx = math.random(-151.6, 151.6)
local zz = math.random(-108.2, 108.2)
for i = 1,10 do
for i = 1,50 do
workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(xx,yy,zz), "D=9Vb7aMuZt!8aMH")
xx = math.random(-151.6, 151.6)
zz = math.random(-158.2, 158.2)
yy = math.random(-20.5,45.5)
end
end
wait(3)
local decals = {305103891,148020056,426868863,51193582,147906004,496638309,253197559,148020132,147905960,481751303,493330460,147905379,148020283,149874244,149874205,149874142,149874121,149874091,149874074,149874053,149874019,149873976,149873926,148021078,148021043,148020947,148020932,148020914,148020831,148020602,148020411,148020366,148020343,148020177,148020092,148020028,148019993,147906126,147906096,147906037,147905917,147905713,147905608,147905537,147905513,147905447,147905405,147905353,147905331,147905274,147905257,147905207,147905183,135796114,135795749,135795807,135795953,135795910,135795616,135795592,135795638}
local decal = math.random(#decals)
local c = decals[ decal ]

local songs = {919270364,155880750,225557046,919256199,919236601,590243700,235201055,155880750,201179350,730013942,737043670,343514724,379240208,237388464,343508984,284768504,609167755,383056380,164833164,911777530,397723799,298226253}
local song = math.random(#songs)
local b = songs[ song ]

for i,v in pairs (workspace.Plates:GetChildren()) do
workspace.RemoteEvents.AddDecal:FireServer(c, v, "D=9Vb7aMuZt!8aMH")
for i = 1,5 do
workspace.RemoteEvents.AddParticles:FireServer(c, v, "D=9Vb7aMuZt!8aMH")
end
workspace.RemoteEvents.AddSound:FireServer("rbxassetid://"..b, v, "D=9Vb7aMuZt!8aMH")
song = math.random(#songs)
b = songs[ song ]
decal = math.random(#decals)
c = decals[ decal ]
end
for i = 1,10 do
for i = 1,300 do
workspace.RemoteEvents.PlaceMineEvent:FireServer(Vector3.new(xx,yy,zz), "D=9Vb7aMuZt!8aMH")
xx = math.random(-151.6, 151.6)
zz = math.random(-158.2, 158.2)
yy = math.random(-20.5,85.5)
end
end
end
if string.sub(tostring(Command.Text), 1, 3) == "tp/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 4)) then
player = v.Character.HumanoidRootPart.Position
workspace.RemoteEvents.ToolTeleportEvent:FireServer(Vector3.new(player.X,player.Y,player.Z), "D=9Vb7aMuZt!8aMH")
end
end
end

if string.sub(tostring(Command.Text), 1, 8) == "platetp/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 9)) then
	for i,b in pairs (workspace.Plates:GetChildren()) do
		if b.Owner.Value == v.Name then
local plater = b.Plate.Position
workspace.RemoteEvents.ToolTeleportEvent:FireServer(Vector3.new(plater.X,plater.Y,plater.Z), "D=9Vb7aMuZt!8aMH")
end
end
end
end
end
if string.sub(tostring(Command.Text), 1, 7) == "points/" then
if not all:match(string.sub(tostring(Command.Text), 8)) or others:match(string.sub(tostring(Command.Text), 8)) or me:match(string.sub(tostring(Command.Text), 8)) then
if me:match(string.sub(tostring(Command.Text), 8)) then
workspace.RemoteEvents.ShopBuyEvent:FireServer(-999999999, "D=9Vb7aMuZt!8aMH")
end
end
end
if string.sub(tostring(Command.Text), 1, 4) == "win/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 5)) and v.Team == game.Teams.Playing then
for i,b in pairs (game.Players:GetChildren()) do
	if b.Team == game.Teams.Playing and b ~= v then
	workspace.RemoteEvents.TakeDamageEvent:FireServer(b.Character.Humanoid, 99999, "D=9Vb7aMuZt!8aMH")
end
end
end
end
end
if string.sub(tostring(Command.Text), 1, 9) == "expand50/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 10)) then
if v.gamestats.Plate.Value then
	game.Workspace.RemoteEvents.ChangePlateSize:FireServer(v.gamestats.Plate.Value, 50, "D=9Vb7aMuZt!8aMH")
end
end
end
end
if string.sub(tostring(Command.Text), 1, 9) == "expand10/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 10)) then
if v.gamestats.Plate.Value then
	game.Workspace.RemoteEvents.ChangePlateSize:FireServer(v.gamestats.Plate.Value, 10, "D=9Vb7aMuZt!8aMH")
end
end
end
end
if string.sub(tostring(Command.Text), 1, 9) == "expand25/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 10)) then
if v.gamestats.Plate.Value then
	game.Workspace.RemoteEvents.ChangePlateSize:FireServer(v.gamestats.Plate.Value, 25, "D=9Vb7aMuZt!8aMH")
end
end
end
end
if string.sub(tostring(Command.Text), 1, 10) == "expand100/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 11)) then
if v.gamestats.Plate.Value then
	game.Workspace.RemoteEvents.ChangePlateSize:FireServer(v.gamestats.Plate.Value, 100, "D=9Vb7aMuZt!8aMH")
end
end
end
end
if string.sub(tostring(Command.Text), 1, 9) == "shrink50/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 10)) then
if v.gamestats.Plate.Value then
	game.Workspace.RemoteEvents.ChangePlateSize:FireServer(v.gamestats.Plate.Value, -50, "D=9Vb7aMuZt!8aMH")
end
end
end
end
if string.sub(tostring(Command.Text), 1, 9) == "shrink10/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 10)) then
if v.gamestats.Plate.Value then
	game.Workspace.RemoteEvents.ChangePlateSize:FireServer(v.gamestats.Plate.Value, -10, "D=9Vb7aMuZt!8aMH")
end
end
end
end
if string.sub(tostring(Command.Text), 1, 9) == "shrink25/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 10)) then
if v.gamestats.Plate.Value then
	game.Workspace.RemoteEvents.ChangePlateSize:FireServer(v.gamestats.Plate.Value, -25, "D=9Vb7aMuZt!8aMH")
end
end
end
end
if string.sub(tostring(Command.Text), 1, 10) == "shrink100/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 11)) then
if v.gamestats.Plate.Value then
	game.Workspace.RemoteEvents.ChangePlateSize:FireServer(v.gamestats.Plate.Value, -100, "D=9Vb7aMuZt!8aMH")
end
end
end
end
if string.sub(tostring(Command.Text), 1, 10) == "obliviate/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 11)) then
if v.gamestats.Plate.Value then
	game.Workspace.RemoteEvents.ChangePlateSize:FireServer(v.gamestats.Plate.Value, -999999, "D=9Vb7aMuZt!8aMH")
end
end
end
end
if string.sub(tostring(Command.Text), 1, 6) == "decal/" then
for i,b in pairs (workspace.Plates:GetChildren()) do
	workspace.RemoteEvents.AddDecal:FireServer(string.sub(tostring(Command.Text), 7), b, "D=9Vb7aMuZt!8aMH")
end
end
if string.sub(tostring(Command.Text), 1, 6) == "audio/" then
for i,b in pairs (workspace.Plates:GetChildren()) do
	workspace.RemoteEvents.AddSound:FireServer("rbxassetid://"..string.sub(tostring(Command.Text), 7), b, "D=9Vb7aMuZt!8aMH")
end
end
if string.sub(tostring(Command.Text), 1, 9) == "particle/" then
for i,b in pairs (workspace.Plates:GetChildren()) do
	workspace.RemoteEvents.AddParticles:FireServer(string.sub(tostring(Command.Text), 10), b, "D=9Vb7aMuZt!8aMH")
end
end
if string.sub(tostring(Command.Text), 1, 8) == "sparkle/" then
for i,b in pairs (workspace.Plates:GetChildren()) do
	workspace.RemoteEvents.AddParticles:FireServer(string.sub(tostring(Command.Text), 9), "D=9Vb7aMuZt!8aMH")
end
end

if string.sub(tostring(Command.Text), 1, 9) == "detonate/" then
for i,v in pairs (workspace.Plates:GetChildren()) do
workspace.RemoteEvents.AddSound:FireServer("rbxassetid://134314368", v, "D=9Vb7aMuZt!8aMH")
end
	for i,v in pairs (workspace.ArenaEvents:GetChildren()) do
	if v.Name == "Landmine" then
		workspace.RemoteEvents.BananaEvent:FireServer(Vector3.new(v.Position.X,v.Position.Y+1,v.Position.Z), "D=9Vb7aMuZt!8aMH")
	end
end
end
if string.sub(tostring(Command.Text), 1, 10) == "platewalk/" then
	if on:match(string.sub(tostring(Command.Text), 11)) then
		status = "on"
		while status == on do
			wait(.15)
			pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
			workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(pos.X,pos.Y-2.5,pos.Z), "D=9Vb7aMuZt!8aMH")
		end
	end
	if off:match(string.sub(tostring(Command.Text), 11)) then
		status = "off"
	end
end
if string.sub(tostring(Command.Text), 1, 5) == "trap/" then
for i,v in pairs (game.Players:GetChildren()) do
if v.Name:match(string.sub(tostring(Command.Text), 6)) then
	player = v.Name
for i,b in pairs (workspace.Plates:GetChildren()) do
	if b.Owner.Value == player then
		b.Plate.Touched:Connect(function(who)
			print("Touched by "..who.Name)
			workspace.RemoteEvents.PlaceMineEvent:FireServer(Vector3.new(who.Position.X,who.Position.Y,who.Position.Z), "D=9Vb7aMuZt!8aMH")
		end)
	end
end
end
end
end
if string.sub(tostring(Command.Text), 1, 12) == "EXPLOOOSION/" then
if not all:match(string.sub(tostring(Command.Text), 13)) or others:match(string.sub(tostring(Command.Text), 13)) or me:match(string.sub(tostring(Command.Text), 13)) then
for i,v in pairs (workspace.Plates:GetChildren()) do
local becal = 723125463
workspace.RemoteEvents.AddDecal:FireServer(becal, v, true)
for i = 1,5 do
workspace.RemoteEvents.AddParticles:FireServer(becal, v, true)
end
workspace.RemoteEvents.AddSound:FireServer("rbxassetid://665015838", v, "D=9Vb7aMuZt!8aMH")
local xx = math.random(-111.6, 111.6)
local zz = math.random(-108.2, 108.2)
local yy = math.random(-20.5,85.5)
for i = 1,15 do
for i = 1,200 do
workspace.RemoteEvents.PlaceMineEvent:FireServer(Vector3.new(xx,yy,zz), "D=9Vb7aMuZt!8aMH")
xx = math.random(-111.6, 111.6)
zz = math.random(-108.2, 108.2)
yy = math.random(-20.5,85.5)
end
end
end
end
end

if string.sub(tostring(Command.Text), 1, 6) == "layer/" then
	local xx = math.random(-111.6, 111.6)
	local zz = math.random(-108.2, 108.2)
	print("Layering!")
	for i = 1,5 do
	for i = 1,100 do
		print("Layered!")
		workspace.RemoteEvents.PlaceMineEvent:FireServer(Vector3.new(xx,string.sub(tostring(Command.Text),7),zz), "D=9Vb7aMuZt!8aMH")
		xx = math.random(-111.6, 111.6)
		zz = math.random(-108.2, 108.2)
	end
	wait(1)
	end
end

if string.sub(tostring(Command.Text), 1, 5) == "tool/" then
	if banan:match(string.sub(tostring(Command.Text), 6)) then
		print("Giving tool")
		local tool = game.ReplicatedStorage["BananaPeel"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif swrd:match(string.sub(tostring(Command.Text), 6)) then
		print("Giving tool")
		local tool = game.ReplicatedStorage["Sword"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif cola:match(string.sub(tostring(Command.Text), 6)) then
		print("Giving tool")
		local tool = game.ReplicatedStorage["Bloxy Cola"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif gracoil:match(string.sub(tostring(Command.Text), 6)) then
		print("Giving tool")
		local tool = game.ReplicatedStorage["GravityCoil"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif regcoil:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["RegenCoil"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif specoil:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["SpeedCoil"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif para:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["Parachute"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif firew:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["Fireworks"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif pie:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["PieTool"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif pot:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["Hot Potato"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif plamine:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["Place Mine"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif burg:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["Burger"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif mbag:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["Moneybag"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif treer:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["Place Tree"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif telep:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["Teleport to Plate"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	elseif plate:match(string.sub(tostring(Command.Text), 6)) then
		local tool = game.ReplicatedStorage["Place Plate"]:Clone()
		tool.Parent = game.Players.LocalPlayer.Backpack
	end
end
if string.sub(tostring(Command.Text), 1, 6) == "round/" then
if mine:match(string.sub(tostring(Command.Text), 7)) then
local xx = math.random(-111.6, 111.6)
local zz = math.random(-108.2, 108.2)
local yy = math.random(-20.5,85.5)
for i = 1,50 do
workspace.RemoteEvents.PlaceMineEvent:FireServer(Vector3.new(xx,yy,zz), "D=9Vb7aMuZt!8aMH")
xx = math.random(-111.6, 111.6)
zz = math.random(-108.2, 108.2)
yy = math.random(-20.5,85.5)
end
elseif mega:match(string.sub(tostring(Command.Text), 7)) then
local xx = math.random(-111.6, 111.6)
local zz = math.random(-108.2, 108.2)
local yy = math.random(-20.5,85.5)
for i = 1,10 do
for i = 1,100 do
workspace.RemoteEvents.PlaceMineEvent:FireServer(Vector3.new(xx,yy,zz), "D=9Vb7aMuZt!8aMH")
xx = math.random(-111.6, 111.6)
zz = math.random(-108.2, 108.2)
yy = math.random(-20.5,85.5)
end
end
elseif bana:match(string.sub(tostring(Command.Text), 7)) then
local xx = math.random(-111.6, 111.6)
local zz = math.random(-108.2, 108.2)
for i = 1,25 do
for i = 1,100 do
workspace.RemoteEvents.BananaEvent:FireServer(Vector3.new(xx,103.5,zz), "D=9Vb7aMuZt!8aMH")
xx = math.random(-111.6, 111.6)
zz = math.random(-108.2, 108.2)
wait()
end
wait(2)
end
elseif pla:match(string.sub(tostring(Command.Text), 7)) then
local xx = math.random(-111.6, 111.6)
local zz = math.random(-108.2, 108.2)
for i = 1,10 do
for i = 1,5 do
workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(xx,yy,zz), "D=9Vb7aMuZt!8aMH")
xx = math.random(-111.6, 111.6)
zz = math.random(-108.2, 108.2)
yy = math.random(-20.5,45.5)
wait()
end
wait(3.5)
end
elseif mon:match(string.sub(tostring(Command.Text), 7)) then
local xx = math.random(-111.6, 111.6)
local zz = math.random(-108.2, 108.2)
for i = 1,25 do
for i = 1,75 do
workspace.RemoteEvents.MoneybagEvent:FireServer(CFrame.new(Vector3.new(xx,103.5,zz)), "D=9Vb7aMuZt!8aMH")
xx = math.random(-111.6, 111.6)
zz = math.random(-108.2, 108.2)
wait(.1)
end
wait(2)
end
elseif size:match(string.sub(tostring(Command.Text), 7)) then
for i,v in pairs(game.Players:GetChildren()) do
plat = math.random(-10,15)
if v.gamestats.Plate then
game.Workspace.RemoteEvents.ChangePlateSize:FireServer(v.gamestats.Plate.Value, plat, "D=9Vb7aMuZt!8aMH")
end
end
elseif yata:match(string.sub(tostring(Command.Text),7)) then
	workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(111.6,10,-108.2), "D=9Vb7aMuZt!8aMH")
	workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(111.6,10,108.2), "D=9Vb7aMuZt!8aMH")
	workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(-111.6,10,108.2), "D=9Vb7aMuZt!8aMH")
	workspace.RemoteEvents.PlacePlateEvent:FireServer(Vector3.new(-111.6,10,-108.2), "D=9Vb7aMuZt!8aMH")
	for i,v in pairs (workspace.Plates:GetChildren()) do
		if v.Plate.Position.Y == 10 then
			workspace.RemoteEvents.AddSound:FireServer("rbxassetid://919270364", v, "D=9Vb7aMuZt!8aMH")
		end
	end
	utsuho()
end
end
if string.sub(tostring(Command.Text), 1, 7) == "delete/" then
if fire:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.ArenaEvents:GetChildren()) do
if v.Name == "FirePart" then
v:Destroy()
end
end
elseif black:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.ArenaEvents:GetChildren()) do
if v.Name == "Blackhole" then
v:Destroy()
end
end
elseif tor:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.ArenaEvents:GetChildren()) do
if v.Name == "Tornado" then
v:Destroy()
end
end
elseif min:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.ArenaEvents:GetChildren()) do
if v.Name == "Landmine" then
v:Destroy()
end
end
elseif vol:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.ArenaEvents:GetChildren()) do
if v.Name == "Part" and v.BrickColor == BrickColor.new("Crimson") then
v:Destroy()
end
end
elseif dis:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.ArenaEvents:GetChildren()) do
if v.Name == "DiscoBallOfDoom" then
v:Destroy()
end
end
elseif nuk:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.ArenaEvents:GetChildren()) do
if v.Name == "Nuke" or v.Name == "NukeExplosion" then
v:Destroy()
end
end
elseif mun:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.ArenaEvents:GetChildren()) do
if v.Name == "Moon" then
v:Destroy()
end
end
elseif ls:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.Plates:GetChildren()) do
for i,b in pairs (v:GetChildren()) do
if b.Name == "LavaSpinner" then
b:Destroy()
end
end
end
for i,v in pairs (workspace.ArenaEvents:GetChildren()) do
if v.Name == "GiantLavaSpinner" then
v:Destroy()
end
end
elseif bmb:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.Plates:GetChildren()) do
for i,b in pairs (v:GetChildren()) do
if b.Name == "TimeBomb" then
b:Destroy()
end
end
end
elseif pri:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.Plates:GetChildren()) do
for i,b in pairs (v:GetChildren()) do
if b.Name == "Cage" then
b:Destroy()
end
end
end
elseif spk:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.Plates:GetChildren()) do
for i,b in pairs (v:GetChildren()) do
if b.Name == "Spike" then
b:Destroy()
end
end
end
elseif zomb:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.Plates:GetChildren()) do
for i,b in pairs (v:GetChildren()) do
if b.Name == "Zombie" then
b:Destroy()
end
end
end
elseif bmbc:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.Plates:GetChildren()) do
for i,b in pairs (v:GetChildren()) do
if b.Name == "BombCloud" then
b:Destroy()
end
end
end
elseif fen:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.Plates:GetChildren()) do
for i,b in pairs (v:GetChildren()) do
if b.Name == "ElectricFence" then
b:Destroy()
end
end
end
elseif cac:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.Plates:GetChildren()) do
for i,b in pairs (v:GetChildren()) do
if b.Name == "Cactus" then
b:Destroy()
end
end
end
elseif wal:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (workspace.Plates:GetChildren()) do
for i,b in pairs (v:GetChildren()) do
if b.Name == "Wall" then
b:Destroy()
end
end
end
elseif pbmb:match(string.sub(tostring(Command.Text), 8)) then
game.Players.LocalPlayer.Character.PlayerTimeBomb:Destroy()
end
elseif frz:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (game.Players.LocalPlayer.Character:GetChildren()) do
if v.Name == "Part" then
v:Destroy()
end
end
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
elseif marbl:match(string.sub(tostring(Command.Text), 8)) then
for i,v in pairs (game.Players.LocalPlayer.Character:GetChildren()) do
if v.Name == "Marble" then
v:Destroy()
end
end
end

CommandBtn()
end)