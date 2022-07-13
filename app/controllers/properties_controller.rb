class PropertiesController <ApplicationController
    skip_before_action :require_login, only: :index
    before_action :set_property, only: %i[ show update destroy]

    def owned
        render json: current_user.properties, status: :ok
    end

    def index
        if current_user
            render json: Property.where.not(user: current_user), status: :ok
        else
            render json: Property.all, status: :ok
        end
    end
    
    def show
        render json: @property, status: :ok
    end

    def create
        property = Property.new(property_params)
        property.user = current_user
        if property.save
            render json: property, status: :created
        else
            render json: property.errors, status: :unprocessable_entity
        end
    end

    def update
        if @property.update(property_params)
            render json: @property
        else
            render json: @property.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @property.destroy
    end

    private 

    def set_property
        @property = Property.find(params[:id])
    end

    def property_params
        params.permit(
            :operationType, 
            :address, 
            :rentType, 
            :rentAmount, 
            :maintenance, 
            :propertyType, 
            :bedrooms, 
            :bathrooms, 
            :area, 
            :petsAllowed, 
            :about
        )
    end        
end
