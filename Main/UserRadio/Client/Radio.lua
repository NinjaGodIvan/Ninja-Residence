--[[Only the player can hear the song.]]

--Radio
local Radio = game.Workspace:FindFirstChild("Radio")
--Play Button
local PlayButton = script.Parent:FindFirstChild("Play")
--Stop Button
local StopButton = script.Parent:FindFirstChild("Stop")
--Pause Button
local PauseButton = script.Parent:FindFirstChild("Pause")
--Minus Button
local Minus = script.Parent:FindFirstChild("Minus")
--Plus Button
local Plus = script.Parent:FindFirstChild("Plus")
--Song ID
local SongID = script.Parent:FindFirstChild("Song ID")
--Song Name
local SongName = script.Parent:FindFirstChild("Song Name")
local Song = SongName:FindFirstChild("Text")
--MarketPlace
local MarketplaceService = game:GetService("MarketplaceService")

--Plays the song
PlayButton.MouseButton1Click:Connect(function()
	
	--Gets input from the player
	Radio.SoundId = "http://www.roblox.com/asset/?id="..SongID.Text
	
	--Product Asset
	local id = Radio.SoundId:match("%d+")
	local Asset = game:GetService("MarketplaceService"):GetProductInfo(id) 
	
	--Sets Song Name
	Song.Text = Asset.Name
	
	--Shrinks button size
	PlayButton.Size = UDim2.new(0.06,0,0.157,0)
	PlayButton.Position = UDim2.new(0.33,0,0.756,0)
	wait(.1)
	
	--Plays song
	Radio:Play()
	print("The song is now playing.")
	
	--Resizes button size
	PlayButton.Size = UDim2.new(0.088,0,0.194,0)
	PlayButton.Position = UDim2.new(0.321,0,0.743,0)
end)

--Stops the song
StopButton.MouseButton1Click:Connect(function()

	--Jumps out of the function
	if Radio.TimePosition == 0 then
		print("The song already stopped!")
		return
	end
	
	--Occurs when the player presses "Pause" and then "Stop"
	if Radio.TimePosition ~= 0 then
		Radio.TimePosition = 0
		print("Song time position still needs to reset to 0.")
	end
	
	--Shrinks button size
	StopButton.Size = UDim2.new(0.06,0,0.157,0)
	StopButton.Position = UDim2.new(0.595,0,0.756,0)
	wait(.1)
	
	--Stops song
	Radio:Stop()
	print("The song stopped.")
	
	--Resizes button size
	StopButton.Size = UDim2.new(0.088,0,0.194,0)
	StopButton.Position = UDim2.new(0.586,0,0.743,0)
end)

--Pauses the song
PauseButton.MouseButton1Click:Connect(function()

	--Pause button does not works if the TimePosition is 0. 
	if Radio.TimePosition == 0 then
		print("Song can't pause if the song hadn't started yet. Press play first.")
		return
	end
	
	--Shrinks button size
	PauseButton.Size = UDim2.new(0.06,0,0.157,0)
	PauseButton.Position = UDim2.new(0.462,0,0.756,0)
	wait(.1)
	
	
	if not Radio.IsPaused then
		Radio:Pause()
		print("The song paused.")
	else
		Radio:Resume()
		print("The song resumed.")
	end
	
	--Resizes button size
	PauseButton.Size = UDim2.new(0.088,0,0.194,0)
	PauseButton.Position = UDim2.new(0.453,0,0.743,0)

end)

--Lowers the song volume
Minus.MouseButton1Click:Connect(function()
	
	if Radio.Volume == 0 then 
		print("The radio has reached its minimum volume level")
	else
		
		--Shrinks button size  
		Minus.Size = UDim2.new(0.045,0,0.118,0)
		Minus.Position = UDim2.new(0.142,0,0.781,0)
		wait(.1)
		
		--Lowers the song volume
		Radio.Volume -= 0.1 
		
		--Resizes button size
		Minus.Size = UDim2.new(0.073,0,0.155,0)
		Minus.Position = UDim2.new(0.133,0,0.768,0)
	end
end)

--Raises the song volume
Plus.MouseButton1Click:Connect(function()
	
	if Radio.Volume >= 1 then 
		
		if Radio.Volume > 1 then
			Radio.Volume = 1
		end
		
		print("The radio has reached its maximum volume level")
	else
		
		--Shrinks button size  
		Plus.Size = UDim2.new(0.045,0,0.118,0)
		Plus.Position = UDim2.new(0.809,0,0.781,0)
		wait(.1)
		
		Radio.Volume += 0.1 
		
		--Resizes button size
		Plus.Size = UDim2.new(0.073,0,0.155,0)
		Plus.Position = UDim2.new(0.8,0,0.768,0)
	end
end)

