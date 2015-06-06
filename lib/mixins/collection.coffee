DocumentClass.Mixins.add 'collection',
  class MixinCollection extends DocumentClass.Mixins.Base
    @static:
      collection: (fn) -> @_collectionConstructor = fn
      Collection: (options...) ->
        collection = @_collectionConstructor?.apply this, options
        collection?.transformTo? this if 'transform' in @_mixins

        return collection
