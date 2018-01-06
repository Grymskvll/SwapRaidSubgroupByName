local NumRaidMembers
local nummembers = GetNumRaidMembers
local swap = SwapRaidSubgroup
local set = SetRaidSubgroup

local RaidIndices = CreateFrame("FRAME", "RaidIndices");
RaidIndices:RegisterEvent("RAID_ROSTER_UPDATE")
RaidIndices:RegisterEvent("VARIABLES_LOADED")

function RaidIndices:Update()
	this.table = {}
	local getinfo = GetRaidRosterInfo
	local lower = string.lower
	for i=1, NumRaidMembers do
		local name = getinfo(i)
		this.table[lower(name)] = i
	end
end

function RaidIndices:OnEvent()
	if event == "VARIABLES_LOADED" then
		-- Function aliases
		swapraidsubgroupbyname = SwapRaidSubgroupByName
		swapbyname = SwapRaidSubgroupByName
		SwapByName = SwapRaidSubgroupByName
		
		setraidsubgroupbyname = SetRaidSubgroupByName
		setbyname = SetRaidSubgroupByName
		SetByName = SetRaidSubgroupByName

		this.table = {}
		NumRaidMembers = nummembers()
		RaidIndices:Update()
	elseif event == "RAID_ROSTER_UPDATE" then
		local NewNumRaidMembers = nummembers()
		if NewNumRaidMembers ~= NumRaidMembers then
			NumRaidMembers = NewNumRaidMembers
			RaidIndices:Update()
		end
	end
end
RaidIndices:SetScript("OnEvent", RaidIndices.OnEvent);

function SwapRaidSubgroupByName(name1, name2)
	local i1, i2
	i1 = RaidIndices.table[string.lower(name1)]
	i2 = RaidIndices.table[string.lower(name2)]
	swap(i1, i2)
end

function SetRaidSubgroupByName(name, subgroup)
	local i = RaidIndices.table[string.lower(name)]
	set(i, subgroup)
end