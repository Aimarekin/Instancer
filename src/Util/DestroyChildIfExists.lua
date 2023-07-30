function DestroyChildIfExists(rbx: Instance, className: string)
    local child = rbx:FindFirstChildOfClass(className)
    if child then
        child:Destroy()
    end
end

return DestroyChildIfExists