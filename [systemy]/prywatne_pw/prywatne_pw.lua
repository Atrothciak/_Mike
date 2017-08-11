function private_message (thePlayer,cmd, cel, ...)
	local pmWords = { ... }
	local pmMessage = table.concat( pmWords, " " )
	if cel then
		if (getPlayerFromParticalName (cel)) then
			toPlayer = (getPlayerFromParticalName (cel))
				if not (pmMessage == "") then
					outputChatBox("#008000[>>]PW #FFFFFF" .. getPlayerName(toPlayer) .. "#FFFFFF: " .. pmMessage, thePlayer, 255, 255, 255, true)
					outputChatBox("#008000[<<]PW #FFFFFF" .. getPlayerName(thePlayer) .. "#FFFFFF: " .. pmMessage, toPlayer, 255, 255, 255, true)
				end
			end
		end
	end

addCommandHandler("pw", private_message, false, false)
addCommandHandler("pm", private_message, false, false)

function getPlayerFromParticalName(thePlayerName)
	local thePlayer = getPlayerFromName(thePlayerName)
	if thePlayer then
		return thePlayer
	end
	for _,thePlayer in ipairs(getElementsByType("player")) do
		if string.find(string.gsub(getPlayerName(thePlayer):lower(),"#%x%x%x%x%x%x", ""), thePlayerName:lower(), 1, true) then
			return thePlayer
		end
	end
return false
end