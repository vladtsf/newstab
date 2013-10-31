cp = require "child_process"
{version} = require "./public/manifest.json"
path = require "path"
cwd = process.cwd()

run = (command, callback) ->
  exec command, (err, stdout, stderr) ->
    console.warn stderr if stderr
    callback?() unless err

task "release", "Release the new version of plugin", ->
  src = path.join cwd, "public"
  dst = path.join cwd, "releases", "v#{version}.zip"

  cp.exec "cd #{src} && zip -r #{dst} ./*", ->
    console.log dst
