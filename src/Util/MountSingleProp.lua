function MountSingleProp(rbx: Instance, prop: string, val: any?)
    if val ~= nil then
        rbx[prop] = val
    end
end

return MountSingleProp