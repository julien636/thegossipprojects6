class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
  before_action :only_user, only: [:edit, :update, :destroy]

  def show
    @gossips=Gossip.find(params['id'])
    @city=User.find(@gossips.user.id).city
    @comment=Comment.new
  end

  def new
    @newgossip=Gossip.new
    @tags=Tag.all
  end

  def create    
    @newgossip=Gossip.new(title:params['title'],content:params['content'],user_id:current_user.id)
    if @newgossip.save 
      flash[:notice] = "Gossip successfully created"
      redirect_to home_path
    else
      render new_gossip_path
    end

  end

  def edit
    @gossip=Gossip.find(params['id'])
  end

  def update
    @gossip=Gossip.find(params['id'])
    params_update=params.require(:gossip).permit(:title, :content)
      if @gossip.update(params_update) 
        flash[:notice] = "Gossip successfully updated"
        redirect_to home_path
      else
        render "edit"
      end
  end

  def destroy
    @gossip=Gossip.find(params['id'])
    @gossip.destroy
    flash[:notice] = "Gossip successfully deleted"
    redirect_to home_path
  end

  private

  def only_user
    @gossip = Gossip.find(params[:id])
    unless current_user == @gossip.user
      flash[:notice] = "Please log in."
      redirect_to new_session_path
    end
  end

end
