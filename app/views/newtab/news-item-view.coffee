View = require "views/base/view"

module.exports = class NewsItemView extends View
  autoRender: yes
  tagName: "a"
  className: "b-news-tile__item b-news-tile__item_loading"
  template: require "./templates/news-item"

  render: ->
    @$el.css
      height: @model.get( "image" )?.height

    @$el.attr
      href: @model.get "href"

    super

    @$(".b-news-tile__item__image").on "load", ( e ) => @onLoad e

    @

  onLoad: ( e ) ->
    @$el.removeClass "b-news-tile__item_loading"
    $(e.currentTarget).addClass "b-news-tile__item__image_loaded"

  events:
    "load .b-news-tile__item__image": "onLoad"