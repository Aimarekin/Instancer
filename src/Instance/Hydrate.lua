local AdaptProps = require(script.Parent.AdaptProps)
local MountProps = require(script.Parent.MountProps)

function Hydrate(rbx: Instance, props: {})
    -- Adapt and mount props
    MountProps(rbx, AdaptProps(rbx, props))
end

return Hydrate