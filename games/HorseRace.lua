-- spooky.wtf | made by @s.eths

-- Variables
local ReplicatedStorage            = game:GetService("ReplicatedStorage");
local CoreGUI                      = game:GetService("CoreGui");
local LocalPlayer                  = game:GetService("Players").LocalPlayer;
local PlayerGUI                    = game:GetService("Players").LocalPlayer.PlayerGui;
local HumanoidRootPart             = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;

-- UI
local Repository                   = 'https://raw.githubusercontent.com/s-eths/spooky.wtf/main/ui/';
local Library                      = loadstring(game:HttpGet(Repository .. 'Library.lua'))();
local ThemeManager                 = loadstring(game:HttpGet(Repository .. 'addons/ThemeManager.lua'))();
local SaveManager                  = loadstring(game:HttpGet(Repository .. 'addons/SaveManager.lua'))();
local Window                       = Library:CreateWindow({Title = 'spooky.wtf - ' .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, Center = true, AutoShow = true, TabPadding = 8});
local Tabs                         = {Main = Window:AddTab('main'), Event = Window:AddTab('event'), ['UI Settings'] = Window:AddTab('ui settings'), Credits = Window:AddTab('credits')};
local FunctionsLeftGroupBox        = Tabs.Main:AddLeftGroupbox('functions');
local AutoBuyLeftGroupBox          = Tabs.Main:AddLeftGroupbox('auto buy');
local EggsLeftGroupBox             = Tabs.Main:AddLeftGroupbox('eggs (can open from any world)');
local QuickTeleportLeftGroupBox    = Tabs.Main:AddLeftGroupbox('quick teleport');
local OptionsRightGroupBox         = Tabs.Main:AddRightGroupbox('options');
local OtherRightGroupBox           = Tabs.Main:AddRightGroupbox('other');
local EventLeftGroupBox            = Tabs.Event:AddLeftGroupbox('event functions');
local EventAutoBuyLeftGroupBox     = Tabs.Event:AddLeftGroupbox('event auto buy');
local EventTeleportsLeftGroupBox   = Tabs.Event:AddLeftGroupbox('event teleports');
local PotionsAutoBuyRightGroupBox  = Tabs.Event:AddRightGroupbox('auto buy potions');
local CreditsLeftGroupBox          = Tabs.Credits:AddLeftGroupbox('credits');
local CreditsRightGroupBox         = Tabs.Credits:AddRightGroupbox('last updated');

-- Index
local TreadmillIndex = {
    Treadmill_1_1   = 0,
    Treadmill_1_2   = 1000,
    Treadmill_1_3   = 5000,
    Treadmill_1_4   = 35000,
    Treadmill_1_5   = 400000,
    Treadmill_1_6   = 1000000,
    Treadmill_1_7   = 4000000,
    Treadmill_1_8   = 15000000,
    Treadmill_1_9   = 50000000,
    Treadmill_1_10  = 300000000,
    Treadmill_1_11  = 1500000000,
    Treadmill_1_12  = 5000000000,
    Treadmill_2_1   = 11000000000,
    Treadmill_2_2   = 24000000000,
    Treadmill_2_3   = 53000000000,
    Treadmill_2_4   = 120000000000,
    Treadmill_2_5   = 260000000000,
    Treadmill_2_6   = 570000000000,
    Treadmill_2_7   = 1300000000000,
    Treadmill_2_8   = 2900000000000,
    Treadmill_2_9   = 6400000000000,
    Treadmill_2_10  = 14000000000000,
    Treadmill_2_11  = 31000000000000,
    Treadmill_2_12  = 68000000000000,
    Treadmill_3_1   = 140000000000000,
    Treadmill_3_2   = 280000000000000, 
    Treadmill_3_3   = 560000000000000,
    Treadmill_3_4   = 1100000000000000,
    Treadmill_3_5   = 2200000000000000,
    Treadmill_3_6   = 4400000000000000,
    Treadmill_3_7   = 8800000000000000,
    Treadmill_3_8   = 18000000000000000,
    Treadmill_3_9   = 36000000000000000,
    Treadmill_3_10  = 72000000000000000,
    Treadmill_3_11  = 140000000000000000,
    Treadmill_3_12  = 280000000000000000,
    Treadmill_4_1   = 560000000000000000,
    Treadmill_4_2   = 1100000000000000000,
    Treadmill_4_3   = 2200000000000000000,
    Treadmill_4_4   = 4400000000000000000,
    Treadmill_4_5   = 8800000000000000000,
    Treadmill_4_6   = 18000000000000000000,
    Treadmill_4_7   = 36000000000000000000,
    Treadmill_4_8   = 72000000000000000000,
    Treadmill_4_9   = 140000000000000000000,
    Treadmill_4_10  = 280000000000000000000,
    Treadmill_4_11  = 560000000000000000000,
    Treadmill_4_12  = 1100000000000000000000,
};

