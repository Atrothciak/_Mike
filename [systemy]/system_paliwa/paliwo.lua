       tick = getTickCount()

function paliwo(veh)
if (getTickCount()-tick > 4000) then
        local paliwoo = getElementData(veh,"paliwo") or 0
        local vx,vy,vz = getElementVelocity(veh)
        local speed = ((vx^2 + vy^2 + vz^2)^(0.5)/100)
        if speed > 0 then
            paliwoo = paliwoo - (speed/30)
            setElementData(veh,"paliwo",paliwoo )
        end
        if getElementData(veh,"paliwo") <= 0 then
            setVehicleEngineState(veh,false)
        end
end
end

addEventHandler("onClientRender",root,function()
    local vh = getPedOccupiedVehicle(localPlayer)
    if vh then
    paliwo(vh)
    end
end)

local screenW, screenH = guiGetScreenSize()
addEventHandler("onClientRender", root,
    function()
    local veh = getPedOccupiedVehicle(localPlayer)
        if veh and getElementData(veh, "veh:id") == true then
                local paliwo = getElementData(veh, "paliwo") or "Brak danych."
                        dxDrawLine((screenW * 0.7880) - 1, (screenH * 0.6917) - 1, (screenW * 0.7880) - 1, screenH * 0.9028, tocolor(0, 0, 0, 255), 1, false)
                        dxDrawLine(screenW * 0.9948, (screenH * 0.6917) - 1, (screenW * 0.7880) - 1, (screenH * 0.6917) - 1, tocolor(0, 0, 0, 255), 1, false)
                        dxDrawLine((screenW * 0.7880) - 1, screenH * 0.9028, screenW * 0.9948, screenH * 0.9028, tocolor(0, 0, 0, 255), 1, false)
                        dxDrawLine(screenW * 0.9948, screenH * 0.9028, screenW * 0.9948, (screenH * 0.6917) - 1, tocolor(0, 0, 0, 255), 1, false)
                        dxDrawRectangle(screenW * 0.7880, screenH * 0.6917, screenW * 0.2068, screenH * 0.2111, tocolor(110, 110, 110, 126), false)
                        dxDrawText("Paliwo: " ..paliwo.. "l", screenW * 0.7943, screenH * 0.8713, screenW * 0.8760, screenH * 0.8991, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "top", false, false, false, false, false) 
    end
    end
)


local marker = createMarker(2200.033203125,2473.0915527344,10.338660240173 -1, "cylinder", 4,0,0,0,200)

function paliwo_dolej ()
	if isElementWithinMarker(localPlayer, marker) then
	local veh = getPedOccupiedVehicle(localPlayer)
	if veh then
		local paliwo = getElementData(veh, "paliwo")
		setElementData(veh, "paliwo", paliwo + 5)
	end
end
end
bindKey("h", "down", paliwo_dolej)
