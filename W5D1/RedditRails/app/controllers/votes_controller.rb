class VotesController < ApplicationController

  def create
    vote = Vote.new(vote_params)
    session[:return_to] ||= request.referer
    if vote.save
      redirect_to session.delete(:return_to)
    else
      flash[:errors] = vote.errors.full_messages
      redirect_to session.delete(:return_to)
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:votable_type, :votable_id, :value)
  end
end