local EggIndex = {
    Egg_0_0 = "none",
    Egg_1_1 = "20 wins",
    Egg_1_2 = "250 wins",
    Egg_1_3 = "3k wins",
    Egg_1_4 = "50k wins",
    Egg_2_1 = "200k wins",
    Egg_2_2 = "800k wins",
    Egg_2_3 = "3.2m wins",
    Egg_2_4 = "13m wins",
    Egg_3_1 = "52m wins",
    Egg_3_2 = "210m wins",
    Egg_3_3 = "840m wins",
    Egg_3_4 = "3.4b wins",
    Egg_4_1 = "14b wins",
    Egg_4_2 = "56b wins",
    Egg_4_3 = "220b wins",
};

local WorldIndex = {
    Area_1 = "world 1",
    Area_2 = "world 2",
    Area_3 = "world 3",
    Area_4 = "world 4",
};

local HorseIndex = {
    Bear_101   = 250,
    Horse_102  = 500,
    Horse_103  = 5000,
    Horse_104  = 20000,
    Horse_105  = 80000,
    Horse_001  = 320000,
    Horse_201  = 1300000,
    Horse_202  = 5200000,
    Bear_102   = 10400000,
    Horse_203  = 21000000,
    Horse_204  = 84000000,
    Horse_205  = 340000000,
    Horse_301  = 1400000000,
    Horse_302  = 5600000000,
    Horse_303  = 22000000000,
    Horse_304  = 88000000000,
    Horse_305  = 350000000000,
    Bear_103   = 700000000000,
    Horse_401  = 1400000000000,
    Horse_402  = 5600000000000,
    Horse_403  = 22000000000000,
    Horse_404  = 88000000000000,
    Horse_405  = 350000000000000,
};

local PrincessIndex = {
    Princess_SnowWhite  = 1000,
    Princesses_Merida   = 50000,
    Princess_Mulan      = 1000000,
    Princess_Jasmine    = 300000000,
    Princess_Mermaid    = 50000000000,
};

local TrailIndex = {
    ["White"]              = {Wins = 100, Rebirths = 0};
    ["Red"]                = {Wins = 400, Rebirths = 0};
    ["Orange"]             = {Wins = 1600, Rebirths = 0};
    ["Yellow"]             = {Wins = 6400, Rebirths = 5};
    ["Green"]              = {Wins = 26000, Rebirths = 5};
    ["Cyan"]               = {Wins = 100000, Rebirths = 5};
    ["Blue"]               = {Wins = 400000, Rebirths = 10};
    ["Purple"]             = {Wins = 1600000, Rebirths = 10};
    ["NewLife"]            = {Wins = 6400000, Rebirths = 10};
    ["MalibuBeach"]        = {Wins = 19000000, Rebirths = 15};
    ["RipeMalinka"]        = {Wins = 57000000, Rebirths = 15};
    ["TrueSunset"]         = {Wins = 170000000, Rebirths = 15};
    ["Cat"]                = {Wins = 510000000, Rebirths = 20};
    ["PileOfPoo"]          = {Wins = 1500000000, Rebirths = 20};
    ["SpeedBump"]          = {Wins = 4500000000, Rebirths = 20};
    ["Lawn"]               = {Wins = 14000000000, Rebirths = 25};
    ["Dollar"]             = {Wins = 42000000000, Rebirths = 25};
    ["Frog"]               = {Wins = 130000000000, Rebirths = 25};
    ["Rainbow"]            = {Wins = 260000000000, Rebirths = 30};
    ["Electrocardiogram"]  = {Wins = 520000000000, Rebirths = 30};
    ["RedCarpet"]          = {Wins = 1000000000000, Rebirths = 30};
    ["TheMatrix"]          = {Wins = 2000000000000, Rebirths = 35};
    ["Elephant"]           = {Wins = 4000000000000, Rebirths = 35};
    ["Tire"]               = {Wins = 8000000000000, Rebirths = 35};
    ["Wave"]               = {Wins = 16000000000000, Rebirths = 40};
    ["Film"]               = {Wins = 32000000000000, Rebirths = 40};
    ["Robux"]              = {Wins = 64000000000000, Rebirths = 40};
    ["Dinosaur"]           = {Wins = 130000000000000, Rebirths = 45};
    ["Bubble"]             = {Wins = 260000000000000, Rebirths = 45};
    ["Graffiti"]           = {Wins = 520000000000000, Rebirths = 45};
    ["WaterRipple"]        = {Wins = 1000000000000000, Rebirths = 50};
};

