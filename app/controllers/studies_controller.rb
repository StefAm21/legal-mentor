class StudiesController < ApplicationController
  before_action :set_user, only: %i[create update edit]
  def create
    @study = Study.new(studies_params)
    @user.studies << @study
    if @user.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def studies_params
    params.require(:study).permit(:title, :university, :start_date, :end_date)
  end
end
