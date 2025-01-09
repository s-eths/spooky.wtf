if not game:IsLoaded() then
    game.Loaded:Wait();
end;

if __LOADED then return end;
getgenv().__LOADED = true;

for i, v in next, getconnections(game:GetService("Players").LocalPlayer.Idled) do
    v:Disable();
end;

local GamesIndex = {
    [93787311916283] = "HorseRace.lua";
    [4893679160] = "BigBrainSimulator.lua";
};

if GamesIndex[game.PlaceId] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/s-eths/spooky.wtf/main/games/" .. GamesIndex[game.PlaceId], true))();
else
    game:GetService("Players").LocalPlayer:Kick("❌ | ERROR: Game is currently not supported.");
end;
