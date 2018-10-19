local E, L, V, P, G = unpack(select(2, ...))
local S = E:GetModule("Skins")

local _G = _G;
local select = select;

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.guildregistrar ~= true then return end

	local GuildRegistrarFrame = _G["GuildRegistrarFrame"]
	GuildRegistrarFrame:StripTextures(true)
	GuildRegistrarFrame:CreateBackdrop("Transparent")
	GuildRegistrarFrame.backdrop:Point("TOPLEFT", 12, -17)
	GuildRegistrarFrame.backdrop:Point("BOTTOMRIGHT", -28, 65)

	GuildRegistrarGreetingFrame:StripTextures()

	GuildRegistrarFrameEditBox:StripTextures()
	S:HandleEditBox(GuildRegistrarFrameEditBox)
	GuildRegistrarFrameEditBox:Height(20)

	for i = 1, GuildRegistrarFrameEditBox:GetNumRegions() do
		local region = select(i, GuildRegistrarFrameEditBox:GetRegions())
		if region and region:GetObjectType() == "Texture" then
			if (region:GetTexture() == "Interface\\ChatFrame\\UI-ChatInputBorder-Left") or (region:GetTexture() == "Interface\\ChatFrame\\UI-ChatInputBorder-Right") then
				region:Kill()
			end
		end
	end

	S:HandleButton(GuildRegistrarFrameGoodbyeButton)
	S:HandleButton(GuildRegistrarFrameCancelButton)
	S:HandleButton(GuildRegistrarFramePurchaseButton)

	S:HandleCloseButton(GuildRegistrarFrameCloseButton)

	for i = 1, 2 do
		_G["GuildRegistrarButton"..i]:GetFontString():SetTextColor(1, 1, 1)
	end

	GuildRegistrarPurchaseText:SetTextColor(1, 1, 1)
	AvailableServicesText:SetTextColor(1, 0.80, 0.10)
end

S:AddCallback("GuildRegistrar", LoadSkin)