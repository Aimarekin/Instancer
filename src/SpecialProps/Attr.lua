local propPriority = require(script.Parent.Parent.Definitions.propPriorities).RegularProp

function AttrExecute(self, rbx: Instance, value: any)
    rbx:SetAttribute(self.savedArgs.attrName, value)
end

function Attr(attrName: string)
    return {
        type = "SpecialProp",
        propName = "Attr",
        priority = propPriority,
        execute =  AttrExecute,
        savedArgs = {
            attrName = attrName
        }
    }
end

return Attr