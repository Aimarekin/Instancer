local propPriorities = require(script.Parent.propPriorities)

return {
    Name = propPriorities.PriorityProp,
    Parent = propPriorities.Parent,

    -- All other priorities take this value
    DefaultPropPriority = propPriorities.RegularProp,
}