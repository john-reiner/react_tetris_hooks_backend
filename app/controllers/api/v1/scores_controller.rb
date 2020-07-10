module Api
    module V1
        class ScoresController < ApplicationController
            def index
                scores = Score.all.order(points: :desc)
                render json: scores.to_json(:include => {:user => {:only => [:username]}}, except: [:created_at, :updated_at])
            end

            def show 
                score = Score.find_by(id: params[:id])
                render json: score.to_json(except: [:created_at, :updated_at])
            end 

            def create
                score = Score.new(score_params)

                if score.save
                    render json: {status: 'SUCCESS', message: 'score Created', data:score},status: :ok
                else 
                    render json: {status: 'ERROR', message: 'score NOT Created', data:score.errors},status: :unprocessable_entity
                end
            end

            def update
                score = Score.find(params[:id])

                if score.update_attributes(score_params)
                    render json: {status: 'SUCCESS', message: 'score Updated', data:score},status: :ok
                else 
                    render json: {status: 'ERROR', message: 'score NOT Updated', data:task.errors},status: :unprocessable_entity
                end
            end

            private
            def score_params
                params.require(:score).permit(:user_id, :points, :rows, :level)
            end
        end
    end
end