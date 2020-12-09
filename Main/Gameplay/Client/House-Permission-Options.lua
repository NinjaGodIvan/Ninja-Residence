--[[This script changes the state of the permission settings if guests are allowed
to use anything in the house.]]

--Doors Permission Option
local DoorsPermission = script.Parent:FindFirstChild("Doors Permission Option")
local DoorsEnableButton = DoorsPermission:FindFirstChild("Enable Button")
--Lights Permission Option
local LightsPermission = script.Parent:FindFirstChild("Lights Permission Option")
local LightsEnableButton = LightsPermission:FindFirstChild("Enable Button")
--Kitchen Permission Option
local KitchenPermission = script.Parent:FindFirstChild("Kitchen Permission Option")
local KitchenEnableButton = KitchenPermission:FindFirstChild("Enable Button")
--Bathroom Permission Option
local BathroomPermission = script.Parent:FindFirstChild("Bathroom Permission Option")
local BathroomEnableButton = BathroomPermission:FindFirstChild("Enable Button")

--Switches the button state and communicates with the server for enabling or disabling permissions 
function OptionHandler(option_name, permission_key)
	
	--Option Frame
	local PermissionType = script.Parent:FindFirstChild(option_name)
	
	--Option Enable Button 
	local Button = PermissionType:FindFirstChild("Enable Button")
	
	--If true, then server will enable specified permission to guests
	local can_allow
	
	if Button.Text == "Yes" then --Disable permissions to guests 
		Button.Text = "No"
		Button.BackgroundColor3 = Color3.fromRGB(252, 1, 7)
		can_allow = false
	else --Enable permissions to guests
		Button.Text = "Yes"
		Button.BackgroundColor3 = Color3.fromRGB(128,255,7)
		can_allow = true
	end
	
	--Tells server to change player's house properties
	game.ReplicatedStorage:FindFirstChild("HS Permissions Handler"):FireServer(permission_key, can_allow)
end



--[[List of all enable buttons]]
DoorsEnableButton.MouseButton1Click:Connect(function() 
	OptionHandler("Doors Permission Option", 1) 
end)

LightsEnableButton.MouseButton1Click:Connect(function() 
	OptionHandler("Lights Permission Option", 2) 
end)

KitchenEnableButton.MouseButton1Click:Connect(function() 
	OptionHandler("Kitchen Permission Option", 3) 
end)

BathroomEnableButton.MouseButton1Click:Connect(function() 
	OptionHandler("Bathroom Permission Option", 4) 
end)
