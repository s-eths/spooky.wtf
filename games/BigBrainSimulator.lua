-- spooky.wtf | made by @s.eths

-- Services
local Workspace                = game:GetService("Workspace");
local ReplicatedStorage        = game:GetService("ReplicatedStorage");

-- Variables
local LocalPlayer              = game:GetService("Players").LocalPlayer;
local HumanoidRootPart         = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart;

-- UI
local Repository               = 'https://raw.githubusercontent.com/s-eths/spooky.wtf/main/ui/';
local Library                  = loadstring(game:HttpGet(Repository .. 'Library.lua'))();
local ThemeManager             = loadstring(game:HttpGet(Repository .. 'addons/ThemeManager.lua'))();
local SaveManager              = loadstring(game:HttpGet(Repository .. 'addons/SaveManager.lua'))();
local Version                  = loadstring(game:HttpGet(Repository .. 'addons/Version.lua'))();
local Window                   = Library:CreateWindow({Title = 'spooky.wtf | ' .. Version .. ' | ' .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, Center = true, AutoShow = true, TabPadding = 8});
local Tabs                     = {Main = Window:AddTab('main'), ['UI Settings'] = Window:AddTab('ui settings'), Credits = Window:AddTab('credits')};
local FunctionsLeftGroupBox    = Tabs.Main:AddLeftGroupbox('functions');
local AutoUpgradeLeftGroupBox  = Tabs.Main:AddLeftGroupbox('auto upgrade');
local OtherRightGroupBox       = Tabs.Main:AddRightGroupbox('other');
local CreditsLeftGroupBox      = Tabs.Credits:AddLeftGroupbox('credits');
local CreditsRightGroupBox     = Tabs.Credits:AddRightGroupbox('last updated');

-- Functions
local function UnlockAllIslands()
    local OldPosition = HumanoidRootPart.Position;
    HumanoidRootPart.CFrame = Workspace.Islands.Mars.IqCapsule.Part.CFrame;
    task.wait(2);
    HumanoidRootPart.CFrame = CFrame.new(OldPosition);
end;

-- Buttons/Toggles/Dropdowns/Labels
FunctionsLeftGroupBox:AddToggle('AutoReadToggle', {Text = 'auto read', Default = false});
FunctionsLeftGroupBox:AddToggle('AutoSellToggle', {Text = 'auto sell', Default = false});
FunctionsLeftGroupBox:AddToggle('AutoEquipBookToggle', {Text = 'auto equip book', Default = false});
AutoUpgradeLeftGroupBox:AddToggle('AutoBuyBooksToggle', {Text = 'auto buy books', Default = false});
AutoUpgradeLeftGroupBox:AddToggle('AutoUpgradeBrainToggle', {Text = 'auto upgrade brain', Default = false});
OtherRightGroupBox:AddToggle('AutoCollectCoinsToggle', {Text = 'auto collect coins', Default = false});
OtherRightGroupBox:AddToggle('AutoCollectCoinCapsulesToggle', {Text = 'auto collect coin capsules', Default = false});
OtherRightGroupBox:AddButton({Text = "unlock all islands", Func = function() UnlockAllIslands() end}); 
CreditsLeftGroupBox:AddLabel('made by @s.eths');
CreditsRightGroupBox:AddLabel('10/01/2025');

-- UI Callbacks
Toggles.AutoReadToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoReadToggle.Value do
            for i, v in next, Workspace[LocalPlayer.Name]:GetChildren() do
                if v:IsA("Tool") then
                    task.wait();
                    v:Activate();
                end;
            end;
            task.wait();
        end;
    end);
end);

Toggles.AutoSellToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoSellToggle.Value do
            task.wait();
            firetouchinterest(HumanoidRootPart, Workspace.Islands.Mars.SellPart, 0);
            firetouchinterest(HumanoidRootPart, Workspace.Islands.Mars.SellPart, 1);
        end;
    end);
end);

Toggles.AutoEquipBookToggle:OnChanged(function()
    task.spawn(function()
        LocalPlayer.Backpack.ChildAdded:Connect(function(Child)
            if Toggles.AutoEquipBookToggle.Value then
                if Child:IsA("Tool") then
                    task.wait();
                    Child.Parent = LocalPlayer.Character;
                end;
            end;
        end);
    end);
end);

local IndexNumber, IndexCount = 1, 0;
Toggles.AutoBuyBooksToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoBuyBooksToggle.Value do
            task.wait();
            for i, v in next, ReplicatedStorage.Books:GetChildren() do
                if v:GetAttribute("Number") == IndexNumber then
                    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BuyBook"):FireServer(v.Name);
                    task.wait();
                    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("EquipBook"):FireServer(v.Name);
                    task.wait(0.5);
                end;
            end;
            IndexNumber = IndexNumber + 1;
            IndexCount = IndexCount + 1;
            if IndexCount == 23 then
                IndexNumber = 1;
                IndexCount = 0;
                task.wait(60);
            end;
        end;
    end);
end);

Toggles.AutoUpgradeBrainToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoUpgradeBrainToggle.Value do
            task.wait();
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("UpgradeCapacity"):FireServer();
        end;
    end);
end);

Toggles.AutoCollectCoinsToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoCollectCoinsToggle.Value do
            task.wait();
            for i, v in next, Workspace.Coins:GetChildren() do
                if v:FindFirstChild("Coin") then
                    firetouchinterest(HumanoidRootPart, v.Coin, 0);
                end;
            end;
        end;
    end);
end);

Toggles.AutoCollectCoinCapsulesToggle:OnChanged(function()
    task.spawn(function()
        while Toggles.AutoCollectCoinCapsulesToggle.Value do
            for i, v in next, workspace.Islands:GetChildren() do
                task.wait(0.5);
                firetouchinterest(HumanoidRootPart, v.IqCapsule.CollectPart, 0);
                firetouchinterest(HumanoidRootPart, v.IqCapsule.CollectPart, 1);
            end;
            task.wait(600);
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

Library:SetWatermark('spooky.wtf | ' .. Version .. ' | ' .. game.JobId .. ' | ' .. game.PlaceId);
ThemeManager:SetLibrary(Library);
SaveManager:SetLibrary(Library);
SaveManager:IgnoreThemeSettings();
SaveManager:SetIgnoreIndexes({'MenuKeybind'});
ThemeManager:SetFolder('spooky.wtf');
SaveManager:SetFolder('spooky.wtf/' .. game.PlaceId);
SaveManager:BuildConfigSection(Tabs['UI Settings']);
ThemeManager:ApplyToTab(Tabs['UI Settings']);
SaveManager:LoadAutoloadConfig();
