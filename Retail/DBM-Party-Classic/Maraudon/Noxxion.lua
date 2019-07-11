local mod	= DBM:NewMod(423, "DBM-Party-Classic", 6, 232)
local L		= mod:GetLocalizedStrings()

mod:SetRevision("2019061413859")
mod:SetCreatureID(13282)
mod:SetEncounterID(422)

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_CAST_SUCCESS 10966 21707"
)

--TODO, spawns affect uppercut timer?
local warningSpawns					= mod:NewSpellAnnounce(21707, 2)
local warningUppercut				= mod:NewSpellAnnounce(10966, 2)

local timerSpawnsCD					= mod:NewAITimer(180, 21707, nil, nil, nil, 1, nil, DBM_CORE_DAMAGE_ICON)
local timerUppercutCD				= mod:NewAITimer(180, 10966, nil, nil, nil, 5, nil, DBM_CORE_TANK_ICON)

function mod:OnCombatStart(delay)
	timerUppercutCD:Start(1-delay)
end

function mod:SPELL_CAST_SUCCESS(args)
	if args.spellId == 10966 then
		warningUppercut:Show()
		timerUppercutCD:Start()
	elseif args.spellId == 21707 then
		warningSpawns:Show()
		timerSpawnsCD:Start()
	end
end
