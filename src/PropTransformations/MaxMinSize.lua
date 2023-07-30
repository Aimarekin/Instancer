local GetOrCreateChild = require(script.Parent.Parent.Util.GetOrCreateChild)

local UNCONSTRAINED_MINIMUM = Vector2.new(-math.huge, -math.huge)
local UNCONSTRAINED_MAXIMUM = Vector2.new(math.huge, math.huge)

function TransformMinMaxSize(rbx: Instance, props: {})
    local minSize = props["MinSize"]
    local maxSize = props["MaxSize"]

    if minSize == nil and maxSize == nil or rbx.ClassName == "UISizeConstraint" then
        return
    end

    props["MinSize"] = nil
    props["MaxSize"] = nil

    assert(rbx:IsA("GuiBase2d"), "MinSize and MaxSize can only be applied to GuiBase2d instances")

    assert(minSize == nil or typeof(minSize) == "Vector2", "MinSize must be a Vector2")
    assert(maxSize == nil or typeof(maxSize) == "Vector2", "MaxSize must be a Vector2")

    GetOrCreateChild(rbx, "UISizeConstraint", function(el)
        el.MinSize = minSize or UNCONSTRAINED_MINIMUM
        el.MaxSize = maxSize or UNCONSTRAINED_MAXIMUM
    end)
end

return TransformMinMaxSize