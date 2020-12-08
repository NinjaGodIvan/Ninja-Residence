--Adds food item in the player's inventory
game.ReplicatedStorage:FindFirstChild("Send Food To Player").OnServerEvent:Connect(function(player, food)
	if not player.Character:FindFirstChild(food) and not player.Backpack:FindFirstChild(food) then
		
		--Cloning items twice (One for Backpack and other for StarterGear
		local BP_Food = game.ReplicatedStorage.Foods:FindFirstChild(food):Clone()
		local SG_Food = game.ReplicatedStorage.Foods:FindFirstChild(food):Clone()
		
		--Adds food in player's backpack and starter gear
		BP_Food.Parent = player.Backpack
		SG_Food.Parent = player.StarterGear
	end
end)