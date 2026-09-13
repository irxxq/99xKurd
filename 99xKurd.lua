--// 🤖 99xFamilyy — UPDATE 1
--// ⚫⚪ 2026 AI / Robot UI
--// 📱 PC + iPad + Android
--// 📌 Place this ONE LocalScript in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TextChatService = game:GetService("TextChatService")

local LP = Players.LocalPlayer

--==================================================
-- ⚙️ CONFIG
--==================================================

local ACCESS_CODE = "99x"

local OWNER = "TheRealRoger160"

local ADMINS = {
	["TheRealRoger160"] = true,
	["XxkikoxX_99x"] = true,
}

local CHAR_NAMES = {
	"Zakaryaahmad01",
	"Renwen124",
	"Crazydalejr",
	"Hama_black23",

	-- 🆕 UPDATE 1
	"ywsf425",
	"85xBaHoZ16",
	"kurd_77771",
	"User_hech",
	"85x7ama_napoli",
	"0_0",
	"dabazy_zaman",
	"pek_jaf",
	"85xSina_hawlire",
}

--==================================================
-- 🌐 LANGUAGE
--==================================================

local Language = "English"
local LastLanguageChange = 0

local T = {
	English = {
		home = "🏠 Home",
		obby = "🏃 Obby",
		char = "👤 Char",
		people = "👥 People",
		rank = "👑 Rank",
		support = "🆘 Support",
		cheat = "⚡ Cheat",
		admin = "🛡️ Admin",
		game = "🎮 Game",

		welcome = "🤖 Welcome to 99xFamilyy",
		online = "🟢 System Online",
		teleport = "📍 Teleport",
		spectate = "👁️ Spectate",
		stopSpectate = "⛔ Stop Spectating",
		wave = "👋 Wave",
		refresh = "🔄 Refresh",
		invisible = "👻 Invisible",
		visible = "👀 Visible",

		walkSpeed = "🏃 WalkSpeed",
		jumpPower = "🦘 JumpPower",
		setSpeed = "⚡ Set Speed",
		setJump = "🦘 Set JumpPower",

		owner = "👑 Owner",
		adminRole = "🛡️ Admin",
		creator = "🔨 Creator",

		sendSupport = "📨 Send Support",
		search = "🔎 Search players...",

		chatSpam = "💬 Chat Spam",
		animationHub = "🎬 Animation Hub",
		on = "🟢 ON",
		off = "🔴 OFF",
		animationNote = "🎬 Add your own approved animations here.",
		spamNote = "💬 Sends messages only in your own experience.",
	},

	Sorani = {
		home = "🏠 سەرەکی",
		obby = "🏃 ئۆبی",
		char = "👤 کارەکتەر",
		people = "👥 یاریزانەکان",
		rank = "👑 پلە",
		support = "🆘 پشتگیری",
		cheat = "⚡ Cheat",
		admin = "🛡️ ئەدمین",
		game = "🎮 یاری",

		welcome = "🤖 بەخێربێیت بۆ 99xFamilyy",
		online = "🟢 سیستەم کار دەکات",
		teleport = "📍 تێلەپۆرت",
		spectate = "👁️ سەیرکردن",
		stopSpectate = "⛔ وەستاندنی سەیرکردن",
		wave = "👋 سڵاوکردن",
		refresh = "🔄 نوێکردنەوە",
		invisible = "👻 ونبوون",
		visible = "👀 دەرکەوتن",

		walkSpeed = "🏃 خێرایی",
		jumpPower = "🦘 هێزی هەڵبازین",
		setSpeed = "⚡ دانانی خێرایی",
		setJump = "🦘 دانانی هێزی هەڵبازین",

		owner = "👑 خاوەن",
		adminRole = "🛡️ ئەدمین",
		creator = "🔨 دروستکەر",

		sendSupport = "📨 ناردنی پشتگیری",
		search = "🔎 گەڕان بۆ یاریزان...",

		chatSpam = "💬 سپامی چات",
		animationHub = "🎬 Animation Hub",
		on = "🟢 کارا",
		off = "🔴 ناچالاک",
		animationNote = "🎬 ئەنامەیشنە ڕێپێدراوەکانی یاریی خۆت زیاد بکە.",
		spamNote = "💬 تەنها لە یاریی خۆت پەیام دەنێرێت.",
	}
}

local function tr(key)
	return T[Language][key] or key
end

--==================================================
-- 🎨 COLORS
--==================================================

