App.factory 'Screencast', ['$resource', ($resource) ->
  $resource '/screencasts/:id', id: '@id'
]