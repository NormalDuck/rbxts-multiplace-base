-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _react = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local React = _react
local forwardRef = _react.forwardRef
--[[
	*
	 * A component for displaying an image.
	 *
	 * @example
	 *
	 * ```tsx
	 * <ImageLabel
	 * 	Image="rbxassetid://1234567890"
	 * 	Native={{
	 * 		Size={new UDim2(0, 100, 0, 100)}
	 * 	}}
	 * />;
	 * ```
	 *
	 * @component
	 *
	 * @see https://developer.roblox.com/en-us/api-reference/class/ImageLabel
	 
]]
local ImageLabel = forwardRef(function(props, ref)
	local _binding = props
	local CornerRadius = _binding.CornerRadius
	local Image = _binding.Image
	local Native = _binding.Native
	local children = _binding.children
	local _attributes = {
		ref = ref,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Image = Image,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
	}
	if Native then
		for _k, _v in Native do
			_attributes[_k] = _v
		end
	end
	return React.createElement("imagelabel", _attributes, if CornerRadius then React.createElement("uicorner", {
		CornerRadius = CornerRadius,
	}) else nil, children)
end)
local default = ImageLabel
return {
	default = default,
}
