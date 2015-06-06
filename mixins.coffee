DocumentClass.Mixins =
  _mixins: {}
  get: (name) => DocumentClass.Mixins._mixins[name]
  add: (name, obj) => DocumentClass.Mixins._mixins[name] = obj

DocumentClass.Mixins.Base = class MixinBase
  @applyMixin: (obj) ->
    obj[key] = value for key, value of @static or {}
    obj::[key] = value for key, value of @instance or {}
