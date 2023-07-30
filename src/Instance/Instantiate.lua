local defaultProps = require(script.Parent.Parent.Definitions.defaultProps)

function Instantiate(className: string)
    local rbx = Instance.new(className)

    if defaultProps[className] then
        for propName,propValue in pairs(defaultProps[className]) do
            rbx[propName] = propValue
        end
    end

    return rbx
end

return Instantiate