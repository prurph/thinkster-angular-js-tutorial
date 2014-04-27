'use strict'

app.controller('ProfileCtrl', ($scope, $routeParams, Post, User) ->
  $scope.user = User.findByUsername($routeParams.username)
  $scope.commentedPosts = {}

  populatePosts = ->
    $scope.posts = {}
    angular.forEach($scope.user.posts, (postId) ->
      $scope.posts[postId] = Post.find(postId)
    )

  populateComments = ->
    $scope.comments = {}
    angular.forEach($scope.user.comments, (comment) ->
      post = Post.find(comment.postId)

      post.$on('loaded', ->
        $scope.comments[comment.id] = post.$child('comments').$child(comment.id)
        $scope.commentedPosts[comment.postId] = post
      )
    )

  $scope.user.$on('loaded', ->
    populatePosts()
    populateComments()
  )

)
