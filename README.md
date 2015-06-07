# Meteor document classes [![Build Status](https://travis-ci.org/maximummeteor/document-classes.svg)](https://travis-ci.org/maximummeteor/document-classes)
Meteor package for easily creating classes for transformation of collections

## Installation
```
    meteor add maximum:document-classes
```

## Usage

create a class, that extends `DocumentClass.Base`
````coffeescript
Posts = new Mongo.Collection 'posts'

class Post extends DocumentClass.Base
  # define your functions here
  # test: -> return true

# Class.isTransformOf(Collection) transforms documents
# of the given collection to an instance of your class.
Post.isTransformOf Posts
````

mostly you'll have one class for one collection. In this case, you can use the 'collection' mixin.
````coffeescript
class Post extends DocumentClass.Base
  @mixins 'collection'
  @collection ->
    # with the collection function, you can define the
    # instantiation of the collection for this class.
    # You can also pass parameters or make use of
    # collection-instances.
    return new Mongo.Collection 'posts'

# we can get our collection with Class.Collection()
# documents of this collection will automatically transformed to our class
Posts = Post.Collection()
````

### Javascript

It's also possible to use javascript. Use extend for extending classes
````javascript
var Posts = new Mongo.Collection('posts');

var Post = DocumentClass.Base.extend(function(){
  this.isTransformOf(Posts);

  this.staticFunction = function() {
    return 'static';
  };

  this.prototype.instanceFunction = function() {
    return 'instance';
  };

  return this;
});
````

### Mixins

document classes are extensible with mixins. You can add mixins, with `Class.mixins()`
````coffeescript
class Post extends DocumentClass.Base
  # the mixins function takes one or multiple mixin-names
  @mixins 'collection', 'schema'
  # you can also pass an array of mixins, instead of multiple parameters
````
#### Default mixins
the following mixins are available by default

##### transform
*Notice: the transform mixin is included by default and is only listed here to have a complete list*

provides the `isTransformOf` function to transform a collection to this class.

##### collection
provides the ability to define a collection for a class.

example:
````coffeescript
class Post extends DocumentClass.Base
  @mixins 'collection'
  @collection ->
    # with the collection function, you can define the
    # instantiation of the collection for this class.
    # You can also pass parameters or make use of
    # collection-instances.
    return new Mongo.Collection 'posts'

# we can get our collection with Class.Collection()
# documents of this collection will automatically transformed to our class
Posts = Post.Collection()
````
##### schema
add a schema to your class.

example:
````coffeescript
class Post extends DocumentClass.Base
  @mixin 'schema'
  @schema new SimpleSchema
    name:
      type: String
````
##### remove
provides the `remove()` function, to delete the current document.
##### update
provides the `update(modifier)` function, to update the current document.

#### Create own mixins

you can add your own mixin with calling `DocumentClass.Mixins.add(name, mixin)`.
Pass a class that extends `DocumentClass.Mixins.Base` as the second parameter.

example:
````coffeescript
DocumentClass.Mixins.add 'example', class ExampleMixin extends DocumentClass.Mixins.Base
  @static:
    # static functions

  @instance:
    # instance functions
````
