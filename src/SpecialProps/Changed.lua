local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Bindings

function ChangedExecute(rbx: Instance, callback: (Instance, any) -> (), savedArgs: { propName: string })
    rbx:GetPropertyChangedSignal(savedArgs.propName):Connect(function()
        callback(rbx, rbx[savedArgs.propName])
    end)
end

function Changed(propName: string)
    return {
        propName = "Changed",
        priority = propPriority,
        execute =  ChangedExecute,
        savedArgs = {
            propName = propName
        }
    }
end

return Changed