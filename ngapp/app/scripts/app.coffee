'use strict'

@app = angular.module('ngappApp', [
  'ngCookies',
  'ngSanitize',
  'ngRoute',
  'restangular'
])

@app.config ['$routeProvider', 'RestangularProvider', ($routeProvider, RestangularProvider) ->
  RestangularProvider.setBaseUrl('/api/v1')
  RestangularProvider.setRequestSuffix('.json')

  $routeProvider
    .when '/',
      templateUrl: 'views/portfolio.html'
      controller: 'PortfolioCtrl'
    .when '/reports',
      templateUrl: 'views/reports.html'
      controller: 'ReportCtrl'
    .when '/portfolio',
      templateUrl: 'views/portfolio.html'
      controller: 'PortfolioCtrl'
    .when '/notifications',
      templateUrl: 'views/notifications.html'
      controller: 'NotificationCtrl'
    .otherwise
      redirectTo: '/'
]

# setting headers to use PATCH
#defaults = $http.defaults.headers
#defaults.patch = defaults.patch || {}
#defaults.patch['Content-Type'] = 'application/json'

# Prefix url string for api calls
@app.constant "apiPrefix", "/api/v1"

@app.config ['$httpProvider', ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
]
