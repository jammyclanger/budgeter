<!doctype html>
<html>
  <head>
    <script src="/public/js/jquery-2.1.4.min.js"></script>
    <script src="/public/js/bootstrap.min.js"></script>
    <script src="/public/js/angular.min.js"></script>
    <script src="/public/js/angular-drag-and-drop-lists.js"></script>
    <script src="/public/js/main.js"></script>
    
    <link rel="stylesheet" href="/public/css/bootstrap.css" />
    <link rel="stylesheet" href="/public/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="/public/css/budgeter.css" />
  </head>
  <body ng-app="budgeter">
<div ng-view="" class="ng-scope">
<div class="container">
<div class="nestedDemo row" ng-include="'/public/nested.html'" ng-controller="NestedListsDemoController"></div>
</div>
