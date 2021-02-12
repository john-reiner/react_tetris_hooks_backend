class ApplicationController < ActionController::API
    def authenticate_user 
        
        auth_header = request.headers[:authorization]
        
        if auth_header 
            token = auth_header.split(' ')[1]
            key = Rails.application.secret_key_base
    
            decoded_token = JWT.decode(token, key)
    
            @user = User.find_by(username: decoded_token[0]["username"])
        else
            render status: :unauthorized
        end
    end
end
