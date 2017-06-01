class Api::V1::SessionsController < ApplicationController

    def create
        user = User.find_by_email(params[:user][:email])
        if user.valid_password?(params[:user][:password])
            user.get_token
            render json: {error: {message: 'Authentication successfully.', user: user, status: 401}}, status: 401
        else
            puts 'Password is wrong'
            render json: {error: {message: 'Authentication failed.', status: 401}}, status: 401
        end
    end
end
