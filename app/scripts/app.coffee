'use strict'

root = exports ? this
root.app = angular.module('angNewsApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'firebase'
  ])

app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/posts.html',
      controller: 'PostsCtrl'
    .when '/posts/:postId',
      templateUrl: 'views/showpost.html',
      controller: 'PostViewCtrl'
    .when '/register',
      templateUrl: 'views/register.html',
      controller: 'AuthCtrl',
    .when '/login',
      templateUrl: 'views/login.html',
      controller: 'AuthCtrl'
    .when '/users/:username',
      templateUrl: 'views/profile.html',
      controller: 'ProfileCtrl'
    .otherwise redirectTo: '/'

app.constant('FIREBASE_URL', 'https://vivid-fire-4076.firebaseio.com/')

#@ sourceMappingURL=app.js.map
