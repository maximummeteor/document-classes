DocumentClass.Base = class Base
  @defaultMixins: ['transform']
  @_mixins: []
  @mixin: (mixins...) ->
    for mixin in mixins
      mixins = _.unique mixins.concat mixin.dependsOn or []

    for mixin in mixins
      @_mixins.push mixin
      DocumentClass.Mixins.get(mixin)?.applyMixin this
  @mixin @defaultMixins

  constructor: (doc) -> _.extend this, doc
