local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character:FindFirstChildOfClass("Humanoid")

local function rm()
   for i,v in pairs(Character:GetDescendants()) do
       if v.Name == "OriginalSize" or v.Name == "OriginalPosition" then
           v:Destroy();  
       end
   end
end


local plr = game.Players.LocalPlayer;
local char = plr.Character;
rm();
wait(0.5);
char.Humanoid.BodyWidthScale:Destroy();
wait(0.5);
rm();
char.Humanoid.BodyHeightScale:Destroy();
wait(0.5);
rm();
char.Humanoid.BodyDepthScale:Destroy();
wait(0.5);
rm();
char.Humanoid.BodyProportionScale:Destroy();
wait(0.5);
rm();
char.Humanoid.BodyTypeScale:Destroy();
wait(0.5);
rm();
char.Humanoid.HeadScale:Destroy();
wait(0.5);
rm();
