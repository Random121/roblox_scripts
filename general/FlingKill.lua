local LocalPlayer = game:GetService("Players").LocalPlayer
local tool = Instance.new("Tool", LocalPlayer.Backpack)
local hat = LocalPlayer.Character:FindFirstChildOfClass("Accessory")
local hathandle = hat.Handle
hathandle.Parent = tool
hathandle.Massless = true
tool.GripPos = Vector3.new(0, 9e999, 0)
tool.Parent = LocalPlayer.Character
repeat wait() until LocalPlayer.Character:FindFirstChildOfClass("Tool") ~= nil
tool.Grip = CFrame.new(Vector3.new(0, 0, 0))
LocalPlayer.Character:FindFirstChild(torsoname).Anchored = false


