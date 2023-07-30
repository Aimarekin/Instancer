local robloxPropPriorities = require(script.Parent.Parent.Definitions.robloxPropPriorities)
local propTransformations = require(script.Parent.Parent.Definitions.propTransformations)

function ApplyProp(rbx: Instance, value: any, savedArgs: { propName: string })
    rbx[savedArgs.propName] = value
end

function AdaptProps(rbx: Instance, props: {})
    local copiedProps = table.clone(props)

    -- Apply transformations
    for _,transformation in propTransformations do
        print("Applying transformation", transformation)
        transformation(rbx, copiedProps)
    end

    print("Adapted props", copiedProps)

    local adaptedProps = {}

    for prop,val in pairs(copiedProps) do
        if typeof(prop) == "string" then
            -- This is a Roblox property
            -- Adapt it to the general format
            table.insert(adaptedProps, {
                propName = "ApplyProp@" .. prop,
                priority = robloxPropPriorities[prop] or robloxPropPriorities.DefaultPropPriority,
                value = val,
                execute = ApplyProp,
                savedArgs = {
                    propName = prop
                }
            })
        elseif typeof(prop) == "table" then
            prop.value = val
            table.insert(adaptedProps, prop)
        else
            error("INSTANCER: Invalid property type: " .. typeof(prop))
        end
    end

    table.sort(adaptedProps, function(a,b)
        return a.priority < b.priority
    end)

    return adaptedProps
end

return AdaptProps