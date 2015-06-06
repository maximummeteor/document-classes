DocumentClass.Mixins.add 'update',
  class MixinUpdate extends DocumentClass.Mixins.Base
    @instance:
      update: (modifier) -> @_collection().update @_id, modifier
