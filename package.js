Package.describe({
  name: 'team:document-class',
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
    'namespace.coffee',
    'baseclass.coffee',
    'mixins.coffee',
    'mixins/update.coffee',
    'mixins/remove.coffee',
  ]);

  api.export('DocumentClass');
});
