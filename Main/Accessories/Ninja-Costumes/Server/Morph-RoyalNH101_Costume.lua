--[[Player is required to use R6 model and own the gamepass to morph into
this model.]]

--MarketPlaceServices
local MarketplaceServices = game:GetService("MarketplaceService")

--Changes player's character package
function changeCharacterPackage(character)
	
	--Ninja Royal Package
	local Package = game.ServerStorage:FindFirstChild("Ninja Royal Package")
	
	--Clears player's package parts
	for _, obj in pairs(character:GetChildren()) do
		if obj:IsA('CharacterMesh') then
			obj:Remove()
		end
	end
	
	--Adds Ninja Royal package parts to player
	for _, obj in pairs(Package:GetChildren()) do
		obj:Clone().Parent = character
	end
end


--Changes clothes
script.Parent.ClickDetector.MouseClick:Connect(function(player)
		
	--Player's Character
	local character = player.Character
	
	--Player can't be dead
	if character.Humanoid.Health == 0 then return end
	
	--Player must have Ninja Heroes 101 Royal Costume Gamepass
	if not MarketplaceServices:UserOwnsGamePassAsync(player.UserId, 12331587) then
		MarketplaceServices:PromptGamePassPurchase(player, 12331587)
		return
	end
	
	--Player must use R6
	if character.Humanoid.RigType ~= Enum.HumanoidRigType.R6 then return end
	
	--Player's Shirt, Pants, and other accessories
	local Shirt = character:FindFirstChild("Shirt")
	local NinjaMask = character:FindFirstChild("NinjaRedMaskOfShadows")
	local NinjaTwinSwords = character:FindFirstChild("NinjaTwinSwords")
	local NinjaAssassinBelt = character:FindFirstChild("AssassinsBelt")
	
	--Adds shirt if the player isn't wearing it
	if not Shirt then
		Shirt = Instance.new("Shirt", character)
		Shirt.Name = "Shirt"
	end
	
	--Sets player's shirt template
	Shirt.ShirtTemplate = script.Parent.Shirt.ShirtTemplate
	
	--Adds Ninja Mask accessory to character
	if not NinjaMask then
		character.Humanoid:AddAccessory(game.ServerStorage.Accessories:FindFirstChild("NinjaRedMaskOfShadows"):Clone())
	end
	
	--Adds Ninja Twin Swords accessory to character
	if not NinjaTwinSwords then
		character.Humanoid:AddAccessory(game.ServerStorage.Accessories:FindFirstChild("NinjaTwinRoyalSwords"):Clone())
	end
	
	--Adds Assassin Belt accessory to character
	if not NinjaAssassinBelt then
		character.Humanoid:AddAccessory(game.ServerStorage.Accessories:FindFirstChild("AssassinsBelt"):Clone())
	end
	
	--Needs to remove existing character package and replace them with Ninja Royal's package.
	changeCharacterPackage(character)
end)