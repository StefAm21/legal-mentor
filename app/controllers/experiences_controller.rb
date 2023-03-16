class ExperiencesController < ApplicationController
  before_action :set_user, only: %i[create update edit]
  def create
    @experiences = Experience.new(experiences_params)
    @user.experiences << @experiences
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

  def experiences_params
    params.require(:experience).permit(:company_name, :job_title, :start_date, :end_date)
  end
end
