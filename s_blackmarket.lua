
-- 			Name Factions =	الـتـهريـب
-- 			ID Factions = 98



function govBlackMarket(thePlayer, commandName, ...)
	local theTeam = getPlayerTeam(thePlayer)
	local tameName = getTeamName(theTeam)
	if (theTeam) then
		local teamID = tonumber(getElementData(theTeam, "id"))

		if (tameName == "الـتـهريـب" or  teamID==98) then
			local message = table.concat({...}, " ")
			local factionLeader = getElementData(thePlayer,"factionleader")

			if #message == 0 then
				outputChatBox("SYNTAX: /" .. commandName .. " [message]", thePlayer, 255, 194, 14)
				return false
			end

			if factionLeader>0 then

				for key, value in ipairs(exports.pool:getPoolElementsByType("player")) do
					local logged = getElementData(value, "loggedin")
					local tameTarget = getPlayerTeam(value)
					local typeFactions = getElementData(tameTarget, "type")
					if (typeFactions == 0 or typeFactions == 1) then
						if (logged==1) then
							outputChatBox("[Hidden] ㄨ ßlå¢kMårkê† Mêmßêr ㄨ", value, 217, 11, 0)
							outputChatBox(message, value, 217, 11, 0)
							outputChatBox("[Hidden] ㄨ ßlå¢kMårkê† Mêmßêr ㄨ", value, 217, 11, 0)

						end
					end
				end
			else
				outputChatBox("You do not have permission to use this command.", thePlayer, 255, 0, 0)
			end
		end
	end
end

addCommandHandler("govb",govBlackMarket)