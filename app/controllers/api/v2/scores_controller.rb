module Api
    module V2
        class ScoresController < ApplicationController
            def index
                scores = Score.all.limit(10)
                render json: {all_scores: scores}
            end

            def create
                score = Score.create!(
                    name: parmas[:name],
                    points: params[:points],
                    rows: params[:rows],
                    level: params[:level]
                )

                if score 
                    render json: score
                end 

            end
            
        end
    end    
end