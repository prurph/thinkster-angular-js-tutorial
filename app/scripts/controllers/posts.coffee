'use strict'

app.controller 'PostsCtrl', ($scope, $location, Post) ->
  $scope.posts = Post.all if $location.path() == '/'
  $scope.post =
    url: 'http://'
    title: ''

  $scope.deletePost = (postId) ->
    Post.delete(postId)
