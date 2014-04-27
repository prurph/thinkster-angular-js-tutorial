'use strict'

app.factory('User', ($firebase, FIREBASE_URL, Auth, $rootScope) ->
  ref = new Firebase(FIREBASE_URL + 'users')
  users = $firebase(ref)

  $rootScope.$on('$firebaseSimpleLogin:login', (e, authUser) ->
    query = $firebase(ref.startAt(authUser.uid).endAt(authUser.uid))

    query.$on('loaded', ->
      setCurrentUser(query.$getIndex()[0])
    )
  )

  $rootScope.$on('$firebaseSimpleLogin:logout', ->
    delete $rootScope.currentUser
  )

  setCurrentUser = (username) ->
    $rootScope.currentUser = User.findByUsername(username)

  User =
    create: (authUser, username) ->
      users[username] =
        md5_hash: authUser.md5_hash
        username: username
        $priority: authUser.uid

      users.$save(username).then ->
        setCurrentUser(username)

      users.$save(username)

    findByUsername: (username) ->
      users.$child(username) if username

    getCurrent: ->
      $rootScope.currentUser

    signedIn: ->
      $rootScope.currentUser?

  User
)
