module Api
    module V2
        class UsersController < ApplicationController

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

            private 

            # def user_params
            #     params.require(:user).permit(:username, :password, :password_confirmation)
            # end
        end
    end
end