local ResetCameraOn = {
['GUI_Toggle'] = true;
['Goto_ButtonClick'] = true;
};


local SpectatorGUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Toggle = Instance.new("TextButton")
local SpectatorButtons = Instance.new("Frame")
local Previous = Instance.new("TextButton")
local Next = Instance.new("TextButton")
local Goto = Instance.new("TextButton")
local SpectatingPlayerName = Instance.new("TextLabel")

SpectatorGUI.Name = "Spectator-A1B2"
SpectatorGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
SpectatorGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = SpectatorGUI
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.BackgroundTransparency = 1
MainFrame.Size = UDim2.new(1, 0, 1, 0)

Toggle.Name = "Toggle"
Toggle.Parent = MainFrame
Toggle.BackgroundColor3 = Color3.new(0.117647, 0.0745098, 0.0745098)
Toggle.BackgroundTransparency = 0.5
Toggle.BorderColor3 = Color3.new(0.388235, 0.388235, 0.388235)
Toggle.Position = UDim2.new(0, 10, 1, -40)
Toggle.Size = UDim2.new(0, 100, 0, 30)
Toggle.AutoButtonColor = false
Toggle.Font = Enum.Font.GothamBold
Toggle.Text = "Close"
Toggle.TextColor3 = Color3.new(0.776471, 0.776471, 0.776471)
Toggle.TextSize = 14
Toggle.TextStrokeColor3 = Color3.new(1, 1, 1)

SpectatorButtons.Name = "SpectatorButtons"
SpectatorButtons.Parent = MainFrame
SpectatorButtons.BackgroundColor3 = Color3.new(1, 1, 1)
SpectatorButtons.BackgroundTransparency = 1
SpectatorButtons.BorderSizePixel = 0
SpectatorButtons.Position = UDim2.new(0, 10, 1, -160)
SpectatorButtons.Size = UDim2.new(0, 100, 0, 110)

Previous.Name = "Previous"
Previous.Parent = SpectatorButtons
Previous.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
Previous.BackgroundTransparency = 0.5
Previous.BorderColor3 = Color3.new(0.388235, 0.388235, 0.388235)
Previous.Position = UDim2.new(0, 0, 0, 40)
Previous.Size = UDim2.new(0, 100, 0, 30)
Previous.AutoButtonColor = false
Previous.Font = Enum.Font.GothamBold
Previous.Text = "Previous"
Previous.TextColor3 = Color3.new(0.776471, 0.776471, 0.776471)
Previous.TextSize = 14
Previous.TextStrokeColor3 = Color3.new(1, 1, 1)

Next.Name = "Next"
Next.Parent = SpectatorButtons
Next.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
Next.BackgroundTransparency = 0.5
Next.BorderColor3 = Color3.new(0.388235, 0.388235, 0.388235)
Next.Size = UDim2.new(0, 100, 0, 30)
Next.AutoButtonColor = false
Next.Font = Enum.Font.GothamBold
Next.Text = "Next"
Next.TextColor3 = Color3.new(0.776471, 0.776471, 0.776471)
Next.TextSize = 14
Next.TextStrokeColor3 = Color3.new(1, 1, 1)

Goto.Name = "Goto"
Goto.Parent = SpectatorButtons
Goto.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
Goto.BackgroundTransparency = 0.5
Goto.BorderColor3 = Color3.new(0.388235, 0.388235, 0.388235)
Goto.Position = UDim2.new(0, 0, 0, 80)
Goto.Size = UDim2.new(0, 100, 0, 30)
Goto.AutoButtonColor = false
Goto.Font = Enum.Font.GothamBold
Goto.Text = "Go to"
Goto.TextColor3 = Color3.new(0.776471, 0.776471, 0.776471)
Goto.TextSize = 14
Goto.TextStrokeColor3 = Color3.new(1, 1, 1)

SpectatingPlayerName.Name = "SpectatingPlayerName"
SpectatingPlayerName.Parent = MainFrame
SpectatingPlayerName.BackgroundColor3 = Color3.new(1, 1, 1)
SpectatingPlayerName.BackgroundTransparency = 1
SpectatingPlayerName.Position = UDim2.new(0, 10, 0, 10)
SpectatingPlayerName.Size = UDim2.new(0, 100, 0, 16)
SpectatingPlayerName.Font = Enum.Font.GothamBold
SpectatingPlayerName.Text = "Player1"
SpectatingPlayerName.TextColor3 = Color3.new(0.941177, 0.941177, 0.941177)
SpectatingPlayerName.TextSize = 14
SpectatingPlayerName.TextStrokeTransparency = 0.94999998807907
SpectatingPlayerName.TextXAlignment = Enum.TextXAlignment.Left
SpectatingPlayerName.TextYAlignment = Enum.TextYAlignment.Top

local Players = game:GetService'Players';
local CurrentPlayerIndex = 0;
local CurrentPlayer;

local TweenService = game:GetService'TweenService';
local AnimationTime = .5;

for i, v in next, SpectatorGUI:GetDescendants'' do
if v:IsA'TextButton' then
local DefaultBorderColor = v.BorderColor3;
v.MouseEnter:Connect(function()
TweenService:Create(v, TweenInfo.new(AnimationTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
BorderColor3 = Color3.fromRGB(0, 170, 255);
}):Play();
end);

v.MouseLeave:Connect(function()
TweenService:Create(v, TweenInfo.new(AnimationTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
BorderColor3 = DefaultBorderColor;
}):Play();
end);
end;
end;

Toggle.MouseButton1Click:Connect(function()
SpectatorButtons.Visible = not SpectatorButtons.Visible;
Toggle.Text = SpectatorButtons.Visible and 'Close' or 'Open';

if not SpectatorButtons.Visible and ResetCameraOn['GUI_Toggle'] then
CurrentPlayerIndex = 0;
end;
end);

local function ChangeCameraSubject(Player)
if Player and Player.Character then
local Humanoid = Player.Character:FindFirstChildOfClass'Humanoid'

if Humanoid then
workspace.CurrentCamera.CameraSubject = Humanoid;
CurrentPlayer = Player;
end;
end;
end;

game:GetService'RunService'.Heartbeat:Connect(function()
local PlayersChildren = Players:GetChildren();

if CurrentPlayerIndex <= 0 then
workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
CurrentPlayer = Players.LocalPlayer;
ChangeCameraSubject(Players.LocalPlayer);

elseif CurrentPlayerIndex >= 1 and PlayersChildren[CurrentPlayerIndex] then

ChangeCameraSubject(PlayersChildren[CurrentPlayerIndex]);
else
CurrentPlayerIndex = 0;
CurrentPlayer = Players.LocalPlayer;
end;

SpectatingPlayerName.Text = CurrentPlayer.Name;
end);

Next.MouseButton1Click:Connect(function()
local NewIndex = CurrentPlayerIndex + 1;

if NewIndex > #Players:GetChildren() then
CurrentPlayerIndex = 1;
else
CurrentPlayerIndex = NewIndex;
end;
end);

Previous.MouseButton1Click:Connect(function()
local NewIndex = CurrentPlayerIndex - 1;

if NewIndex <= 0 then
CurrentPlayerIndex = #Players:GetChildren();
else
CurrentPlayerIndex = NewIndex;
end;
end);

Goto.MouseButton1Click:Connect(function()
pcall(function()
Players.LocalPlayer.Character:MoveTo(CurrentPlayer.Character.HumanoidRootPart.Position)
if ResetCameraOn['Goto_ButtonClick'] then
CurrentPlayerIndex = 0;
end;
end);
end);

