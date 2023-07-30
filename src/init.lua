local Instancer = {}

-- Instance
Instancer.New = require(script.Instance.New)
Instancer.Hydrate = require(script.Instance.Hydrate)

-- Creators
Instancer.Component = require(script.Creators.Component)
Instancer.Interface = require(script.Creators.Interface)

-- SpecialProps
Instancer.Apply = require(script.SpecialProps.Apply)
Instancer.Attr = require(script.SpecialProps.Attr)
Instancer.AttrChanged = require(script.SpecialProps.AttrChanged)
Instancer.Changed = require(script.SpecialProps:FindFirstChild("Changed"))
Instancer.Children = require(script.SpecialProps.Children)
Instancer.Cleanup = require(script.SpecialProps.Cleanup)
Instancer.On = require(script.SpecialProps.On)
Instancer.Ref = require(script.SpecialProps.Ref)
Instancer.Resize = require(script.SpecialProps.Resize)

return Instancer