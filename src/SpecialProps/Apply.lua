local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Apply

function ApplyExecute<T>(rbx: T, functions: { (T) -> () })
    for _, func in ipairs(functions) do
        xpcall(
            func,
            function(err: any)
                warn(
                    "INSTANCER: Apply function failed and returned error", err,
                    "\nOBJECT: ", rbx,
                    "\nFUNCTION: ", func
                )
            end,
            rbx
        )
    end
end

return {
    propName = "Apply",
    priority = propPriority,
    execute =  ApplyExecute
}