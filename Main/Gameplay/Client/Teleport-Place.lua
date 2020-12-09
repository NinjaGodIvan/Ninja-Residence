--{{This script teleports the player to another place.]]

--Teleport Service
local TeleportService = game:GetService("TeleportService")
--Player
local Player = game.Players.LocalPlayer
--Teleport GUI
local Teleportation = script.Parent.Parent
--Message GUI
local Message = script.Parent.Parent.Parent:FindFirstChild("Message")
--Teleportation Button
local TeleportationButton = script.Parent.Parent.Parent:FindFirstChild("Teleport Button")
--CanPress Bool Value
local CanPress = TeleportationButton:FindFirstChild("CanPress")

--List of places
local Ninja_VIP_Island = script.Parent:FindFirstChild("Ninja VIP Island")
local NinjaGodIvanHouse = script.Parent:FindFirstChild("NinjaGodIvan's House")
local NinjaArena = script.Parent:FindFirstChild("Ninja Arena")
local NinjaArena2 = script.Parent:FindFirstChild("Ninja Arena 2")

--Handles teleportation 
function teleportPlayer(placeName, placeId)
	
	--Closes Teleport GUI
	Teleportation.Visible = false
	
	--Players can't press teleportation button anymore
	CanPress.Value = false
	
	--Opens message frame
	Message.Line2.Text = placeName
	Message.Visible = true
	
	wait(3)
	
	--Teleports players to another 
	TeleportService:Teleport(placeId)
end

--List of all buttons from teleportation frame
NinjaArena.MouseButton1Click:Connect(function()
	teleportPlayer(NinjaArena.Name, 1158121082)
end)

--EXCLUSIVE USERS ONLY
NinjaGodIvanHouse.MouseButton1Click:Connect(function()
	if not Player.UserId == 107263163 and not Player.UserId == 1066869454 then return end
	teleportPlayer(NinjaGodIvanHouse.Name, 471441252)
end)