local BLACK = Color3.fromRGB(8, 8, 10)
local BLACK2 = Color3.fromRGB(14, 14, 17)
local PANEL = Color3.fromRGB(20, 20, 24)
local PANEL2 = Color3.fromRGB(27, 27, 32)
local WHITE = Color3.fromRGB(245, 245, 248)
local GRAY = Color3.fromRGB(155, 155, 165)
local DARKGRAY = Color3.fromRGB(70, 70, 78)
local RED = Color3.fromRGB(220, 55, 65)

--==================================================
-- 🖥️ GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "99xFamilyy"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.DisplayOrder = 999
Gui.Parent = LP:WaitForChild("PlayerGui")

local UIScale = Instance.new("UIScale")
UIScale.Parent = Gui

local function updateScale()
	local cam = workspace.CurrentCamera
	if not cam then return end

	local width = cam.ViewportSize.X

	if width < 500 then
		UIScale.Scale = 0.72
	elseif width < 800 then
		UIScale.Scale = 0.84
	else
		UIScale.Scale = 1
	end
end

updateScale()

if workspace.CurrentCamera then
	workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateScale)
end

--==================================================
-- 🧱 HELPERS
--==================================================

local function Corner(obj, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius or 10)
	c.Parent = obj
	return c
end

local function Stroke(obj, color, thickness, transparency)
	local s = Instance.new("UIStroke")
	s.Color = color or WHITE
	s.Thickness = thickness or 1
	s.Transparency = transparency or 0
	s.Parent = obj
	return s
end

local function Padding(obj, amount)
	local p = Instance.new("UIPadding")
	p.PaddingTop = UDim.new(0, amount)
	p.PaddingBottom = UDim.new(0, amount)
	p.PaddingLeft = UDim.new(0, amount)
	p.PaddingRight = UDim.new(0, amount)
	p.Parent = obj
	return p
end

local function Label(parent, text, size, pos)
	local x = Instance.new("TextLabel")
	x.BackgroundTransparency = 1
	x.Text = text
	x.TextColor3 = WHITE
	x.Font = Enum.Font.GothamMedium
	x.TextSize = size or 14
	x.Position = pos or UDim2.new()
	x.Size = UDim2.new(1, 0, 0, 28)
	x.TextXAlignment = Enum.TextXAlignment.Left
	x.Parent = parent
	return x
end

local function Button(parent, text)
	local b = Instance.new("TextButton")
	b.BackgroundColor3 = PANEL2
	b.TextColor3 = WHITE
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 13
	b.AutoButtonColor = false
	b.Size = UDim2.new(1, 0, 0, 42)
	b.Parent = parent

	Corner(b, 9)
	Stroke(b, DARKGRAY, 1, 0.35)

	b.MouseEnter:Connect(function()
		TweenService:Create(
			b,
			TweenInfo.new(.12),
			{BackgroundColor3 = Color3.fromRGB(42,42,48)}
		):Play()
	end)

	b.MouseLeave:Connect(function()
		TweenService:Create(
			b,
			TweenInfo.new(.12),
			{BackgroundColor3 = PANEL2}
		):Play()
	end)

	return b
end

local function Input(parent, placeholder, default)
	local box = Instance.new("TextBox")
	box.BackgroundColor3 = BLACK2
	box.TextColor3 = WHITE
	box.PlaceholderColor3 = GRAY
	box.PlaceholderText = placeholder or ""
	box.Text = tostring(default or "")
	box.Font = Enum.Font.GothamMedium
	box.TextSize = 13
	box.ClearTextOnFocus = false
	box.Size = UDim2.new(1, 0, 0, 40)
	box.Parent = parent

	Corner(box, 9)
	Stroke(box, DARKGRAY, 1, 0.35)

	return box
end

local function Clear(parent)
	for _, child in ipairs(parent:GetChildren()) do
		if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
			child:Destroy()
		end
	end
end

--==================================================
-- 🔐 LOCK SCREEN
--==================================================

local Lock = Instance.new("Frame")
Lock.Size = UDim2.new(1,0,1,0)
Lock.BackgroundColor3 = BLACK
Lock.Parent = Gui

local LockCard = Instance.new("Frame")
LockCard.AnchorPoint = Vector2.new(.5,.5)
LockCard.Position = UDim2.new(.5,0,.5,0)
LockCard.Size = UDim2.new(0,380,0,310)
LockCard.BackgroundColor3 = PANEL
LockCard.Parent = Lock

