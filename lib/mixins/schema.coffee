return unless Package["aldeed:collection2"]?

DocumentClass.Mixins.add 'schema',
  class MixinSchema extends DocumentClass.Mixins.Base
    @static:
      schema: (schema) ->
        @_collection().attachSchema schema
