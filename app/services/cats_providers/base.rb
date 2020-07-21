require 'field_mappings'

module CatsProviders
  class Base
    attr_reader :search_request, :deals

    def initialize(search_request = nil)
      @search_request = search_request
      @deals = []
    end

    def fetch_deals
      raise NoMethodError, "#{__method__} method should be implemented"
    end

    private

    def endpoint
      CatsDealerConfig.provider_endpoints[self.class.name.split('::').last.underscore.to_sym]
    end
  end
end
