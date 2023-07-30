function GetOrCreateChild(rbx: Instance, className: string, functionToRun: ((Instance) -> ())?)
    local child = rbx:FindFirstChildOfClass(className)
    if child ~= nil then
        if functionToRun then
            functionToRun(child)
        end
        return child
    end

    child = Instance.new(className)
    if functionToRun then
        functionToRun(child)
    end
    child.Parent = rbx

    return child
end

return GetOrCreateChild