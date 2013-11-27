'use strict'

@app.controller 'NotificationCtrl', ['$scope', 'Restangular', ($scope, Restangular) ->
  notification = Restangular.all('notifications')
  notification.getList().then (notifications) ->
    $scope.notifications = notifications

  $scope.shown = true

  $scope.dismiss = (notification) ->
    notification.dismissed_at = new Date
    notification.put()
    $scope.notifications.splice( $scope.notifications.indexOf(notification), 1 )
    $scope.shown = false

  $scope
]