local EventHorseIndex = {
    Moose_001 = 5000,
    Moose_002 = 90000,
    Moose_003 = 5000000,
};

local EventPrincessIndex = {
    Princess_SantaGirl = 1234,
    Princess_ElfPrincess = 90000,
    Princess_SantaClaus = 2000000,
};

-- Display Indexes
local EggIndexDisplay   = {"none", "20 wins", "250 wins", "3k wins", "50k wins", "200k wins", "800k wins", "3.2m wins", "13m wins", "52m wins", "210m wins", "840m wins", "3.4b wins", "14b wins", "56 wins", "220b wins"};
local WorldIndexDisplay = {"world 1", "world 2", "world 3", "world 4"};

-- Functions
local function ConvertAbbreviatedNumber(AbbreviatedNumber)
    AbbreviatedNumber     = string.gsub(AbbreviatedNumber, ",", "");
    local Number, Suffix  = string.match(AbbreviatedNumber, "([%d%.]+)(%a*)");
    Number                = tonumber(Number);

    if not Number then
        return nil;
    end;

    if Suffix == "k" or Suffix == "K" then
        return Number * 1e3;
    elseif Suffix == "m" or Suffix == "M" then
        return Number * 1e6;
    elseif Suffix == "b" or Suffix == "B" then
        return Number * 1e9;
    elseif Suffix == "t" or Suffix == "T" then
        return Number * 1e12;
    end;

    return Number;
end;

local function GetAreaName()
    for i, v in next, game:GetService("Workspace").Areas:GetDescendants() do
        if v:IsA("Model") then
            return v.Name;
        end;
    end;
end;

local function GetBestTreadmill()
    local BestTreadmill         = nil;
    local BestPowerRequirement  = -math.huge;

    for i, v in next, TreadmillIndex do
        if LocalPlayer.leaderstats["\226\154\161\239\184\143Power"].Value >= v and v > BestPowerRequirement then
            BestTreadmill = i;
            BestPowerRequirement = v;
        end;
    end;
    return BestTreadmill;
end;

local CurrentHorseValue = 0;
local function GetBestHorse()
    local BestHorse  = nil;
    local MaxWins    = 0;

    for i, v in next, HorseIndex do
        if LocalPlayer.leaderstats["\240\159\143\134Wins"].Value >= v and v > MaxWins and v > CurrentHorseValue then
            BestHorse = i;
            MaxWins = v;
        end;
    end;
    return BestHorse, MaxWins;
end;

local CurrentPrincessValue = 0;
local function GetBestPrincess()
    local BestPrincess  = nil;
    local MaxWins       = 0;

    for i, v in next, PrincessIndex do
        if LocalPlayer.leaderstats["\240\159\143\134Wins"].Value >= v and v > MaxWins and v > CurrentPrincessValue then
            BestPrincess = i;
            MaxWins = v;
        end;
    end;
    return BestPrincess, MaxWins;
end;

local CurrentTrailValue = 0;
local function GetBestTrail()
    local BestTrail  = nil;
    local MaxWins    = 0;

    for i, v in next, TrailIndex do
        if v.Wins <= LocalPlayer.leaderstats["\240\159\143\134Wins"].Value and v.Rebirths <= LocalPlayer.leaderstats["\226\153\187\239\184\143Rebirth"].Value then
            if v.Wins > MaxWins and v.Wins > CurrentTrailValue then
                BestTrail = i;
                MaxWins = v.Wins;
            end;
        end;
    end;
    return BestTrail, MaxWins;
end;

local function RedeemAllCodes()
    local Codes = {"Love", "Santa", "Xmas", "Like60K", "Like28K", "RELEASE", "NEW", "Like3K"};
    for i, v in next, Codes do
        ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("CodesService"):WaitForChild("RF"):WaitForChild("RedeemItem"):InvokeServer(v);
        task.wait();
    end;
    Library:Notify("successfully redeemed all codes.", 5);
