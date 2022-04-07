COMSERV = {
	coords = vector3(168.528, -978.9825, 30.09193),
	radius = 10,

	marker = { --task marker
		typ = 1,
		size = 1.5,
		upDown = false,
		color = { 200, 150, 0, 150 },
	},

	blip = {
		icon = 1,
		name = "Current Job",
	},

	model = GetHashKey("prop_tool_broom"),
}

ADMIN_RANKS = {
	["admin"] = true,
}

function output(text, target)
	if IsDuplicityVersion() then --Server Side
		TriggerClientEvent("chat:addMessage", target or -1, {
			color = { 255, 0, 0 },
			multiline = true,
			args = { "Server", text },
		})
	else
		TriggerEvent("chat:addMessage", {
			color = { 255, 0, 0 },
			multiline = true,
			args = { "Server", text },
		})
	end
end

if not IsDuplicityVersion() then --Server side
	return
end

function isAdmin(xPlayer)
	if type(xPlayer) ~= "table" then
		xPlayer = ESX.GetPlayerFromId(xPlayer)
	end

	if not xPlayer then
		return false
	end

	local permissions = ADMIN_RANKS[xPlayer.getGroup()]

	if not permissions then
		output("You have not permissions!", xPlayer.source)
	end

	return permissions
end