Corner(LockCard, 18)
Stroke(LockCard, WHITE, 1, .82)

local Robot = Label(LockCard, "◉ 99x", 30)
Robot.Size = UDim2.new(1,-40,0,45)
Robot.Position = UDim2.new(0,20,0,25)
Robot.TextXAlignment = Enum.TextXAlignment.Center
Robot.Font = Enum.Font.GothamBlack

local LockTitle = Label(LockCard, "🤖 99xFamilyy", 20)
LockTitle.Position = UDim2.new(0,20,0,80)
LockTitle.TextXAlignment = Enum.TextXAlignment.Center

local CodeBox = Input(LockCard, "🔐 Enter access code", "")
CodeBox.Position = UDim2.new(0,25,0,130)
CodeBox.Size = UDim2.new(1,-50,0,45)

local Unlock = Button(LockCard, "🔓 Unlock 99x")
Unlock.Position = UDim2.new(0,25,0,190)
Unlock.Size = UDim2.new(1,-50,0,45)

local Error = Label(LockCard, "", 12)
Error.Position = UDim2.new(0,25,0,245)
Error.Size = UDim2.new(1,-50,0,30)
Error.TextColor3 = RED
Error.TextXAlignment = Enum.TextXAlignment.Center

--==================================================
-- 🪟 MAIN UI
--==================================================

local Main = Instance.new("Frame")
Main.AnchorPoint = Vector2.new(.5,.5)
Main.Position = UDim2.new(.5,0,.5,0)
Main.Size = UDim2.new(.90,0,.84,0)
Main.BackgroundColor3 = BLACK
Main.Visible = false
Main.Parent = Gui

Corner(Main, 18)
Stroke(Main, WHITE, 1, .82)

-- Top
local Top = Instance.new("Frame")
Top.Size = UDim2.new(1,0,0,62)
Top.BackgroundColor3 = PANEL
Top.Parent = Main
Corner(Top,18)

local Title = Label(Top, "◉ 99xFamilyy", 20)
Title.Position = UDim2.new(0,22,0,8)
Title.Size = UDim2.new(.55,0,0,28)
Title.Font = Enum.Font.GothamBlack

local Status = Label(Top, "● SYSTEM ONLINE", 11)
Status.Position = UDim2.new(0,23,0,35)
Status.TextColor3 = GRAY
Status.Size = UDim2.new(.55,0,0,20)

local LangButton = Button(Top, "🌐 EN")
LangButton.AnchorPoint = Vector2.new(1,0)
LangButton.Position = UDim2.new(1,-55,0,10)
LangButton.Size = UDim2.new(0,70,0,40)

local Close = Button(Top, "×")
Close.AnchorPoint = Vector2.new(1,0)
Close.Position = UDim2.new(1,-10,0,10)
Close.Size = UDim2.new(0,38,0,40)
Close.TextSize = 20

-- Sidebar
local Side = Instance.new("Frame")
Side.Position = UDim2.new(0,10,0,72)
Side.Size = UDim2.new(0,175,1,-82)
Side.BackgroundColor3 = PANEL
Side.Parent = Main

Corner(Side,14)
Padding(Side,10)

local SideLayout = Instance.new("UIListLayout")
SideLayout.Padding = UDim.new(0,6)
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Parent = Side

-- Content
local Content = Instance.new("Frame")
Content.Position = UDim2.new(0,195,0,72)
Content.Size = UDim2.new(1,-205,1,-82)
Content.BackgroundColor3 = PANEL
Content.Parent = Main

Corner(Content,14)
Padding(Content,18)

--==================================================
-- 🧭 NAVIGATION
--==================================================

local Pages = {}
local NavButtons = {}
local CurrentPage = nil

local function MakePage(name)
	local page = Instance.new("ScrollingFrame")
	page.Name = name
	page.Size = UDim2.new(1,0,1,0)
	page.BackgroundTransparency = 1
	page.BorderSizePixel = 0
	page.ScrollBarThickness = 4
	page.CanvasSize = UDim2.new(0,0,0,0)
	page.AutomaticCanvasSize = Enum.AutomaticSize.Y
	page.Visible = false
	page.Parent = Content

	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0,10)
	layout.Parent = page

	Pages[name] = page
	return page
end

