DocumentClass.Mixins.add 'update', class MixinUpdate
  @instance:
    update: (modifier) -> @_collection().update @_id, modifier
