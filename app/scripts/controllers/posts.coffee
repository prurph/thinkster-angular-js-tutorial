'use strict'

app.controller 'PostsCtrl', ($scope) ->
  $scope.posts = []
  $scope.post =
    url: 'http://'
    title: ''

  $scope.submitPost = ->
    $scope.posts.push $scope.post
    $scope.post =
      url: 'http://'
      title: ''

  $scope.deletePost = (index) ->
    $scope.posts.splice(index, 1)

#@ sourceMappingURL=posts.js.map
