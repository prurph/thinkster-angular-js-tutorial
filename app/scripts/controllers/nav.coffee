'use strict'

app.controller('NavCtrl', ($scope, $location, Post, Auth) ->
  $scope.post =
    url: 'http://',
    title: ''

  $scope.submitPost = ->
    Post.create($scope.post).then (postId) ->
      $location.path '/posts/' + postId
      $scope.post =
        url: 'http://',
        title: ''

  $scope.logout = ->
    Auth.logout()

)
