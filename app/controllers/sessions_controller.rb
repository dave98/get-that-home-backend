class SessionsController < ApplicationController
    skip_before_action :require_login

    def create
        user = User.authenticate(params[:email], params[:password])
        if user
            render json: user, status: :ok
        else
            render_unauthorized("Invalid credentials")
        end
    end

    def destroy
        if current_user && current_user.invalidate_token
            render json: {}, status: :no_content
        else
            render json: nil, status: :internal_server_error
        end
    end

end