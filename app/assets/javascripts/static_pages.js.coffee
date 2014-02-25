# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@flutter = angular.module('flutter', [])

@flutter.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = 
    $('meta[name=csrf-token]').attr('content')
]

@flutter.filter 'timeAgo', ->
  (date) ->
    moment(date).fromNow()

@flutter.controller 'FeedCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.new_feed_item = {}

  $scope.createFeedItem = (feed_item) ->
    $http.post("/microposts.json", feed_item)
      .success (created_item) ->
        $scope.feed_items.unshift(created_item.micropost)
        $scope.new_feed_item = {}
      .error (data) ->
        console.log(data)

  $scope.deleteFeedItem = (feed_item) ->
    $http.delete("/microposts/#{feed_item.id}.json").success ->
      $scope.feed_items.splice($scope.feed_items.indexOf(feed_item), 1);
]