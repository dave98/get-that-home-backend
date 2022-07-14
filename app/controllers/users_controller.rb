class UsersController <ApplicationController
    skip_before_action :require_login, only: [ :create ]

    #------------------
    def create 
        @user = User.new(create_user_params)

        if @user.save
            render json: @user, status: :created
        else
            render json: {errors: @user.errors}, status: :unprocessable_entity
        end
    end

    #------------------
    def show
        render json: current_user, status: :ok
    end

    #------------------
    def update
        if current_user.update(update_user_params)
            render json: current_user, status: :ok
        else
            render json: { errors: current_user.errors }, status: :unprocessable_entity
        end
    end

    #-------------------
    def attach_image
        current_user = User.find(params[:id])
        if current_user.update(attach_params)
            render json: current_user, status: :ok
        else
            render json: {errors: user.errors }, status: :unprocessable_entity
        end
    end

    private

    #------------------
    def create_user_params
        params.permit(:name, :email, :password, :password_confirmation)
    end

    def update_user_params
        params.permit(:name, :password)
    end

    def attach_params
        params.require(:user).permit(:avatar)
    end
    
end
