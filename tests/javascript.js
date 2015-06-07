var prefixTest = function(name) {
  return "Document-Classes - Javascript - " + name
}

Tinytest.add(prefixTest('transform'), function(test) {
  var Posts = new Mongo.Collection(null);
  var Post = DocumentClass.Base.extend(function(){
    this.isTransformOf(Posts);

    this.prototype.test = function() {
      return true;
    }

    return this;
  });

  var id = Posts.insert({name: 'test'});
  var post = Posts.findOne(id);

  test.isTrue(post instanceof Post);
  test.isTrue(post.test());
});

Tinytest.add(prefixTest('mixins - remove'), function(test) {
  var Posts = new Mongo.Collection(null);
  var Post = DocumentClass.Base.extend(function(){
    this.isTransformOf(Posts);
    this.mixin('remove');

    return this;
  });

  var id = Posts.insert({name: 'test'});
  var post = Posts.findOne(id);
  post.remove();

  test.isFalse(!!Posts.findOne(id));
});

Tinytest.add(prefixTest('mixins - update'), function(test) {
  var Posts = new Mongo.Collection(null);
  var Post = DocumentClass.Base.extend(function(){
    this.isTransformOf(Posts);
    this.mixin('update');

    return this;
  });

  var id = Posts.insert({name: 'test'});
  var post = Posts.findOne(id);
  post.update({$set: {
    test: true
  }});

  test.isTrue(Posts.findOne(id).test);
});

Tinytest.add(prefixTest('mixins - schema'), function(test) {
  var Posts = new Mongo.Collection(null);
  var Post = DocumentClass.Base.extend(function(){
    this.isTransformOf(Posts);
    this.mixin('schema');
    this.schema(new SimpleSchema({
      name: {
        type: String
      }
    }));

    return this;
  });

  var id = Posts.insert({name: 'test', test: true});

  test.isFalse(Posts.findOne(id).test);
});
Tinytest.add(prefixTest('mixins - collection'), function(test) {
  var Post = DocumentClass.Base.extend(function(){
    this.isTransformOf(Posts);
    this.mixin('collection');
    this.collection(function(){
      return new Mongo.Collection(null);
    });
    return this;
  });

  var Posts = new Post.Collection();

  var id = Posts.insert({name: 'test'});
  var post = Posts.findOne(id);

  test.isTrue(post instanceof Post);
});
