addEvent("zaloguj",true)
addEventHandler("zaloguj",root,function(thePlayer,kasa1)
		
		result = exports.db_connect:pobierzTabeleWynikow("Select * from Banko WHERE Nick = ? and PIN=?",getPlayerName(thePlayer),kasa1)
				for k,v in ipairs(result) do
					if v.PIN == kasa1 then
				
						hajs = v.Kasa
						triggerClientEvent("zalogowano",thePlayer,hajs)
							
					end
				end

end)

addEvent("add_kasa",true)
addEventHandler("add_kasa",root,function(thePlayer,pieniadze)

				exports.db_connect:update("UPDATE Banko SET Kasa =? WHERE Nick=?",pieniadze,getPlayerName(thePlayer))
				takePlayerMoney(thePlayer,pieniadze)
				outputChatBox("wprowadzono")

end)