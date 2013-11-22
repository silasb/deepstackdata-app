'use strict'

@app = angular.module('ngappApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])

@app.config ($routeProvider) ->
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
      .otherwise
        redirectTo: '/'

# Prefix url string for api calls
@app.constant "apiPrefix", "/api/v1"

#@app.config ($httpProvider) ->
#authToken = $("meta[name=\"csrf-token\"]").attr("content")
#$httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
