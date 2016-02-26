class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def get_random(len)
    newrandom = ""
    1.upto(len){|i| newrandom << rand(10).to_s}
    return newrandom
  end

end
