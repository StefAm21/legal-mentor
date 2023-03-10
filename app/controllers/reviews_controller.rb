class ReviewsController < ApplicationController
  before_action :set_answer, only: %i[new create]
  before_action :set_question, only: %i[new create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    # @user_lawyer = @answer[:user_id]
    # @review.user = User.find(@user_lawyer)
    # if @review.save
    #   redirect_to questions_path
    # else
    #   render :new, status: :unprocessable_entity
    # end
    if @review.save
      flash[:success] = "Review successfully submitted"
      redirect_to root_path
    else
      flash[:error] = "There was an error submitting your review"
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:rating, :comment)
  end

  def set_answer
    @answer = Answer.find(params[:answer_id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
