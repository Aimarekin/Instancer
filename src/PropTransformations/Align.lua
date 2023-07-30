local alignments = {
    ["top"] = {
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
    },
    ["top-left"] = {
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.fromScale(0, 0),
    },
    ["top-right"] = {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1, 0),
    },

    ["bottom"] = {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
    },
    ["bottom-left"] = {
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
    },
    ["bottom-right"] = {
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.fromScale(1, 1),
    },

    ["left"] = {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
    },
    ["right"] = {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
    },
    ["center"] = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    },
}

function TransformAlign(rbx: Instance, props: {})
    local alignValue = props["Align"]
    if alignValue == nil then
        return
    end

    props["Align"] = nil

    assert(rbx:IsA("GuiBase2d"), "Align can only be applied to GuiBase2d instances")
    assert(type(alignValue) == "string", "Align must be a string")

    local alignment = alignments[alignValue]
    assert(alignment ~= nil, "Invalid alignment")

    props["AnchorPoint"] = if props.AnchorPoint ~= nil then alignment.AnchorPoint + props.AnchorPoint else alignment.AnchorPoint
    props["Position"] = if props.Position ~= nil then alignment.Position + props.Position else alignment.Position
end

return TransformAlign