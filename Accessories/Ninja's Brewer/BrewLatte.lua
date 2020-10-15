-- Don't mind about the coffee text. It's meant to be latte since I made changes.

--Coffee Station
local CoffeeStation = script.Parent.Parent
--Coffee Glass
local CoffeeGlass = script.Parent.Parent.Parent:FindFirstChild("Coffee Glass")
--ClickDetector
local ClickDetector = CoffeeGlass:FindFirstChild("ClickDetector")
--Coffee Pouring Sound
local CoffeePouring = CoffeeGlass.Glass:FindFirstChild("Coffee Pouring")
--List of Coffee Stages
local CoffeeStages = {
	CoffeeGlass:FindFirstChild("Coffee Stage 1"), 
	CoffeeGlass:FindFirstChild("Coffee Stage 2"),
	CoffeeGlass:FindFirstChild("Coffee Stage 3")
}
--Screen Message
local Message = script.Parent.Parent.Screen.SurfaceGui:FindFirstChild("Message")
--debouncer
local debounce = false

--Starts Coffee Making!
script.Parent.ClickDetector.MouseClick:Connect(function()
	
	--Jumps out of the function to prevent numerous executions
	if debounce then 
		print("Um you already started making the coffee :/")
		return 
	end
	
	--Jumps out of the function because there's coffee in the glass
	if CoffeeStages[3].Transparency == 0 then
		print("There's coffee in the glass already!")
		return
	end
	
	debounce = true
	
	--Changes button to red
	script.Parent.Color = Color3.fromRGB(255,0,0)
	
	--Changes message
	Message.Text = "Brewing in Progress"	
	
	--Previous Coffee Stage
	local prevCoffeeStage = nil
	
	--Plays Coffee Pouring Sound
	wait(1)
	CoffeePouring:Play()
	
	--Fills up coffee
	for i, CoffeeStage in pairs(CoffeeStages) do
		wait(10)
		
		--Coffee liquids become invisible
		if prevCoffeeStage then
			prevCoffeeStage.Transparency = 1
		end
		
		--Coffee liquids are visible
		CoffeeStage.Transparency = 0 
		print("Stage "..i.." Complete!")
		prevCoffeeStage = CoffeeStage
	end
	
	prevCoffeeStage = nil
	
	--Stops Coffee Pouring Sound
	CoffeePouring:Stop()
	
	--Changes message
	Message.Text = "Complete! Thank you for using Ninja's Brewer!"
	
	--Glass is now clickable
	ClickDetector.MaxActivationDistance = 10
	
	--Changes color back to lime
	script.Parent.Color = Color3.fromRGB(0,255,0)
	
	--Message will change in 10 seconds
	wait(10)
	Message.Text = "Press the green button to begin brewing."
	
	debounce = false
end)
