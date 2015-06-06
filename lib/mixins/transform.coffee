DocumentClass.Mixins.add 'transform',
  class MixinTransform extends DocumentClass.Mixins.Base
    @static:
      isTransformOf: (collection) ->
        @_collection = collection
        collection.transformTo this

    @instance:
      _collection: -> @constructor._collection
