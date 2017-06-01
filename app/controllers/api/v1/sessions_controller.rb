class Api::V1::SessionsController < ApplicationController
    protect_from_forgery with: :null_session
    skip_before_action :authenticate_user!
    def create
        begin
            user = User.find_by_email(params[:user][:email])
            if user.nil?
                puts 'Email not found'
                render json: {error: {message: 'Authentication failed. Unregistered user', status: 401}}, status: 401
            elsif user.valid_password?(params[:user][:password])
                user.get_token
                render json: {valid: {message: 'Authentication successfully.', user: user, status: 200}}, status: 200
            else
                puts 'Password is wrong'
                render json: {error: {message: 'Authentication failed. Password is wrong', status: 401}}, status: 401
            end
        rescue Exception => e
            render json: {error: {message: "Error in Authentication. #{e}" , details: e.backtrace[0], status: 500}}, status: 500
        end
    end

    def destroy
        begin
            user = User.find_by_email(params[:user][:email])
            user.update_attribute(:token, nil)
            render json: {valid: {message: 'Session destroyed'}, status: 200}, status: 200
        rescue Exception => e
            render json: {error: {message: "Error in logout. #{e}" , details: e.backtrace[0], status: 500}}, status: 500
        end
    end
end
