'use strict'

app.controller 'PostsCtrl', ($scope, $location, Post) ->
  $scope.posts = Post.all
  $scope.post =
    url: 'http://'
    title: ''

  $scope.deletePost = (postId) ->
    Post.delete(postId)

#@ sourceMappingURL=posts.js.map
