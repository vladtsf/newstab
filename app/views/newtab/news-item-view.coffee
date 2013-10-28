View = require "views/base/view"

module.exports = class NewsItemView extends View
  autoRender: yes
  className: "b-news-tile__item b-news-tile__item_loading"
  template: require "./templates/news-item"

  render: ->
    @$el.css
      width: @model.get( "image" )?.width
      height: @model.get( "image" )?.height

    super
