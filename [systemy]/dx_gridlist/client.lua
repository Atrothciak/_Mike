local sx, sy = guiGetScreenSize()
local px, py = sx/1280,sy/768

light = dxCreateFont("Raleway-Light.ttf")

local rows = 50
local ivisible = 10
currect = 0

addEventHandler("onClientRender",root,function ()
	
	local height = 20*py
	
	for i = currect, ivisible + currect -1 do
	
		visible = i  - currect
	
		dxDrawText("cos_" ..i, 500*px, 100*py+height*visible, 100*px, 300*py+height*(visible+1), tocolor(255, 255, 255, 255), 1, light, "left", "top", false, false, false, false, false)
		
	end

end)

bindKey("mouse_wheel_up", "down", function()
		
		currect = currect - 1
		if currect < 0 then currect = 0 end

end)
	
bindKey("mouse_wheel_down", "down", function()
		
		currect = currect + 1
		if currect > rows-ivisible then currect = rows-ivisible end
	
end)


