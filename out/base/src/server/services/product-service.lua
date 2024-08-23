-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Service = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Service
local MarketplaceService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").MarketplaceService
local ProductService
do
	ProductService = setmetatable({}, {
		__tostring = function()
			return "ProductService"
		end,
	})
	ProductService.__index = ProductService
	function ProductService.new(...)
		local self = setmetatable({}, ProductService)
		return self:constructor(...) or self
	end
	function ProductService:constructor(saveService)
		self.saveService = saveService
	end
	function ProductService:onStart()
		print("hello worldS")
	end
	function ProductService:ProcessReceipt(receiptInfo)
		print("ok")
		return Enum.ProductPurchaseDecision.PurchaseGranted
	end
	do
		-- (Flamework) ProductService metadata
		Reflect.defineMetadata(ProductService, "identifier", "base/src/server/services/product-service@ProductService")
		Reflect.defineMetadata(ProductService, "flamework:parameters", { "base/src/server/services/save-service@SaveService" })
		Reflect.defineMetadata(ProductService, "flamework:implements", { "$:flamework@OnStart" })
	end
end
-- (Flamework) ProductService decorators
Reflect.decorate(ProductService, "$:flamework@Service", Service, {})
print("aa")
local function ProcessReceipt(receiptInfo)
	print("e")
	return Enum.ProductPurchaseDecision.PurchaseGranted
end
MarketplaceService.ProcessReceipt = ProcessReceipt
return {
	ProductService = ProductService,
}
