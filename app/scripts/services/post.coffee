'use strict'

app.factory('Post', ($firebase, FIREBASE_URL, User) ->
  ref = new Firebase(FIREBASE_URL + 'posts')
  posts = $firebase(ref)

  # can now call these methods on posts
  Post =
    all: posts,
    create: (post) ->
      if User.signedIn()
        user = User.getCurrent()
        post.owner = user.username

        posts.$add(post).then (ref) ->
          postId = ref.name()
          user.$child('posts').$child(postId).$set(postId)
          postId

    find: (postId) ->
      posts.$child(postId)

    delete: (postId) ->
      if User.signedIn()
        post = Post.find(postId)

        post.$on('loaded', () ->
          # when the post is loaded, use its owner property to find a user
          user = User.findByUsername(post.owner)
          # then remove the post by its ID and remove the association from the user
          posts.$remove(postId).then () ->
            user.$child('posts').$remove(postId)
        )

)
