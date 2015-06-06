DocumentClass.Base = class Base
  @defaultMixins: ['transform']
  @_mixins: []
  @mixin: (mixins...) -> @mixinArray mixins
  @mixinArray: (mixins) ->
    for mixin in mixins
      mixins = _.unique mixins.concat mixin.dependsOn or []

    for mixin in mixins
      @_mixins.push mixin
      DocumentClass.Mixins.get(mixin)?.applyMixin this
  @mixinArray @defaultMixins

  constructor: (doc) -> _.extend this, doc
