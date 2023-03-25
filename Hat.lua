local plr = game.Players.LocalPlayer;
local chr = plr.Character;
local hum = chr.Humanoid;
local mov = {};
local mov2 = {};
--local gamerpart = Instance.new("Part")
--[[Network]]
--[[
coroutine.resume(coroutine.create(function()
	settings().Physics.AllowSleep = false;
	game.RunService.RenderStepped:Connect(function()
		for i, v in pairs(game.Players:GetPlayers()) do
			if v ~= plr then
				
			else
				
			end
		end
	end)
end))
]]
function ftp(str)
    local pt = {};
    if str ~= 'me' and str ~= 'random' then
        for i, v in pairs(game.Players:GetPlayers()) do
            if v.Name:lower():find(str:lower()) then
                table.insert(pt, v);
            end
        end
    elseif str == 'me' then
        table.insert(pt, plr);
	elseif str == 'random' then
		table.insert(pt, game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]);
    end
    return pt;
end

for _, v in pairs(hum:GetAccessories()) do
	local b = v.Handle;
	b.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0);
	b.CanCollide = false;
	b:BreakJoints();
	for _, k in pairs(v:GetChildren()) do
		if not k:IsA'SpecialMesh' and not k:IsA'Part' then
			k:Destroy();
		end
	end
	local still = Instance.new('BodyAngularVelocity', b);
	still.MaxTorque = Vector3.new(math.huge, math.huge, math.huge);
	still.AngularVelocity = Vector3.new(0, 0, 0);
	local align = Instance.new('AlignPosition', b);
	align.MaxForce = 1000000;
	align.MaxVelocity = math.huge;
	align.RigidityEnabled = false;
	align.ApplyAtCenterOfMass = true;
	align.Responsiveness = 200;
	local a0 = Instance.new('Attachment', b);
	local a1 = Instance.new('Attachment', chr.HumanoidRootPart);
	align.Attachment0 = a0;
	align.Attachment1 = a1;
	table.insert(mov, a1);
	table.insert(mov2, still);
end

local par = {};
for _, v in pairs(mov) do
	local parr = Instance.new('Part', workspace);
	parr.Anchored = true;
	parr.Size = Vector3.new(1, 1, 1);
	parr.Transparency = 1;
	parr.CanCollide = false;
	table.insert(par, parr);
end

