local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Bindings

function CleanupExecute(rbx: Instance, callback: (Instance) -> ())
    rbx.Destroying:Connect(function()
        callback(rbx)
    end)
end

return {
    propName = "Cleanup",
    priority = propPriority,
    execute =  CleanupExecute
}