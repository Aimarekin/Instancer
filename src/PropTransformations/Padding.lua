local GetOrCreateChild = require(script.Parent.Parent.Util.GetOrCreateChild)
local DestroyChildIfExists = require(script.Parent.Parent.Util.DestroyChildIfExists)
local MountSingleProp = require(script.Parent.Parent.Util.MountSingleProp)

function TransformPadding(rbx: Instance, props: {})
    local padding = props["Padding"]

    if padding == nil then
        return
    end

    props["Padding"] = nil

    assert(rbx:IsA("GuiBase2d"), "Padding can only be applied to GuiBase2d instances")

    if type(padding) == "number" then
        if padding == 0 then
            DestroyChildIfExists(rbx, "UIPadding")
        else
            GetOrCreateChild(rbx, "UIPadding", function(el)
                local paddingUDim = UDim.new(0, padding)

                el.PaddingLeft = paddingUDim
                el.PaddingRight = paddingUDim
                el.PaddingTop = paddingUDim
                el.PaddingBottom = paddingUDim
            end)
        end
    elseif typeof(padding) == "UDim" then
        if padding == UDim.new(0, 0) then
            DestroyChildIfExists(rbx, "UIPadding")
        else
            GetOrCreateChild(rbx, "UIPadding", function(el)
                el.PaddingLeft = padding
                el.PaddingRight = padding
                el.PaddingTop = padding
                el.PaddingBottom = padding
            end)
        end
    elseif type(padding) == "table" then
        GetOrCreateChild(rbx, "UIPadding", function(el)
            MountSingleProp(el, "PaddingLeft", padding["Left"])
            MountSingleProp(el, "PaddingRight", padding["Right"])
            MountSingleProp(el, "PaddingTop", padding["Top"])
            MountSingleProp(el, "PaddingBottom", padding["Bottom"])
        end)
    else
        error("Padding must be a number, UDim or a table")
    end
end

return TransformPadding