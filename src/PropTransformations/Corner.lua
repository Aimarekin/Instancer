local GetOrCreateChild = require(script.Parent.Parent.Util.GetOrCreateChild)

function TransformCorner(rbx: Instance, props: {})
    local corner = props["Corner"]

    if corner == nil then
        return
    end

    props["Corner"] = nil

    assert(rbx:IsA("GuiBase2d"), "Corner can only be applied to GuiBase2d instances")

    if type(corner) == "number" then
        corner = UDim2.fromOffset(corner, corner)
    else
        assert(typeof(corner) == "UDim2", "Corner must be a number or UDim2")
    end

    GetOrCreateChild(rbx, "UICorner", function(el)
        el.CornerRadius = corner
    end)
end

return TransformCorner