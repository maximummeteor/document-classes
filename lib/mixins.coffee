DocumentClass.Mixins =
  _mixins: {}
  get: (name, throwError=true) ->
    if throwError and not DocumentClass.Mixins._mixins[name]?
      throw new Error "mixin '#{name}' not found!"
    return DocumentClass.Mixins._mixins[name]
  add: (name, obj) ->
    if DocumentClass.Mixins.get(name, false)?
      throw new Error "mixin '#{name}' already exists!"
    DocumentClass.Mixins._mixins[name] = obj

DocumentClass.Mixins.Base = class MixinBase
  @applyMixin: (obj) ->
    obj[key] = value for key, value of @static or {}
    obj::[key] = value for key, value of @instance or {}
    @autorun?.call obj
