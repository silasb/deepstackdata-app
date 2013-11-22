'use strict'

angular.module('ngappApp')
  .controller 'WelcomeCtrl', ($scope, $cookieStore) ->
    $scope.shown = $cookieStore.get('welcome_banner')

    $scope.dismiss = () ->
      $scope.shown = false
      $cookieStore.put('welcome_banner', false)

    $scope
