# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@flutter = angular.module('flutter', [])

@flutter.filter 'timeAgo', ->
  (date) ->
    moment(date).fromNow()

@flutter.controller 'FeedCtrl', ['$scope', ($scope) ->

]