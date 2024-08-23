
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","flamework-binary-serializer","out").createBinarySerializer
local c=b{"object_raw",{{"purchaseHistory",{"array",{"object_raw",{{"assetid",{"f64"}},{"robux",{"f64"}},{"timestamp",{"string"}}}}}}}}
local d=b{"object_raw",{{"saves",{"map",{"blob"},{"object_raw",{{"purchaseHistory",{"array",{"object_raw",{{"assetid",{"f64"}},{"robux",{"f64"}},{"timestamp",{"string"}}}}}}}}}}}}
return{
PlayerSerDes=c,
HydrateSerDes=d,
}