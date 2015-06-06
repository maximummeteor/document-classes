DocumentClass.Base = class Base
  @defaultMixins: ['transform']
  @mixin: (mixins...) ->
    for mixin in mixins
      mixins = _.unique mixins.concat mixin.dependsOn or []

    DocumentClass.Mixins.get(mixin)?.applyMixin this for mixin in mixins
  @mixin @defaultMixins

  constructor: (doc) -> _.extend this, doc
