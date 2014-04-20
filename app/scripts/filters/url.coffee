'use strict'

app.filter('hostnameFromUrl', ->
  (str) ->
    url = document.createElement('a')
    url.href = str
    url.hostname
)

# @sourceMappingURL=url.js.map
