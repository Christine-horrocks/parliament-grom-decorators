module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/Laying
      module Laying
        # Alias layingDate with fallback.
        #
        # @return [Date, nil] the date of the Grom::Node or nil.
        def date
          respond_to?(:layingDate) ? DateTime.parse(layingDate) : nil
        end

        # Alias layingHasLayingBody with fallback.
        #
        # @return [Grom::Node, nil] the LayingBody of the Grom::Node or nil.
        def body
          return @body if @body
          return nil unless respond_to?(:layingHasLayingBody)

          @body = Helpers::Utils.type_safe_first(layingHasLayingBody, Parliament::Grom::Decorator::Group)
        end

        # Alias layingHasLayingPerson with fallback.
        #
        # @return [Grom::Node, nil] the LayingPerson of the Grom::Node or nil.
        def person
          return @person if @person
          return nil unless respond_to?(:layingHasLayingPerson)

          @person = Helpers::Utils.type_safe_first(layingHasLayingPerson, Parliament::Grom::Decorator::Person)
        end
      end
    end
  end
end