local function Nav(id, key)
	local b = Button(Side, tr(key))
	b.Name = id
	b.LayoutOrder = #NavButtons + 1
	NavButtons[id] = b

	b.MouseButton1Click:Connect(function()
		for _, page in pairs(Pages) do
			page.Visible = false
		end

		if Pages[id] then
			Pages[id].Visible = true
			CurrentPage = id
		end

		for _, btn in pairs(NavButtons) do
			btn.BackgroundColor3 = PANEL2
		end

		b.BackgroundColor3 = Color3.fromRGB(50,50,55)
	end)

	return b
end

--==================================================
-- 📄 CREATE TABS
--==================================================

local Home = MakePage("Home")
local Obby = MakePage("Obby")
local Char = MakePage("Char")
local People = MakePage("People")
local Rank = MakePage("Rank")
local Support = MakePage("Support")
local Cheat = MakePage("Cheat")
local Game = MakePage("Game")

local HomeNav = Nav("Home","home")
local ObbyNav = Nav("Obby","obby")
local CharNav = Nav("Char","char")
local PeopleNav = Nav("People","people")
local RankNav = Nav("Rank","rank")
local SupportNav = Nav("Support","support")
local CheatNav = Nav("Cheat","cheat")
local GameNav = Nav("Game","game")

local AdminNav

if ADMINS[LP.Name] then
	AdminNav = Nav("Admin","admin")
	MakePage("Admin")
end

--==================================================
-- 🏠 HOME
--==================================================

local HomeTitle = Label(Home, tr("welcome"), 25)
HomeTitle.Size = UDim2.new(1,0,0,40)
HomeTitle.Font = Enum.Font.GothamBlack

local HomeInfo = Label(
	Home,
	"🤖 99x AI Dashboard\n🟢 Secure local controls\n⚫ Black / ⚪ White 2026 interface",
	14
)
HomeInfo.Size = UDim2.new(1,0,0,100)
HomeInfo.TextWrapped = true

--==================================================
-- 🏃 OBBY
--==================================================

local ObbyTitle = Label(Obby, "🏃 Kurdish Obby Script", 22)
ObbyTitle.Size = UDim2.new(1,0,0,35)

local ObbyInfo = Label(
	Obby,
	"🛡️ Own-game tools only. These controls do not bypass Roblox anti-cheat.",
	13
)
ObbyInfo.Size = UDim2.new(1,0,0,55)
ObbyInfo.TextWrapped = true

local LocalInvisible = false

local function SetLocalInvisible(state)
	LocalInvisible = state

	local char = LP.Character
	if not char then return end

	for _, obj in ipairs(char:GetDescendants()) do
		if obj:IsA("BasePart") then
			obj.LocalTransparencyModifier = state and 1 or 0
		elseif obj:IsA("Decal") then
			obj.Transparency = state and 1 or 0
		end
	end
end

local InvisButton = Button(Obby, "👻 Invisible")
InvisButton.MouseButton1Click:Connect(function()
	SetLocalInvisible(not LocalInvisible)
	InvisButton.Text = LocalInvisible and "👀 Visible" or "👻 Invisible"
end)

local BangButton = Button(Obby, "👋 Bang v2 — Safe")
BangButton.MouseButton1Click:Connect(function()
	BangButton.Text = "🟢 Own-game interaction"
	task.delay(1.2,function()
		if BangButton then
			BangButton.Text = "👋 Bang v2 — Safe"
		end
	end)
end)

local AntiBang = Button(Obby, "🛡️ Anti Bang")
AntiBang.MouseButton1Click:Connect(function()
	AntiBang.Text = "🟢 Anti Bang Enabled"
end)

local AntiAFK = Button(Obby, "⏱️ Anti AFK — Own Game")
AntiAFK.MouseButton1Click:Connect(function()
	AntiAFK.Text = "🟢 Own-game AFK protection ON"
end)

local AntiCheat = Button(Obby, "🛡️ Anti Cheat — Own Game")
AntiCheat.MouseButton1Click:Connect(function()
	AntiCheat.Text = "🟢 Own-game protection ON"
end)

--==================================================
-- 👤 CHAR
--==================================================

local CharTitle = Label(Char, "👤 Char Commands", 22)
CharTitle.Size = UDim2.new(1,0,0,35)

local CharInfo = Label(
	Char,
	"💬 Click a name to send the /char command in your game's chat.",
	13
)
CharInfo.Size = UDim2.new(1,0,0,40)

local function SendChat(text)
	local channels = TextChatService:FindFirstChild("TextChannels")
	if channels then
		local general = channels:FindFirstChild("RBXGeneral")
		if general then
			pcall(function()
				general:SendAsync(text)
			end)
			return
		end
	end
end

