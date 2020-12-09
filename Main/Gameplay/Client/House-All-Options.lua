--[[This script changes the states of all objects.]]

--All Door Settings
local AllDoorsSettings = script.Parent:FindFirstChild("All Doors Settings")

--Tells the server to open all doors
AllDoorsSettings:FindFirstChild("Open Button").MouseButton1Click:Connect(function()
	game.ReplicatedStorage:FindFirstChild("HS All Handler"):FireServer("Door", true)
end)

--Tells the server to close all doors
AllDoorsSettings:FindFirstChild("Close Button").MouseButton1Click:Connect(function()
	game.ReplicatedStorage:FindFirstChild("HS All Handler"):FireServer("Door", false)
end)