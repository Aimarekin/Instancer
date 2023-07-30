local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Children

function ChildrenExecute(rbx: Instance, children: { Instance })
    for _, child in ipairs(children) do
        child.Parent = rbx
    end
end

return {
    propName = "Children",
    priority = propPriority,
    execute = ChildrenExecute
}