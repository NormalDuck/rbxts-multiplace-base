-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local ProductController
do
	ProductController = setmetatable({}, {
		__tostring = function()
			return "ProductController"
		end,
	})
	ProductController.__index = ProductController
	function ProductController.new(...)
		local self = setmetatable({}, ProductController)
		return self:constructor(...) or self
	end
	function ProductController:constructor()
	end
	function ProductController:onStart()
	end
	do
		-- (Flamework) ProductController metadata
		Reflect.defineMetadata(ProductController, "identifier", "base/src/client/controllers/product-controller@ProductController")
		Reflect.defineMetadata(ProductController, "flamework:implements", { "$:flamework@OnStart" })
	end
end
-- (Flamework) ProductController decorators
Reflect.decorate(ProductController, "$:flamework@Controller", Controller, {})
return {
	ProductController = ProductController,
}
