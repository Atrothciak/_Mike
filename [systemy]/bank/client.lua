local sx,sy = guiGetScreenSize ()
isDx = false
zalogowany = false

function isMouseInPosition ( x, y, width, height )
    if ( not isCursorShowing( ) ) then
        return false
    end
	local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end


local marker = createMarker(1496.8732910156,-1749.1577148438,14.4453125,"cylinder",2,0,0,0,150)

addEventHandler("onClientMarkerHit",root,function (hit,dim)

		if hit~=localPlayer and not dim then return end
			
				load_dx ()
				showCursor(true,false)
				isDx = true
				
end)

function load_dx ()
		
		exports.dxeditbox:dxDrawWindow(1,sx * 0.3505, sy * 0.3454, sx * 0.3443, sy * 0.3556)
		exports.dxeditbox:dxDrawEditBox(1,sx * 0.3615, sy * 0.3704, sx * 0.0724, sy * 0.0176)
		exports.dxeditbox:dxEditBoxSetLetters(1,3)
		exports.dxeditbox:dxTextDraw(1,sx * 0.3620, sy * 0.4306, sx * 0.4339, sy * 0.4481,"Zaloguj się (wpisz PIN)")
		exports.dxeditbox:dxTextDraw(2,sx * 0.3615, sy * 0.3593, sx * 0.4339, sy * 0.3704,"Wpisz swój PIN")
		exports.dxeditbox:dxTextDraw(3,sx * 0.3615, sy * 0.4907, sx * 0.4339, sy * 0.5093,"Zarejestruj się")
		exports.dxeditbox:dxDrawButton(1,sx * 0.3615, sy * 0.4306, sx * 0.0724, sy * 0.0176)
		exports.dxeditbox:dxDrawButton(2,sx * 0.3615, sy * 0.4917, sx * 0.0724, sy * 0.0176)
		klocek = exports.dxeditbox:dxDrawButton(3,sx * 0.3594, sy * 0.5796, sx * 0.1161, sy * 0.0620)

end

function marker_leave (leavingPlayer, matchingDimension)

		if leavingPlayer~=localPlayer and not matchingDimension then return end
		
			exports.dxeditbox:dxEditBoxSetVisible(1,false)
			exports.dxeditbox:dxTextSetVisible(1,false)
			exports.dxeditbox:dxTextSetVisible(2,false)
			exports.dxeditbox:dxTextSetVisible(3,false)
			exports.dxeditbox:setButtonVisible(1,false)
			exports.dxeditbox:setButtonVisible(2,false)
			exports.dxeditbox:setButtonVisible(3,false)
			exports.dxeditbox:dxDrawWindowSetVisible(1,false)
			
			exports.dxeditbox:dxDrawWindowSetVisible(2,false)
			exports.dxeditbox:dxTextSetVisible(4,false)
			exports.dxeditbox:dxTextSetVisible(5,false)
			exports.dxeditbox:dxTextSetVisible(6,false)
			exports.dxeditbox:dxEditBoxSetVisible(2,false)
			exports.dxeditbox:dxEditBoxSetVisible(3,false)
			exports.dxeditbox:setButtonVisible(3,false)
			exports.dxeditbox:setButtonVisible(4,false)
			
			showCursor(false)
			isDx = false

end
addEventHandler("onClientMarkerLeave",marker,marker_leave)

addEventHandler("onClientClick",root,function()
	
		if isMouseInPosition(sx * 0.3594, sy * 0.5796, sx * 0.1161, sy * 0.0620) then
			
			if isDx == true then
				
				kasa1 = exports.dxeditbox:dxEditBoxGetText(1)
				
					if #kasa1 >0 and zalogowany == false then
						triggerServerEvent("zaloguj",localPlayer,localPlayer,kasa1)
						
		
					end
				
			end
		end
		
		if isMouseInPosition(sx * 0.5719, sy * 0.3620, sx * 0.0870, sy * 0.0522) then
		
			if zalogowany == true then
			
					pieniadze = exports.dxeditbox:dxEditBoxGetText(2)
					
						if #pieniadze >0 then
							triggerServerEvent("add_kasa",localPlayer,localPlayer,pieniadze)
						end
						
			end
		
		end


end)

addEvent("zalogowano",true)
addEventHandler("zalogowano",root,function(hajs)
			
			exports.dxeditbox:dxEditBoxSetVisible(1,false)
			exports.dxeditbox:dxTextSetVisible(1,false)
			exports.dxeditbox:dxTextSetVisible(2,false)
			exports.dxeditbox:dxTextSetVisible(3,false)
			exports.dxeditbox:setButtonVisible(1,false)
			exports.dxeditbox:setButtonVisible(2,false)
			exports.dxeditbox:setButtonVisible(3,false)
			exports.dxeditbox:dxDrawWindowSetVisible(1,false)
		
			zalogowany = true
		
		exports.dxeditbox:dxDrawWindow(2,sx * 0.3563, sy * 0.3222, sx * 0.3073, sy * 0.4065)
		exports.dxeditbox:dxTextDraw(4,sx * 0.4594, sy * 0.3398, sx * 0.5505, sy * 0.3593,"Wpłać")
		exports.dxeditbox:dxDrawEditBox(2,sx * 0.4646, sy * 0.3630, sx * 0.0828, sy * 0.0222)
		exports.dxeditbox:dxTextDraw(5,sx * 0.4594, sy * 0.4287, sx * 0.5505, sy * 0.4481,"Wypłać")
		exports.dxeditbox:dxDrawEditBox(3,sx * 0.4646, sy * 0.4574, sx * 0.0828, sy * 0.0222)
		exports.dxeditbox:dxTextDraw(6,sx * 0.4656, sy * 0.5167, sx * 0.5474, sy * 0.5370,"Kasa w banku: "..hajs)
		exports.dxeditbox:dxDrawButton(3,sx * 0.5719, sy * 0.3620, sx * 0.0870, sy * 0.0522)
		exports.dxeditbox:dxDrawButton(4,sx * 0.5698, sy * 0.4593, sx * 0.0870, sy * 0.0522)

end)
