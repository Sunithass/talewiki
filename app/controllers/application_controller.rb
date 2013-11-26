class ApplicationController < ActionController::Base
  protect_from_forgery

def check_authentic_user
unless session[:user_id]
flash[:notice] = "please log in"
redirect_to(:controller => "users", :action => "index")
end
end
end
