'use strict'

angular.module('ngappApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/reports',
        templateUrl: 'views/reports.html'
        controller: 'ReportCtrl'
      .when '/portfolio',
        templateUrl: 'views/portfolio.html'
        controller: 'PortfolioCtrl'
      .otherwise
        redirectTo: '/'
