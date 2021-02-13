module Api
    module V2
        class ScoresController < ApplicationController
            before_action :authenticate_user
            def index
                scores = Score.all.limit(10)
                user_scores = Score.where(user_id: @user.id)
                render json: {all_scores: scores, user_scores: user_scores}, :include => :user
            end

            def create
                score = Score.create!(
                    user_id: @user.id,
                    points: params[:points],
                    rows: params[:rows],
                    level: params[:level]
                )

            end
            
        end
    end    
end