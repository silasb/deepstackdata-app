'use strict'

@app.controller 'WelcomeCtrl', ['$scope', '$cookieStore', ($scope, $cookieStore) ->
  if $cookieStore.get('welcome_banner') == undefined
    $scope.shown = true
  else
    $scope.shown = $cookieStore.get('welcome_banner')

  $scope.dismiss = () ->
    $scope.shown = false
    $cookieStore.put('welcome_banner', false)

  $scope
]
