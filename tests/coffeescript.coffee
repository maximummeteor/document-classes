prefixTest = (name) -> "Document-Classes - Coffeescript - #{name}"

Tinytest.add prefixTest('transform'), (test) ->
  Posts = new Mongo.Collection null

  class Post extends DocumentClass.Base
    @isTransformOf Posts
    test: -> true

  id = Posts.insert name: 'test'
  post = Posts.findOne id

  test.isTrue post instanceof Post

# mixins
Tinytest.add prefixTest('mixins - remove'), (test) ->
  Posts = new Mongo.Collection null

  class Post extends DocumentClass.Base
    @isTransformOf Posts
    @mixin 'remove'

  id = Posts.insert name: 'test'
  post = Posts.findOne id
  post.remove()

  test.isFalse !!Posts.findOne(id)

Tinytest.add prefixTest('mixins - update'), (test) ->
  Posts = new Mongo.Collection null

  class Post extends DocumentClass.Base
    @isTransformOf Posts
    @mixin 'update'

  id = Posts.insert name: 'test'
  post = Posts.findOne id
  post.update $set: test: true

  test.isTrue Posts.findOne(id)?.test

Tinytest.add prefixTest('mixins - schema'), (test) ->
  Posts = new Mongo.Collection null

  class Post extends DocumentClass.Base
    @isTransformOf Posts
    @mixin 'schema'
    @schema new SimpleSchema
      name:
        type: String

  id = Posts.insert name: 'test', test: true

  test.isFalse Posts.findOne(id)?.test
