class TopsController < ApplicationController
  
  def index
    if current_user
      @nickname = current_user.nickname
    end
  end
end
