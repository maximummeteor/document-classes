DocumentClass.Mixins.add 'transform',
  class MixinTransform extends DocumentClass.Mixins.Base
    @static:
      isTransformOf: (collection) ->
        @__collection = collection
        collection.transformTo this

      _collection: -> @__collection

    @instance:
      _collection: -> @constructor.__collection
