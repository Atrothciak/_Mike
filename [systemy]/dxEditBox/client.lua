local screenW, screenH = guiGetScreenSize ()

light = dxCreateFont ("Raleway-Light.ttf", 12)

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

local znaki ={ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k","l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}

local dxEditBox = {}

function usunostatnialitere (tekst)
		
		asd = utf8.sub(tekst, 1, string.len(tekst)-1)
		return asd

end

function stworzEditBox (klucz,posX,posY,posS,posW)
	
	dxEditBox[klucz] = {
		
		kl = klucz,
		x = posX,
		y = posY,
		s = posS,
		w = posW,
		tekst = "",
		bool = true,
		aktywny = false,
		
	}

end

function pobierzTekst (kl)

	return dxEditBox[kl].tekst

end

function usunEditBox (kl,bool)

	dxEditBox[kl].bool = bool or false

end


addEventHandler("onClientRender",root,function ()

	for k,v in ipairs(dxEditBox) do
		
		if v.bool == true then
		
			dxDrawRectangle(v.x, v.y, v.s, v.w, tocolor(255, 255, 255, 255), true)
			dxDrawText(v.tekst,v.x, v.y, v.x+v.s, v.y+v.w, tocolor(0, 0, 0, 255), 1.00, light, "center", "center", false, false, true, false, false)
			
		end
	end

end)

addEventHandler("onClientKey",root,function(przycisk,stan)

		if stan then
			
			for _,v in ipairs(dxEditBox) do
				
				for _,litery in ipairs(znaki) do
				
					if przycisk == litery then
						
						if #dxEditBox[v.kl].tekst <= 16 and v.aktywny then
						
							dxEditBox[v.kl].tekst = dxEditBox[v.kl].tekst ..litery
						
						end
					end
					
					if przycisk == "backspace" then
					
						if #dxEditBox[v.kl].tekst > 0 then
						
							dxEditBox[v.kl].tekst = usunostatnialitere(dxEditBox[v.kl].tekst)
							break
							
						end
					
					end
			
				end
			end
		end

end)

addEventHandler("onClientClick",root,function(przycisk,stan)
	
		if przycisk and stan then
			
			for _,v in ipairs(dxEditBox) do
				if isMouseInPosition(v.x, v.y, v.s, v.w) then
				
					v.aktywny = true
					
				elseif not isMouseInPosition(v.x, v.y, v.s, v.w) then
				
					v.aktywny = false
				
				end
				
			end
			
		end
	
end)