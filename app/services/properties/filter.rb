class Properties::Filter
  def self.call(resources, options)
    new(resources, options).filter 
  end

  attr_reader :resources, :options

  def initialize(resources, options)
    @resources = resources
    @options = options
  end

  def filter
    if options[:propertyType].present?
      @resources = resources.where(propertyType: options[:propertyType])
    end
    if options[:operationType].present?
      @resources = resources.where(operationType: options[:operationType])
    end
    if options[:rentType].present?
      @resources = resources.where(rentType: options[:rentType])
    end
    if options[:bedrooms].present?
      @resources = resources.where("bedrooms >= ?", options[:bedrooms])
    end
    if options[:bathrooms].present?
      @resources = resources.where("bathrooms >= ?", options[:bathrooms])
    end
    if options[:max_price].present?
      @resources = resources.where( "\"rentAmount\" <= ?", options[:max_price] )
    end
    if options[:min_price].present?
      @resources = resources.where("\"rentAmount\" >= ?", options[:min_price] )
    end
    if options[:address].present?
      @resources = resources.where("address ILIKE ?", "%#{options[:address]}%")
    end
    if options[:petsAllowed].present?
      @resources = resources.where(petsAllowed: options[:petsAllowed])
    end
    if options[:min_area].present?
      @resources = resources.where("area >= ?", options[:min_area])
    end
    if options[:max_area].present?
      @resources = resources.where("area <= ?", options[:max_area])
    end
    resources
  end 
end
