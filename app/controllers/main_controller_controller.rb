class MainControllerController < ApplicationController
  def team
  end

  def contact
  end
  
  def welcome

  end
  def index
    @gossips=Gossip.all
  end

end
 