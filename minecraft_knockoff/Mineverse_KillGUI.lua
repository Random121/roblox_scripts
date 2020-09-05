-- Instances:

local MineverseKill = Instance.new("ScreenGui")
local Topframe = Instance.new("Frame")
local Mainframe = Instance.new("Frame")
local KillBox = Instance.new("TextBox")
local KillButton = Instance.new("TextButton")
local Title = Instance.new("TextLabel")

--Properties:

MineverseKill.Name = "MineverseKill"
MineverseKill.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MineverseKill.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Topframe.Name = "Topframe"
Topframe.Parent = MineverseKill
Topframe.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Topframe.Position = UDim2.new(0.0921501741, 0, 0.682397962, 0)
Topframe.Size = UDim2.new(0, 200, 0, 20)

Mainframe.Name = "Mainframe"
Mainframe.Parent = Topframe
Mainframe.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Mainframe.Position = UDim2.new(-0.00499999989, 1, 1, 0)
Mainframe.Size = UDim2.new(0, 200, 0, 100)

KillBox.Name = "KillBox"
KillBox.Parent = Mainframe
KillBox.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
KillBox.Position = UDim2.new(0.125, 0, 0.0799999833, 0)
KillBox.Size = UDim2.new(0, 150, 0, 32)
KillBox.Font = Enum.Font.Highway
KillBox.PlaceholderText = "Enter Name"
KillBox.Text = ""
KillBox.TextColor3 = Color3.fromRGB(0, 0, 0)
KillBox.TextScaled = true
KillBox.TextSize = 14.000
KillBox.TextWrapped = true

KillButton.Name = "KillButton"
KillButton.Parent = Mainframe
KillButton.BackgroundColor3 = Color3.fromRGB(207, 0, 0)
KillButton.BorderSizePixel = 0
KillButton.Position = UDim2.new(0.245000005, 0, 0.5, 0)
KillButton.Size = UDim2.new(0, 100, 0, 30)
KillButton.Font = Enum.Font.SourceSansSemibold
KillButton.Text = "Kill"
KillButton.TextColor3 = Color3.fromRGB(0, 0, 0)
KillButton.TextSize = 25.000
KillButton.TextWrapped = true

Title.Name = "Title"
Title.Parent = Topframe
Title.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
Title.BackgroundTransparency = 1.000
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.147747427, 0, 0.084948957, 0)
Title.Size = UDim2.new(0, 140, 0, 15)
Title.Font = Enum.Font.GothamSemibold
Title.Text = "Mineverse Kill"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14.000

--Function:

local find_player = function(input)
    for i,v in next, game.Players:GetPlayers() do
        if v.Name:lower():sub(1, #input) == input:lower() then
            return v
        end
    end
end

--Scripts:

game.ReplicatedStorage.GameRemotes.RequestDamage:Destroy()
game.Lighting.GlobalShadows = true
game.Lighting.Ambient = Color3.new(1,1,1)
game.Lighting.FogEnd = 1000000

KillButton.MouseButton1Click:Connect(function()
    local killname = KillBox.Text
    local killplr = find_player(killname).Character

    for i = 1, 50 do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = killplr.HumanoidRootPart.CFrame
        game.ReplicatedStorage.GameRemotes.Attack:InvokeServer(killplr)
    end
end)
