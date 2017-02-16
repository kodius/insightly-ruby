require 'insightly2/dsl'

module Insightly2
  module DSL::Relationships
    # GET /v2.2/Relationships
    # Get a list of relationships.
    # @return [Array, nil].
    def get_relationships
      Resources::Relationship.parse(request(:get, "Relationships"))
    end
  end
end
