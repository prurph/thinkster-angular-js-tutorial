'use strict'

app.factory('Post', ($resource) ->
  $resource('https://vivid-fire-4076.firebaseio.com/posts/:id.json')
)

#@ sourceMappingURL=post.js.map
