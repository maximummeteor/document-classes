DocumentClass.Base = class Base
  @mixin: (mixins...) ->
    DocumentClass.Mixins.get(mixin)?.applyMixin this for mixin in mixins

  @isTransformOf: (collection) ->
    @_collection = collection
    collection.transformTo this

  constructor: (doc) -> _.extend this, doc

  _collection: -> @constructor._collection
