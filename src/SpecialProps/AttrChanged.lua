local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Bindings

function AttrChangedExecute(self, rbx: Instance, callback: (Instance, any) -> ())
    rbx:GetAttributeChangedSignal(self.savedArgs.attrName):Connect(function()
        callback(rbx, rbx:GetAttribute(self.savedArgs.attrName))
    end)
end

function AttrChanged(attrName: string)
    return {
        type = "SpecialProp",
        attrName = "AttrChanged",
        priority = propPriority,
        execute =  AttrChangedExecute,
        savedArgs = {
            attrName = attrName
        }
    }
end

return AttrChanged