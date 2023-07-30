local Hydrate = require(script.Parent.Parent.Instance.Hydrate)
local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Children + 100

function LayoutExecute(self, rbx: Instance, appliedLayout: {})
    local currentLayout = rbx:FindFirstChildWhichIsA("UILayout")

    if currentLayout then
        currentLayout:Destroy()
    end

    currentLayout = Instance.new(appliedLayout.layoutType)
    Hydrate(currentLayout, appliedLayout.layoutProps)
    currentLayout.Parent = rbx
end

function CreateLayoutType(className: string)
    return function(layoutProps: {}?)
        return {
            type = "Layout",
            layoutType = className,
            layoutProps = layoutProps
        }
    end
end

return {
    type = "SpecialProp",
    propName = "Layout",
    priority = propPriority,
    execute =  LayoutExecute,

    List = CreateLayoutType("UIListLayout"),
    Grid = CreateLayoutType("UIGridLayout"),
    Page = CreateLayoutType("UIPageLayout"),
    Table = CreateLayoutType("UITableLayout")
}