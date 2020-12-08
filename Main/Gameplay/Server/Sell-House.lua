--Closes all doors
function CloseAllDoors(house)
	
end

--Turns off all lights
function TurnOffAllLights(house)
	
end

--Turns off all sinks
function TurnOffAllSinks(house)
	
end

--Turns off the Jacuzzi
function TurnOffJacuzzi(house)
	
end

--Turns off the Shower
function TurnOffShower(house)
	
end

--Turns off all house guests' permission
function TurnOffAllPermissions(house)
	
end

--Sells the house 
function SellHouse(player)
	--Gets player's house color
	local House = player:WaitForChild("House")

	--Jumps out if the player doesn't own a house
	if House.Value == "No House" then return end

	--Gets player's house model from the Workspace
	local HouseModel = game.Workspace:FindFirstChild(House.Value)

	--Turns everything off everything in the house
	CloseAllDoors(HouseModel)
	TurnOffAllLights(HouseModel)
	TurnOffAllSinks(HouseModel)
	TurnOffJacuzzi(HouseModel)
	TurnOffShower(HouseModel)
	TurnOffAllPermissions(HouseModel)
end

--Fires when the player leaves the game
game.Players.PlayerRemoving:Connect(SellHouse)