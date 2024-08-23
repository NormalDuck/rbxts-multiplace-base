-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local store = TS.import(script, game:GetService("ServerScriptService"), "TS", "store").store
local retry = TS.import(script, game:GetService("ReplicatedStorage"), "common", "utils", "retrier").retry
local function processReceipt(receiptInfo)
	local success, respnose = pcall(function()
		retry(function()
			local player = Players:GetPlayerByUserId(receiptInfo.PlayerId)
			store.patchPurchaseHistory(player, {
				assetid = receiptInfo.ProductId,
				timestamp = DateTime.now():ToIsoDate(),
				robux = receiptInfo.CurrencySpent,
			})
		end, 3, 1):await()
	end)
	if success then
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	return Enum.ProductPurchaseDecision.NotProcessedYet
end
return {
	processReceipt = processReceipt,
}
