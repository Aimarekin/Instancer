local GetOrCreateChild = require(script.Parent.Parent.Util.GetOrCreateChild)
local MountSingleProp = require(script.Parent.Parent.Util.MountSingleProp)

function TransformAspectRatio(rbx: Instance, props: {})
    local aspectRatio = props["AspectRatio"]

    if aspectRatio == nil then
        return
    end

    props["AspectRatio"] = nil

    assert(rbx:IsA("GuiBase2d"), "AspectRatio can only be applied to GuiBase2d instances")

    if type(aspectRatio) == "number" then
        GetOrCreateChild(rbx, "UIAspectRatioConstraint", function(el)
            el.AspectRatio = aspectRatio
        end)
    elseif type(aspectRatio) == "table" then
        GetOrCreateChild(rbx, "UIAspectRatioConstraint", function(el)
            MountSingleProp(el, "AspectRatio", aspectRatio["AspectRatio"])
            MountSingleProp(el, "AspectType", aspectRatio["AspectType"])
            MountSingleProp(el, "DominantAxis", aspectRatio["DominantAxis"])
        end)
    else
        error("AspectRatio must be a number or a table")
    end
end

return TransformAspectRatio