-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Make = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local useMountEffect = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "pretty-react-hooks", "out").useMountEffect
local _react = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local React = _react
local useRef = _react.useRef
local function setDefaultCameraView(camera, model, cameraDepth)
	if cameraDepth == nil then
		cameraDepth = 0
	end
	local modelCF = model:GetBoundingBox()
	local radius = model:GetExtentsSize().Magnitude / 2
	local halfFov = math.rad(camera.FieldOfView) / 2
	local depth = radius / math.tan(halfFov) + cameraDepth
	-- 1. Remove translation
	-- 2. Move to model position
	-- 3. Push camera back by depth in the original angle given
	local _cFrame = camera.CFrame
	local _position = camera.CFrame.Position
	local _position_1 = modelCF.Position
	local _position_2 = camera.CFrame.Position
	local _position_3 = modelCF.Position
	local _arg0 = (_position_2 - _position_3).Unit * depth
	camera.CFrame = _cFrame - _position + _position_1 + _arg0
end
--[[
	*
	 * Renders a viewport for displaying an object.
	 *
	 * @example
	 *
	 * ```tsx
	 * <ObjectViewport
	 * 	Native={{ Size: new UDim2(1, 0, 1, 0) }}
	 * 	Object={new Part()}
	 * />;
	 * ```
	 *
	 * @param props - The object viewport component props.
	 * @returns The rendered viewport.
	 * @component
	 
]]
local function ObjectViewport(_param)
	local ExtraCameraDepth = _param.ExtraCameraDepth
	local Native = _param.Native
	local Object = _param.Object
	local children = _param.children
	-- Setup the viewport after mounting when we have a ref to it
	local viewportRef = useRef()
	useMountEffect(function()
		local viewport = viewportRef.current
		local _arg0 = viewport ~= nil
		assert(_arg0, "Viewport is not defined")
		local model = Object
		if not model:IsA("Model") then
			model = Make("Model", {
				Children = { Object },
				PrimaryPart = Object,
			})
		end
		model.Parent = viewport
		local viewportCamera = Instance.new("Camera")
		viewport.CurrentCamera = viewportCamera
		setDefaultCameraView(viewportCamera, model, ExtraCameraDepth)
		viewportCamera.Parent = viewport
	end)
	local _attributes = {
		ref = viewportRef,
	}
	for _k, _v in Native do
		_attributes[_k] = _v
	end
	return React.createElement("viewportframe", _attributes, children)
end
return {
	default = ObjectViewport,
}
