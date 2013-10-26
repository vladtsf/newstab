CollectionView = require "views/base/collection-view"
NewsItemView = require "./news-item-view"

module.exports = class NewtabIndexView extends CollectionView
  autoRender: yes
  className: "b-news-tile b-news-tile_loading"
  itemView: NewsItemView
  template: require "./templates/index"

  onSync: ->
    @$el.removeClass "b-news-tile_loading"

  listen:
    "sync collection": "onSync"