local propPriority = require(script.Parent.Parent.Definitions.propPriorities).RegularProp

function AttrExecute(rbx: Instance, value: any, savedArgs: { attrName: string })
    rbx:SetAttribute(savedArgs.attrName, value)
end

function Attr(attrName: string)
    return {
        propName = "Attr",
        priority = propPriority,
        execute =  AttrExecute,
        savedArgs = {
            attrName = attrName
        }
    }
end

return Attr