require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
# Ouvrir sur la racine
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'index.html.erb')
#la route de validation du formulaire (action=...)
server.mount('/validation.cgi', WEBrick::HTTPServlet::CGIHandler, 'validation.rb')


server.start