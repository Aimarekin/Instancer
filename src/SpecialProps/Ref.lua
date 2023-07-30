local propPriority = require(script.Parent.Parent.Definitions.propPriorities).RegularProp

function RefExecute(self, rbx: Instance, holdingTable: {})
    holdingTable[self.savedArgs.refName] = rbx
end

function Ref(refName: string)
    return {
        type = "SpecialProp",
        attrName = "Ref",
        priority = propPriority,
        execute =  RefExecute,
        savedArgs = {
            attrName = refName
        }
    }
end

return Ref