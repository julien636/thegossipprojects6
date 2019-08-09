class LikesController < ApplicationController
  before_action :find_gossip
  before_action :find_like, only: [:destroy]

  def create
    @gossip=Gossip.find_by(id:params[:gossip_id])
    if already_liked?
      
    else
      @gossip.likes.create(user: current_user)
      flash[:notice] = "Like ajouté"
    end
    redirect_back fallback_location: gossips_path
  end

  def destroy
    @like.destroy
    redirect_back fallback_location: gossips_path
    flash[:notice] = "Unlike"
  end


  private

  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, gossip_id:params[:gossip_id]).exists?
  end

  def find_like
    @like = @gossip.likes.find(params[:id])
 end
end
