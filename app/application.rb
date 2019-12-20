class Application 
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path == "/items"
      item = req.path.split("/items/").last
      price_lookup = @@items.find { |i| i.name == item }
      resp.write price_lookup.price
      
    else
      resp.write "Route not found"
      resp.status = 404
    
    end
 
    resp.finish
  end

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path=="/songs"
      resp.write "You requested the songs"
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end