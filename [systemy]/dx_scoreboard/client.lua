local sx, sy = guiGetScreenSize()
isDX = false

local rows = {}
rows.p = 1
rows.on = 20

local function load ()
	
		players = {}
			
				for k,v in ipairs(getElementsByType("player")) do
					if v ~= localPlayer then
						
						table.insert(players,v)
						
					end
				
				end
				
		local _players = players
		players = {}
		table.insert(players,localPlayer)
		
			for i = 1,#_players do
			
				players[i+1] = _players[i]
			
			end
			_players = nil
			
			v_players = #players
			
end
addEventHandler("onClientRender",root,load)

local function dxRender ()
	
	local i = 1
	
			dxDrawRectangle(sx * 0.2615, sy * 0.2935, sx * 0.5036, sy * 0.4944, tocolor(3, 0, 0, 198), false)
			dxDrawRectangle(sx * 0.2703, sy * 0.3111, sx * 0.4896, sy * 0.0481, tocolor(26, 114, 8, 215), false)
            dxDrawText("Nick", sx * 0.2703, sy * 0.3102, sx * 0.3495, sy * 0.3593, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText("Ping", sx * 0.3703, sy * 0.3102, sx * 0.3495, sy * 0.3593, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
			
			for k, v in ipairs(players) do
			
					if k >= (rows.p - 1) * rows.on and k < rows.p * rows.on then
					
						dxDrawText(getPlayerName(v), sx * 0.2703, sy * 0.3593+ (i - 1) * 20, sx * 0.3495, sy * 0.4083+ (i - 1) * 20, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
						dxDrawText(getPlayerPing(v), sx * 0.3703, sy * 0.3593+ (i - 1) * 20, sx * 0.3495, sy * 0.4083+ (i - 1) * 20, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
						
						i = i+1
						
					end
					
			end

end

bindKey("F2","down",function()

                if isDX == false then
                        
                        isDX = true
                        addEventHandler( "onClientRender",root,dxRender )
						       
                elseif isDX == true then
                
                        isDX = false
                        removeEventHandler( "onClientRender",root,dxRender )
                
                end
                
end)

bindKey("mouse_wheel_down", "down",function()
				
				local max = math.floor(v_players / rows.on)+1
				if max == rows.p then return end
                rows.p = rows.p + 1
                
end)

bindKey("mouse_wheel_up", "down",function()

                if rows.p == 1 then return end
                rows.p = rows.p - 1

end)