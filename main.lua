if not game:IsLoaded() then
    game.Loaded:Wait();
end;

if __LOADED then return end;
getgenv().__LOADED = true;

for i, v in next, getconnections(game:GetService("Players").LocalPlayer.Idled) do
    v:Disable();
 end;

if game.PlaceId == 93787311916283 then -- Horse Race
    loadstring(game:HttpGet("https://raw.githubusercontent.com/s-eths/spooky.wtf/main/games/HorseRace.lua", true))();
else
    print("❌ | ERROR: Game is currently not supported.");
end;
