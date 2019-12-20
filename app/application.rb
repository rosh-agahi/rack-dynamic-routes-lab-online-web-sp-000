class Application 
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match("/items")
      item = req.path.split("/items/").last
      search_item = @@items.find { |i| i.name == item }
      if search_item
        resp.write search_item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
      
    else
      resp.write "Route not found"
      resp.status = 404
    
    end
 
    resp.finish
  end

    
end