end;

local CurrentEventPrincessValue = 0;
local function GetBestEventPrincess()
    local BestEventPrincess  = nil;
    local MaxPresents        = 0;

    for i, v in next, EventPrincessIndex do
        if ConvertAbbreviatedNumber(game:GetService("Players").LocalPlayer.PlayerGui.HomeGui.LeftFrame.CurrencyFrame.ChristmasTokenFrame.AmountLabel.Text) >= v and v > MaxPresents and v > CurrentEventPrincessValue then
            BestEventPrincess = i;
            MaxPresents = v;
        end;
    end;
    return BestEventPrincess, MaxPresents;
end;

local CurrentEventHorseValue = 0;
local function GetBestEventHorse()
    local BestEventHorse  = nil;
    local MaxPresents     = 0;

    for i, v in next, EventHorseIndex do
        if ConvertAbbreviatedNumber(game:GetService("Players").LocalPlayer.PlayerGui.HomeGui.LeftFrame.CurrencyFrame.ChristmasTokenFrame.AmountLabel.Text) >= v and v > MaxPresents and v > CurrentEventHorseValue then
            BestEventHorse = i;
            MaxPresents = v;
        end;
    end;
    return BestEventHorse, MaxPresents;
end;        

local function TeleportToChristmasWorld()
    ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("AreaService"):WaitForChild("RE"):WaitForChild("UpdatePlayerCurrentArea"):FireServer("Area_Christmas");
    Library:Notify("successfully teleported, please rejoin to change worlds.", 5);
end;

-- Buttons/Toggles/Dropdowns/Labels
FunctionsLeftGroupBox:AddToggle('AutoWinToggle', {Text = 'auto win', Default = false});
FunctionsLeftGroupBox:AddToggle('AutoTrainToggle', {Text = 'auto train', Default = false});
FunctionsLeftGroupBox:AddToggle('AutoRebirthToggle', {Text = 'auto rebirth', Default = false});
AutoBuyLeftGroupBox:AddToggle('AutoBuyHorsesToggle', {Text = 'auto buy horses', Default = false});
AutoBuyLeftGroupBox:AddToggle('AutoBuyPrincessesToggle', {Text = 'auto buy princesses', Default = false});
AutoBuyLeftGroupBox:AddToggle('AutoBuyTrailsToggle', {Text = 'auto buy trails', Default = false});
EggsLeftGroupBox:AddDropdown('SelectEggDropdown', {Values = EggIndexDisplay, Default = 0, Multi = false, Text = 'select egg'});
QuickTeleportLeftGroupBox:AddDropdown('WorldTeleportDropdown', {Values = WorldIndexDisplay, Default = 0, Multi = false, Text = 'select world'});
OptionsRightGroupBox:AddToggle('AutoSpinToggle', {Text = 'auto spin', Default = false});
OptionsRightGroupBox:AddToggle('AutoCrateToggle', {Text = 'auto crate', Default = false});
OptionsRightGroupBox:AddToggle('AutoClaimQuestToggle', {Text = 'auto claim quest', Default = false});
OptionsRightGroupBox:AddToggle('AutoSeasonPassToggle', {Text = "auto season pass", Default = false});
OptionsRightGroupBox:AddToggle('AutoClaimOnlineRewardsToggle', {Text = 'auto claim online rewards', Default = false});
OptionsRightGroupBox:AddButton({Text = 'redeem all codes', Func = function() RedeemAllCodes(); end});
OtherRightGroupBox:AddToggle('DisablePurchasePromptToggle', {Text = 'disable purchase prompt', Default = false});
OtherRightGroupBox:AddToggle('DisableAlertNotifcationsToggle', {Text = 'disable alert notifications', Default = false});
EventLeftGroupBox:AddToggle('AutoEventEggToggle', {Text = 'auto event egg', Default = false});
EventLeftGroupBox:AddToggle('AutoClaimEventRewardsToggle', {Text = 'auto claim event rewards', Default = false});
EventAutoBuyLeftGroupBox:AddToggle('AutoBuyEventHorsesToggle', {Text = 'auto buy event horses', Default = false});
EventAutoBuyLeftGroupBox:AddToggle('AutoBuyEventPrincessesToggle', {Text = 'auto buy event princesses', Default = false});
EventTeleportsLeftGroupBox:AddButton({Text = 'teleport to christmas world', Func = function() TeleportToChristmasWorld() end});
PotionsAutoBuyRightGroupBox:AddToggle('AutoBuyDoubleWinsPotionToggle', {Text = 'auto buy double wins potion', Default = false});
PotionsAutoBuyRightGroupBox:AddToggle('AutoBuySuperLuckyPotionToggle', {Text = 'auto buy super lucky potion', Default = false});
PotionsAutoBuyRightGroupBox:AddToggle('AutoBuyGoldenPotionToggle', {Text = 'auto buy golden potion', Default = false});
PotionsAutoBuyRightGroupBox:AddToggle('AutoBuyRainbowPotionToggle', {Text = 'auto buy rainbow potion', Default = false});
CreditsLeftGroupBox:AddLabel('made by @s.eths');
CreditsRightGroupBox:AddLabel('5/01/2025');

