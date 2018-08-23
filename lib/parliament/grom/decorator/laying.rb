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
        def laying_body
          respond_to?(:layingHasLayingBody) ? layingHasLayingBody.first : nil
        end
      end
    end
  end
end