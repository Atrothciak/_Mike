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

function deleteLastLetter(text,ile)
			if tostring(text) and tonumber(ile) then
				asd = utf8.sub(text, 1, string.len(text)-ile)
				return asd
			end
			return false
end

local edits = {

	editbox = {},
	dozwolone={ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k","l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"},
	window = {},
	dxText = {},
	button = {},
	
}

light = dxCreateFont ("Raleway-Light.ttf", 12)
edit = false

function dxDrawEditBox (idd, posX, posY, posW,posH)
		
		edits.editbox[idd] = {
		
			visible = true,
			id = idd,
			x = posX,
			y = posY,
			w = posW,
			h = posH,
			text = "",
			on = false,
			znaki = 20,
			
		}

end

function dxEditBoxGetText(id)
	
	return edits.editbox[id].text 
	
end

function dxEditBoxSetVisible(id, bool)
	
	edits.editbox[id].visible = bool or false
	
end

function dxEditBoxSetLetters(id,liczba)

	edits.editbox[id].znaki = tonumber(liczba)

end

function dxDrawWindow (idd, posX, posY, posW,posH,r,g,b,alpha)

	edits.window[idd] = {
	
		id = idd,
		visible = true,
		x = posX,
		y = posY,
		w = posW,
		h = posH,
		rr=r,
		gg=g,
		bb=b,
		alpha = alphaa,
	
	}

end

function dxTextDraw (idd,posX,posY,posW,posH,teext)
	
		edits.dxText[idd] = {
			
			visible = true,
			id = idd,
			x = posX,
			y = posY,
			w = posW,
			h = posH,
			text = teext
			
		}

end

function dxTextSetVisible (idd, bool)

	edits.dxText[idd].visible = bool or false
	
end

function dxDrawButton (idd,posX,posY,posW,posH)

	edits.button[idd] = {
	
		visible = true,
		id = idd,
		x = posX,
		y = posY,
		w = posW,
		h = posH,

	}
	
end

function setButtonVisible(idd,bool)
	
		edits.button[idd].visible = bool or false
		
end

function dxDrawWindowSetVisible(idd,bool)

		edits.window[idd].visible = bool or false

end

addEventHandler("onClientKey",root,function(btn,prs)

		if prs then
		
				for k,v in ipairs(edits.editbox) do
					
					if v.on == true then
					
						for k,litera in pairs(edits.dozwolone) do
					
							if btn == litera then
								if #edits.editbox[v.id].text <= v.znaki then
							
									edits.editbox[v.id].text = edits.editbox[v.id].text ..litera
								
								end
							end
						
							if btn == "backspace" then
							
								if #edits.editbox[v.id].text > 0 then
									
										edits.editbox[v.id].text = deleteLastLetter(edits.editbox[v.id].text, 1)
							
								end
							
							end
							
							if button == litera and getKeyState("lshift") then
								
								edits.editbox[v.id].text = edits.editbox[v.id].text..string.upper(litera)
								break
								
							end
					
					end
				end
				
				end
		end
		
end)


addEventHandler("onClientRender",root,function()
	
		for k,v in ipairs(edits.editbox) do
			if v.visible == true then
				dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(255,255,255,100,true))
				dxDrawText(v.text,v.x, v.y, v.x+v.w, v.y+v.h,tocolor ( 0, 0, 0, 255 ), 1,light,"center","center",false,false,true)
			end
		end
		
		for k,v in ipairs(edits.window) do
			if v.visible == true then
				dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(0,0,0,100))
			end
		end
		
		for k,v in ipairs(edits.dxText) do
			
			if v.visible == true then
				dxDrawText(v.text, v.x, v.y, v.w, v.h, tocolor(0, 0, 0, 255), 1.00, light, "center", "center", false, false, true, false, false)
			end
		end
		
		for k,v in ipairs(edits.button) do
		
				if v.visible == true then
				
						dxDrawRectangle(v.x,v.y,v.w,v.h,tocolor(255,255,255,150,true))
				
				end
				
		end
		
end)

addEventHandler("onClientClick",root,function()

	for k,v in ipairs(edits.editbox) do
		
		if isMouseInPosition(v.x,v.y,v.w,v.h) then
			if v.visible == true then	
				edits.editbox[v.id].on = true
			
			end
			
		elseif not isMouseInPosition(v.x,v.y,v.w,v.h) then
			if v.visible == true then
				edits.editbox[v.id].on = false
			end
			end
		
	end
	
	for k,v in ipairs(edits.button) do
	
		if isMouseInPosition(v.x,v.y,v.w,v.h) then
		
		
		end
	
	end

end)