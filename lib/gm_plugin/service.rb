module Ym4r
  module GmPlugin

    # A collection of service objects that don't fit elsewhere

    class GDirections
      include MappingObject

      # Initialize a GDirections object associated with the given DIVs.
      # If +map+ is specified, the map will receive the polylines for the route.
      # If +text_directions+ is specified, the div will be updated with a textual description of the route.
      # Both arguments, if not +nil+, may be of type +String+ or +MappingObject+.
      # +String+ values represent the ID of a HTML element to be resolved by +getElementById+.
      def initialize(map = nil, text_directions = nil)
        @map, @text_directions = map, text_directions
      end

      def create
        "new GDirections(#{xlate_object(@map)}, #{xlate_object(@text_directions)})"
      end

      private

        def xlate_object(obj)
          case obj
          when MappingObject
            MappingObject.javascriptify_variable(obj)
          when String
            "document.getElementById('#{obj}')"
          else
            "null"
          end
        end

    end

  end
end


