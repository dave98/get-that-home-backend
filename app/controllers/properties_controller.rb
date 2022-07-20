class PropertiesController <ApplicationController
    skip_before_action :require_login, only: %i[index]
    before_action :set_property, only: %i[ show update destroy attach_images]

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
        render json: DetailedPropertySerializer.new(@property).serializable_hash[:data][:attributes], status: :ok
    end

    def create
        property = Property.new(property_params)
        property.user = current_user
        if property.save
            render json: DetailedPropertySerializer.new(property).serializable_hash[:data][:attributes], status: :created
        else
            render json: {errors: property.errors}, status: :unprocessable_entity
        end
    end

    def update
        if @property.update(property_params)
            render json: DetailedPropertySerializer.new(@property).serializable_hash[:data][:attributes], status: :ok
        else
            render json: {errors: @property.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        @property.destroy
    end

    def attach_images
        if @property.update(property_image_params)
            render json: DetailedPropertySerializer.new(@property).serializable_hash[:data][:attributes], status: :ok
        else
            render json: {errors: @property.errors}, status: :unprocessable_entity
        end
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
            :about,
            :closed
        )
    end  
    
    def property_image_params
        params.require(:property).permit(images: [])
    end
end
