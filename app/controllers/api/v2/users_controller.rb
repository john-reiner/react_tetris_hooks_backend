module Api
    module V2
        class UsersController < ApplicationController

            before_action :authenticate_user, except: [:create]

            def create
                user = User.create!(
                    username: params[:username],
                    password: params[:password]
                )

                if user.save 
                    render json: {status: 'SUCCESS', message: 'user Created', data:user},status: :ok
                else 
                    render json: {status: 'ERROR', message: 'user NOT Created', data:user.errors},status: :unprocessable_entity
                end
            end

            def get_user 
                render json: { user: {id: @user.id, username: @user.username}}
            end

            private 

            # def user_params
            #     params.require(:user).permit(:username, :password, :password_confirmation)
            # end
        end
    end
end