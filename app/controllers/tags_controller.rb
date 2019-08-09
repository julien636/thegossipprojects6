class TagsController < ApplicationController

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @tags=Tag.all
    @tag=@tags.find_by(id:params[:id])
    @gossips=Gossip.all
  end

end
