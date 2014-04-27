'use strict'

app.controller('AuthCtrl', ($scope, $location, Auth, User) ->
  if Auth.signedIn() then $location.path('/')

  $scope.$on('$firebaseSimpleLogin:login', ->
    $location.path('/')
  )

  $scope.login = ->
    Auth.login($scope.user).then (authUser) ->
      $location.path('/')
    , (error) ->
      $scope.error = error.toString()

  $scope.register = ->
    Auth.register($scope.user).then (authUser) ->
      User.create(authUser, $scope.user.username)
      $location.path('/')
    , (error) ->
      $scope.error = error.toString()
)
