-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _pretty_react_hooks = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "pretty-react-hooks", "out")
local useBindingListener = _pretty_react_hooks.useBindingListener
local useCamera = _pretty_react_hooks.useCamera
local _react = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local React = _react
local useState = _react.useState
local createPortal = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react-roblox").createPortal
--[[
	*
	 * Renders a background blur effect based on the provided `BlurSize`.
	 *
	 * @param props - The component props.
	 * @returns The rendered background blur component.
	 
]]
local function BackgroundBlur(_param)
	local BlurSize = _param.BlurSize
	local camera = useCamera()
	local visible, setVisible = useState(false)
	useBindingListener(BlurSize, function(size)
		if size == nil then
			size = 0
		end
		setVisible(size > 0)
	end)
	return createPortal(React.createElement(React.Fragment, nil, if visible then React.createElement("blureffect", {
		Size = BlurSize,
	}) else nil), camera)
end
return {
	BackgroundBlur = BackgroundBlur,
}
