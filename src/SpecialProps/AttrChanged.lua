local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Bindings

function AttrChangedExecute(rbx: Instance, callback: (Instance, any) -> (), savedArgs: { attrName: string })
    rbx:GetAttributeChangedSignal(savedArgs.attrName):Connect(function()
        callback(rbx, rbx:GetAttribute(savedArgs.attrName))
    end)
end

function AttrChanged(attrName: string)
    return {
        attrName = "AttrChanged",
        priority = propPriority,
        execute =  AttrChangedExecute,
        savedArgs = {
            attrName = attrName
        }
    }
end

return AttrChanged