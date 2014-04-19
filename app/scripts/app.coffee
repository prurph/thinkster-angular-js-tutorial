'use strict'

root = exports ? this
root.app = angular.module('angNewsApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute'
  ])

app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/posts.html',
      controller: 'PostsCtrl'
    .otherwise
      redirectTo: '/'

