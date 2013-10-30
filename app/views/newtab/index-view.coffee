CollectionView = require "views/base/collection-view"
NewsItemView = require "./news-item-view"

module.exports = class NewtabIndexView extends CollectionView
  autoRender: yes
  className: "b-news-tile b-news-tile_loading"
  itemView: NewsItemView
  template: require "./templates/index"
  animationDuration: 0 # disable animation
  options:
    imageWidth: 256

  initialize: ->
    $(window).on "scroll.#{@cid}", @onScroll.bind @
    $(window).on "resize.#{@cid}", @updateWidth.bind @

    # don't fetch 'till the request will be finished
    @noFetch = yes

    super

  render: ->
    super
    @updateWidth()
    @masonry()
    @

  updateWidth: ->
    @$el.css "max-width", ~~( document.body.clientWidth / @options.imageWidth ) * @options.imageWidth

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

  masonry: ->
    if @$el.data "masonry"
      @$el.removeData( "masonry" )
    else
      setTimeout => @$el.masonry "bindResize"

    @$el.masonry
      columnWidth: 256,
      itemSelector: '.b-news-tile__item'


  onSync: ->
    @$("img").load @masonry.bind @

    @noFetch = no
    @$el.removeClass "b-news-tile_loading"

  listen:
    "sync collection": "onSync"