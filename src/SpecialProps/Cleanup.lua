local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Bindings

function CleanupExecute(self, rbx: Instance, callback: (Instance) -> ())
    rbx.Destroying:Connect(function()
        callback(rbx)
    end)
end

return {
    type = "SpecialProp",
    propName = "Cleanup",
    priority = propPriority,
    execute =  CleanupExecute
}