for _, username in ipairs(CHAR_NAMES) do
	local b = Button(Char, "👤 " .. username)

	b.MouseButton1Click:Connect(function()
		SendChat("/char " .. username)
		b.Text = "✅ /char " .. username

		task.delay(1,function()
			if b then
				b.Text = "👤 " .. username
			end
		end)
	end)
end

--==================================================
-- 👥 PEOPLE
--==================================================

local PeopleTitle = Label(People, "👥 People", 22)
PeopleTitle.Size = UDim2.new(1,0,0,35)

local Search = Input(People, tr("search"), "")
Search.LayoutOrder = 1

local PeopleList = Instance.new("Frame")
PeopleList.BackgroundTransparency = 1
PeopleList.Size = UDim2.new(1,0,0,0)
PeopleList.AutomaticSize = Enum.AutomaticSize.Y
PeopleList.LayoutOrder = 2
PeopleList.Parent = People

local PeopleLayout = Instance.new("UIListLayout")
PeopleLayout.Padding = UDim.new(0,8)
PeopleLayout.Parent = PeopleList

local SelectedPlayer = nil
local Spectating = false

local function StopSpectating()
	Spectating = false

	local char = LP.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")

	if hum and workspace.CurrentCamera then
		workspace.CurrentCamera.CameraSubject = hum
	end
end

local function SpectatePlayer(player)
	if not player.Character then return end

	local hum = player.Character:FindFirstChildOfClass("Humanoid")
	if hum and workspace.CurrentCamera then
		Spectating = true
		workspace.CurrentCamera.CameraSubject = hum
	end
end

local function RefreshPeople()
	Clear(PeopleList)

	local query = string.lower(Search.Text or "")

	for _, player in ipairs(Players:GetPlayers()) do
		if query == ""
			or string.find(string.lower(player.Name),query,1,true)
			or string.find(string.lower(player.DisplayName),query,1,true) then

			local Card = Instance.new("Frame")
			Card.Size = UDim2.new(1,0,0,82)
			Card.BackgroundColor3 = PANEL2
			Card.Parent = PeopleList

			Corner(Card,10)
			Stroke(Card,DARKGRAY,1,.35)

			local Avatar = Instance.new("ImageLabel")
			Avatar.Size = UDim2.new(0,62,0,62)
			Avatar.Position = UDim2.new(0,10,0,10)
			Avatar.BackgroundColor3 = BLACK2
			Avatar.Parent = Card

			Corner(Avatar,10)

			local ok, image = pcall(function()
				return Players:GetUserThumbnailAsync(
					player.UserId,
					Enum.ThumbnailType.HeadShot,
					Enum.ThumbnailSize.Size100x100
				)
			end)

			if ok then
				Avatar.Image = image
			end

			local Info = Label(
				Card,
				"👤 "..player.Name.."\n📛 "..player.DisplayName,
				12
			)

			Info.Position = UDim2.new(0,82,0,10)
			Info.Size = UDim2.new(.34,0,0,60)
			Info.TextWrapped = true

			local Select = Button(Card,"🎯 Select")
			Select.Position = UDim2.new(.42,0,0,20)
			Select.Size = UDim2.new(0,90,0,40)

			Select.MouseButton1Click:Connect(function()
				SelectedPlayer = player
				Select.Text = "✅ Selected"
			end)

			local TP = Button(Card,tr("teleport"))
			TP.Position = UDim2.new(.42,100,0,20)
			TP.Size = UDim2.new(0,100,0,40)

			TP.MouseButton1Click:Connect(function()
				local myChar = LP.Character
				local targetChar = player.Character

				if myChar and targetChar then
					local myRoot = myChar:FindFirstChild("HumanoidRootPart")
					local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")

					if myRoot and targetRoot then
						myRoot.CFrame = targetRoot.CFrame + Vector3.new(2,0,0)
					end
				end
			end)

			local Spec = Button(Card,tr("spectate"))
			Spec.Position = UDim2.new(.42,210,0,20)
			Spec.Size = UDim2.new(0,100,0,40)

			Spec.MouseButton1Click:Connect(function()
				SpectatePlayer(player)
			end)
		end
	end
end

Search:GetPropertyChangedSignal("Text"):Connect(RefreshPeople)

local Refresh = Button(People,tr("refresh"))
Refresh.LayoutOrder = 3
Refresh.MouseButton1Click:Connect(RefreshPeople)

