'use strict'

app.controller('ProfileCtrl', ($scope, $routeParams, Post, User) ->
  $scope.user = User.findByUsername($routeParams.username)
)
