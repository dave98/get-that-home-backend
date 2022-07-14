class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    before_action :require_login

    rescue_from ActionController::RoutingError, with: :route_not_found # Not working ?
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ArgumentError, with: :argument_with_error
    

    def require_login
        current_user || render_unauthorized("Access denied")
    end

    def current_user
        @current_user ||= authenticate_token
    end

    def render_unauthorized(message)
        render json: { errors: message }, status: :unauthorized
    end

    private

    def authenticate_token
        authenticate_with_http_token do |token, _options|
            User.where(token:).first
        end
    end

    def route_not_found(error)
        head :not_found
    end

    def record_not_found(error)
        head :not_found
    end

    def argument_with_error(error)
        render json: {message: error}, status: 500
    end

end
