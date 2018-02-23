class CollaboratorsController < ApplicationController
  def destroy
    @collaborator = Collaborator.find(params[:id])
    @collaborator.destroy
    redirect_to @collaborator.wiki
  end
end
