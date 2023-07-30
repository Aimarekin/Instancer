local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Bindings

function ChangedExecute(self, rbx: Instance, callback: (Instance, any) -> ())
    rbx:GetPropertyChangedSignal(self.savedArgs.propName):Connect(function()
        callback(rbx, rbx[self.savedArgs.propName])
    end)
end

function Changed(propName: string)
    return {
        type = "SpecialProp",
        propName = "Changed",
        priority = propPriority,
        execute =  ChangedExecute,
        savedArgs = {
            propName = propName
        }
    }
end

return Changed