local propPriority = require(script.Parent.Parent.Definitions.propPriorities).RegularProp

function RefExecute(rbx: Instance, holdingTable: {}, savedArgs: { refName: string })
    holdingTable[savedArgs.refName] = rbx
end

function Ref(refName: string)
    return {
        attrName = "Ref",
        priority = propPriority,
        execute =  RefExecute,
        savedArgs = {
            attrName = refName
        }
    }
end

return Ref