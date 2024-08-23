-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _react = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local React = _react
local useEffect = _react.useEffect
local useState = _react.useState
local setTimeout = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "set-timeout", "out").setTimeout
--[[
	*
	 * Renders the children component with a delay based on the provided MountDelay
	 * and UnmountDelay values.
	 *
	 * This component can be useful for creating transitions or animations when
	 * rendering or unmounting components, e.g, playing a fade-out animation before
	 * unmounting a component.
	 *
	 * @example
	 *
	 * ```tsx
	 * <DelayRender ShouldRender={true} UnmountDelay={1}>
	 * 	<Text Text={"Hello World!"} />
	 * </DelayRender>;
	 * ```
	 *
	 * @param delayRenderProps - The properties of delay-render props.
	 * @returns - The rendered children component.
	 * @component
	 
]]
local function DelayRender(_param)
	local MountDelay = _param.MountDelay
	if MountDelay == nil then
		MountDelay = 0
	end
	local ShouldRender = _param.ShouldRender
	local UnmountDelay = _param.UnmountDelay
	if UnmountDelay == nil then
		UnmountDelay = 0
	end
	local children = _param.children
	local render, setRender = useState(false)
	useEffect(function()
		local delay = if ShouldRender then MountDelay else UnmountDelay
		return setTimeout(function()
			setRender(ShouldRender)
		end, delay)
	end, { MountDelay, ShouldRender, UnmountDelay })
	return React.createElement(React.Fragment, nil, if render then children else nil)
end
return {
	DelayRender = DelayRender,
}
