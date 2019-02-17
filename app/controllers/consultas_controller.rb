class ConsultasController < ApplicationController
    def index
        @consultas = Consulta.all
    end
end
