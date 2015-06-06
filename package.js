Package.describe({
  name: 'maximum:document-classes',
  summary: 'Provides ability to add transform-classes to a collection',
  version: '0.1.0'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.2');
  api.use([
    'coffeescript',
    'maximum:transformto@1.0.0',
  ]);

  api.addFiles([
    'lib/namespace.coffee',
    'lib/baseclass.coffee',
    'lib/mixins.coffee',
    'lib/mixins/update.coffee',
    'lib/mixins/remove.coffee',
  ]);

  api.export('DocumentClass');
});

Package.onTest(function(api) {
  api.use([
    'tinytest',
    'coffeescript',
    'maximum:document-classes'
  ]);
  api.addFiles('tests/coffeescript.coffee');
});
