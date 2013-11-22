'use strict'

angular.module('ngappApp')
  .controller 'WelcomeCtrl', ($scope, $cookieStore) ->
    if $cookieStore.get('welcome_banner') == undefined
      $scope.shown = true
    else
      $scope.shown = $cookieStore.get('welcome_banner')

    $scope.dismiss = () ->
      $scope.shown = false
      $cookieStore.put('welcome_banner', false)

    $scope
