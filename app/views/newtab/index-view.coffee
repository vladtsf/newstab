CollectionView = require "views/base/collection-view"
NewsItemView = require "./news-item-view"

module.exports = class NewtabIndexView extends CollectionView
  autoRender: yes
  className: "b-news-tile b-news-tile_loading"
  itemView: NewsItemView
  template: require "./templates/index"
  animationDuration: 0 # disable animation

  initialize: ->
    $(window).on "scroll.#{@cid}", @onScroll.bind @

    # don't fetch 'till the request will be finished
    @noFetch = yes

    super

  render: ->
    super

    @$el.isotope
      itemSelector : '.b-news-tile__item',
      layoutMode : 'fitRows'

    @

  onScroll: ->
    newOffset = @collection.offset + 30

    # don't do nothing in case of timeline end
    return if newOffset >= @collection.total

    if not @noFetch and document.height - $(document).scrollTop() - document.body.clientHeight <= 0
      @noFetch = yes

      @collection.fetch
        remove: no
        data:
          offset: newOffset
          limit: @collection.limit

  onSync: ->
    @$el.isotope "reLayout"
    @noFetch = no
    @$el.removeClass "b-news-tile_loading"

  listen:
    "sync collection": "onSync"