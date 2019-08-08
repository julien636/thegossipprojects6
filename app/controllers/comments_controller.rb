class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
  def new

  end
  def create
  @newcomment=Comment.new(content:params['content'],user_id:current_user.id, commentable: Gossip.find(params[:gossip_id]))
    if @newcomment.save 
      flash[:notice] = "Comment successfully created"
      redirect_to home_path
    else
      flash[:notice] = "Comment cannot be empty"
      redirect_to home_path

  end
  end

  def edit
    @comment=Comment.find(params[:id])
  end

  def update
    @comment=Comment.find(params['id'])
    params_update=params.require(:comment).permit(:content)
      if @comment.update(params_update)
        flash[:notice] = "Comment successfully updated"
        redirect_to home_path
      else
        render "edit"
      end
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @comment=Comment.find(params['id'])
    @comment.destroy
    flash[:notice] = "Comment successfully deleted"
    redirect_to home_path
  end

end
