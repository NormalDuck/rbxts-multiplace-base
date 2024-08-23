-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Service = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Service
local MarketplaceService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").MarketplaceService
local retry = TS.import(script, game:GetService("ReplicatedStorage"), "common", "utils", "retrier").retry
--[[
	*
	 * A wrapper around MarketPlaceService. Uses promises for yielding methods.
	 * Please use MarketPlaceService for non-yielding code.
	 
]]
local MarketService
do
	MarketService = setmetatable({}, {
		__tostring = function()
			return "MarketService"
		end,
	})
	MarketService.__index = MarketService
	function MarketService.new(...)
		local self = setmetatable({}, MarketService)
		return self:constructor(...) or self
	end
	function MarketService:constructor()
	end
	MarketService.GetDeveloperProductsAsync = TS.async(function(self)
		return TS.await(retry(function()
			return MarketplaceService:GetDeveloperProductsAsync()
		end))
	end)
	MarketService.GetProductInfo = TS.async(function(self, id, infoType)
		return TS.await(retry(function()
			return MarketplaceService:GetProductInfo(id, infoType)
		end))
	end)
	MarketService.GetSubscriptionProductInfoAsync = TS.async(function(self, subscriptionId) end)
	do
		-- (Flamework) MarketService metadata
		Reflect.defineMetadata(MarketService, "identifier", "common/src/server/services/market-service@MarketService")
	end
end
-- (Flamework) MarketService decorators
Reflect.decorate(MarketService, "$:flamework@Service", Service, {})
return {
	MarketService = MarketService,
}
