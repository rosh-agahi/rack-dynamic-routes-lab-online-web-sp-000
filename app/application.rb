class Application 
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path == "/items"
      item = req.path.split("/items/").last
      resp.write @@items.find { |i| i.name == item }.price
      
    else
      resp.write "Route not found"
      resp.status = 404
    
    end
 
    resp.finish
  end

  
end