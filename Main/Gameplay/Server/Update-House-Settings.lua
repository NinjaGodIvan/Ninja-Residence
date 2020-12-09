--[[This script is responsible for assisting the client in handling house settings. ]]

--Opens or closes all doors
function AllDoorHandler(House, transparency, canCollide)
	
	--List of Door Model
	local DoorModelList = {"Bathroom Door" ,"Bedroom Door", "Kitchen Door"}
	
	--Loops through all doors
	for _, a in pairs(DoorModelList) do
		--Gets the door model
		local doorModel = House:FindFirstChild(a)
		--Gets the door from door model
		local door = doorModel:FindFirstChild("Door")
		--Opens or closes all doors
		door.Transparency = transparency
		door.CanCollide = canCollide
	end
end

--Turns on or off all lights
function AllLightsHandler(House, state)
	
end

--Deals with changing the state of all objects of one category
game.ReplicatedStorage:FindFirstChild("HS All Handler").OnServerEvent:Connect(function(player, object, state)
	
	--Gets player's house model from Workspace
	local House = game.Workspace:FindFirstChild(player.House.Value)
	
	if object == "Door" and state then --Opens all doors
		AllDoorHandler(House, 1, false)
		print("All doors are opened!")
	elseif object == "Door" and not state then --Closes all doors
		AllDoorHandler(House, 0, true)
		print("All doors are closed!")
	end
end)

--Deals with guest's permissions to use any house accessories
game.ReplicatedStorage:FindFirstChild("HS Permissions Handler").OnServerEvent:Connect(function(player, permission_key, can_allow)
	
	--Gets player's house model from Workspace
	local House = game.Workspace:FindFirstChild(player.House.Value)
	
	--Selects settings
	if permission_key == 1 then
		if can_allow then 
			
		else
			
		end
	elseif permission_key == 2 then
		
	end
end)