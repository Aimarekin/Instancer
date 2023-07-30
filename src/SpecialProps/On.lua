local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Bindings

function OnExecute(rbx: Instance, callback: (Instance, ...any) -> (), savedArgs: { eventName: string })
    rbx[savedArgs.eventName]:Connect(function(...)
        callback(rbx, ...)
    end)
end

function On(eventName: string)
    return {
        propName = "On",
        priority = propPriority,
        execute =  OnExecute,
        savedArgs = {
            eventName = eventName
        }
    }
end

return On