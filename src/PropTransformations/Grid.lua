local GetOrCreateChild = require(script.Parent.Parent.Util.GetOrCreateChild)
local MountSingleProp = require(script.Parent.Parent.Util.MountSingleProp)

function TransformGrid(rbx: Instance, props: {})
    local grid = props["Grid"]

    if grid == nil then
        return
    end

    props["Grid"] = nil

    assert(rbx:IsA("GuiBase2d"), "Grid can only be applied to GuiBase2d instances")
    assert(type(grid) == "table", "Grid must be a table")

    GetOrCreateChild(rbx, "UIGridLayout", function(el)
        MountSingleProp(el, "CellSize", grid["CellSize"])
        MountSingleProp(el, "CellPadding", grid["CellPadding"])
        MountSingleProp(el, "FillDirectionMaxCells", grid["FillDirectionMaxCells"])
        MountSingleProp(el, "StartCorner", grid["StartCorner"])

        MountSingleProp(el, "FillDirection", grid["FillDirection"])
        MountSingleProp(el, "HorizontalAlignment", grid["HorizontalAlignment"])
        MountSingleProp(el, "SortOrder", grid["SortOrder"])
        MountSingleProp(el, "VerticalAlignment", grid["VerticalAlignment"])
    end)
end

return TransformGrid