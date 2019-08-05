class GossipController < ApplicationController
  def gdisplay
    @gossips=Gossip.find(params['id'])
  end

end
