local Instancer = {}

-- Instance
Instancer.New = require(script.Instance.New)
Instancer.Hydrate = require(script.Instance.Hydrate)

-- Creators
Instancer.Component = require(script.Creators.Component)
Instancer.Interface = require(script.Creators.Interface)

-- SpecialProps
for _, specialProp in ipairs(script.SpecialProps:GetChildren()) do
    Instancer[specialProp.Name] = require(specialProp)
end

return Instancer