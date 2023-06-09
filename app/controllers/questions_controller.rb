class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]

  def index
    @questions = Question.find_all_questions
    @question = Question.new
  end

  def general
    if params[:query].present?
      @questions = Question.search_by_category(params[:query])
    else
      @questions = Question.find_all_questions
    end
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(current_user.id)
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
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
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, status: :see_other
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :category)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
