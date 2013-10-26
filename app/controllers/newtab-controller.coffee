Controller = require 'controllers/base/controller'
NewtabIndexView = require 'views/newtab/index-view'
NewsCollection = require 'models/news'

module.exports = class NewtabController extends Controller

  index: ->
    @view = new NewtabIndexView
      collection: new NewsCollection
      region: "main"

    @view.collection.fetch()
