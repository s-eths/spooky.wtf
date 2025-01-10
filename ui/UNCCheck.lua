-- credits: https://github.com/unified-naming-convention/NamingStandard/blob/main/UNCCheckEnv.lua
-- a edited version of it to support spooky.wtf

local Passes, Fails, Undefined = 0, 0, 0;
local Running = 0;

local function GetGlobal(Path)
	local Value = getfenv(0);

	while Value ~= nil and Path ~= "" do
		local Name, NextValue = string.match(Path, "^([^.]+)%.?(.*)$");
		Value = Value[Name];
		Path = NextValue;
	end;
	return Value;
end;

local function test(Name, Aliases, Callback)
	Running += 1;

	task.spawn(function()
		if not GetGlobal(Name) then
			Fails += 1;
		else
			local Success, Message = pcall(Callback);
	
			if Success then
				Passes += 1;
			else
				Fails += 1;
			end;
		end;
	
		local UndefinedAliases = {};
	
		for i, v in ipairs(Aliases) do
			if GetGlobal(v) == nil then
				table.insert(UndefinedAliases, v);
			end;
		end;
	
		if #UndefinedAliases > 0 then
			Undefined += 1;
		end;

		Running -= 1;
	end)
end

task.defer(function()
	repeat task.wait() until Running == 0;

    if Passes == 5 then
        return true;
    else
        return false;
    end;
end)

test("loadstring", {}, function()
	local Animate = game:GetService("Players").LocalPlayer.Character.Animate
	local Bytecode = getscriptbytecode(Animate)
	local func = loadstring(Bytecode)
	assert(type(func) ~= "function", "Luau bytecode should not be loadable!");
	assert(assert(loadstring("return ... + 1"))(1) == 2, "Failed to do simple math");
	assert(type(select(2, loadstring("f"))) == "string", "Loadstring did not return anything for a compiler error");
end);

test("fireclickdetector", {}, function()
	local Detector = Instance.new("ClickDetector");
	fireclickdetector(Detector, 50, "MouseHoverEnter");
end);

test("getconnections", {}, function()
	local Types = {
		Enabled = "boolean",
		ForeignState = "boolean",
		LuaConnection = "boolean",
		Function = "function",
		Thread = "thread",
		Fire = "function",
		Defer = "function",
		Disconnect = "function",
		Disable = "function",
		Enable = "function",
	};
	local Bindable = Instance.new("BindableEvent");
	Bindable.Event:Connect(function() end);
	local Connection = getconnections(Bindable.Event)[1];
	for i, v in pairs(Types) do
		assert(Connection[i] ~= nil, "Did not return a table with a '" .. i .. "' field");
		assert(type(Connection[i]) == v, "Did not return a table with " .. i .. " as a " .. v .. " (got " .. type(Connection[i]) .. ")");
	end;
end);

test("setfpscap", {}, function()
	local RenderStepped = game:GetService("RunService").RenderStepped;
	local function Step()
		RenderStepped:Wait()
		local Summary = 0
		for i = 1, 5 do
			Summary += 1 / RenderStepped:Wait();
		end;
		return math.round(Summary / 5);
	end;
	setfpscap(60);
	local Step60 = Step();
	setfpscap(0);
	local Step0 = Step();
	return Step60 .. "FPS @60 • " .. Step0 .. "FPS @0";
end)

test("getgenv", {}, function()
	getgenv().__TEST_GLOBAL = true;
	assert(__TEST_GLOBAL, "Failed to set a global variable");
	getgenv().__TEST_GLOBAL = nil;
end);
