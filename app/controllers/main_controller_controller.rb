class MainControllerController < ApplicationController


  def team
  end

  def contact
  end
  
  def welcome

  end

  def home
    @gossips=Gossip.all
  end


end
 