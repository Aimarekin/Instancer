-- Default prop transformations
local propTransformations = {}

for _,transformation in pairs(script.Parent.Parent.PropTransformations:GetChildren()) do
    table.insert(propTransformations, require(transformation))
end

return propTransformations