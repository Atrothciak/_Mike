local screenW, screenH = guiGetScreenSize()

function dx ()
		dxDrawRectangle(screenW * 0.3719, screenH * 0.0000, screenW * 0.2573, screenH * 1.0000, tocolor(51, 184, 10, 69), false)
        dxDrawText("Tutaj wpisz login", screenW * 0.4375, screenH * 0.3444, screenW * 0.6089, screenH * 0.3787, tocolor(255, 255, 255, 255), 2.00, "default-bold", "left", "top", false, false, false, false, false)
      dxDrawText("Tutaj wpisz hasło", screenW * 0.4375, screenH * 0.5148, screenW * 0.6089, screenH * 0.5491, tocolor(255, 255, 255, 255), 2.00, "default-bold", "left", "top", false, false, false, false, false)
end

addEvent("broadCastMusic", true)
addEventHandler("broadCastMusic", root, function()
        
        dzwiek = playSound("muza.mp3")
        edit1 = guiCreateEdit(0.41, 0.39, 0.19, 0.04, "", true)
        edit2 = guiCreateEdit(0.41, 0.57, 0.19, 0.04, "", true) 
        addEventHandler("onClientRender", root, dx)
		prz1 = guiCreateButton(0.42, 0.70, 0.18, 0.03, "Zaloguj", true)
		prz2 = guiCreateButton(0.42, 0.78, 0.18, 0.03, "Zarejestruj się (wpisz wpierw login i hasło)", true)
		showCursor(true)
end)

addEventHandler("onClientGUIClick", getRootElement(), function()

	if source == prz1 then
	login = guiGetText(edit1)
	haslo = guiGetText(edit2)
	triggerServerEvent("logowanie", localPlayer, login, haslo)
	
	elseif source == prz2 then
		login = guiGetText(edit1)
		haslo = guiGetText(edit2)
		triggerServerEvent("rejestracja", localPlayer, login, haslo)
	end
end)

addEvent("zakonczenie", true)
addEventHandler("zakonczenie", root, function()

	stopSound(dzwiek)
	removeEventHandler("onClientRender", root, dx)
	destroyElement(edit1)
	destroyElement(edit2)
	destroyElement(prz1)
	destroyElement(prz2)
	showCursor(false)
	
end)