local Stop = Button(People,tr("stopSpectate"))
Stop.LayoutOrder = 4
Stop.MouseButton1Click:Connect(StopSpectating)

local Wave = Button(People,tr("wave"))
Wave.LayoutOrder = 5
Wave.MouseButton1Click:Connect(function()
	SendChat("👋 Wave!")
end)

Players.PlayerAdded:Connect(function()
	task.wait(.2)
	RefreshPeople()
end)

Players.PlayerRemoving:Connect(function()
	task.wait(.2)
	RefreshPeople()
end)

--==================================================
-- 👑 RANK
--==================================================

local RankTitle = Label(Rank,"👑 99x Rank",22)
RankTitle.Size = UDim2.new(1,0,0,35)

local function RankLine(icon,name,role)
	local b = Button(Rank,icon.." "..name.." — "..role)
	return b
end

RankLine("👑","Xx99x_LokiXx","Owner")
RankLine("🛡️","SarOk_99x","Admin")
RankLine("🔨","99x_Trump","Creator")

--==================================================
-- 🆘 SUPPORT
--==================================================

local SupportTitle = Label(Support,"🆘 Support",22)
SupportTitle.Size = UDim2.new(1,0,0,35)

local SupportBox = Input(Support,"📝 Write your support message...","")
SupportBox.Size = UDim2.new(1,0,0,90)
SupportBox.MultiLine = true
SupportBox.TextYAlignment = Enum.TextYAlignment.Top

local SendSupport = Button(Support,tr("sendSupport"))

SendSupport.MouseButton1Click:Connect(function()
	if SupportBox.Text == "" then
		SendSupport.Text = "⚠️ Write something first"
		task.delay(1.2,function()
			SendSupport.Text = tr("sendSupport")
		end)
		return
	end

	-- Safe local-game notification.
	SendChat("[99x Support] "..SupportBox.Text)

	SendSupport.Text = "✅ Sent to "..OWNER

	task.delay(1.5,function()
		SendSupport.Text = tr("sendSupport")
	end)
end)

--==================================================
-- ⚡ CHEAT TAB
--==================================================

local CheatTitle = Label(Cheat,"⚡ Cheat Controls",22)
CheatTitle.Size = UDim2.new(1,0,0,35)

local CheatInfo = Label(
	Cheat,
	"🤖 Own-game local character controls\n⚠️ Speed: 1–70 | JumpPower: 1–40",
	13
)
CheatInfo.Size = UDim2.new(1,0,0,55)
CheatInfo.TextWrapped = true

local SpeedInput = Input(Cheat,"🏃 Speed 1–70","16")
local JumpInput = Input(Cheat,"🦘 JumpPower 1–40","40")

local ApplyCheat = Button(Cheat,"⚡ Apply Controls")
local ResetCheat = Button(Cheat,"🔄 Reset Controls")

local function GetHumanoid()
	local char = LP.Character
	if not char then return nil end
	return char:FindFirstChildOfClass("Humanoid")
end

ApplyCheat.MouseButton1Click:Connect(function()
	local hum = GetHumanoid()
	if not hum then return end

	local speed = math.clamp(tonumber(SpeedInput.Text) or 16,1,70)
	local jump = math.clamp(tonumber(JumpInput.Text) or 40,1,40)

	hum.WalkSpeed = speed
	hum.JumpPower = jump

	SpeedInput.Text = tostring(speed)
	JumpInput.Text = tostring(jump)

	ApplyCheat.Text = "✅ Applied"
	task.delay(1,function()
		ApplyCheat.Text = "⚡ Apply Controls"
	end)
end)

ResetCheat.MouseButton1Click:Connect(function()
	local hum = GetHumanoid()
	if not hum then return end

	hum.WalkSpeed = 16
	hum.JumpPower = 40

	SpeedInput.Text = "16"
	JumpInput.Text = "40"

	ResetCheat.Text = "✅ Reset"
	task.delay(1,function()
		ResetCheat.Text = "🔄 Reset Controls"
	end)
end)

--==================================================
-- 🎮 GAME TAB — UPDATE 1
--==================================================

local GameTitle = Label(Game,"🎮 Game Control Center",22)
GameTitle.Size = UDim2.new(1,0,0,35)
GameTitle.Font = Enum.Font.GothamBlack

local GameStatus = Label(
	Game,
	"🤖 99x AI Game Dashboard • Update 1",
	13
)
GameStatus.Size = UDim2.new(1,0,0,35)
GameStatus.TextColor3 = GRAY

