local function event (thePlayer)

	veh = createVehicle(552,-152.70472717285,1181.8046875,18.7421875 +1)
	warpPedIntoVehicle(thePlayer,veh)
	bindKey(thePlayer,"h", "down",hit)
	create(thePlayer)

end
addEvent("job_start",true)
addEventHandler("job_start",root,event)

local pos = {
{-109.69773864746,1262.4504394531,15.565181732178},
{-38.537364959717,1272.3171386719,8.3568592071533},
{29.157079696655,1263.6407470703,11.244177818298},
}

local blip = {}

function create (thePlayer)

		for k,v in ipairs(pos) do
			obj = createObject(713, v[1], v[2], v[3]-1)
			blip[obj] = createBlipAttachedTo(obj,41)
			setElementVisibleTo(obj,thePlayer,true)
		end
		
		for gracz,gracze in ipairs(getElementsByType("player")) do
			bindKey(gracze,"h", "down",hit)
		end
end

scinanie = false

function hit (thePlayer)

		for _,tree in ipairs(getElementsByType("object", resourceRoot)) do
			if isElement(tree) then
				local x,y,z = getElementPosition(tree)
				local x1,y1,z1 = getElementPosition(thePlayer)
				distance = getDistanceBetweenPoints3D(x1,y1,z1,x,y,z)
		
					if distance < 3 and scinanie == false then
					
						setElementFrozen(thePlayer,true)
						scinanie = true
						setPedAnimation(thePlayer,"CHAINSAW","csaw_part")
						destroyElement(blip[tree])
					
							setTimer(function()
								setPedAnimation(thePlayer,false)
								scinanie = false
								setElementFrozen(thePlayer,false)
								givePlayerMoney(thePlayer,10)
								
									destroyElement(tree)
								
							end,1000,1)
		
					end
		
				end
		end
end
