phantom = require 'phantom';

phantom.create (ph) ->
  ph.createPage (page) ->
    page.open "http://www.baidu.com", (status) ->
      console.log "opened baidu? ", status
      page.evaluate (-> document.title), (result) ->
        console.log 'Page title is ' + result
        ph.exit()