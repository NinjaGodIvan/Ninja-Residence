--Open Menu Remote
local OpenMenu = game.ReplicatedStorage:FindFirstChild("Open Menu")
--Close Menu Remote
local CloseMenu = game.ReplicatedStorage:FindFirstChild("Close Menu")
--Menu GUI
local MenuGUI = script.Parent
--Menu
local Menu = MenuGUI:FindFirstChild("Menu")
--Close Button
local Close = Menu:FindFirstChild("Exit")

--SendFoodToPlayer Remote Event
local SendFoodToPlayer = game.ReplicatedStorage:FindFirstChild("Send Food To Player")

--Opens the Ninja Cafe Menu GUI
OpenMenu.OnClientEvent:Connect(function()
	if MenuGUI.Visible then return end
	MenuGUI.Visible = true
end)

--Closes the Ninja Cafe Menu GUI
function closeMenu()
	if not MenuGUI.Visible then return end
	MenuGUI.Visible = false
end

CloseMenu.OnClientEvent:Connect(closeMenu)
Close.MouseButton1Click:Connect(closeMenu)

--FOODS FROM THE MENU
Menu:FindFirstChild("Cheeseburger").MouseButton1Click:Connect(function()
	SendFoodToPlayer:FireServer("Cheeseburger")
end)

Menu:FindFirstChild("Pizza").MouseButton1Click:Connect(function()
	SendFoodToPlayer:FireServer("Pizza")
end)

Menu:FindFirstChild("Hot Dog").MouseButton1Click:Connect(function()
	SendFoodToPlayer:FireServer("Hot Dog")
end)

Menu:FindFirstChild("Taco").MouseButton1Click:Connect(function()
	SendFoodToPlayer:FireServer("Taco")
end)

Menu:FindFirstChild("Sandwich").MouseButton1Click:Connect(function()
	SendFoodToPlayer:FireServer("Sandwich")
end)

--DRINKS FROM THE MENU
Menu:FindFirstChild("Water").MouseButton1Click:Connect(function()
	SendFoodToPlayer:FireServer("Water")
end)

Menu:FindFirstChild("Starblox Coffee").MouseButton1Click:Connect(function()
	SendFoodToPlayer:FireServer("Starblox Coffee")
end)

Menu:FindFirstChild("Orange Juice").MouseButton1Click:Connect(function()
	SendFoodToPlayer:FireServer("Orange Juice")
end)

Menu:FindFirstChild("Bloxy Cola").MouseButton1Click:Connect(function()
	SendFoodToPlayer:FireServer("Bloxy Cola")
end)

Menu:FindFirstChild("Milk").MouseButton1Click:Connect(function()
	SendFoodToPlayer:FireServer("Milk")
end)