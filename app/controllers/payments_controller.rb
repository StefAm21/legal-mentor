class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'mercadopago'
  def index
    @payments = Payment.all
  end

  def new
    @answer = Answer.find(params[:answer_id])
    @payment = Payment.new
    session[:answer_id] = params[:answer_id] # Es como un params pero global de la app
    session[:question_id] = params[:id]

  end

  def process_payment
    # @answer = Answer.find(params[:answer_id])
    # @question = Question.find(params[:question_id])]
    require 'mercadopago'
    sdk = Mercadopago::SDK.new(ENV['MP_TOKEN'])


    payment_data = {
      transaction_amount: params[:transaction_amount].to_f,
      token: params[:token],
      description: params[:description],
      installments: params[:installments].to_i,
      payment_method_id: params[:payment_method_id],
      payer: {
        email: params["payer"]["email"],
        identification: {
          type: params[:identificationType],
          number: params[:identificationNumber]
        },
        first_name: params[:cardholderName]
      }
    }

    payment_response = sdk.payment.create(payment_data)
    payment = payment_response[:response]
    resultado = JSON.parse(payment.to_json)
    if resultado["status"] == "rejected"
      redirect_to root_path
    end



    #result = JSON.parse(request.raw_post)
    #result = JSON.parse(request.body.string)
    #pp "#############################################"
    #pp result
    #pp "#############################################"

    #pp "*********************************************"
    #pp payment
    #pp "*********************************************"

    pp "+++++++++++++++++++++++++++++++++++++++++++++"
    pp resultado
    pp "+++++++++++++++++++++++++++++++++++++++++++++"
    #pp "-----------------"
    #pp payment_response
    #pp "-----------------"

    #pp "............................................."
    #pp payment_data
    # pp "............................................."

    pp params


    @payment = Payment.new
    @payment.mp_id = resultado["id"].to_i
    @payment.status = resultado["status"]
    @payment.status_detail = resultado["status_detail"]
    @answer = Answer.find(session[:answer_id])
    if @payment.save
      if @payment.status == "approved"
        @question = @answer.question
        @answer.pay
        @question.choosed
        @answer.save
        @question.save
        p "PASOOOOOOOOO POR EL IFFFFFFF------------------"
      end
      redirect_to payment_path(@payment)
    else
      redirect_to root_path, alert: "Algo salio mal"
    end

  end

  def show
    @payment = Payment.find(params[:id])
  end


end
