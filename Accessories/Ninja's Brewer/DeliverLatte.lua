--Takes Creamed Latte
script.Parent.ClickDetector.MouseClick:Connect(function(player)
	if not player.Character:FindFirstChild("Creamed Latte") and not player.Backpack:FindFirstChild("Creamed Latte") then
		
		--Empties out coffee from the glass
		local CoffeeFromGlass = script.Parent:FindFirstChild("Coffee Stage 3")
		CoffeeFromGlass.Transparency = 1
		
		--Adds Starblox Coffee in the player's backpack and starter gear
		local StarbloxCoffeeBP = game.ReplicatedStorage.Foods:FindFirstChild("Creamed Latte"):Clone()
		local StarbloxCoffeeSG = game.ReplicatedStorage.Foods:FindFirstChild("Creamed Latte"):Clone()
		StarbloxCoffeeBP.Parent = player.Backpack
		StarbloxCoffeeSG.Parent = player.StarterGear
		
		--Glass is now unclickable
		script.Parent.ClickDetector.MaxActivationDistance = 0
	end
end)
