bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local obf_OR = obf_bitlib.bor;
local obf_AND = obf_bitlib.band;
local obf_stringmatch = string.match;
local obf_tonumber = tonumber;
local obf_pcall = pcall;
local TweenService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\229\212\222\32\232\136\194\12\199\202\216\32", "\126\177\163\187\69\134\219\167"));
local RunService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\17\216\36\246\249\49\219\35\198\249", "\156\67\173\74\165"));
local Players = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\4\187\72\15\185\52\85", "\38\84\215\41\118\220\70"));
local Player = Players['LocalPlayer'];
local PlayerGui = Player:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\96\26\35\11\251\66\49\55\27", "\158\48\118\66\114"));
local CORRECT_KEY = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
local KEY_LINK = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
local DISCORD_LINK = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
local SAVE_FILE_NAME = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
local SAVE_DURATION = 13744 + 7856;
local saveKeyEnabled = false;
local ScreenGui = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
ScreenGui['Name'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
ScreenGui['ResetOnSpawn'] = false;
ScreenGui['IgnoreGuiInset'] = true;
ScreenGui['Parent'] = PlayerGui;
local function LoadMainScript()
	local function obf_wrapperfunc(obf_arg)
		if obf_arg then
			local Players = game:GetService(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			local TweenService = game:GetService(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			local RunService = game:GetService(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			local UserInputService = game:GetService(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			local StarterGui = game:GetService(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			local Player = Players['LocalPlayer'];
			local PlayerGui = Player:WaitForChild(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			local Camera = _G['workspace']['CurrentCamera'];
			local invite = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
			if _G['CamlockConnection'] then
				_G['CamlockConnection']:Disconnect();
			end
			if game['CoreGui']:FindFirstChild(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])) then
				game['CoreGui']['CamlockHighlight']:Destroy();
			end
			if PlayerGui:FindFirstChild(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])) then
				PlayerGui['CamlockGui']:Destroy();
			end
			local Gui = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			Gui['IgnoreGuiInset'] = true;
			Gui['ResetOnSpawn'] = false;
			Gui['Parent'] = PlayerGui;
			local Blur = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			Blur['Size'] = 0 - 0;
			Blur['Parent'] = _G['game']['Lighting'];
			local MainFrame = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			MainFrame['Size'] = UDim2.new(1 + 0, 0 - 0, 1470 - (1269 + 200), 0 - 0);
			MainFrame['BackgroundColor3'] = Color3.fromRGB(820 - (98 + 717), 831 - (802 + 24), 11 - 4);
			MainFrame['BackgroundTransparency'] = 1 - 0;
			MainFrame['Parent'] = Gui;
			local AccentLine = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			AccentLine['Size'] = UDim2.new(0 + 0, 0 + 0, 0 + 0, 1 + 1);
			AccentLine['Position'] = UDim2.new(0.5 - 0, 0 - 0, 0.52 + 0, 0 + 0);
			AccentLine['AnchorPoint'] = Vector2.new(0.5 + 0, 0.5 + 0);
			AccentLine['BackgroundColor3'] = Color3.fromRGB(0 + 0, 1543 - (797 + 636), 631 - 501);
			AccentLine['BorderSizePixel'] = 1619 - (1427 + 192);
			AccentLine['Parent'] = MainFrame;
			local Title = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			Title['Size'] = UDim2.new(0.8 + 0, 0 - 0, 0 + 0, 23 + 27);
			Title['Position'] = UDim2.new(326.1 - (192 + 134), 1276 - (316 + 960), 0.53 + 0, 0 + 0);
			Title['BackgroundTransparency'] = 1 + 0;
			Title['TextColor3'] = Color3.new(3 - 2, 552 - (83 + 468), 1807 - (1202 + 604));
			Title['Font'] = Enum['Font']['GothamBold'];
			Title['TextSize'] = 177 - 139;
			Title['Text'] = "";
			Title['Parent'] = MainFrame;
			local Credits = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			Credits['Size'] = UDim2.new(0.8 - 0, 0 - 0, 325 - (45 + 280), 20 + 0);
			Credits['Position'] = UDim2.new(0.1 + 0, 0 + 0, 0.64 + 0, 0 + 0);
			Credits['BackgroundTransparency'] = 1 - 0;
			Credits['TextColor3'] = Color3.fromRGB(1991 - (340 + 1571), 32 + 48, 1852 - (1733 + 39));
			Credits['Font'] = Enum['Font']['GothamMedium'];
			Credits['TextSize'] = 35 - 22;
			Credits['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
			Credits['TextTransparency'] = 1035 - (125 + 909);
			Credits['Parent'] = MainFrame;
			local LoadingContainer = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			LoadingContainer['Size'] = UDim2.new(1948 - (1096 + 852), 158 + 192, 0 - 0, 3 + 0);
			LoadingContainer['Position'] = UDim2.new(512.5 - (409 + 103), 236 - (46 + 190), 95.35 - (51 + 44), 0 + 0);
			LoadingContainer['AnchorPoint'] = Vector2.new(1317.5 - (1114 + 203), 726.5 - (228 + 498));
			LoadingContainer['BackgroundColor3'] = Color3.fromRGB(56 + 199, 141 + 114, 918 - (174 + 489));
			LoadingContainer['BackgroundTransparency'] = 0.8 - 0;
			LoadingContainer['BorderSizePixel'] = 1905 - (830 + 1075);
			LoadingContainer['Parent'] = MainFrame;
			local LoadingFill = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			LoadingFill['Size'] = UDim2.new(524 - (303 + 221), 1269 - (231 + 1038), 1 + 0, 1162 - (171 + 991));
			LoadingFill['BackgroundColor3'] = Color3.new(4 - 3, 2 - 1, 2 - 1);
			LoadingFill['BorderSizePixel'] = 0 + 0;
			LoadingFill['Parent'] = LoadingContainer;
			local LoadingTitle = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			LoadingTitle['Size'] = UDim2.new(0 - 0, 576 - 376, 0 - 0, 61 - 41);
			LoadingTitle['Position'] = UDim2.new(1248.5 - (111 + 1137), 158 - (91 + 67), -(29 - 19), 0 + 0);
			LoadingTitle['AnchorPoint'] = Vector2.new(523.5 - (423 + 100), 0.5 + 0);
			LoadingTitle['BackgroundTransparency'] = 2 - 1;
			LoadingTitle['TextColor3'] = Color3.new(1 + 0, 772 - (326 + 445), 4 - 3);
			LoadingTitle['Font'] = Enum['Font']['GothamMedium'];
			LoadingTitle['TextSize'] = 26 - 14;
			LoadingTitle['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
			LoadingTitle['TextTransparency'] = 2 - 1;
			LoadingTitle['Parent'] = LoadingContainer;
			local PercText = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			PercText['Size'] = UDim2.new(711 - (530 + 181), 981 - (614 + 267), 32 - (19 + 13), 32 - 12);
			PercText['Position'] = UDim2.new(0.5 - 0, 0 - 0, 0 + 0, 20 - 8);
			PercText['AnchorPoint'] = Vector2.new(0.5 - 0, 1812 - (1293 + 519));
			PercText['BackgroundTransparency'] = 1 - 0;
			PercText['TextColor3'] = Color3.new(2 - 1, 1 - 0, 4 - 3);
			PercText['Font'] = Enum['Font']['GothamBold'];
			PercText['TextSize'] = 32 - 18;
			PercText['TextTransparency'] = 1 + 0;
			PercText['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
			PercText['Parent'] = LoadingContainer;
			local function styleButton(btn, color)
				local FlatIdent_92FAC = 0;
				local corner;
				while true do
					if (FlatIdent_92FAC == 0) then
						corner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']), btn);
						corner['CornerRadius'] = UDim.new(0 + 0, 13 - 7);
						FlatIdent_92FAC = 1;
					end
					if (FlatIdent_92FAC == 1) then
						btn['MouseEnter']:Connect(function()
							TweenService:Create(btn, TweenInfo.new(0.3 + 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=color,[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=Color3.new(0 + 0, 0 + 0, 1096 - (709 + 387))}):Play();
						end);
						btn['MouseLeave']:Connect(function()
							TweenService:Create(btn, TweenInfo.new(1858.3 - (673 + 1185)), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=Color3.fromRGB(72 - 47, 80 - 55, 49 - 19),[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=Color3.new(1 + 0, 1 + 0, 1 - 0)}):Play();
						end);
						break;
					end
				end
			end
			local function InitCamlock()
				_G['Keybind'] = "V";
				_G['LockStrength'] = 2 + 3;
				_G['Enabled'] = false;
				local lastInputTime = 0 - 0;
				StarterGui:SetCore(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']),[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']) .. tostring(_G.Keybind):upper() .. _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']) .. tostring(_G.LockStrength)),[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(9 - 4)});
				local ScreenGui = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				ScreenGui['Name'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
				ScreenGui['ResetOnSpawn'] = false;
				ScreenGui['Parent'] = Player:WaitForChild(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				local OuterFrame = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				OuterFrame['Size'] = UDim2.new(1880 - (446 + 1434), 1463 - (1040 + 243), 0 - 0, 1902 - (559 + 1288));
				OuterFrame['Position'] = UDim2.new(1931.5 - (609 + 1322), -(544 - (13 + 441)), 0.05 - 0, 0 - 0);
				OuterFrame['BackgroundColor3'] = Color3.fromRGB(1270 - 1015, 10 + 245, 926 - 671);
				OuterFrame['BorderSizePixel'] = 0 + 0;
				OuterFrame['Active'] = true;
				OuterFrame['Parent'] = ScreenGui;
				local OuterCorner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				OuterCorner['CornerRadius'] = UDim.new(0.5 + 0, 0 - 0);
				OuterCorner['Parent'] = OuterFrame;
				local InnerFrame = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				InnerFrame['Size'] = UDim2.new(0 + 0, 323 - 147, 0 + 0, 29 + 22);
				InnerFrame['Position'] = UDim2.new(0.5 + 0, -(74 + 14), 0.5 + 0, -(458 - (153 + 280)));
				InnerFrame['BackgroundColor3'] = Color3.fromRGB(0 - 0, 0 + 0, 0 + 0);
				InnerFrame['BorderSizePixel'] = 0 + 0;
				InnerFrame['Parent'] = OuterFrame;
				local InnerCorner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				InnerCorner['CornerRadius'] = UDim.new(0.5 + 0, 0 + 0);
				InnerCorner['Parent'] = InnerFrame;
				local TitleLabel = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				TitleLabel['Size'] = UDim2.new(1 - 0, 0 + 0, 667.6 - (89 + 578), 0 + 0);
				TitleLabel['Position'] = UDim2.new(0 - 0, 1049 - (572 + 477), 0.1 + 0, 0 + 0);
				TitleLabel['BackgroundTransparency'] = 1 + 0;
				TitleLabel['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
				TitleLabel['TextColor3'] = Color3.fromRGB(341 - (84 + 2), 420 - 165, 184 + 71);
				TitleLabel['TextSize'] = 856 - (497 + 345);
				TitleLabel['Font'] = Enum['Font']['GothamBold'];
				TitleLabel['Parent'] = InnerFrame;
				local TargetLabel = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				TargetLabel['Size'] = UDim2.new(1 + 0, 0 + 0, 1333.3 - (605 + 728), 0 + 0);
				TargetLabel['Position'] = UDim2.new(0 - 0, 0 + 0, 0.6 - 0, 0 + 0);
				TargetLabel['BackgroundTransparency'] = 2 - 1;
				TargetLabel['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
				TargetLabel['TextColor3'] = Color3.fromRGB(114 + 36, 639 - (457 + 32), 64 + 86);
				TargetLabel['TextSize'] = 1412 - (832 + 570);
				TargetLabel['Font'] = Enum['Font']['Gotham'];
				TargetLabel['Parent'] = InnerFrame;
				local TargetHighlight = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				TargetHighlight['Name'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
				TargetHighlight['FillTransparency'] = 1 + 0;
				TargetHighlight['OutlineTransparency'] = 0 + 0;
				TargetHighlight['OutlineColor'] = Color3.fromRGB(902 - 647, 123 + 132, 1051 - (588 + 208));
				TargetHighlight['Enabled'] = false;
				TargetHighlight['Parent'] = _G['game']['CoreGui'];
				local dragging, dragStart, startPos, startMousePos;
				local function toggle()
					local FlatIdent_101D1 = 0;
					while true do
						if (0 == FlatIdent_101D1) then
							_G['Enabled'] = not _G['Enabled'];
							if _G['Enabled'] then
								local FlatIdent_5C7CA = 0;
								while true do
									if (FlatIdent_5C7CA == 0) then
										TitleLabel['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
										TitleLabel['TextColor3'] = Color3.fromRGB(0 - 0, 2055 - (884 + 916), 314 - 164);
										break;
									end
								end
							else
								local FlatIdent_365F8 = 0;
								while true do
									if (FlatIdent_365F8 == 0) then
										TitleLabel['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
										TitleLabel['TextColor3'] = Color3.fromRGB(148 + 107, 908 - (232 + 421), 2144 - (1569 + 320));
										FlatIdent_365F8 = 1;
									end
									if (FlatIdent_365F8 == 2) then
										TargetHighlight['Adornee'] = nil;
										break;
									end
									if (FlatIdent_365F8 == 1) then
										TargetLabel['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
										TargetHighlight['Enabled'] = false;
										FlatIdent_365F8 = 2;
									end
								end
							end
							break;
						end
					end
				end
				OuterFrame['InputBegan']:Connect(function(input)
					if ((input['UserInputType'] == Enum['UserInputType']['MouseButton1']) or (input['UserInputType'] == Enum['UserInputType']['Touch'])) then
						local FlatIdent_22DED = 0;
						while true do
							if (FlatIdent_22DED == 0) then
								dragging = true;
								dragStart = input['Position'];
								FlatIdent_22DED = 1;
							end
							if (FlatIdent_22DED == 2) then
								input['Changed']:Connect(function()
									if (input['UserInputState'] ~= Enum['UserInputState']['End']) then
									else
										local FlatIdent_583B7 = 0;
										while true do
											if (0 == FlatIdent_583B7) then
												dragging = false;
												if ((input['Position'] - startMousePos)['Magnitude'] >= (2 + 3)) then
												else
													toggle();
												end
												break;
											end
										end
									end
								end);
								break;
							end
							if (FlatIdent_22DED == 1) then
								startMousePos = input['Position'];
								startPos = OuterFrame['Position'];
								FlatIdent_22DED = 2;
							end
						end
					end
				end);
				UserInputService['InputChanged']:Connect(function(input)
					if (dragging and ((input['UserInputType'] == Enum['UserInputType']['MouseMovement']) or (input['UserInputType'] == Enum['UserInputType']['Touch']))) then
						local FlatIdent_DDF2 = 0;
						local delta;
						local targetPos;
						while true do
							if (FlatIdent_DDF2 == 0) then
								delta = input['Position'] - dragStart;
								targetPos = UDim2.new(startPos['X'].Scale, obf_AND(startPos['X'].Offset, delta.X) + obf_OR(startPos['X'].Offset, delta.X), startPos['Y'].Scale, obf_AND(startPos['Y'].Offset, delta.Y) + obf_OR(startPos['Y'].Offset, delta.Y));
								FlatIdent_DDF2 = 1;
							end
							if (FlatIdent_DDF2 == 1) then
								TweenService:Create(OuterFrame, TweenInfo.new(0.08 + 0, Enum['EasingStyle'].Quart, Enum['EasingDirection'].Out), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=targetPos}):Play();
								break;
							end
						end
					end
				end);
				local function getNearestTarget()
					local FlatIdent_39AEA = 0;
					local nearest;
					local lastDist;
					local myRoot;
					while true do
						if (FlatIdent_39AEA == 2) then
							return nearest;
						end
						if (FlatIdent_39AEA == 1) then
							if not myRoot then
								return nil;
							end
							for _, v in pairs(workspace:GetDescendants()) do
								if (v:IsA(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])) and v:FindFirstChild(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])) and v:FindFirstChild(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']))) then
									if ((v ~= Player['Character']) and (v['Humanoid']['Health'] > (0 - 0))) then
										local FlatIdent_23065 = 0;
										local dist;
										while true do
											if (FlatIdent_23065 == 0) then
												dist = (myRoot['Position'] - v['HumanoidRootPart']['Position'])['Magnitude'];
												if (dist >= lastDist) then
												else
													local FlatIdent_83642 = 0;
													while true do
														if (FlatIdent_83642 == 0) then
															lastDist = dist;
															nearest = v;
															break;
														end
													end
												end
												break;
											end
										end
									end
								end
							end
							FlatIdent_39AEA = 2;
						end
						if (FlatIdent_39AEA == 0) then
							nearest, lastDist = nil, _G['math']['huge'];
							myRoot = Player['Character'] and Player['Character']:FindFirstChild(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
							FlatIdent_39AEA = 1;
						end
					end
				end
				_G['CamlockConnection'] = RunService['RenderStepped']:Connect(function()
					local FlatIdent_54A2D = 0;
					local currentKey;
					while true do
						if (1 == FlatIdent_54A2D) then
							if _G['Enabled'] then
								local FlatIdent_52E8 = 0;
								local target;
								while true do
									if (0 == FlatIdent_52E8) then
										target = getNearestTarget();
										if target then
											local FlatIdent_1D2C3 = 0;
											local root;
											while true do
												if (FlatIdent_1D2C3 == 0) then
													root = target:FindFirstChild(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
													if root then
														local FlatIdent_BEF0 = 0;
														local s;
														local alpha;
														while true do
															if (FlatIdent_BEF0 == 2) then
																TargetHighlight['Adornee'] = target;
																TargetHighlight['Enabled'] = true;
																break;
															end
															if (FlatIdent_BEF0 == 0) then
																s = tonumber(_G.LockStrength) or (13 - 8);
																alpha = _G['math'].clamp(s / (1 + 9), 1453.1 - (666 + 787), 426 - (360 + 65));
																FlatIdent_BEF0 = 1;
															end
															if (FlatIdent_BEF0 == 1) then
																Camera['CFrame'] = Camera['CFrame']:Lerp(CFrame.new(Camera['CFrame'].Position, root.Position), alpha);
																TargetLabel['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']) .. target['Name'] .. "]";
																FlatIdent_BEF0 = 2;
															end
														end
													end
													break;
												end
											end
										else
											local FlatIdent_891A = 0;
											while true do
												if (FlatIdent_891A == 1) then
													TargetHighlight['Adornee'] = nil;
													break;
												end
												if (FlatIdent_891A == 0) then
													TargetLabel['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
													TargetHighlight['Enabled'] = false;
													FlatIdent_891A = 1;
												end
											end
										end
										break;
									end
								end
							end
							break;
						end
						if (0 == FlatIdent_54A2D) then
							currentKey = Enum['KeyCode'][_G['Keybind']:upper()];
							if UserInputService:IsKeyDown(currentKey) then
								if ((tick() - lastInputTime) <= (605.3 - (316 + 289))) then
								else
									local FlatIdent_646A2 = 0;
									while true do
										if (0 == FlatIdent_646A2) then
											toggle();
											lastInputTime = _G['tick']();
											break;
										end
									end
								end
							end
							FlatIdent_54A2D = 1;
						end
					end
				end);
			end
			task.spawn(function()
				TweenService:Create(MainFrame, TweenInfo.new(1 + 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(254.1 - (79 + 175))}):Play();
				TweenService:Create(Blur, TweenInfo.new(1.5 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(20 + 5)}):Play();
				task.wait(0.5 - 0);
				local message = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
				for i = 1 - 0, #message do
					local FlatIdent_86D0A = 0;
					while true do
						if (FlatIdent_86D0A == 0) then
							Title['Text'] = string.sub(message, 900 - (503 + 396), i);
							task.wait(181.04 - (92 + 89));
							break;
						end
					end
				end
				TweenService:Create(AccentLine, TweenInfo.new(0.8 - 0, Enum['EasingStyle'].Exponential), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=UDim2.new(0.4 + 0, 0 + 0, 0 - 0, 1 + 1)}):Play();
				TweenService:Create(Credits, TweenInfo.new(0.8 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 + 0)}):Play();
				task.wait(0.4 + 0);
				TweenService:Create(LoadingContainer, TweenInfo.new(0.5 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0.8 + 0)}):Play();
				TweenService:Create(LoadingTitle, TweenInfo.new(0.5 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1244 - (485 + 759))}):Play();
				TweenService:Create(PercText, TweenInfo.new(0.5 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1189 - (442 + 747))}):Play();
				local currentPercent = 1135 - (832 + 303);
				while currentPercent < (1046 - (88 + 858)) do
					local FlatIdent_60E17 = 0;
					local jump;
					while true do
						if (FlatIdent_60E17 == 1) then
							TweenService:Create(LoadingFill, TweenInfo.new(789.4 - (766 + 23), Enum['EasingStyle'].Quad), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=UDim2.new(currentPercent / (493 - 393), 0 - 0, 2 - 1, 0 - 0)}):Play();
							PercText['Text'] = currentPercent .. "%";
							FlatIdent_60E17 = 2;
						end
						if (2 == FlatIdent_60E17) then
							task.wait(_G['math'].random(1079 - (1036 + 37), 9 + 3) / (19 - 9));
							break;
						end
						if (FlatIdent_60E17 == 0) then
							jump = _G['math'].random(5 + 10, 29 + 6);
							currentPercent = _G['math'].min(obf_AND(currentPercent, jump) + obf_OR(currentPercent, jump), 5 + 95);
							FlatIdent_60E17 = 1;
						end
					end
				end
				task.wait(0.5 + 0);
				TweenService:Create(Title, TweenInfo.new(1480.5 - (641 + 839)), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(914 - (910 + 3))}):Play();
				TweenService:Create(Credits, TweenInfo.new(0.5 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1685 - (1466 + 218))}):Play();
				TweenService:Create(AccentLine, TweenInfo.new(0.5 + 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1149 - (556 + 592))}):Play();
				TweenService:Create(LoadingContainer, TweenInfo.new(0.5 + 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(809 - (329 + 479))}):Play();
				TweenService:Create(LoadingFill, TweenInfo.new(854.5 - (174 + 680)), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(3 - 2)}):Play();
				TweenService:Create(LoadingTitle, TweenInfo.new(0.5 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1 + 0)}):Play();
				TweenService:Create(PercText, TweenInfo.new(739.5 - (396 + 343)), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1 + 0)}):Play();
				task.wait(1477.6 - (29 + 1448));
				local Question = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				Question['Size'] = UDim2.new(1389.6 - (135 + 1254), 0 - 0, 0 - 0, 20 + 10);
				Question['AnchorPoint'] = Vector2.new(1527.5 - (389 + 1138), 574.5 - (102 + 472));
				Question['Position'] = UDim2.new(0.5 + 0, 0 + 0, 0.44 + 0, 1545 - (320 + 1225));
				Question['BackgroundTransparency'] = 1 - 0;
				Question['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
				Question['TextColor3'] = Color3.new(1 + 0, 1465 - (157 + 1307), 1860 - (821 + 1038));
				Question['Font'] = Enum['Font']['GothamBold'];
				Question['TextSize'] = 74 - 44;
				Question['TextTransparency'] = 1 + 0;
				Question['Parent'] = MainFrame;
				local SubText = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				SubText['Size'] = UDim2.new(0.6 - 0, 0 + 0, 0 - 0, 1046 - (834 + 192));
				SubText['AnchorPoint'] = Vector2.new(0.5 + 0, 0.5 + 0);
				SubText['Position'] = UDim2.new(0.5 + 0, 0 - 0, 304.485 - (300 + 4), 0 + 0);
				SubText['BackgroundTransparency'] = 2 - 1;
				SubText['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
				SubText['TextColor3'] = Color3.fromRGB(542 - (112 + 250), 72 + 108, 450 - 270);
				SubText['Font'] = Enum['Font']['GothamMedium'];
				SubText['TextSize'] = 8 + 5;
				SubText['TextTransparency'] = 1 + 0;
				SubText['Parent'] = MainFrame;
				local Divider = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				Divider['Size'] = UDim2.new(0 + 0, 0 + 0, 0 + 0, 1415 - (1001 + 413));
				Divider['Position'] = UDim2.new(0.5 - 0, 882 - (244 + 638), 693.525 - (627 + 66), 0 - 0);
				Divider['AnchorPoint'] = Vector2.new(602.5 - (512 + 90), 1906.5 - (1665 + 241));
				Divider['BackgroundColor3'] = Color3.new(718 - (373 + 344), 1 + 0, 1 + 0);
				Divider['BackgroundTransparency'] = 0.8 - 0;
				Divider['BorderSizePixel'] = 0 - 0;
				Divider['Parent'] = MainFrame;
				local Ok = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				Ok['Size'] = UDim2.new(1099 - (35 + 1064), 110 + 40, 0 - 0, 1 + 41);
				Ok['Position'] = UDim2.new(1236.5 - (298 + 938), -(1419 - (233 + 1026)), 1666.58 - (636 + 1030), 0 + 0);
				Ok['BackgroundColor3'] = Color3.fromRGB(25 + 0, 8 + 17, 3 + 27);
				Ok['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
				Ok['TextColor3'] = Color3.new(222 - (55 + 166), 1 + 0, 1 + 0);
				Ok['Font'] = Enum['Font']['GothamBold'];
				Ok['TextSize'] = 53 - 39;
				Ok['TextTransparency'] = 298 - (36 + 261);
				Ok['Parent'] = MainFrame;
				styleButton(Ok, Color3.fromRGB(0 - 0, 1623 - (34 + 1334), 58 + 92));
				local Discord = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				Discord['Size'] = UDim2.new(0 + 0, 1433 - (1035 + 248), 21 - (20 + 1), 22 + 20);
				Discord['Position'] = UDim2.new(319.5 - (134 + 185), 1143 - (549 + 584), 685.58 - (314 + 371), 0 - 0);
				Discord['BackgroundColor3'] = Color3.fromRGB(993 - (478 + 490), 14 + 11, 1202 - (786 + 386));
				Discord['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
				Discord['TextColor3'] = Color3.new(3 - 2, 1380 - (1055 + 324), 1341 - (1093 + 247));
				Discord['Font'] = Enum['Font']['GothamBold'];
				Discord['TextSize'] = 13 + 1;
				Discord['TextTransparency'] = 1 + 0;
				Discord['Parent'] = MainFrame;
				styleButton(Discord, Color3.fromRGB(349 - 261, 342 - 241, 688 - 446));
				TweenService:Create(Question, TweenInfo.new(0.5 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 + 0)}):Play();
				TweenService:Create(SubText, TweenInfo.new(0.5 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 - 0)}):Play();
				TweenService:Create(Divider, TweenInfo.new(0.8 + 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=UDim2.new(0.3 - 0, 688 - (364 + 324), 0 - 0, 2 - 1)}):Play();
				TweenService:Create(Ok, TweenInfo.new(0.5 + 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 - 0)}):Play();
				TweenService:Create(Discord, TweenInfo.new(0.5 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 - 0)}):Play();
				Discord['MouseButton1Click']:Connect(function()
					local FlatIdent_100BB = 0;
					while true do
						if (FlatIdent_100BB == 0) then
							pcall(function()
								setclipboard(invite);
							end);
							Discord['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
							FlatIdent_100BB = 1;
						end
						if (FlatIdent_100BB == 1) then
							task.wait(1269 - (1249 + 19));
							Discord['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
							break;
						end
					end
				end);
				Ok['MouseButton1Click']:Connect(function()
					local FlatIdent_6D902 = 0;
					while true do
						if (FlatIdent_6D902 == 0) then
							TweenService:Create(MainFrame, TweenInfo.new(0.6 + 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(3 - 2)}):Play();
							TweenService:Create(Blur, TweenInfo.new(1086.6 - (686 + 400)), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 + 0)}):Play();
							TweenService:Create(Question, TweenInfo.new(229.4 - (73 + 156)), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1 + 0)}):Play();
							FlatIdent_6D902 = 1;
						end
						if (FlatIdent_6D902 == 2) then
							TweenService:Create(Discord, TweenInfo.new(0.4 + 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1 + 0),[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1 - 0)}):Play();
							task.wait(0.6 - 0);
							Blur:Destroy();
							FlatIdent_6D902 = 3;
						end
						if (3 == FlatIdent_6D902) then
							Gui:Destroy();
							InitCamlock();
							break;
						end
						if (FlatIdent_6D902 == 1) then
							TweenService:Create(SubText, TweenInfo.new(811.4 - (721 + 90)), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1 + 0)}):Play();
							TweenService:Create(Divider, TweenInfo.new(0.4 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(471 - (224 + 246))}):Play();
							TweenService:Create(Ok, TweenInfo.new(0.4 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1 - 0),[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1 + 0)}):Play();
							FlatIdent_6D902 = 2;
						end
					end
				end);
			end);
		else
			local sdawdwqdq = obf_arg[1];
		end
	end
	if (obf_tonumber(obf_stringmatch(obf_stringmatch(({obf_pcall(obf_wrapperfunc, nil)})[2], ":%d+:"), "%d+")) == 1) then
		return obf_wrapperfunc({});
	else
		return LoadMainScript();
	end
