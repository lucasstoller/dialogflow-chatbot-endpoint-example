class ConsultasController < ApplicationController
    protect_from_forgery with: :null_session

    before_action :set_params, only: :create
    def index
        @consultas = Consulta.all
    end

    def create
        @consulta = Consulta.new({ especialidade: @especialidade, data: @data, horario: @horario})
        if @consulta.save
            response = {
                fulfillmentMessages: [
                    { 
                        text: {
                            text: [
                                "Consulta marcada! O código da sua consulta é consulta: #{@consulta.id}. Obrigado ;)."
                            ]
                        },
                    }
                ]
            }
        else
            response = {
                fulfillmentMessages: [
                    { 
                        text: {
                            text: [
                                "Infelizmente não foi possível marcar sua consulta.
                                \nPor favor tente novamente."
                            ]
                        },
                    }
                ]
            }
        end
        puts response
        puts @horario
        render json: response
    end

    private
        def set_params
            @especialidade = params[:queryResult][:parameters]["especialidade"]
            @data = params[:queryResult][:parameters]["date"]
            @horario = params[:queryResult][:parameters]["time"]
        end
end
