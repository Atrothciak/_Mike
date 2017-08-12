local SQL

local function connect()
    -- w ponizszej linii uzupelnij dane autoryzacji
	SQL = dbConnect("mysql", "dbname=mike;host=localhost", "root","","share=1")
	if (not SQL) then
		outputServerLog("BRAK POLACZENIA Z BAZA DANYCH!")
	else
		outputDebugString("DB PASS")
		zapytanie("SET NAMES utf8;")
	end

end
addEventHandler("onResourceStart",resourceRoot, connect)

function pobierzTabeleWynikow(...)
	local h=dbQuery(SQL,...)
	if (not h) then 
		return nil
	end
	local rows = dbPoll(h, -1)
	return rows
end

function pobierzWyniki(...)
	local h=dbQuery(SQL,...)
	if (not h) then 
		return nil
	end
	local rows = dbPoll(h, -1)
	if not rows then return nil end
	return rows[1]
end

function zapytanie(...)
	local h=dbQuery(SQL,...)
	local result,numrows, last_id=dbPoll(h,-1)
	return numrows
end

function zapytanieID(...)
	local h=dbQuery(SQL,...)
	local result,numrows, last_id=dbPoll(h,-1)
	return numrows, last_id
end

function update(...)
	local h=dbExec(SQL,...)
	return h
end