--[[When player clicks the model. It will dress the character as an act of morphing
to the model.]]


--Changes clothes
script.Parent.ClickDetector.MouseClick:Connect(function(player)
	
	--Player's Character
	local character = player.Character
	
	if character.Humanoid.Health == 0 then return end
	
	--Player's Shirt, Pants, and Ninja Mask
	local Shirt = character:FindFirstChild("Shirt")
	local Pants = character:FindFirstChild("Pants")
	local NinjaMask = character:FindFirstChild("NinjaMaskOfShadows")
	local NinjaTwinSwords = character:FindFirstChild("NinjaTwinSwords")
	
	--Adds shirt if the player isn't wearing it
	if not Shirt then
		Shirt = Instance.new("Shirt", character)
		Shirt.Name = "Shirt"
	end
	
	--Sets player's shirt template
	Shirt.ShirtTemplate = script.Parent.Shirt.ShirtTemplate
	
	--Adds pants if the player isn't wearing it
	if not Pants then
		Pants = Instance.new("Pants", character)
		Pants.Name = "Pants"
	end
	
	--Sets player's pants template
	Pants.PantsTemplate = script.Parent.Pants.PantsTemplate
	
	--Adds Ninja Mask accessory to character
	if not NinjaMask then
		character.Humanoid:AddAccessory(game.ServerStorage.Accessories:FindFirstChild("NinjaMaskOfShadows"):Clone())
	else
		print("hh")
	end
	
	--Adds Ninja Twin Swords accessory to character
	if not NinjaTwinSwords then
		character.Humanoid:AddAccessory(game.ServerStorage.Accessories:FindFirstChild("NinjaTwinSwords"):Clone())
	end
	
	--Avatar's Torso
	local torso
	
	--Finds avatar torso based on their model
	if character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
		torso = character:FindFirstChild("UpperTorso")
	else
		torso = character:FindFirstChild("Torso")
	end
	
	--Changes avatar torso brick color
	torso.BrickColor = BrickColor.new("Really black")
end)