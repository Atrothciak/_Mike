local connect = dbConnect( "sqlite", "baza_pozoranci.db" )

-- bind na otwieranie gui

function komenda (thePlayer)
	local que1 = dbQuery(connect, "SELECT * FROM pozoranci_zatrudnieni WHERE Ranga=?", 11 )
		local result1 = dbPoll(que1, -1)
			if result1[1] then
				triggerClientEvent("gui", thePlayer)
			end
end

addEventHandler("onResourceStart", root, function()
	for k,v in ipairs(getElementsByType("player")) do
		bindKey(v, "F7", "down", komenda)
	end
end)
--gridlista

addEvent("gridlist", true)
addEventHandler("gridlist", root, function()
    local que = dbQuery(connect, "SELECT * FROM pozoranci_zatrudnieni ")
    local result = dbPoll(que, -1)
    if #result > 0 then
        for k,v in pairs(result) do
            triggerClientEvent(client, "insert_gridlist", client, result)
        end
    end
end)

-- dodawanie do panelu

addEvent("dodawanie", true)
addEventHandler("dodawanie", root, 
function(text)
		local que1 = dbQuery(connect, "SELECT * FROM pozoranci_zatrudnieni WHERE Ranga=?", 11)
		local result1 = dbPoll(que1, -1)
			if result1[1] then		
				local que = dbQuery(connect, "SELECT * FROM pozoranci_zatrudnieni WHERE Nick =?", text)
				result = dbPoll(que, -1)
			if not result[1] then 
				dbExec ( connect, "INSERT INTO pozoranci_zatrudnieni ( Nick ) VALUES ( ? )", text)
				outputChatBox("Dodałeś  " ..text, client, 255,255,255)
				dbFree(que)
				dbFree(que1)
			else
			outputChatBox("Ten gracz jest już w pozorantach!", client)
			dbFree(que)
			dbFree(que1)
		end	
	end
end
)

-- usuwanie z panelu

addEvent("usuwanie", true)
addEventHandler("usuwanie", root, 
function(text)
		
		local que1 = dbQuery(connect, "SELECT * FROM pozoranci_zatrudnieni WHERE Ranga=?", 11)
		local result1 = dbPoll(que1, -1)
			if result1[1] then	
				local que = dbQuery(connect, "SELECT * FROM pozoranci_zatrudnieni WHERE Nick =?", text)
				result = dbPoll(que, -1)
			if result[1] then 
				dbExec ( connect, "DELETE FROM pozoranci_zatrudnieni WHERE  Nick =? ", text)
				outputChatBox("Usunąłeś " ..text, client, 255,255,255)
				dbFree(que)
				dbFree(que1)
			else
				outputChatBox("Tego gracza nie ma w bazie danych!", client, 255,255,255)
				dbFree(que)
				dbFree(que1)
		end
	end
end
)

-- zmiana rangi w panelu 

addEvent("zmiana", true)
addEventHandler("zmiana", root, 
function(text, numer, item)
	local que1 = dbQuery(connect, "SELECT * FROM pozoranci_zatrudnieni WHERE Ranga=?", 11)
	local result1 = dbPoll(que1, -1)
		if result1[1] then	
			local que = dbQuery(connect, "SELECT * FROM pozoranci_zatrudnieni WHERE Nick =?", text)
			result = dbPoll(que, -1)
		if result[1] then
			dbExec ( connect, "UPDATE pozoranci_zatrudnieni SET Ranga = ? WHERE NICK=?", numer, text)
			outputChatBox("Zmieniłeś rangę.", client)
			dbFree(que)
			dbFree(que1)
		else
			outputChatBox("Tego gracza nie ma w pozorantach", client)
			dbFree(que)
			dbFree(que1)
		end
	end
end
)




