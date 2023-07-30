local GetOrCreateChild = require(script.Parent.Parent.Util.GetOrCreateChild)
local MountSingleProp = require(script.Parent.Parent.Util.MountSingleProp)

function TransformList(rbx: Instance, props: {})
    local list = props["List"]

    if list == nil then
        return
    end

    props["List"] = nil

    assert(rbx:IsA("GuiBase2d"), "List can only be applied to GuiBase2d instances")
    
    if type(list) == "table" then
        GetOrCreateChild(rbx, "UIGridLayout", function(el)
            MountSingleProp(el, "Padding", list["Padding"])

            MountSingleProp(el, "FillDirection", list["FillDirection"])
            MountSingleProp(el, "HorizontalAlignment", list["HorizontalAlignment"])
            MountSingleProp(el, "SortOrder", list["SortOrder"])
            MountSingleProp(el, "VerticalAlignment", list["VerticalAlignment"])
        end)
    elseif type(list) == "boolean" then
        if list then
            GetOrCreateChild(rbx, "UIGridLayout")
        else
            local child = rbx:FindFirstChildOfClass("UIGridLayout")
            if child then
                child:Destroy()
            end
        end
    else
        error("List must be a boolean or a table")
    end
end

return TransformList