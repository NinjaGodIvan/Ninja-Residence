--[[This script is responsible for assisting the client in handling house settings.]]

--Server needs to deal with player's house settings
local HS_Handler = game.ReplicatedStorage:FindFirstChild("HS Handler")

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

--[[Handles house settings
1: Doors Permissions
2: Lights Permission
]]
HS_Handler.OnServerEvent:Connect(function(player, permission_key, can_allow)
	
	--Gets player's house model from Workspace
	local House = game.Workspace:FindFirstChild(player.House.Value)
	
end)