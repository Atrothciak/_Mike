local connect = dbConnect( "mysql", "dbname=db_23805;host=46.29.17.244", "db_23805", "s8qkLFQjHmS0", "share=1" )

if connect then
	
	dbExec (connect, "CREATE TABLE IF NOT EXISTS player (Nick TEXT, Haslo TEXT)")
end

addEventHandler("onPlayerJoin",  getRootElement(), function()

    setCameraMatrix(source,1920.8371582031,2393.6320800781,100.3517074585)
    fadeCamera(source,true, 0.1)
    triggerClientEvent(source,"broadCastMusic", source)
    
end)

addEvent("logowanie", true)
addEventHandler("logowanie", root, function(login, haslo)

	local que = dbQuery(connect, "SELECT * FROM player WHERE Nick=? AND Haslo=?", login, haslo)
	local result = dbPoll(que, -2)
		if #result>0 then
			outputChatBox("Zalogowałeś się!", client)
			fadeCamera(source,true, 0.1)
			setCameraTarget(source)
			spawnPlayer(source, 1920.8371582031,2394.7028808594,11.09375)
			triggerClientEvent("zakonczenie", source)
			toggleControl(source,"fire",false)
			toggleControl(source,"aim_weapon",false)
			toggleControl(source,"action", false)
		else
			outputChatBox("Błędny login lub hasło", client)
		end
end)

addEvent("rejestracja", true)
addEventHandler("rejestracja", root, function(login, haslo)
	
	dbExec ( connect, "INSERT INTO player ( Nick, Haslo ) VALUES ( ?,? )", login, haslo)
	outputChatBox("Teraz się zaloguj!", client)

end)

addEventHandler("onPlayerJoin", root, function()
toggleControl(source,"fire",false)
toggleControl(source,"aim_weapon",false)
toggleControl(source,"action", false)
end)

addEventHandler("onPlayerWasted", root, function()
spawnPlayer(source, 1939.1630859375,2402.3681640625,10.8203125)
	fadeCamera(source, true, 1)
	setCameraTarget(source)
end)