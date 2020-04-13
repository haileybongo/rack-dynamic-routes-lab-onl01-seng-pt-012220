require 'pry'

class Application
  
  @@items = Item.all 

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      req_item = req.params["items"]
      binding.pry 
      
      if @@items.include?
        item = Item.all.select{|item| item.name == req_item}
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

#Item.all.select {|item| item.name == req_item}
