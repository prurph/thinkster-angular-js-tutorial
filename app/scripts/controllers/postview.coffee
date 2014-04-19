'use strict'

app.controller('PostViewCtrl', ($scope, $routeParams, Post) ->
  $scope.post = Post.find($routeParams.postId)
)

#@ sourceMappingURL=postview.js.map