end
local FullBG = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
FullBG['Name'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
FullBG['Size'] = UDim2.new(514 - (203 + 310), 1993 - (1238 + 755), 1 + 0, 1534 - (709 + 825));
FullBG['BackgroundColor3'] = Color3.fromRGB(8 - 3, 6 - 1, 869 - (196 + 668));
FullBG['BackgroundTransparency'] = 3 - 2;
FullBG['BorderSizePixel'] = 0 - 0;
FullBG['Parent'] = ScreenGui;
local function CreateNotify(msg, duration)
	local function obf_wrapperfunc(obf_arg)
		if obf_arg then
			local FlatIdent_4A385 = 0;
			local PopupFrame;
			local PopupCorner;
			local PopupStroke;
			local PopupLabel;
			local tweenIn;
			while true do
				if (3 == FlatIdent_4A385) then
					PopupStroke['Color'] = Color3.fromRGB(97 - 57, 473 - (114 + 319), 71 - 21);
					PopupStroke['Parent'] = PopupFrame;
					PopupLabel = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
					PopupLabel['Size'] = UDim2.new(1 - 0, -(13 + 7), 1 - 0, 0 - 0);
					FlatIdent_4A385 = 4;
				end
				if (FlatIdent_4A385 == 5) then
					PopupLabel['Font'] = Enum['Font']['GothamMedium'];
					PopupLabel['TextSize'] = 8 + 5;
					PopupLabel['TextWrapped'] = true;
					PopupLabel['Parent'] = PopupFrame;
					FlatIdent_4A385 = 6;
				end
				if (FlatIdent_4A385 == 6) then
					tweenIn = TweenService:Create(PopupFrame, TweenInfo.new(1230.5 - (957 + 273), Enum['EasingStyle'].Quart, Enum['EasingDirection'].Out), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=UDim2.new(0.5 + 0, -(61 + 89), 0.9 - 0, -(52 - 32))});
					tweenIn:Play();
					task.spawn(function()
						local FlatIdent_33E2D = 0;
						local tweenOut;
						while true do
							if (FlatIdent_33E2D == 0) then
								task.wait(duration);
								tweenOut = TweenService:Create(PopupFrame, TweenInfo.new(0.5 - 0, Enum['EasingStyle'].Quart, Enum['EasingDirection'].In), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=UDim2.new(0.5 - 0, -(1930 - (389 + 1391)), 1 + 0, 6 + 44)});
								FlatIdent_33E2D = 1;
							end
							if (FlatIdent_33E2D == 1) then
								tweenOut:Play();
								tweenOut['Completed']:Wait();
								FlatIdent_33E2D = 2;
							end
							if (2 == FlatIdent_33E2D) then
								PopupFrame:Destroy();
								break;
							end
						end
					end);
					return PopupFrame, PopupLabel;
				end
				if (FlatIdent_4A385 == 1) then
					PopupFrame['BackgroundColor3'] = Color3.fromRGB(20 + 0, 1534 - (822 + 692), 35 - 10);
					PopupFrame['BorderSizePixel'] = 0 + 0;
					PopupFrame['Parent'] = ScreenGui;
					PopupCorner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
					FlatIdent_4A385 = 2;
				end
				if (FlatIdent_4A385 == 2) then
					PopupCorner['CornerRadius'] = UDim.new(297 - (45 + 252), 8 + 0);
					PopupCorner['Parent'] = PopupFrame;
					PopupStroke = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
					PopupStroke['Thickness'] = 1 + 1;
					FlatIdent_4A385 = 3;
				end
				if (FlatIdent_4A385 == 4) then
					PopupLabel['Position'] = UDim2.new(1963 - (556 + 1407), 1216 - (741 + 465), 465 - (170 + 295), 0 + 0);
					PopupLabel['BackgroundTransparency'] = 1 + 0;
					PopupLabel['Text'] = msg;
					PopupLabel['TextColor3'] = Color3.fromRGB(627 - 372, 212 + 43, 164 + 91);
					FlatIdent_4A385 = 5;
				end
				if (FlatIdent_4A385 == 0) then
					duration = duration or (835.5 - (171 + 662));
					PopupFrame = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
					PopupFrame['Size'] = UDim2.new(93 - (4 + 89), 1051 - 751, 0 + 0, 197 - 152);
					PopupFrame['Position'] = UDim2.new(0.5 + 0, -(1636 - (35 + 1451)), 1454 - (28 + 1425), 2013 - (941 + 1052));
					FlatIdent_4A385 = 1;
				end
			end
		else
			local sdawdwqdq = obf_arg[1];
		end
	end
	if (obf_tonumber(obf_stringmatch(obf_stringmatch(({obf_pcall(obf_wrapperfunc, nil)})[2], ":%d+:"), "%d+")) == 1) then
		return obf_wrapperfunc({});
	else
		return CreateNotify();
	end