-- UI Callbacks
Toggles.AutoWinToggle:OnChanged(function()
    task.spawn(function()
        if Toggles.AutoWinToggle.Value then
            if PlayerGUI.HomeGui.RightFrame.AutoFightButton.OFF.Visible then
                for i, v in next, getconnections(PlayerGUI.HomeGui.RightFrame.AutoFightButton.MouseButton1Click) do
                    v.Function();
                end;
            end;
            task.wait(3);
        else
            if PlayerGUI.HomeGui.RightFrame.AutoFightButton.ON.Visible then
                for i, v in next, getconnections(PlayerGUI.HomeGui.RightFrame.AutoFightButton.MouseButton1Click) do
                    v.Function();
                end;
            end;
        end;
        while Toggles.AutoWinToggle.Value do
            if PlayerGUI.HomeGui.TopFrame.TimeLabel.Text == "Race Ended" or PlayerGUI.HomeGui.TopFrame.TimeLabel.Text == "Race Will Start" or not PlayerGUI.HomeGui.TopFrame.TimeLabel.Visible then
                repeat task.wait(); until PlayerGUI.HomeGui.TopFrame.TimeLabel.Text ~= "Race Ended" and PlayerGUI.HomeGui.TopFrame.TimeLabel.Text ~= "Race Will Start" and PlayerGUI.HomeGui.TopFrame.TimeLabel.Visible;
                task.wait(3);
            end;
            task.wait();
            local AreaName = GetAreaName();
            HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Areas[AreaName].WinGates.WinGate_16.gate.Position);
        end;
    end);
end);

Toggles.AutoTrainToggle:OnChanged(function()
    task.spawn(function()
        if Toggles.AutoTrainToggle.Value then
            Library:Notify("if your not gaining power, get on any treadmill and then hop off it.", 5);
        end;
        while Toggles.AutoTrainToggle.Value do
            task.wait();
            ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("TrainService"):WaitForChild("RE"):WaitForChild("RunTrain"):FireServer(GetBestTreadmill());
        end;
    end);
end);

Toggles.AutoRebirthToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoRebirthToggle.Value do
            task.wait();
            ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("RebirthService"):WaitForChild("RF"):WaitForChild("Rebirth"):InvokeServer();
        end;
    end);
end);

Toggles.AutoBuyHorsesToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoBuyHorsesToggle.Value do
            local BestHorse, BestHorsePrice = GetBestHorse();
            if BestHorse and BestHorsePrice > CurrentHorseValue then
                local BestHorseEquip = BestHorse;
                CurrentHorseValue = BestHorsePrice;
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("HorseService"):WaitForChild("RE"):WaitForChild("UnlockHorseEvent"):FireServer(BestHorseEquip);
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("HorseService"):WaitForChild("RE"):WaitForChild("EquipHorseEvent"):FireServer(BestHorseEquip);
            end;
            task.wait(1);
        end;
    end);
end);

Toggles.AutoBuyPrincessesToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoBuyPrincessesToggle.Value do
            local BestPrincess, BestPrincessPrice = GetBestPrincess();
            if BestPrincess and BestPrincessPrice > CurrentPrincessValue then
                local BestPrincessEquip = BestPrincess;
                CurrentPrincessValue = BestPrincessPrice;
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PrincessService"):WaitForChild("RE"):WaitForChild("UnlockPrincess"):FireServer(BestPrincessEquip);
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PrincessService"):WaitForChild("RE"):WaitForChild("EquipPrincess"):FireServer(BestPrincessEquip);
            end;
            task.wait(1);
        end;
    end);
