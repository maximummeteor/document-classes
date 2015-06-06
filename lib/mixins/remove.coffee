DocumentClass.Mixins.add 'remove',
  class MixinRemove extends DocumentClass.Mixins.Base
    @instance:
      remove: -> @_collection().remove @_id