end
local function SpawnConfetti()
	local function obf_wrapperfunc(obf_arg)
		if obf_arg then
			local Colors = {Color3.fromRGB(1206 - (783 + 168), 0 - 0, 0 + 0),Color3.fromRGB(0 - 0, 1467 - (1090 + 122), 0 + 0),Color3.fromRGB(0 + 0, 1118 - (628 + 490), 46 + 209),Color3.fromRGB(1165 - 910, 1029 - (431 + 343), 0 - 0),Color3.fromRGB(202 + 53, 0 + 0, 1950 - (556 + 1139))};
			for i = 16 - (6 + 9), 10 + 40 do
				task.spawn(function()
					local FlatIdent_17397 = 0;
					local p;
					local corner;
					local tx;
					local ty;
					local tr;
					local t;
					while true do
						if (FlatIdent_17397 == 3) then
							tx = _G['math'].random(-(887 - (371 + 16)), 2250 - (1326 + 424));
							ty = _G['math'].random(-(946 - 446), 1827 - 1327);
							tr = _G['math'].random(118 - (88 + 30), 1131 - (720 + 51));
							FlatIdent_17397 = 4;
						end
						if (4 == FlatIdent_17397) then
							t = TweenService:Create(p, TweenInfo.new(2.5 - 1, Enum['EasingStyle'].Quart, Enum['EasingDirection'].Out), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=UDim2.new(1776.5 - (421 + 1355), tx, 0.5 - 0, ty),[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=tr,[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1 + 0)});
							t:Play();
							t['Completed']:Wait();
							FlatIdent_17397 = 5;
						end
						if (FlatIdent_17397 == 2) then
							corner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
							corner['CornerRadius'] = UDim.new(290 - (23 + 267), 1946 - (1129 + 815));
							corner['Parent'] = p;
							FlatIdent_17397 = 3;
						end
						if (1 == FlatIdent_17397) then
							p['BackgroundColor3'] = Colors[_G['math'].random(1 + 0, #Colors)];
							p['BorderSizePixel'] = 0 - 0;
							p['Parent'] = ScreenGui;
							FlatIdent_17397 = 2;
						end
						if (0 == FlatIdent_17397) then
							p = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
							p['Size'] = UDim2.new(0 + 0, _G['math'].random(174 - (28 + 141), 4 + 6), 0 - 0, _G['math'].random(4 + 1, 1327 - (486 + 831)));
							p['Position'] = UDim2.new(0.5 - 0, _G['math'].random(-(176 - 126), 10 + 40), 0.5 - 0, _G['math'].random(-(1313 - (668 + 595)), 45 + 5));
							FlatIdent_17397 = 1;
						end
						if (5 == FlatIdent_17397) then
							p:Destroy();
							break;
						end
					end
				end);
			end
		else
			local sdawdwqdq = obf_arg[1];
		end
	end
	if (obf_tonumber(obf_stringmatch(obf_stringmatch(({obf_pcall(obf_wrapperfunc, nil)})[2], ":%d+:"), "%d+")) == 1) then
		return obf_wrapperfunc({});
	else
		return SpawnConfetti();
	end
end
local ChangelogFrame = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
ChangelogFrame['Name'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
ChangelogFrame['Size'] = UDim2.new(1083 - (286 + 797), 767 - 557, 0 - 0, 749 - (397 + 42));
ChangelogFrame['Position'] = UDim2.new(0.5 + 0, -(1185 - (24 + 776)), 0.5 - 0, -(940 - (222 + 563)));
ChangelogFrame['BackgroundColor3'] = Color3.fromRGB(33 - 18, 11 + 4, 210 - (23 + 167));
ChangelogFrame['BorderSizePixel'] = 1798 - (690 + 1108);
ChangelogFrame['BackgroundTransparency'] = 1 + 0;
ChangelogFrame['ScrollBarThickness'] = 0 + 0;
ChangelogFrame['CanvasSize'] = UDim2.new(848 - (40 + 808), 0 + 0, 0 - 0, 364 + 16);
ChangelogFrame['Visible'] = false;
ChangelogFrame['Parent'] = ScreenGui;
local UIListLayout = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
UIListLayout['Parent'] = ChangelogFrame;
UIListLayout['SortOrder'] = Enum['SortOrder']['LayoutOrder'];
UIListLayout['Padding'] = UDim.new(0 + 0, 2 + 0);
local UIPadding = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
UIPadding['Parent'] = ChangelogFrame;
UIPadding['PaddingLeft'] = UDim.new(571 - (47 + 524), 7 + 3);
UIPadding['PaddingRight'] = UDim.new(0 - 0, 14 - 4);
UIPadding['PaddingTop'] = UDim.new(0 - 0, 1736 - (1165 + 561));
local CL_Corner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
CL_Corner['CornerRadius'] = UDim.new(0 + 0, 37 - 25);
CL_Corner['Parent'] = ChangelogFrame;
local CL_Stroke = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
CL_Stroke['Thickness'] = 1 + 1;
CL_Stroke['Color'] = Color3.fromRGB(519 - (341 + 138), 11 + 29, 103 - 53);
CL_Stroke['Transparency'] = 327 - (89 + 237);
CL_Stroke['Parent'] = ChangelogFrame;
local CL_Title = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
CL_Title['Size'] = UDim2.new(3 - 2, 0 - 0, 881 - (581 + 300), 1245 - (855 + 365));
CL_Title['BackgroundTransparency'] = 2 - 1;
CL_Title['Text'] = "•Why We Added Key System?";
CL_Title['TextColor3'] = Color3.fromRGB(84 + 171, 1490 - (1030 + 205), 240 + 15);
CL_Title['TextSize'] = 14 + 0;
CL_Title['Font'] = Enum['Font']['GothamBold'];
CL_Title['TextXAlignment'] = Enum['TextXAlignment']['Left'];
CL_Title['TextTransparency'] = 287 - (156 + 130);
CL_Title['Parent'] = ChangelogFrame;
local DescLabel = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
DescLabel['Size'] = UDim2.new(2 - 1, 0 - 0, 0 - 0, 36 + 99);
DescLabel['BackgroundTransparency'] = 1 + 0;
DescLabel['Text'] = "• We Added Key System To Support Our Current Developers. I know some of you All may be mad because of Key System But It's One Way to Support The Current Developers And Besides, The Checkpoint Is Only 1 Step. The Key is Also Permanent It's just different Keys for Different Scripts. Also If You want more Better Scripts Just Donate To Our Server Or Boost The server:";
DescLabel['TextColor3'] = Color3.fromRGB(249 - (10 + 59), 51 + 129, 935 - 745);
DescLabel['TextSize'] = 1174 - (671 + 492);
DescLabel['Font'] = Enum['Font']['Gotham'];
DescLabel['TextWrapped'] = true;
DescLabel['TextXAlignment'] = Enum['TextXAlignment']['Left'];
DescLabel['TextYAlignment'] = Enum['TextYAlignment']['Top'];
DescLabel['TextTransparency'] = 1 + 0;
DescLabel['Parent'] = ChangelogFrame;
local FuncTitle = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
FuncTitle['Size'] = UDim2.new(1216 - (369 + 846), 0 + 0, 0 + 0, 1970 - (1036 + 909));
FuncTitle['BackgroundTransparency'] = 1 + 0;
FuncTitle['Text'] = "•Key System Explanation";
FuncTitle['TextColor3'] = Color3.fromRGB(428 - 173, 458 - (11 + 192), 129 + 126);
FuncTitle['TextSize'] = 189 - (135 + 40);
FuncTitle['Font'] = Enum['Font']['GothamBold'];
FuncTitle['TextXAlignment'] = Enum['TextXAlignment']['Left'];
FuncTitle['TextTransparency'] = 2 - 1;
FuncTitle['Parent'] = ChangelogFrame;
local FuncDesc = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
FuncDesc['Size'] = UDim2.new(1 + 0, 0 - 0, 0 - 0, 261 - (50 + 126));
FuncDesc['BackgroundTransparency'] = 2 - 1;
FuncDesc['Text'] = "• Key Saves For Only 6 Hours But If Someone Donates, We Will Change It To 24 hours. Key System Will Be Skipped When Key Saves. Since Donating Supports our HardWorking Team.";
FuncDesc['TextColor3'] = Color3.fromRGB(40 + 140, 1593 - (1233 + 180), 1159 - (522 + 447));
FuncDesc['TextSize'] = 1432 - (107 + 1314);
FuncDesc['Font'] = Enum['Font']['Gotham'];
FuncDesc['TextWrapped'] = true;
FuncDesc['TextXAlignment'] = Enum['TextXAlignment']['Left'];
FuncDesc['TextYAlignment'] = Enum['TextYAlignment']['Top'];
FuncDesc['TextTransparency'] = 1 + 0;
FuncDesc['Parent'] = ChangelogFrame;
local SaveToggleFrame = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
SaveToggleFrame['Size'] = UDim2.new(2 - 1, 0 + 0, 0 - 0, 118 - 88);
SaveToggleFrame['BackgroundTransparency'] = 1911 - (716 + 1194);
SaveToggleFrame['Parent'] = ChangelogFrame;
local SaveToggleBtn = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
SaveToggleBtn['Size'] = UDim2.new(0 + 0, 2 + 16, 503 - (74 + 429), 34 - 16);
SaveToggleBtn['Position'] = UDim2.new(0 + 0, 0 - 0, 0.5 + 0, -(27 - 18));
SaveToggleBtn['BackgroundColor3'] = Color3.fromRGB(74 - 44, 463 - (279 + 154), 813 - (454 + 324));
SaveToggleBtn['BorderSizePixel'] = 0 + 0;
SaveToggleBtn['Text'] = "✓";
SaveToggleBtn['TextColor3'] = Color3.fromRGB(17 - (12 + 5), 0 + 0, 0 - 0);
SaveToggleBtn['TextSize'] = 6 + 8;
SaveToggleBtn['Font'] = Enum['Font']['GothamBold'];
SaveToggleBtn['BackgroundTransparency'] = 1094 - (277 + 816);
SaveToggleBtn['TextTransparency'] = 4 - 3;
SaveToggleBtn['Parent'] = SaveToggleFrame;
local SaveToggleCorner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
SaveToggleCorner['CornerRadius'] = UDim.new(1183 - (1058 + 125), 1 + 3);
SaveToggleCorner['Parent'] = SaveToggleBtn;
local SaveToggleStroke = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
SaveToggleStroke['Thickness'] = 976 - (815 + 160);
SaveToggleStroke['Color'] = Color3.fromRGB(257 - 197, 142 - 82, 17 + 53);
SaveToggleStroke['Transparency'] = 2 - 1;
SaveToggleStroke['Parent'] = SaveToggleBtn;
local SaveToggleLabel = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
SaveToggleLabel['Size'] = UDim2.new(1899 - (41 + 1857), -(1918 - (1222 + 671)), 2 - 1, 0 - 0);
SaveToggleLabel['Position'] = UDim2.new(1182 - (229 + 953), 1799 - (1111 + 663), 1579 - (874 + 705), 0 + 0);
SaveToggleLabel['BackgroundTransparency'] = 1 + 0;
SaveToggleLabel['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
SaveToggleLabel['TextColor3'] = Color3.fromRGB(415 - 215, 6 + 194, 889 - (642 + 37));
SaveToggleLabel['TextSize'] = 3 + 8;
SaveToggleLabel['Font'] = Enum['Font']['GothamMedium'];
SaveToggleLabel['TextXAlignment'] = Enum['TextXAlignment']['Left'];
SaveToggleLabel['TextTransparency'] = 1 + 0;
SaveToggleLabel['Parent'] = SaveToggleFrame;
local DiscordBtn = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
DiscordBtn['Size'] = UDim2.new(2 - 1, 454 - (233 + 221), 0 - 0, 27 + 3);
DiscordBtn['BackgroundTransparency'] = 1542 - (718 + 823);
DiscordBtn['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
DiscordBtn['TextColor3'] = Color3.fromRGB(63 + 37, 955 - (266 + 539), 721 - 466);
DiscordBtn['TextSize'] = 1237 - (636 + 589);
DiscordBtn['Font'] = Enum['Font']['GothamBold'];
DiscordBtn['TextXAlignment'] = Enum['TextXAlignment']['Left'];
DiscordBtn['TextTransparency'] = 2 - 1;
DiscordBtn['Parent'] = ChangelogFrame;
local MainFrame = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
MainFrame['Name'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
MainFrame['Size'] = UDim2.new(0 - 0, 254 + 66, 0 + 0, 1435 - (657 + 358));
MainFrame['Position'] = UDim2.new(0.5 - 0, -(364 - 204), 1188.2 - (1151 + 36), 0 + 0);
MainFrame['BackgroundColor3'] = Color3.fromRGB(4 + 11, 44 - 29, 1852 - (1552 + 280));
MainFrame['BorderSizePixel'] = 834 - (64 + 770);
MainFrame['ClipsDescendants'] = true;
MainFrame['Parent'] = ScreenGui;
local MainCorner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
MainCorner['CornerRadius'] = UDim.new(0 + 0, 36 - 20);
MainCorner['Parent'] = MainFrame;
local MainStroke = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
MainStroke['Thickness'] = 1 + 1;
MainStroke['Color'] = Color3.fromRGB(1283 - (157 + 1086), 80 - 40, 218 - 168);
MainStroke['ApplyStrokeMode'] = Enum['ApplyStrokeMode']['Border'];
MainStroke['Parent'] = MainFrame;
local CloseBtn = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
CloseBtn['Name'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
CloseBtn['Size'] = UDim2.new(0 - 0, 40 - 10, 819 - (599 + 220), 59 - 29);
CloseBtn['Position'] = UDim2.new(1932 - (1813 + 118), -(33 + 12), 1217 - (841 + 376), 104 - 29);
CloseBtn['BackgroundColor3'] = Color3.fromRGB(5 + 15, 54 - 34, 884 - (464 + 395));
CloseBtn['Text'] = "×";
CloseBtn['TextColor3'] = Color3.fromRGB(513 - 313, 97 + 103, 1037 - (467 + 370));
CloseBtn['TextSize'] = 49 - 25;
CloseBtn['Font'] = Enum['Font']['GothamMedium'];
CloseBtn['BackgroundTransparency'] = 1 + 0;
CloseBtn['TextTransparency'] = 3 - 2;
CloseBtn['Parent'] = MainFrame;
local CloseCorner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
CloseCorner['CornerRadius'] = UDim.new(0 + 0, 18 - 10);
CloseCorner['Parent'] = CloseBtn;
local CloseStroke = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
CloseStroke['Thickness'] = 521 - (150 + 370);
CloseStroke['Color'] = Color3.fromRGB(1332 - (74 + 1208), 122 - 72, 284 - 224);
CloseStroke['Transparency'] = 1 + 0;
CloseStroke['Parent'] = CloseBtn;
local ToggleCL = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
ToggleCL['Size'] = UDim2.new(390 - (14 + 376), 52 - 22, 0 + 0, 44 + 6);
ToggleCL['Position'] = UDim2.new(0.5 + 0, -(586 - 386), 1.2 + 0, 258 - (23 + 55));
ToggleCL['BackgroundColor3'] = Color3.fromRGB(35 - 20, 11 + 4, 18 + 2);
ToggleCL['Text'] = "<";
ToggleCL['TextColor3'] = Color3.fromRGB(310 - 110, 63 + 137, 1101 - (652 + 249));
ToggleCL['TextSize'] = 42 - 26;
ToggleCL['Font'] = Enum['Font']['GothamBold'];
ToggleCL['BackgroundTransparency'] = 1869 - (708 + 1160);
ToggleCL['TextTransparency'] = 2 - 1;
ToggleCL['Parent'] = ScreenGui;
local ToggleCorner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
ToggleCorner['CornerRadius'] = UDim.new(0 - 0, 33 - (10 + 17));
ToggleCorner['Parent'] = ToggleCL;
local ToggleStroke = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
ToggleStroke['Thickness'] = 1 + 1;
ToggleStroke['Color'] = Color3.fromRGB(1772 - (1400 + 332), 76 - 36, 1958 - (242 + 1666));
ToggleStroke['Transparency'] = 1 + 0;
ToggleStroke['Parent'] = ToggleCL;
local Title = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
Title['Size'] = UDim2.new(1 + 0, 0 + 0, 940 - (850 + 90), 105 - 45);
Title['Position'] = UDim2.new(1390 - (360 + 1030), 0 + 0, 0 - 0, 82 - 22);
Title['BackgroundTransparency'] = 1662 - (909 + 752);
Title['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
Title['TextColor3'] = Color3.fromRGB(1478 - (109 + 1114), 466 - 211, 100 + 155);
Title['TextSize'] = 264 - (6 + 236);
Title['Font'] = Enum['Font']['GothamBold'];
Title['TextTransparency'] = 1 + 0;
Title['Parent'] = MainFrame;
local GreyUnderline = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
GreyUnderline['Size'] = UDim2.new(0 + 0, 613 - 353, 0 - 0, 1134 - (1076 + 57));
GreyUnderline['Position'] = UDim2.new(0.5 + 0, -(819 - (579 + 110)), 0 + 0, 102 + 13);
GreyUnderline['BackgroundColor3'] = Color3.fromRGB(32 + 28, 467 - (174 + 233), 195 - 125);
GreyUnderline['BackgroundTransparency'] = 1 - 0;
GreyUnderline['Parent'] = MainFrame;
local InputContainer = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
InputContainer['Size'] = UDim2.new(0 + 0, 1434 - (663 + 511), 0 + 0, 10 + 35);
InputContainer['Position'] = UDim2.new(0.5 - 0, -(79 + 51), 0 - 0, 363 - 213);
InputContainer['BackgroundColor3'] = Color3.fromRGB(12 + 13, 48 - 23, 22 + 8);
InputContainer['BackgroundTransparency'] = 1 + 0;
InputContainer['Parent'] = MainFrame;
local InputCorner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
InputCorner['CornerRadius'] = UDim.new(722 - (478 + 244), 525 - (440 + 77));
InputCorner['Parent'] = InputContainer;
local TextBox = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
TextBox['Size'] = UDim2.new(1 + 0, -(73 - 53), 1557 - (655 + 901), 0 + 0);
TextBox['Position'] = UDim2.new(0 + 0, 7 + 3, 0 - 0, 1445 - (695 + 750));
TextBox['BackgroundTransparency'] = 3 - 2;
TextBox['Text'] = "";
TextBox['PlaceholderText'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
TextBox['Font'] = Enum['Font']['Gotham'];
TextBox['TextSize'] = 21 - 7;
TextBox['TextColor3'] = Color3.fromRGB(1025 - 770, 606 - (285 + 66), 594 - 339);
TextBox['PlaceholderColor3'] = Color3.fromRGB(1410 - (682 + 628), 17 + 83, 409 - (176 + 123));
TextBox['TextTransparency'] = 1 + 0;
TextBox['Parent'] = InputContainer;
local VerifyBtn = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
VerifyBtn['Size'] = UDim2.new(0 + 0, 529 - (239 + 30), 0 + 0, 44 + 1);
VerifyBtn['Position'] = UDim2.new(0.5 - 0, -(405 - 275), 315 - (306 + 9), 732 - 522);
VerifyBtn['BackgroundColor3'] = Color3.fromRGB(45 + 210, 157 + 98, 123 + 132);
VerifyBtn['Font'] = Enum['Font']['GothamBold'];
VerifyBtn['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
VerifyBtn['TextColor3'] = Color3.fromRGB(0 - 0, 1375 - (1140 + 235), 0 + 0);
VerifyBtn['TextSize'] = 13 + 1;
VerifyBtn['BackgroundTransparency'] = 1 + 0;
VerifyBtn['TextTransparency'] = 53 - (33 + 19);
VerifyBtn['Parent'] = MainFrame;
local BtnCorner = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
BtnCorner['CornerRadius'] = UDim.new(0 + 0, 23 - 15);
BtnCorner['Parent'] = VerifyBtn;
local GetKeyBtn = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
GetKeyBtn['Size'] = UDim2.new(0 + 0, 509 - 249, 0 + 0, 719 - (586 + 103));
GetKeyBtn['Position'] = UDim2.new(0.5 + 0, -(400 - 270), 1488 - (1309 + 179), 478 - 213);
GetKeyBtn['BackgroundTransparency'] = 1 + 0;
GetKeyBtn['Font'] = Enum['Font']['Gotham'];
GetKeyBtn['Text'] = "Don't have a key? Click here";
GetKeyBtn['TextColor3'] = Color3.fromRGB(402 - 252, 114 + 36, 339 - 179);
GetKeyBtn['TextSize'] = 23 - 11;
GetKeyBtn['TextTransparency'] = 610 - (295 + 314);
GetKeyBtn['Parent'] = MainFrame;
local MainSuggestion = Instance.new(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
MainSuggestion['Size'] = UDim2.new(0 - 0, 2222 - (1300 + 662), 0 - 0, 1835 - (1178 + 577));
MainSuggestion['Position'] = UDim2.new(0.5 + 0, -(384 - 254), 1405 - (851 + 554), 275 + 35);
MainSuggestion['BackgroundTransparency'] = 2 - 1;
MainSuggestion['Text'] = "• Suggest More Scripts In Discord To Help Our Team Brainstorm Ideas And To Help You guys With what you want!";
MainSuggestion['TextColor3'] = Color3.fromRGB(325 - 175, 452 - (115 + 187), 123 + 37);
MainSuggestion['TextSize'] = 13 + 0;
MainSuggestion['Font'] = Enum['Font']['Gotham'];
MainSuggestion['TextWrapped'] = true;
MainSuggestion['TextXAlignment'] = Enum['TextXAlignment']['Center'];
MainSuggestion['TextTransparency'] = 3 - 2;
MainSuggestion['Parent'] = MainFrame;
local function CloseUI()
	local function obf_wrapperfunc(obf_arg)
		if obf_arg then
			local FlatIdent_31826 = 0;
			local exitInfo;
			while true do
				if (FlatIdent_31826 == 2) then
					TweenService:Create(FullBG, exitInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1 + 0)}):Play();
					task.wait(0.8 - 0);
					FlatIdent_31826 = 3;
				end
				if (FlatIdent_31826 == 1) then
					TweenService:Create(ToggleCL, exitInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=UDim2.new(897.5 - (525 + 372), -(379 - 179), 3.2 - 2, 322 - (96 + 46))}):Play();
					TweenService:Create(ChangelogFrame, exitInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(778 - (643 + 134))}):Play();
					FlatIdent_31826 = 2;
				end
				if (FlatIdent_31826 == 3) then
					ScreenGui:Destroy();
					break;
				end
				if (FlatIdent_31826 == 0) then
					exitInfo = TweenInfo.new(1161.8 - (160 + 1001), Enum['EasingStyle'].Quart, Enum['EasingDirection'].In);
					TweenService:Create(MainFrame, exitInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=UDim2.new(0.5 + 0, -(111 + 49), 1.2 - 0, 358 - (237 + 121))}):Play();
					FlatIdent_31826 = 1;
				end
			end
		else
			local sdawdwqdq = obf_arg[1];
		end
	end
	if (obf_tonumber(obf_stringmatch(obf_stringmatch(({obf_pcall(obf_wrapperfunc, nil)})[2], ":%d+:"), "%d+")) == 1) then
		return obf_wrapperfunc({});
	else
		return CloseUI();
	end
end
local function SaveKeyData()
	local function obf_wrapperfunc(obf_arg)
		if obf_arg then
			if writefile then
				local FlatIdent_4ADD9 = 0;
				local data;
				while true do
					if (FlatIdent_4ADD9 == 0) then
						data = {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(obf_AND(os.time(), SAVE_DURATION) + obf_OR(os.time(), SAVE_DURATION)),[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=Player['UserId']};
						writefile(SAVE_FILE_NAME, _G['game']:GetService(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])):JSONEncode(data));
						break;
					end
				end
			end
		else
			local sdawdwqdq = obf_arg[1];
		end
	end
	if (obf_tonumber(obf_stringmatch(obf_stringmatch(({obf_pcall(obf_wrapperfunc, nil)})[2], ":%d+:"), "%d+")) == 1) then
		return obf_wrapperfunc({});
	else
		return SaveKeyData();
	end
end
local function FormatTimeLeft(seconds)
	local function obf_wrapperfunc(obf_arg)
		if obf_arg then
			local FlatIdent_792E7 = 0;
			local hours;
			local mins;
			local secs;
			while true do
				if (FlatIdent_792E7 == 0) then
					hours = _G['math'].floor(seconds / (13365 - 9765));
					mins = _G['math'].floor((seconds % (3453 + 147)) / (117 - 57));
					FlatIdent_792E7 = 1;
				end
				if (FlatIdent_792E7 == 1) then
					secs = _G['math'].floor(seconds % (122 - 62));
					return string.format(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']), hours, mins, secs);
				end
			end
		else
			local sdawdwqdq = obf_arg[1];
		end
	end
	if (obf_tonumber(obf_stringmatch(obf_stringmatch(({obf_pcall(obf_wrapperfunc, nil)})[2], ":%d+:"), "%d+")) == 1) then
		return obf_wrapperfunc({});
	else
		return FormatTimeLeft();
	end
end
local function CheckSavedKey()
	local function obf_wrapperfunc(obf_arg)
		if obf_arg then
			local FlatIdent_C761 = 0;
			while true do
				if (FlatIdent_C761 == 0) then
					if (isfile and readfile and isfile(SAVE_FILE_NAME)) then
						local FlatIdent_6BDCA = 0;
						local success;
						local data;
						while true do
							if (FlatIdent_6BDCA == 0) then
								success, data = _G['pcall'](function()
									return _G['game']:GetService(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])):JSONDecode(readfile(SAVE_FILE_NAME));
								end);
								if (success and data and (data['UserId'] == Player['UserId'])) then
									if (os.time() < data['Expiration']) then
										return data['Expiration'] - os.time();
									elseif delfile then
										delfile(SAVE_FILE_NAME);
									end
								end
								break;
							end
						end
					end
					return nil;
				end
			end
		else
			local sdawdwqdq = obf_arg[1];
		end
	end
	if (obf_tonumber(obf_stringmatch(obf_stringmatch(({obf_pcall(obf_wrapperfunc, nil)})[2], ":%d+:"), "%d+")) == 1) then
		return obf_wrapperfunc({});
	else
		return CheckSavedKey();
	end
end
SaveToggleBtn['MouseButton1Click']:Connect(function()
	local FlatIdent_3B073 = 0;
	local targetBG;
	local targetText;
	while true do
		if (FlatIdent_3B073 == 0) then
			saveKeyEnabled = not saveKeyEnabled;
			targetBG = (saveKeyEnabled and Color3.fromRGB(974 - (316 + 403), 170 + 85, 701 - 446)) or Color3.fromRGB(11 + 19, 75 - 45, 25 + 10);
			FlatIdent_3B073 = 1;
		end
		if (FlatIdent_3B073 == 1) then
			targetText = (saveKeyEnabled and (0 + 0)) or (3 - 2);
			TweenService:Create(SaveToggleBtn, TweenInfo.new(0.2 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=targetBG}):Play();
			FlatIdent_3B073 = 2;
		end
		if (2 == FlatIdent_3B073) then
			TweenService:Create(SaveToggleBtn, TweenInfo.new(0.2 - 0), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=targetText}):Play();
			break;
		end
	end
end);
DiscordBtn['MouseButton1Click']:Connect(function()
	if setclipboard then
		local FlatIdent_6480C = 0;
		while true do
			if (0 == FlatIdent_6480C) then
				setclipboard(DISCORD_LINK);
				CreateNotify(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				break;
			end
		end
	end
end);
CloseBtn['MouseButton1Click']:Connect(CloseUI);
local isProcessing = false;
VerifyBtn['MouseButton1Click']:Connect(function()
	local FlatIdent_5E464 = 0;
	local input;
	while true do
		if (FlatIdent_5E464 == 0) then
			if isProcessing then
				return;
			end
			input = TextBox['Text']:gsub(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']), "");
			FlatIdent_5E464 = 1;
		end
		if (FlatIdent_5E464 == 1) then
			if (input == "") then
				CreateNotify(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			elseif (input == CORRECT_KEY) then
				local FlatIdent_77F0F = 0;
				while true do
					if (FlatIdent_77F0F == 0) then
						isProcessing = true;
						if saveKeyEnabled then
							SaveKeyData();
						end
						FlatIdent_77F0F = 1;
					end
					if (FlatIdent_77F0F == 1) then
						VerifyBtn['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
						VerifyBtn['BackgroundColor3'] = Color3.fromRGB(6 + 94, 502 - 247, 5 + 95);
						FlatIdent_77F0F = 2;
					end
					if (FlatIdent_77F0F == 2) then
						SpawnConfetti();
						task.wait(2.5 - 1);
						FlatIdent_77F0F = 3;
					end
					if (FlatIdent_77F0F == 3) then
						CloseUI();
						LoadMainScript();
						break;
					end
				end
			else
				CreateNotify(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
			end
			break;
		end
	end
end);
local clOpen = false;
ToggleCL['MouseButton1Click']:Connect(function()
	local FlatIdent_4E320 = 0;
	local targetTrans;
	local animObjects;
	while true do
		if (FlatIdent_4E320 == 1) then
			ToggleCL['Text'] = (clOpen and ">") or "<";
			if clOpen then
				ChangelogFrame['Visible'] = true;
			end
			FlatIdent_4E320 = 2;
		end
		if (FlatIdent_4E320 == 3) then
			if clOpen then
				local FlatIdent_1C62C = 0;
				local checkTrans;
				while true do
					if (FlatIdent_1C62C == 0) then
						checkTrans = (saveKeyEnabled and (0 + 0)) or (854 - (152 + 701));
						TweenService:Create(SaveToggleBtn, TweenInfo.new(1311.4 - (430 + 881)), {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=checkTrans}):Play();
						break;
					end
				end
			end
			if not clOpen then
				task.delay(0.4 + 0, function()
					if not clOpen then
						ChangelogFrame['Visible'] = false;
					end
				end);
			end
			break;
		end
		if (FlatIdent_4E320 == 0) then
			clOpen = not clOpen;
			targetTrans = (clOpen and (17 - (12 + 5))) or (3 - 2);
			FlatIdent_4E320 = 1;
		end
		if (FlatIdent_4E320 == 2) then
			animObjects = {{ChangelogFrame,_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])},{CL_Stroke,_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])},{CL_Title,_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])},{DescLabel,_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])},{FuncTitle,_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])},{FuncDesc,_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])},{SaveToggleBtn,_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])},{SaveToggleLabel,_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])},{SaveToggleStroke,_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])},{DiscordBtn,_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])}};
			for _, obj in pairs(animObjects) do
				local FlatIdent_4A836 = 0;
				local finalVal;
				while true do
					if (FlatIdent_4A836 == 1) then
						TweenService:Create(obj[1 + 0], TweenInfo.new(0.4 - 0), {[obj[1 + 1]]=finalVal}):Play();
						break;
					end
					if (FlatIdent_4A836 == 0) then
						finalVal = targetTrans;
						if (obj[1 - 0] ~= SaveToggleBtn) then
						elseif clOpen then
							finalVal = (saveKeyEnabled and (773 - (48 + 725))) or (0.5 - 0);
						else
							finalVal = 2 - 1;
						end
						FlatIdent_4A836 = 1;
					end
				end
			end
			FlatIdent_4E320 = 3;
		end
	end
