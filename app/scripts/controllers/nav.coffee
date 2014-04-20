'use strict'

app.controller('NavCtrl', ($scope, $location, Post, Auth) ->
  $scope.post =
    url: 'http://',
    title: ''

  $scope.submitPost = ->
    Post.create($scope.post).then (ref) ->
      $location.path '/posts/' + ref.name()
      $scope.post =
        url: 'http://',
        title: ''

  $scope.logout = ->
    Auth.logout()
)

#@ sourceMappingURL=nav.js.map
