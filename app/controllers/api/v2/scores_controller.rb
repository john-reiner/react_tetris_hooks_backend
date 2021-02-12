module Api
    module V2
        class ScoresController < ApplicationController
            before_action :authenticate_user
            def index
                scores = Score.all
                render json: scores
            end
            
        end
    end    
end