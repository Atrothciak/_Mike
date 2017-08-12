--[[

Autor: _Mike
Zakaz kopiowania bez zgody autora!

--]]

local sx, sy = guiGetScreenSize ()

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

czcionka = "default-bold"
isDx = false

marker = createMarker(-145.59536743164,1174.7720947266,18.7421875,"cylinder",1.5,255,255,255,100)
createBlipAttachedTo(marker,51)

local function load ()
		
		dxDrawRectangle(sx * 0.3276, sy * 0.3352, sx * 0.3411, sy * 0.4250, tocolor(0, 0, 0, 174), false)
        dxDrawRectangle(sx * 0.3349, sy * 0.7167, sx * 0.0974, sy * 0.0287, tocolor(21, 59, 223, 248), false)
        dxDrawRectangle(sx * 0.5573, sy * 0.7167, sx * 0.0974, sy * 0.0287, tocolor(21, 59, 223, 248), false)
        dxDrawText("Rozpocznij", sx * 0.3354, sy * 0.7176, sx * 0.4323, sy * 0.7454, tocolor(255, 255, 255, 255), 1.00, czcionka, "center", "center", false, false, false, false, false)
        dxDrawText("Zamknij ", sx * 0.5573, sy * 0.7176, sx * 0.6542, sy * 0.7454, tocolor(255, 255, 255, 255), 1.00, czcionka, "center", "center", false, false, false, false, false)
        dxDrawText("Praca polega na ścięciu drewna oraz odwiezienia go do tartaku.", sx * 0.3354, sy * 0.3509, sx * 0.4661, sy * 0.3731, tocolor(255, 255, 255, 255), 1.00, czcionka, "left", "top", false, false, false, false, false)
		
end

local function onClick (btn,state)
	if btn and state then
		if isDx == true then
			if isMouseInPosition(sx * 0.3349, sy * 0.7167, sx * 0.0974, sy * 0.0287) then
			
					triggerServerEvent("job_start",localPlayer,localPlayer)
					showCursor(false)
					isDx = false
					removeEventHandler("onClientRender",root,load)
			
			elseif isMouseInPosition(sx * 0.5573, sy * 0.7167, sx * 0.0974, sy * 0.0287) then
			
					isDx = false
					removeEventHandler("onClientRender",root,load)
				
			end
		end
	end
end
addEventHandler("onClientClick",root,onClick)

addEventHandler("onClientMarkerHit",root,function(hit,dim)
	
	if hit ~=localPlayer and not dim then return end
	
		if isDx == false then
		
			addEventHandler("onClientRender",root,load)
			isDx = true
			showCursor(true)
		
		end
	
end)