end);

Toggles.AutoBuyTrailsToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoBuyTrailsToggle.Value do
            local BestTrail, BestTrailPrice = GetBestTrail();
            if BestTrail and BestTrailPrice > CurrentTrailValue then
                local BestTrailEquip = BestTrail;
                CurrentTrailValue = BestTrailPrice;
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("TrailService"):WaitForChild("RE"):WaitForChild("BuyTrailEvent"):FireServer(BestTrailEquip);
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("TrailService"):WaitForChild("RE"):WaitForChild("EquipTrailEvent"):FireServer(BestTrailEquip);
            end;
            task.wait(1);
        end;
    end);
end);

Options.SelectEggDropdown:OnChanged(function()
    task.spawn(function()
        for i, v in next, EggIndex do
            if v == Options.SelectEggDropdown.Value then
                while Options.SelectEggDropdown.Value ~= "none" do
                    task.wait();
                    ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("EggHatchService"):WaitForChild("RE"):WaitForChild("Hatch"):FireServer(i, 1);
                end;
            end;
        end;
    end);
end);

Options.WorldTeleportDropdown:OnChanged(function()
    task.spawn(function()
        for i, v in next, WorldIndex do
            if v == Options.WorldTeleportDropdown.Value then
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("AreaService"):WaitForChild("RE"):WaitForChild("UpdatePlayerCurrentArea"):FireServer(i);
                Library:Notify("successfully teleported, please rejoin to change worlds.", 5);
            end;
        end;
    end);
end);

Toggles.AutoSpinToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoSpinToggle.Value do
            task.wait();
            ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("SpinningWheelService"):WaitForChild("RF"):WaitForChild("StartSpin"):InvokeServer();
        end;
    end);
end);

Toggles.AutoCrateToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoCrateToggle.Value do
            task.wait();
            ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ItemCrateService"):WaitForChild("RE"):WaitForChild("UnboxCrate"):FireServer("Crate_1");
        end;
    end);
end);

Toggles.AutoClaimQuestToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoClaimQuestToggle.Value do
            task.wait();
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("OnlineRewardService"):WaitForChild("RF"):WaitForChild("ClaimOnlineQuestReward"):InvokeServer();
        end;
    end);
end);

Toggles.AutoSeasonPassToggle:OnChanged(function()
    task.spawn(function()
        local SeasonIndex = {"Reward_1", "Reward_2", "Reward_3", "Reward_4", "Reward_5", "Reward_6", "Reward_7", "Reward_8", "Reward_9", "Reward_10", "Reward_11", "Reward_12", "Reward_13", "Reward_14", "Reward_15", "Reward_16", "Reward_17", "Reward_18", "Reward_19", "Reward_20"};
        if Toggles.AutoSeasonPassToggle.Value then
            Library:Notify("a purchase prompt may pop-up, to disable toggle disable purchase prompts.", 5);
        end;
        while Toggles.AutoSeasonPassToggle.Value do
            for i, v in next, SeasonIndex do
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("SeasonService"):WaitForChild("RF"):WaitForChild("ClaimSeasonReward"):InvokeServer(true, v)
            end;
            task.wait(60);
        end;
    end);
end);

Toggles.AutoClaimOnlineRewardsToggle:OnChanged(function()
    task.spawn(function()
        local Index = 0;
        while Toggles.AutoClaimOnlineRewardsToggle.Value do
            repeat
                Index = Index + 1;
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("OnlineRewardService"):WaitForChild("RE"):WaitForChild("ClaimOnlineReward"):FireServer(Index);
            until Index == 12;
            Index = 0;
            task.wait(60);
        end;
    end);
end);

Toggles.DisablePurchasePromptToggle:OnChanged(function()
    task.spawn(function()
        if Toggles.DisablePurchasePromptToggle.Value then
            game:GetService("CoreGui").PurchasePrompt.Enabled = false;
        else
            game:GetService("CoreGui").PurchasePrompt.Enabled = true;
        end;
    end);
end);

Toggles.DisableAlertNotifcationsToggle:OnChanged(function()
    task.spawn(function()
        game:GetService("Players").LocalPlayer.PlayerGui.NotificationGui.Container.ChildAdded:Connect(function(AddedChild)
            if AddedChild.Name == "NotificationTemplate" and Toggles.DisableAlertNotifcationsToggle.Value then
                AddedChild:Destroy();
            end;
        end);
    end);
end);

