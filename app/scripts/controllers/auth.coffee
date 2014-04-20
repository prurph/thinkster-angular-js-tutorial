'use strict'

app.controller('AuthCtrl', ($scope, $location, Auth) ->
  if Auth.signedIn() then $location.path('/')

  $scope.$on('$firebaseSimpleLogin:login', ->
    $location.path('/')
  )

  $scope.login = ->
    Auth.login($scope.user).then ->
      $location.path('/')
    , (error) ->
      $scope.error = error.toString()

  $scope.register = ->
    Auth.register($scope.user).then (authUser) ->
      console.log(authUser)
      $location.path('/')
    , (error) ->
      $scope.error = error.toString()
)
