	--gui
	local screenW, screenH = guiGetScreenSize()
		okno = guiCreateWindow(0.30, 0.37, 0.39, 0.43, "Panel zarządzania Grupą Pozorantów", true)
        guiWindowSetSizable(okno, false)
		guiSetVisible(okno, false)
        gridlista = guiCreateGridList(0.02, 0.10, 0.31, 0.85, true, okno)
        kolumna = guiGridListAddColumn(gridlista, "Pozoranci", 0.9)
        prz1 = guiCreateButton(0.41, 0.35, 0.22, 0.06, "Wyrzuć", true, okno)
        edit1 = guiCreateEdit(0.36, 0.17, 0.31, 0.05, "", true, okno)
        prz2 = guiCreateButton(0.41, 0.24, 0.22, 0.06, "Dodaj", true, okno)
        combobox = guiCreateComboBox(0.41, 0.70, 0.22, 0.50, "", true, okno)
        guiComboBoxAddItem(combobox, "1")
        guiComboBoxAddItem(combobox, "2")
        guiComboBoxAddItem(combobox, "3")
        guiComboBoxAddItem(combobox, "4")
        guiComboBoxAddItem(combobox, "5")
        guiComboBoxAddItem(combobox, "6")
        guiComboBoxAddItem(combobox, "7")
        guiComboBoxAddItem(combobox, "8")
        guiComboBoxAddItem(combobox, "9")
        guiComboBoxAddItem(combobox, "10")
        guiComboBoxAddItem(combobox, "11")
        prz3 = guiCreateButton(0.41, 0.50, 0.22, 0.06, "Zmień rangę", true, okno)
	
-- panel

addEvent("gui", true)		
function komenda ()
	
	if (guiGetVisible(okno)) then
		showCursor(false)
		guiSetVisible(okno,false)
	elseif (not isCursorShowing()) then
		showCursor(true)
		guiSetVisible(okno,true)
		triggerServerEvent("gridlist", localPlayer)
	end

end
addEventHandler("gui", root, komenda)

function przyciski ()
	
	if source == prz1 then
		text = guiGetText(edit1)
		triggerServerEvent("usuwanie", localPlayer, text)
	elseif source == prz2 then
		text = guiGetText(edit1)
		triggerServerEvent("dodawanie", localPlayer, text)
	elseif source == prz3 then
		text = guiGetText(edit1)
		item = guiComboBoxGetSelected(combobox)
		numer = guiComboBoxGetItemText(combobox, item)
		triggerServerEvent("zmiana", localPlayer, text, numer, item)
	end
end
addEventHandler("onClientGUIClick", getRootElement(), przyciski)

--gridlista

addEvent("insert_gridlist", true)
addEventHandler("insert_gridlist", root, function(result)
guiGridListClear(gridlista)
	for i,v in pairs(result) do
		local row = guiGridListAddRow(gridlista)
		guiGridListSetItemText ( gridlista, row,1, v["Nick"], false, false)
	end
end)


