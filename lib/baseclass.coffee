DocumentClass.Base = class Base
  @defaultMixins: ['transform']
  @_mixins: []
  @mixin: (mixins...) ->
    mixins = mixins[0] if mixins[0] instanceof Array
    for mixin in mixins
      mixins = _.unique mixins.concat mixin.dependsOn or []

    for mixin in mixins
      @_mixins.push mixin
      DocumentClass.Mixins.get(mixin)?.applyMixin this
  @mixin @defaultMixins

  @extend: (extension) ->
    Constructor = null
    Extended = class extends this
      constructor: ->
        if Constructor? then Constructor.apply(this, arguments) else super

    if typeof(extension) is 'function'
      extension = extension.call Extended
    else
      extension = extension ? {}
    Constructor = extension.Constructor ? null
    Extended.prototype[key] = extension[key] for key of extension
    return Extended

  constructor: (doc) -> _.extend this, doc
