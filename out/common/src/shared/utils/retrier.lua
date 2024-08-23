-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local retry = TS.async(function(callback, retryTimes, retryDelay)
	if retryTimes == nil then
		retryTimes = 5
	end
	if retryDelay == nil then
		retryDelay = 0
	end
	local result = nil
	local retryCount = 0
	while not (result ~= 0 and result == result and result ~= "" and result) do
		local sucess, reponse = pcall(callback)
		if not sucess then
			if not (retryDelay == 0) then
				task.wait(retryDelay)
			end
			retryCount += 1
		else
			result = reponse
		end
		if retryCount == retryTimes then
			warn(`retrier failed to retry in {retryCount} times of retrying. `)
		end
	end
	return result
end)
return {
	retry = retry,
}
