(function(){"use strict";angular.module("ngappApp",["ngCookies","ngResource","ngSanitize","ngRoute"]).config(["$routeProvider",function(a){return a.when("/",{templateUrl:"views/portfolio.html",controller:"PortfolioCtrl"}).when("/reports",{templateUrl:"views/reports.html",controller:"ReportCtrl"}).when("/portfolio",{templateUrl:"views/portfolio.html",controller:"PortfolioCtrl"}).otherwise({redirectTo:"/"})}])}).call(this),function(){"use strict";angular.module("ngappApp").controller("MainCtrl",["$scope",function(a){return a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}])}.call(this),function(){"use strict";angular.module("ngappApp").controller("ReportCtrl",["$scope",function(a){return a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}])}.call(this),function(){"use strict";angular.module("ngappApp").controller("PortfolioCtrl",["$scope",function(a){return a.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}])}.call(this);