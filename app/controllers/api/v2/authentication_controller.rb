module Api
    module V2
        class AuthenticationController < ApplicationController
            def login 
                user = User.find_by(username: params[:username])

                if user && user.authenticate(params[:password])
                    secret_key = Rails.application.secret_key_base
                    token = JWT.encode({
                        user_id: user.id,
                        username: user.username,
                    }, secret_key)
                    render json: {token: token}
                else 
                    render json: {status: 'error', message: "Unable to verifiy username or password. Please try again."},status: :unauthorized
                end
                # byebug

            end
        end
    end
end