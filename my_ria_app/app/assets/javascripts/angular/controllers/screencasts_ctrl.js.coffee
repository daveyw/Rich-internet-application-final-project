App.controller 'ScreencastsCtrl', ['$scope', 'Screencast', ($scope, Screencast) ->
  # Attributes accessible on the view
  $scope.screencasts        = Screencast.query()
  $scope.selectedScreencast = null

  # Set the selected screencast to the one which was clicked
  $scope.showScreencast = (screencast) ->
    $scope.selectedScreencast = screencast
]