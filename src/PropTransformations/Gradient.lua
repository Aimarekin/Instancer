local GetOrCreateChild = require(script.Parent.Parent.Util.GetOrCreateChild)
local MountSingleProp = require(script.Parent.Parent.Util.MountSingleProp)

function TransformGradient(rbx: Instance, props: {})
    local gradient = props["Gradient"]

    if gradient == nil then
        return
    end

    props["Gradient"] = nil

    assert(rbx:IsA("GuiBase2d"), "Gradient can only be applied to GuiBase2d instances")
    assert(type(gradient) == "table", "Gradient must be a table")

    GetOrCreateChild(rbx, "UIGradient", function(el)
        MountSingleProp(el, "Enabled", gradient["Enabled"])
        MountSingleProp(el, "Color", gradient["Color"])
        MountSingleProp(el, "Transparency", gradient["Transparency"])
        MountSingleProp(el, "Rotation", gradient["Rotation"])
    end)
end

return TransformGradient