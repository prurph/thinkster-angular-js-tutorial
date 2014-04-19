'use strict'

app.controller 'PostsCtrl', ($scope, $location, Post) ->
  $scope.posts = Post.all
  $scope.post =
    url: 'http://'
    title: ''

  $scope.submitPost = ->
    Post.create($scope.post).then (ref) ->
      $location.path '/posts/' + ref.name()


  $scope.deletePost = (postId) ->
    Post.delete(postId)

#@ sourceMappingURL=posts.js.map