Toggles.AutoEventEggToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoEventEggToggle.Value do
            task.wait(0.1);
            ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("EggHatchService"):WaitForChild("RE"):WaitForChild("Hatch"):FireServer("Egg_Christmas", 1);
        end;
    end);
end);

Toggles.AutoBuyEventHorsesToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoBuyEventHorsesToggle.Value do
            local BestEventHorse, BestEventHorsePrice = GetBestEventHorse();
            if BestEventHorse and BestEventHorsePrice > CurrentEventHorseValue then
                local BestEventHorseEquip = BestEventHorse;
                CurrentEventHorseValue = BestEventHorsePrice;
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("HorseService"):WaitForChild("RE"):WaitForChild("UnlockHorseEvent"):FireServer(BestEventHorseEquip, "ChristmasTokens");
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("HorseService"):WaitForChild("RE"):WaitForChild("EquipHorseEvent"):FireServer(BestEventHorseEquip);
            end;
            task.wait(1);
        end;
    end);
end);

Toggles.AutoBuyEventPrincessesToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoBuyEventPrincessesToggle.Value do
            local BestEventPrincess, BestEventPrincessPrice = GetBestEventPrincess();
            if BestEventPrincess and BestEventPrincessPrice > CurrentEventPrincessValue then
                local BestEventPrincessEquip = BestEventPrincess;
                CurrentEventPrincessValue = BestEventPrincessPrice;
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PrincessService"):WaitForChild("RE"):WaitForChild("UnlockPrincess"):FireServer(BestEventPrincessEquip, "ChristmasTokens");
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("PrincessService"):WaitForChild("RE"):WaitForChild("EquipPrincess"):FireServer(BestEventPrincessEquip);
            end;
            task.wait(1);
        end;
    end);
end);

Toggles.AutoClaimEventRewardsToggle:OnChanged(function()
    task.spawn(function()
        local Index = 0;
        while Toggles.AutoClaimEventRewardsToggle.Value do
            repeat
                Index = Index + 1;
                ReplicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ChristmasDailyRewardService"):WaitForChild("RE"):WaitForChild("ClaimRewardEvent"):FireServer(Index);
            until Index == 12;
            Index = 0;
            task.wait(60);
        end;
    end);
end);

Toggles.AutoBuyDoubleWinsPotionToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoBuyDoubleWinsPotionToggle.Value do
            task.wait();
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ChristmasService"):WaitForChild("RE"):WaitForChild("BuyPotion"):FireServer("Potion_DoubleWins")
        end;
    end);
end);

Toggles.AutoBuySuperLuckyPotionToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoBuySuperLuckyPotionToggle.Value do
            task.wait();
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ChristmasService"):WaitForChild("RE"):WaitForChild("BuyPotion"):FireServer("Potion_SuperLucky")
        end;
    end);
end);

Toggles.AutoBuyGoldenPotionToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoBuyGoldenPotionToggle.Value do
            task.wait();
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ChristmasService"):WaitForChild("RE"):WaitForChild("BuyPotion"):FireServer("Potion_Golden")
        end;
    end);
end);

Toggles.AutoBuyRainbowPotionToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoBuyRainbowPotionToggle.Value do
            task.wait();
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ChristmasService"):WaitForChild("RE"):WaitForChild("BuyPotion"):FireServer("Potion_Rainbow")
        end;
    end);
end);

-- UI
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu');

MenuGroup:AddButton('Unload', function() Library:Unload() end);
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', {Default = 'BackSlash', NoUI = true, Text = 'Menu keybind'});

Library.ToggleKeybind = Options.MenuKeybind;

Library:OnUnload(function()
    Library.Unloaded = true;
end);

Library:SetWatermark('spooky.wtf | ' .. game.JobId .. ' | ' .. game.PlaceId);
ThemeManager:SetLibrary(Library);
SaveManager:SetLibrary(Library);
SaveManager:IgnoreThemeSettings();
SaveManager:SetIgnoreIndexes({'MenuKeybind'});
ThemeManager:SetFolder('spooky.wtf');
SaveManager:SetFolder('spooky.wtf/Heaven-Line-Simulator');
SaveManager:BuildConfigSection(Tabs['UI Settings']);
ThemeManager:ApplyToTab(Tabs['UI Settings']);
SaveManager:LoadAutoloadConfig();
