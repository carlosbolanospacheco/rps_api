module Api
    module V1
        class AuthenticationController < ApplicationController
            rescue_from ActionController::ParameterMissing, with: :parameter_missing 

            def create            
                raise ActiveRecord::RecordNotFound unless user != nil
                raise ActiveRecord::RecordNotFound unless user.authenticate(params.require(:password))
                token = AuthenticationTokenService.encode(user.id)
                render json: { token: token }, status: :created
            end

            private

            def user
                @user ||= User.find_by(username: params.require(:user))
            end

            def parameter_missing(e)
                render json: { error: e.message}, status: :unprocessable_entity
            end
        end
    end
end