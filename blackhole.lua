--[[
╭━━━╮╱╱╱╱╭╮╱╱╱╱╱╱╱╭╮
┃╭━━╯╱╱╱╱┃┃╱╱╱╱╱╱╭╯╰╮
┃╰━━┳━━┳━╯┣━━┳━┳━┻╮╭╋╮╭┳╮╭╮
┃╭━━┫┃━┫╭╮┃╭╮┃╭┫╭╮┃┃┃┃┃┃╰╯┃
┃┃╱╱┃┃━┫╰╯┃╰╯┃┃┃╭╮┃╰┫╰╯┃┃┃┃
╰╯╱╱╰━━┻━━┻━━┻╯╰╯╰┻━┻━━┻┻┻╯

RayBeam Fling V2.2 (FE)
Official name of this Script.

Wear trench coat, and any layered clothing pants to make this script work better.
--]]

--[[
+/+/+/+/+/+( UpdateLog of V2.2 )+/+/+/+/+/+
(1.) Added UpdateLog (explainable) (V2)
(2.) Added R15 Detection (so you know) (V2)
(3.) Added DeleteArm (prevent exploiters) (V2)
(4.) Added SayDramaticStuff (explainable and slows down the script process) (V2)
(5.) Added New Animation On SayDramaticStuff (Casting Summons Of Heaven) (V2.2)
--]]

-- R15 Detection wow

if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
local m = Instance.new("Message", game.CoreGui)
m.Text = "You are in R6, this script will not work"
wait(4)
m:Destroy()
task.wait()
return
end

--[[
(I will never obsfucate this, as it would make me claim this as my own code, all the code cut is from Infinite Yield and other sources i have forgotten.)

Don't use this with games that has a kill block because you're gonna touch that kill block easier and kill yourself.
--]]

-- Respect to Digitality
-- For creating Leg Resize.

-----
-- INFO TO KNOW
-----

--[[
Noclip : Automatically On
Fly : Automatically On
Fly is mobile supported, which means you can move with fly in mobile

(Mobile users with executors wont be strugglin pressing a fake keyboard)

Wear layered clothing when on a nocollide game (to only annoy people)
--]]

TypeOfFling = 1 -- Default
-- 1 is SpreadRadius
-- 2 is FocusOneRadius
-- Any random number is still 2

-- if you dont know how to script
-- true is on
-- false is off

DeleteArm = true
-- Prevent killing from other exploitors

SayDramaticStuff = true
-- Say dramatic stuff like in anime lol

-- Meaning of the option TypeOfFling

-- SPREAD RADIUS

--[[
This will reduce the effectiveness of flinging more harder but spreads the fling of radius even more.
--]]

-- FOCUS ONE RADIUS

--[[
This will increase effectiveness of flinging more harder but reduces the radius of flinging.
--]]

-- OPTION FOR FLING VELOCITY

--[[
Set your fling velocity, the higher the better, but the more broken it is. (This means you are going to get fling off because of the map parts or either bug out)
--]]

FlingVelocity = 9000 -- Default

-- Set to 0 if you want it to not spin


-- Script will start now
-- You can notice familliar code cuts.

local function Notif(txt)
game.StarterGui:SetCore("SendNotification",{
        Title = "Fling Notification";
        Text = txt;
         Icon = "rbxassetid://7772906436";
         Duration = 5;
    })
end

Notif("Running the script please wait")

local Player = game.Players.LocalPlayer

Player.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = 0

if DeleteArm then
Player.Character.RightUpperArm:Destroy()
end

if SayDramaticStuff then
AnimationId = "3303161675"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local k = Player.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
k:Play()
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("UNLEASH POWER OF HEAVEN","All")
k:AdjustSpeed(1)
wait(1)
end

local P2 = game:GetService("Players").LocalPlayer
local Noclipping = nil
local Clip = true
local RunService = game:GetService("RunService")
	wait(0.1)
	local function NoclipLoop()
if Clip then
		if P2.Character ~= nil then
			for _, child in pairs(P2.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
	end
end
end
	Noclipping = RunService.Stepped:Connect(NoclipLoop)
wait(0.3)

				for i, x in pairs(Player.Character:GetDescendants()) do
					if x:IsA("BasePart") and not x.Anchored then
						x.Anchored = true
					end
				end

if SayDramaticStuff then

-- I watch anime so i know
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("THE POWER OF HEAVEN CHEATS.","All")
wait(1.5)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("POWER OF DIMENSIONAL DIVERSION.","All")
wait(2)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("HEAVEN SKILL, SUPERNOVA!!","All")
wait(0.5)
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("UNLEASH THE BLACKHOLE!!!!!!!!!!!!!!!","All")
end

local IsFlying = true
local flyv
local flyg
local Speed = 70

local LastSpeed = Speed
local IsRunning = false
local f = 1

				flyv = Instance.new("BodyVelocity")
	
			flyv.Parent = Player.Character:FindFirstChild('Torso') or Player.Character:FindFirstChild('UpperTorso')
				flyv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	
				flyg = Instance.new("BodyGyro")
			flyg.Parent = Player.Character:FindFirstChild('Torso') or Player.Character:FindFirstChild('UpperTorso')
				flyg.MaxTorque = Vector3.new(9e9,9e9,9e9)
				flyg.P = 1000
				flyg.D = 50
			Player.Character:WaitForChild('Humanoid').PlatformStand = true

spawn(function()
		while true do
			wait()
		if IsFlying then
				flyg.CFrame = workspace.CurrentCamera.CoordinateFrame * CFrame.new(-math.rad((f+0)*50*Speed),0,0) 
					flyv.Velocity = workspace.CurrentCamera.CoordinateFrame.LookVector * Speed
else
f = 0
		end
if IsRunning then
			Speed = LastSpeed
		else
			if not Speed == 0 then
				LastSpeed = Speed
			end 
			Speed = 0
		end
end
end)

Player.Character.Humanoid.Changed:Connect(function()
		if Player.Character.Humanoid.Health == 0 then
		if IsFlying then
Noclipping:Disconnect()
Clip = false
		flyg:Destroy()
		flyv:Destroy()
		end
		end
	end)

Player.CharacterAdded:Connect(function()
if isFlying then
Noclipping:Disconnect()
Clip = false
flyg:Destroy()
flyv:Destroy()
end
end)
	Player.Character.Humanoid.Changed:Connect(function(Prop)
		
			if Player.Character.Humanoid.MoveDirection == Vector3.new(0,0,0) then
				IsRunning = false
			else
				IsRunning = true
			end	
	end)

wait(0.3)

local char = Player.Character
function helpmeget(char)
	local c4 = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return c4
end

local Spin = Instance.new("BodyAngularVelocity")
Spin.Name = "SpinnerVelocity"
Spin.Parent = helpmeget(Player.Character)
Spin.MaxTorque = Vector3.new(0, math.huge, 0) 
Spin.AngularVelocity = Vector3.new(0,FlingVelocity,0)

wait(0.3)

Player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
if TypeOfFling == 1 then
Player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
Player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
elseif TypeOfFling == 2 then
Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
else
Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
end

loadstring(game:HttpGet('https://raw.githubusercontent.com/DigitalityScripts/roblox-scripts/main/Leg%20Resize'))()

wait(0.4)

for i, x in pairs(Player.Character:GetDescendants()) do
					if x:IsA("BasePart") and x.Anchored then
						x.Anchored = false
					end
				end

Notif("Finished at loading the script")
