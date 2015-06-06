DocumentClass.Mixins.add 'remove', class MixinRemove
  @instance:
    remove: -> @_collection().remove @_id
