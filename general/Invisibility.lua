local plr = game:GetService("Players").LocalPlayer
repeat wait() until plr.Character
repeat wait() until plr.Character.HumanoidRootPart
local char = plr.Character
char.Archivable = true
local clone = char:Clone()
clone.Parent = game:GetService("LocalizationService")
local POI = "false"
local prefix = ";"
local CCF = CFrame.new()



local DummySs = Instance.new("Sound")
DummySs.Name = "Died"

DummySs.Parent = game:GetService("SoundService")

local DummyS = game:GetService("SoundService"):WaitForChild("Died")

plr.Chatted:Connect(function(c)
if c:sub(1,6) == prefix.."invis" or c:sub(1,9) == "/e "..prefix.."invis" then
if POI == "false" then
POI = "true"
DummyS:Clone().Parent = clone.Head
char = workspace[plr.Name]
CCF = plr.Character.HumanoidRootPart.CFrame
wait(.02)
plr.Character.HumanoidRootPart.CFrame = CFrame.new(23094,23451,123582)
wait(.2)
plr.Character.HumanoidRootPart.Anchored = true
wait(.2)
plr.Character = clone
clone.Parent = workspace.Terrain
clone.HumanoidRootPart.CFrame = CCF
workspace.CurrentCamera.CameraSubject = clone
end
elseif c:sub(1,4) ==  prefix.."vis" or c:sub(1,7) == "/e "..prefix.."vis" then
if POI == "true" then
POI = "false"
DummyS:Clone().Parent = char.Head
CCF = clone.HumanoidRootPart.CFrame
plr.Character = char
clone.Parent = game:GetService("LocalizationService")
wait(.2)
char.HumanoidRootPart.Anchored = false
wait(.2)
char.HumanoidRootPart.CFrame = CCF
workspace.CurrentCamera.CameraSubject = char
end
end
if c == ";stop" then
script:Destroy()
if game:GetService("LocalizationService"):FindFirstChild(plr.Name) then
    game:GetService("LocalizationService"):FindFirstChild(plr.Name):Destroy()
    elseif workspace.Terrain:FindFirstChild(plr.Name) then
    workspace.Terrain:FindFirstChild(plr.Name):Destroy()
    plr.Character = workspace[plr.Name]
    end
end
end)

clone.Humanoid.Died:Connect(function()
POI = "Unusable"
plr.Character = char
DummyS:Clone().Parent = clone.Head
wait(.5)
game:GetService("Players").LocalPlayer.Character:BreakJoints()
clone:Destroy()
wait(.5)
script:Destroy()
end)
char.Humanoid.Died:Connect(function()
POI = "Unusable"
DummyS:Clone().Parent = char.Head
if clone ~= nil then
clone:Destroy()
wait(.5)
script:Destroy()
end
end)
