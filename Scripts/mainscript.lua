local BannerText = mainForm:GetChildChecked('Announce', false )
BannerText:SetVal('value', GTL('ACTIVATE A BANNER!'))
BannerText:SetClassVal('class', 'LogColorOrange' )
local StartCheck = false

function CheckBuff(params)
if StartCheck then
	if IsBannerActive() then
		BannerText:Show(false)
	else 
		BannerText:Show(true)
		end
	end
end

function onClientZoneChanged()
StartCheck = false
BannerText:Show(false)
if cartographer.GetCurrentZoneInfo().sysZoneName:find('PvPArena') then
	StartCheck = true
	if IsBannerActive() then
		BannerText:Show(false)
	else 
		BannerText:Show(true)
		end
	end
end

function IsBannerActive()
local found = false
local buffs = object.GetBuffs(avatar.GetId())
		for _, buffid in pairs(buffs) do
			if userMods.FromWString(object.GetBuffInfo(buffid).name):find(GTL('Banner')) then
				found = true
				break
			end
		end
	return found
end

function Init()
	common.RegisterEventHandler( onClientZoneChanged, 'EVENT_AVATAR_CLIENT_ZONE_CHANGED')
	common.RegisterEventHandler( CheckBuff, 'EVENT_OBJECT_BUFFS_CHANGED',{objectId = avatar.GetId() })
	onClientZoneChanged()
end

if (avatar.IsExist()) then Init()
else common.RegisterEventHandler(Init, 'EVENT_AVATAR_CREATED')	
end