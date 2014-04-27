'use strict'

app.factory('Auth', ($firebaseSimpleLogin, FIREBASE_URL, $rootScope) ->

  ref = new Firebase(FIREBASE_URL)
  auth = $firebaseSimpleLogin(ref)

  Auth =
    register: (user) ->
      auth.$createUser(user.email, user.password)
    signedIn: ->
      auth.user != null
    login: (user) ->
      auth.$login('password', user)
    logout: ->
      auth.$logout()

  $rootScope.signedIn = ->
    Auth.signedIn()

  Auth
)
