Global("localization", nil)

Global("Locales", {
	["rus"] = { -- Russian, Win-1251
    ["ACTIVATE A BANNER!"] = "¿ “»¬»–”… «Õ¿Ãﬂ!",
	},
	["eng_eu"] = { -- English, Latin-1
	}
})

localization = common.GetLocalization()
function GTL( strTextName )
	return Locales[ localization ][ strTextName ] or Locales[ "eng_eu" ][ strTextName ] or strTextName
end