-- 💬 CHAT SPAM
local SpamTitle = Label(Game,tr("chatSpam"),17)
SpamTitle.Size = UDim2.new(1,0,0,30)

local SpamBox = Input(Game,"💬 Message...","99xFamilyy 🤖")

local SpamToggle = Button(Game,tr("off"))

local SpamEnabled = false
local SpamMessage = "99xFamilyy 🤖"
local SpamLoop = nil

SpamBox.FocusLost:Connect(function()
	if SpamBox.Text ~= "" then
		SpamMessage = SpamBox.Text
	end
end)

local function SetSpam(state)
	SpamEnabled = state

	if SpamEnabled then
		SpamToggle.Text = tr("on")

		if SpamLoop then return end

		SpamLoop = task.spawn(function()
			while SpamEnabled do
				SendChat(SpamMessage)
				task.wait(5)
			end

			SpamLoop = nil
		end)
	else
		SpamToggle.Text = tr("off")
	end
end

SpamToggle.MouseButton1Click:Connect(function()
	SetSpam(not SpamEnabled)
end)

local SpamNote = Label(Game,tr("spamNote"),11)
SpamNote.Size = UDim2.new(1,0,0,35)
SpamNote.TextColor3 = GRAY

-- 🎬 ANIMATION HUB
local AnimTitle = Label(Game,tr("animationHub"),17)
AnimTitle.Size = UDim2.new(1,0,0,30)

local AnimToggle = Button(Game,tr("off"))
local AnimEnabled = false

AnimToggle.MouseButton1Click:Connect(function()
	AnimEnabled = not AnimEnabled

	if AnimEnabled then
		AnimToggle.Text = tr("on")
	else
		AnimToggle.Text = tr("off")
	end
end)

local AnimNote = Label(Game,tr("animationNote"),11)
AnimNote.Size = UDim2.new(1,0,0,40)
AnimNote.TextColor3 = GRAY

--==================================================
-- 🛡️ ADMIN
--==================================================

if ADMINS[LP.Name] then
	local AdminPage = Pages["Admin"]

	local AdminTitle = Label(AdminPage,"🛡️ Admin Dashboard",22)
	AdminTitle.Size = UDim2.new(1,0,0,35)

	local AdminInfo = Label(
		AdminPage,
		"👑 Authorized account: "..LP.Name,
		13
	)
	AdminInfo.Size = UDim2.new(1,0,0,35)
	AdminInfo.TextColor3 = GRAY

	local AdminInvisible = Button(AdminPage,"👻 Invisible")

	AdminInvisible.MouseButton1Click:Connect(function()
		SetLocalInvisible(not LocalInvisible)

		AdminInvisible.Text =
			LocalInvisible and "👀 Visible" or "👻 Invisible"
	end)

	local God = Button(AdminPage,"❤️ God Mode — Own Game")

	God.MouseButton1Click:Connect(function()
		God.Text = "🟢 Own-game God Mode ON"
	end)

	local KickProtect = Button(AdminPage,"🛡️ Anti Kick — Own Game")

	KickProtect.MouseButton1Click:Connect(function()
		KickProtect.Text = "🟢 Own-game kick protection ON"
	end)

	local AFK24 = Button(AdminPage,"⏱️ AFK Protection 1–24h")

	AFK24.MouseButton1Click:Connect(function()
		AFK24.Text = "🟢 Own-game AFK protection ON"
	end)
end

--==================================================
-- 🌐 LANGUAGE UPDATE
--==================================================

local function UpdateLanguage()
	NavButtons.Home.Text = tr("home")
	NavButtons.Obby.Text = tr("obby")
	NavButtons.Char.Text = tr("char")
	NavButtons.People.Text = tr("people")
	NavButtons.Rank.Text = tr("rank")
	NavButtons.Support.Text = tr("support")
	NavButtons.Cheat.Text = tr("cheat")
	NavButtons.Game.Text = tr("game")

	if NavButtons.Admin then
		NavButtons.Admin.Text = tr("admin")
	end

	Title.Text = "◉ 99xFamilyy"
	Status.Text = "● "..(Language == "English" and "SYSTEM ONLINE" or "سیستەم کار دەکات")

	LangButton.Text = Language == "English" and "🌐 EN" or "🌐 KU"

	HomeTitle.Text = tr("welcome")

	Refresh.Text = tr("refresh")
	Stop.Text = tr("stopSpectate")
	Wave.Text = tr("wave")

	SupportTitle.Text = tr("🆘 Support")
	SendSupport.Text = tr("sendSupport")

	SpeedInput.PlaceholderText = tr("walkSpeed").." 1–70"
	JumpInput.PlaceholderText = tr("jumpPower").." 1–40"

	GameTitle.Text = "🎮 "..(Language == "English"
		and "Game Control Center"
		or "Game Control Center")

	SpamTitle.Text = tr("chatSpam")
	AnimTitle.Text = tr("animationHub")

	if SpamEnabled then
		SpamToggle.Text = tr("on")
	else
		SpamToggle.Text = tr("off")
	end

	if AnimEnabled then
		AnimToggle.Text = tr("on")
	else
		AnimToggle.Text = tr("off")
	end

	Search.PlaceholderText = tr("search")
