function MountProps(rbx: Instance, props: {})
    for i,prop in ipairs(props) do
        xpcall(
            prop.execute,
            function(err: any)
                warn(
                    `INSTANCER: Failed to mount prop #{i} {prop.propName} due to error`,
                    err,
                    "\nVALUE: ", prop.value,
                    "\nSAVED ARGS: ", prop.savedArgs,
                    "\nOBJECT: ", rbx
                )
            end,
            prop, rbx, prop.value
        )
    end
end

return MountProps