class AnswersController < ApplicationController
  before_action :set_question, only: %i[new create edit update]
  before_action :set_answer, only: %i[show edit update destroy]
  def index
    @answers = Answer.all
    # Aca quizas usemos gema cancancan
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user = current_user
    # @answer.status = "pending"
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to answer_path(@answer)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def status
  # end

  def destroy
    @answer.destroy
    redirect_to answers_path, status: :see_other
  end

  private

  def answer_params
    params.require(:answer).permit(:price, :payment_status, :comment, :avg_time, :photo)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