end

LangButton.MouseButton1Click:Connect(function()
	local now = os.clock()

	if now - LastLanguageChange < 5 then
		LangButton.Text = "⏳ 5s"
		return
	end

	LastLanguageChange = now

	if Language == "English" then
		Language = "Sorani"
	else
		Language = "English"
	end

	UpdateLanguage()
end)

--==================================================
-- 🖱️ DRAG MAIN WINDOW
--==================================================

local dragging = false
local dragStart
local startPos

Top.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPos = Main.Position
	end
end)

Top.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if not dragging then return end

	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then

		local delta = input.Position - dragStart

		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

--==================================================
-- 🔘 SMALL MOVABLE 99X LOGO
--==================================================

local Logo = Instance.new("TextButton")
Logo.Name = "99xFloatingLogo"
Logo.AnchorPoint = Vector2.new(.5,.5)
Logo.Position = UDim2.new(.88,0,.82,0)
Logo.Size = UDim2.new(0,58,0,58)
Logo.BackgroundColor3 = BLACK
Logo.Text = "99x"
Logo.TextColor3 = WHITE
Logo.Font = Enum.Font.GothamBlack
Logo.TextSize = 16
Logo.AutoButtonColor = false
Logo.Visible = false
Logo.Parent = Gui

Corner(Logo,29)
Stroke(Logo,WHITE,1,.25)

Logo.MouseButton1Click:Connect(function()
	Main.Visible = not Main.Visible
end)

local logoDragging = false
local logoStart
local logoPos

Logo.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		logoDragging = true
		logoStart = input.Position
		logoPos = Logo.Position
	end
end)

Logo.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		logoDragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if not logoDragging then return end

	if input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch then

		local delta = input.Position - logoStart

		Logo.Position = UDim2.new(
			logoPos.X.Scale,
			logoPos.X.Offset + delta.X,
			logoPos.Y.Scale,
			logoPos.Y.Offset + delta.Y
		)
	end
end)

--==================================================
-- ❌ CLOSE
--==================================================

Close.MouseButton1Click:Connect(function()
	Main.Visible = false
	Logo.Visible = true
end)

--==================================================
-- 🔓 UNLOCK
--==================================================

local function UnlockUI()
	Lock.Visible = false
	Main.Visible = true
	Logo.Visible = false

	CodeBox.Text = ""
	Error.Text = ""

	for _, page in pairs(Pages) do
		page.Visible = false
	end

	Home.Visible = true
	CurrentPage = "Home"

	for _, btn in pairs(NavButtons) do
		btn.BackgroundColor3 = PANEL2
	end

	if NavButtons.Home then
		NavButtons.Home.BackgroundColor3 = Color3.fromRGB(50,50,55)
	end

	task.defer(RefreshPeople)
end

Unlock.MouseButton1Click:Connect(function()
	if CodeBox.Text == ACCESS_CODE then
		UnlockUI()
	else
		Error.Text = "❌ Wrong code"

		CodeBox.Text = ""

		task.delay(1.5,function()
			if Error then
				Error.Text = ""
			end
		end)
	end
end)

CodeBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		if CodeBox.Text == ACCESS_CODE then
			UnlockUI()
		else
			Error.Text = "❌ Wrong code"
			CodeBox.Text = ""
		end
	end
end)

--==================================================
-- 🔄 CHARACTER RESPAWN
--==================================================

LP.CharacterAdded:Connect(function()
	task.wait(.5)

	if LocalInvisible then
		SetLocalInvisible(true)
	end
end)

--==================================================
-- 🚀 START
--==================================================

Lock.Visible = true
Main.Visible = false
Logo.Visible = false

UpdateLanguage()

print("🤖 99xFamilyy Update 1 loaded successfully.")
