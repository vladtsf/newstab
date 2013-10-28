Collection = require 'models/base/collection'
NewsItem = require './news-item'

module.exports = class News extends Collection
  model: NewsItem

  url: "http://localhost:3000/feed.json"

  parse: ( res ) ->
    @offset = res.offset
    @limit = res.limit
    @total = res.total

    res.items

  # fetch: ->
  #   def = new $.Deferred()

  #   setTimeout =>
  #     @push ( for item in [0...50]

  #       {
  #         title: ( "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc euismod porta turpis, et feugiat mauris suscipit id. Ut id diam." ).split( " " )[ 0 ... ~~( Math.random() * 100 % 15 + 5 )].join " "
  #         href: "http://ya.ru"
  #         image:
  #           width: 200
  #           height: (height = ~~( ( Math.random() * 1000 ) % 150 + 100 ) )
  #           src: "http://dummyimage.com/200x#{ height }/000/000"
  #       }
  #     )

  #     @trigger "sync"

  #     def.resolve()
  #   , 1e3

  #   def
