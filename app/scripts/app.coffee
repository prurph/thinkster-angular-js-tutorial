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
    .otherwise
      redirectTo: '/'

app.constant('FIREBASE_URL', 'https://vivid-fire-4076.firebaseio.com/')

