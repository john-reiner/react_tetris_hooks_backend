module Api
    module V1
        class UsersController < ApplicationController
            def index
                users = User.all
                render json: users.to_json(:include => {:scores => {:only => [:score, :rows, :level]}}, except: [:created_at, :updated_at])
            end

            def show 
                user = user.find_by(id: params[:id])
                render json: user.to_json(except: [:created_at, :updated_at])
            end 

            def create
                user = user.new(user_params)

                if user.save 
                    render json: {status: 'SUCCESS', message: 'user Created', data:user},status: :ok
                else 
                    render json: {status: 'ERROR', message: 'user NOT Created', data:user.errors},status: :unprocessable_entity
                end
            end

            def update

                user = user.find(params[:id])

                if user.update_attributes(user_params)
                    render json: {status: 'SUCCESS', message: 'user Updated', data:user},status: :ok
                else 
                    render json: {status: 'ERROR', message: 'user NOT Updated', data:task.errors},status: :unprocessable_entity
                end
            end

            private
            def user_params
                params.require(:user).permit(:user_id, :username, :password)
            end
        end
    end
end