rotx = 0;
rotz = math.pi / 2;
height = 0;
heighti = 1;
_G._G.offsett = 3;
_G.speed = 0.5;
mode = 9;
_G.offsettt  = 35;
_G.speedd = 20;
_G.val1 = 0;
_G.val2 = 0;
_G.val3 = 0;
_G.val4 = 0;
_G.val5 = 360;
hihi = 0;
angular = Vector3.new(0, 0, 0);
local l = 1;
game['Run Service'].RenderStepped:Connect(function()
	--gamerpart
	--gamerpart.CFrame = CFrame.new(chr.HumanoidRootPart.CFrame.Position.X, chr.HumanoidRootPart.CFrame.Position.Y + hihi, chr.HumanoidRootPart.CFrame.Position.Z)
	--rotx = rotx + _G.speed / 100;
	--rotz = rotz + _G.speed / 100;
	l = (l >= 360 and 1 or l + _G.speed);
	
	for i, v in pairs(par) do
		v.CFrame = CFrame.new(chr.HumanoidRootPart.Position) * CFrame.fromEulerAnglesXYZ(_G.val1, math.rad(l + (_G.val5 / #par) * i + _G.speed), _G.val2) * CFrame.new(_G.offsett, _G.val3, _G.val4);
	end
	
	if heighti == 1 then
		height = height + _G.speed / 100;
	elseif heighti == 2 then
		height = height - _G.speed / 100;
	end
	if height > 2 then
		heighti = 2;
	end
	if height < -1 then
		heighti = 1;
	end
	
	if mode == 1 then
		for _, v in pairs(mov) do
			v.Position = Vector3.new(math.sin(rotx) * _G.offsett, 0, math.sin(rotz) * _G.offsett);
		end
	elseif mode == 2 then
		for _, v in pairs(mov) do
			v.Position = Vector3.new(_G.offsett, height, _G.offsett);
		end
	elseif mode == 3 then
		for _, v in pairs(mov) do
			v.Position = Vector3.new(math.sin(rotx) * _G.offsett, height, math.sin(rotz) * _G.offsett);
		end
	elseif mode == 4 then
		for i, v in pairs(mov) do
			v.Position = Vector3.new(chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).X, chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).Y, chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).Z);
		end
	elseif mode == 5 then
		for i, v in pairs(mov) do
			v.Position = Vector3.new((math.sin(rotx)) * _G.offsett, height, (math.cos(rotz) - i) * _G.offsett);
		end
	elseif mode == 6 then
		for i, v in pairs(mov) do
			v.Position = Vector3.new((math.sin(rotx)) * _G.offsett, height, (math.tan(rotz) - i) * _G.offsett);
		end
	elseif mode == 7 then
		for i, v in pairs(mov) do
			v.Position = Vector3.new(math.cos(rotx * i) * _G.offsett, 0, math.cos(rotz * i) * _G.offsett);
		end
	elseif mode == 8 then
	    for i, v in pairs(mov) do
			v.Position = Vector3.new(math.sin(rotx) * i * _G.offsett, 0, math.sin(rotz) * i * _G.offsett);
		end
	elseif mode == 9 then
		pcall(function()
			local so = nil;
			for k, b in pairs(workspace:GetChildren()) do
				if b:IsA'Sound' then
				so = b;
					for h, j in pairs(b:GetDescendants()) do
						if j:IsA'Sound' then
							
						end
					end
				end
			end
			if so ~= nil then
				_G._G.offsett = so.PlaybackLoudness / _G._G.offsettt ;
				_G.speed = so.PlaybackLoudness / _G.speedd;
				angular = Vector3.new(so.PlaybackLoudness / ang, so.PlaybackLoudness / ang, so.PlaybackLoudness / ang);
			end
		end)
		for i, v in pairs(mov) do
			v.Position = Vector3.new(chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).X, chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).Y, chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).Z);
		end
	elseif mode == 10 then
		_G.offsett = height * 15;
		for i, v in pairs(mov) do
			v.Position = Vector3.new(chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).X, chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).Y, chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).Z);
		end
	elseif mode == 11 then
		for i, v in pairs(mov) do
			v.Position = Vector3.new(chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(plr:GetMouse().Hit.p)).X, chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(plr:GetMouse().Hit.p)).Y, chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(plr:GetMouse().Hit.p)).Z) + Vector3.new(chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).X, chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).Y, chr.HumanoidRootPart.CFrame:ToObjectSpace(CFrame.new(par[i].Position)).Z);
		end
	end
	for _, v in pairs(mov2) do
		v.AngularVelocity = angular;
	end
end)
game.Players.LocalPlayer.Chatted:Connect(function(c)
	if c:split(' ')[1] == '.orbit' then
		for _, v in pairs(mov) do
			chr = ftp(c:split(' ')[2])[1].Character;
			v.Parent = ftp(c:split(' ')[2])[1].Character.HumanoidRootPart;
		end
	end
	if c:split(' ')[1] == '._G.speed' then
		_G.speed = tonumber(c:split(' ')[2]);
	end
	if c:split(' ')[1] == '.mode' then
		mode = tonumber(c:split(' ')[2]);
	end
	if c:split(' ')[1] == '._G.offset' then
		_G.offset = tonumber(c:split(' ')[2]);
	end
	if c:split(' ')[1] == '.angular' then
		angular = Vector3.new(tonumber(c:split(' ')[2]), tonumber(c:split(' ')[3]), tonumber(c:split(' ')[4]));
	end
end)
