exports.config =
  # See http://brunch.io/#documentation for docs.
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^(?!app)/

    stylesheets:
      joinTo: 'stylesheets/app.css'

    templates:
      joinTo: 'javascripts/app.js'

  plugins:
    static_jade:          # all optionals
      pretty: true
      extension: ".static.jade"  # static-compile each file with this extension in `assets`

  conventions:
    assets: /(assets|fonts)/