class ContestsController < ApplicationController
  
  def new
    # pick a random question
	@question = Question.random
	# pick the contestants
	@contestant_a, @contestant_b = TeamMember.pick_two  
	render "new"
  end
  
  def submit
    logger.debug "*****"
    logger.debug "User clicked button for #{TeamMember.find(params[:winner]).name}"
	
	Contest.create(
	  :question_id => params[:question],
	  :winner_id => params[:winner],
	  :loser_id => params[:loser]
	)
	
    redirect_to :back
  end
  
  def index
	@contests = Contest.limit(15).reverse_order
  end
  
  private

  
end
