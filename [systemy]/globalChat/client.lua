local screenW, screenH = guiGetScreenSize ()

light = dxCreateFont ("Raleway-Light.ttf", 12)

dxDrawInfoText = {}

function stworzInfo (klucz,tekst)
	
	dxDrawInfoText[klucz] = {

		kl = klucz,
		text = tekst,
		bool = true,

	}

end

function setInfoBool (kl,bool)

	dxDrawInfoText[kl].bool = bool or false

end

function draw ()
	
	for k,v in ipairs(dxDrawInfoText) do
		if v.bool == true then
		
			progress = (getTickCount()-tick)/1000
			
			--rectangle
			
			local posx,posy,posz = screenW * 0.4177, screenH * -0.0481, screenW * 0.1547, screenH * 0.0537
			local endx,endy,endz = screenW * 0.4177, screenH * 0.0225, screenW * 0.1547, screenH * 0.0537
			local movex,movey,movez,moveh = interpolateBetween(posx,posy,posz,endx,endy,endz,progress,"OutQuad")
			
			dxDrawRectangle(movex,movey,movez,screenH * 0.0537, tocolor(0, 0, 0, 200), true)
			
			--text
			
			local x,y,z = screenW * 0.4182, screenH * -0.2454, screenW * 0.5724, screenH * 0.0102
			local x1,y1,z1= screenW * 0.4182, screenH * 0.0500, screenW * 0.5724, screenH * 0.0556
			local a,b,c,d = interpolateBetween(x,y,z,x1,y1,z1,progress,"OutQuad")
			
			dxDrawText(v.text, a,b,c,d, tocolor(255, 0, 0, 255), 1.00, light, "center", "center", false, false, true, false, false)
			
				if progress > 5 then
				
					removeEventHandler("onClientRender",root,draw)
					addEventHandler("onClientRender",root,removeDraw)
					tick = getTickCount()
					
				end
			   	
		end
	end

end
addEventHandler("onClientRender",root,draw)

function removeDraw ()
	
	for k,v in ipairs(dxDrawInfoText) do
		if v.bool == true then
			
			progress = (getTickCount()-tick)/1000
			local x5,y5,z5 = screenW * 0.4182, screenH * 0.0500, screenW * 0.5724, screenH * 0.0556
			local x2,y2,z2 = screenW * 0.4182, screenH * -0.2454, screenW * 0.5724, screenH * 0.0102
			local a1,b1,c1,d1 = interpolateBetween(x5,y5,z5,x2,y2,z2,progress,"OutQuad")
			
			dxDrawText(v.text, a1,b1,c1,d1, tocolor(255, 0, 0, 255), 1.00, light, "center", "center", false, false, true, false, false)
			
			-- rectangle
			
			local pos1,pos2,pos3 = screenW * 0.4177, screenH * 0.0225, screenW * 0.1547, screenH * 0.0537
			local pos4,pos5,pos6 =  screenW * 0.4177, screenH * -0.0481, screenW * 0.1547, screenH * 0.0537
			local posx,posy,posz = interpolateBetween(pos1,pos2,pos3,pos4,pos5,pos6,progress,"OutQuad")
			
			dxDrawRectangle(posx,posy,posz,screenH * 0.0537, tocolor(0, 0, 0, 200), true)
			
				if progress >= 1 then
				
					removeEventHandler("onClientRender",root,removeDraw)
				
				end
			
		end
	end

end



addCommandHandler("g",function(cmd,...)
	
	tick = getTickCount()
	local tekst = table.concat ( { ... }, " " )
	stworzInfo(1,tekst)

end)