end);
local function StartSequence()
	local function obf_wrapperfunc(obf_arg)
		if obf_arg then
			local FlatIdent_69CF9 = 0;
			local timeLeft;
			local slideInfo;
			local fadeInfo;
			while true do
				if (FlatIdent_69CF9 == 7) then
					TweenService:Create(MainSuggestion, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 - 0)}):Play();
					break;
				end
				if (FlatIdent_69CF9 == 0) then
					timeLeft = CheckSavedKey();
					if timeLeft then
						local FlatIdent_8F6B2 = 0;
						local pop;
						local label;
						while true do
							if (FlatIdent_8F6B2 == 2) then
								pop, label = CreateNotify(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']) .. FormatTimeLeft(timeLeft) .. _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']), 901 - (557 + 338));
								task.spawn(function()
									local FlatIdent_1BEAA = 0;
									local start;
									local endTime;
									while true do
										if (FlatIdent_1BEAA == 0) then
											start = os.time();
											endTime = obf_AND(start, timeLeft) + obf_OR(start, timeLeft);
											FlatIdent_1BEAA = 1;
										end
										if (FlatIdent_1BEAA == 1) then
											while (os.time() < endTime) and ScreenGui['Parent'] do
												local FlatIdent_E727 = 0;
												while true do
													if (FlatIdent_E727 == 0) then
														label['Text'] = _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']) .. FormatTimeLeft(endTime - os.time()) .. _G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']);
														task.wait(1 + 0);
														break;
													end
												end
											end
											break;
										end
									end
								end);
								FlatIdent_8F6B2 = 3;
							end
							if (FlatIdent_8F6B2 == 0) then
								MainFrame['Visible'] = false;
								ToggleCL['Visible'] = false;
								FlatIdent_8F6B2 = 1;
							end
							if (FlatIdent_8F6B2 == 4) then
								return;
							end
							if (FlatIdent_8F6B2 == 3) then
								task.delay(16.5 - 10, function()
									ScreenGui:Destroy();
								end);
								LoadMainScript();
								FlatIdent_8F6B2 = 4;
							end
							if (FlatIdent_8F6B2 == 1) then
								FullBG['Visible'] = false;
								ChangelogFrame['Visible'] = false;
								FlatIdent_8F6B2 = 2;
							end
						end
					end
					slideInfo = TweenInfo.new(3.2 - 2, Enum['EasingStyle'].Quart, Enum['EasingDirection'].Out);
					FlatIdent_69CF9 = 1;
				end
				if (FlatIdent_69CF9 == 3) then
					TweenService:Create(GreyUnderline, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(104 - (103 + 1))}):Play();
					TweenService:Create(CloseBtn, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(554 - (475 + 79)),[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 - 0)}):Play();
					TweenService:Create(CloseStroke, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 - 0)}):Play();
					FlatIdent_69CF9 = 4;
				end
				if (FlatIdent_69CF9 == 4) then
					TweenService:Create(ToggleCL, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 + 0),[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 + 0)}):Play();
					TweenService:Create(ToggleStroke, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1503 - (1395 + 108))}):Play();
					task.wait(0.2 - 0);
					FlatIdent_69CF9 = 5;
				end
				if (FlatIdent_69CF9 == 1) then
					fadeInfo = TweenInfo.new(0.8 - 0, Enum['EasingStyle'].Quad, Enum['EasingDirection'].InOut);
					TweenService:Create(FullBG, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0.3 - 0)}):Play();
					TweenService:Create(MainFrame, slideInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=UDim2.new(801.5 - (499 + 302), -(1026 - (39 + 827)), 0.5 - 0, -(469 - 259))}):Play();
					FlatIdent_69CF9 = 2;
				end
				if (FlatIdent_69CF9 == 2) then
					TweenService:Create(ToggleCL, slideInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=UDim2.new(0.5 - 0, -(307 - 107), 0.5 + 0, -(73 - 48))}):Play();
					task.wait(0.6 + 0);
					TweenService:Create(Title, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 - 0)}):Play();
					FlatIdent_69CF9 = 3;
				end
				if (FlatIdent_69CF9 == 5) then
					TweenService:Create(InputContainer, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(1204 - (7 + 1197))}):Play();
					TweenService:Create(TextBox, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 + 0)}):Play();
					task.wait(0.2 + 0);
					FlatIdent_69CF9 = 6;
				end
				if (FlatIdent_69CF9 == 6) then
					TweenService:Create(VerifyBtn, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(319 - (27 + 292)),[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 - 0)}):Play();
					TweenService:Create(GetKeyBtn, fadeInfo, {[_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0'])]=(0 - 0)}):Play();
					task.wait(0.1 - 0);
					FlatIdent_69CF9 = 7;
				end
			end
		else
			local sdawdwqdq = obf_arg[1];
		end
	end
	if (obf_tonumber(obf_stringmatch(obf_stringmatch(({obf_pcall(obf_wrapperfunc, nil)})[2], ":%d+:"), "%d+")) == 1) then
		return obf_wrapperfunc({});
	else
		return StartSequence();
	end
end
GetKeyBtn['MouseButton1Click']:Connect(function()
	if setclipboard then
		local FlatIdent_6F9C1 = 0;
		while true do
			if (FlatIdent_6F9C1 == 0) then
				setclipboard(KEY_LINK);
				CreateNotify(_G['LUAOBFUSACTOR_DECRYPT_STR_0'](_G['LUAOBFUSACTOR_DECRYPT_STR_0'], _G['LUAOBFUSACTOR_DECRYPT_STR_0']));
				break;
			end
		end
	end
end);
StartSequence();
