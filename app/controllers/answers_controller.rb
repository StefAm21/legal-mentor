class AnswersController < ApplicationController
  before_action :set_question, only: %i[new create show edit update process after_paid check_payment choosed]
  before_action :set_answer, only: %i[show edit update destroy process paid after_paid check_payment choosed]
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
    if @answer.save
      redirect_to general_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show #cuando apreto el pagar, el boton pagar solo tiene que estar cuando el estado de question es choosing y el de answer es accepted
    require 'mercadopago'
    # SDK de Mercado Pago
    # Agrega credenciales
    sdk = Mercadopago::SDK.new('TEST-5635626968426827-030609-8da4baa7bbfe680d16a205b3c2db1afb-325153089')

    # Crea un objeto de preferencia
    preference_data = {
      items: [
        {
          title: @answer.question.title,
          unit_price: @answer.price,
          quantity: 1
        }
      ]
    }
    preference_response = sdk.preference.create(preference_data) # Esto es un post
    preference = preference_response[:response] # Esta es la respuesta de mercado pago es un json

    # Este valor reemplazará el string "<%= @preference_id %>" en tu HTML
    @preference_id = preference['id']
    @preference_status = preference['status']
    #Checkpayment
  end

  def check_payment #Para ver si el pago fue exitoso
    if @preference_status == "approved"
      @answer.pay
      @questions.choosed
      @answer.save
      @question.save
    end
    redirect_to question_answer_path(@question, @answer)
  end


  def choosed #Cuando apreto el Contratar
    @answer.accept
    @answer.save
    redirect_to question_answer_path(@question, @answer)
    # rechazar el resto de Answers que habia para esa pregunta TODO
  end

  def rejected #Cuando apreto rechazar esa propuesta de respuesta
    @answer.reject
    @answer.save
    redirect_to question_answer_path(@question)
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to question_answer_path(@question, @answer)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy #si borro la respusta como lawyer
    @answer.destroy
    redirect_to answers_path, status: :see_other
  end

  def after_paid #Cuando tengo que agregar el archivo adjunto
    if @answer.update(answer_params)
      @question.answer_delivered
      @question.save
      @answer.finalize
      @answer.save
      redirect_to answer_path(@answer)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:price, :payment_status, :comment, :avg_time, :photo, :response_pdf)
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
