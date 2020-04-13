require 'pry'

class Application
  
  

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      req_item = req.params["items"]
      binding.pry 
      
      if Item.all.select(|item| itwm.name = req_item)
        item = Item.all.select(name = req_item)
        resp.write "#{item.price}\n"
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
