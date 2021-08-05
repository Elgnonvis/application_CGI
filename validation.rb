# Start the CGI program that receives and returns the data
require 'cgi'
cgi = CGI.new
# After receiving the data, return a response in HTML format
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # Take out the received data with cgi ['not_auto'] and assign it to a local variable
  # Get information from the landmark'not_auto'
  get = cgi['goya']
  #Return response in HTML
  "<html>
    <body>
      <p>La réponse est la suivante:</p>
      #{get}
    </body>
  </html>"
}