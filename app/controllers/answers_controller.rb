class AnswersController < ApplicationController
  require 'mercadopago'
  before_action :set_question, only: %i[new create edit update process]
  before_action :set_answer, only: %i[show edit update destroy process paid]
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
    @question.new_answer if @question.waiting?
    @question.save
    # @answer.status = "pending"
    if @answer.save
      redirect_to question_path(@question)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  # def process
  #   if params[:condition] == "choosed"
  #     @answer.accept
  #   else
  #     @answer.reject
  #   end
  # end
  def paid
  # SDK de Mercado Pago
  require 'mercadopago'
  # Agrega credenciales
  sdk = Mercadopago::SDK.new(ENV['MERCADOPAGO_TOKEN'])

  # Crea un objeto de preferencia
  preference_data = {
    items: [
      {
        title: "Test de producto",
        unit_price: 75,
        quantity: 1
      }
    ]
  }
  preference_response = sdk.preference.create(preference_data) # Esto es un post
  preference = preference_response[:response] # Esta es la respuesta de mercado pago es un json
  # respuesta = JSON.parse(preference.to_json)
  # @preference_id = respuesta['id']

  # Este valor reemplazará el string "<%= @preference_id %>" en tu HTML
  @preference_id = preference['id']


    @answer.paid
    @questions.choosed
  end

  def choosed
    @answer.accept
    @answer.save
    # rechazar el resto de Answers que habia para esa pregunta
  end

  def rejected
    @answer.reject
    @answer.save
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
