'use strict'

app.factory('Post', ($firebase, FIREBASE_URL) ->
  ref = new Firebase(FIREBASE_URL + 'posts')
  posts = $firebase(ref)

  # can now call these methods on posts
  Post =
    all: posts,
    create: (post) ->
      posts.$add(post)
    find: (postId) ->
      posts.$child(postId)
    delete: (postId) ->
      posts.$remove(postId)

)

#@ sourceMappingURL=post.js.map
