'use strict'

app.controller('PostViewCtrl', ($scope, $routeParams, Post) ->
  $scope.post = Post.find($routeParams.postId)

  $scope.addComment = () ->
    Post.addComment($routeParams.postId, $scope.comment)
    $scope.comment = ''

  $scope.removeComment = (comment, commentId) ->
    Post.deleteComment($scope.post, comment, commentId)
)
