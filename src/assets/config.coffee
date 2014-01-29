require.config
  paths:
    jquery:"//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min"
    angular:"//ajax.googleapis.com/ajax/libs/angularjs/1.2.8/angular.min"
    controllers:"core/controllers"
    app:"app"
  shim:
    'jquery':
      exports:'$'
    'angular':
      deps:['jquery']
      exports:'angular'
    'controllers':
      deps:['angular']
    'app':
      deps:['angular','controllers']
      exports: 'app'
#this is a setting to invalidate all the cached javascript on web browsers
  urlArgs: 'v=0.0.1'

  priority: ['jquery','angular','controllers','app']

require ['angular','controllers','app'],(angular) ->
  angular.element(document).ready () ->
    angular.bootstrap(document,[appName])
