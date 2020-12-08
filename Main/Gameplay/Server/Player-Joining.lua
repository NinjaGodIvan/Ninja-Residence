--MarketPlace
local MarketPlace = game:GetService("MarketplaceService")
--List of Gamepass Items
local Gamepasses = {
	{Name = "Handless Segway", GamepassId = 11821227},
	{Name = "Golden Wings", GamepassId = 12314987}
}

--[[When the player joins the game, he or she will have
a house color. The value of 'House Color' changes once
the player claims the house.]]
game.Players.PlayerAdded:Connect(function(player)
	
	--Only certain player have access to this game until it is released
	if player.UserId ~= 107263163 and player.UserId ~= 1822766716 and player.UserId ~= 1066869454 then
		player:Kick("Game is under development at this time. Sorry.")
		return
	end

	--Goes through all gamepasses to see if the user owns any of them
	for _, gamepass in pairs(Gamepasses) do
		if MarketPlace:UserOwnsGamePassAsync(player.UserId, gamepass.GamepassId) then
			local cloneItem = game.ReplicatedStorage.GamepassItems:FindFirstChild(gamepass.Name):Clone()
			print(player.Name.." owns the "..gamepass.Name.." Gamepass.")
			cloneItem.Parent = player.Backpack
			cloneItem.Parent = player.StarterGear
		end
	end

	--Each player has its own house
	local House = Instance.new("StringValue", player)
	House.Name = "House"
	House.Value = "No House"
	
	--Used to remove Golden Wings from player if they are using R6 model
	player.CharacterAdded:Connect(function(char)
		if MarketPlace:UserOwnsGamePassAsync(player.UserId, 12314987) and char.Humanoid.RigType == Enum.HumanoidRigType.R6 then
			local GoldenWings = player.Backpack:FindFirstChild("Golden Wings")
			GoldenWings:Remove()
		end
	end)
end)
