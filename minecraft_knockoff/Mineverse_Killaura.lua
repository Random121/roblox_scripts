--Variable

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
_G.aura = false
aurabind = "f"

--Remove fall dmg

game.ReplicatedStorage.GameRemotes.RequestDamage:Destroy()

--Fullbright

game.Lighting.GlobalShadows = true
game.Lighting.Ambient = Color3.new(1,1,1)
game.Lighting.FogEnd = 1000000

--Killaura

mouse.KeyDown:connect(function(key)
    if key == aurabind then
        _G.aura = true
        while _G.aura == true do
            wait()
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and player:DistanceFromCharacter(v.Character.HumanoidRootPart.Position) < 16 then
                    game.ReplicatedStorage.GameRemotes.Attack:InvokeServer(v.Character)
                end
            end
        end
    end
end)

mouse.KeyUp:connect(function(key)
    if key == aurabind then
        _G.aura = false
    end
end)
