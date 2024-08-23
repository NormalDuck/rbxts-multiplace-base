-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Service = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Service
local MarketplaceService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").MarketplaceService
local TestService
do
	TestService = setmetatable({}, {
		__tostring = function()
			return "TestService"
		end,
	})
	TestService.__index = TestService
	function TestService.new(...)
		local self = setmetatable({}, TestService)
		return self:constructor(...) or self
	end
	function TestService:constructor()
	end
	function TestService:onPlayerJoin(player)
		MarketplaceService:PromptGamePassPurchase(player, 1645608670)
	end
	do
		-- (Flamework) TestService metadata
		Reflect.defineMetadata(TestService, "identifier", "base/src/server/services/test-service@TestService")
		Reflect.defineMetadata(TestService, "flamework:implements", { "common/src/server/hooks/init@OnPlayerJoin" })
	end
end
-- (Flamework) TestService decorators
Reflect.decorate(TestService, "$:flamework@Service", Service, {})
return {
	TestService = TestService,
}
