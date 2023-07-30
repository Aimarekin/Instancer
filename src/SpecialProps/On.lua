local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Bindings

function OnExecute(self, rbx: Instance, callback: (Instance, ...any) -> ())
    rbx[self.savedArgs.eventName]:Connect(function(...)
        callback(rbx, ...)
    end)
end

function On(eventName: string)
    return {
        type = "SpecialProp",
        propName = "On",
        priority = propPriority,
        execute =  OnExecute,
        savedArgs = {
            eventName = eventName
        }
    }
end

return On