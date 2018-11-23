module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/ProcedureStep
      module ProcedureStep

        # Alias procedureStepHasHouse with fallback.
        #
        # @return [Grom::Node, nil] the House of the Grom::Node or nil.
        def house
          return @house if @house
          return nil unless respond_to?(:procedureStepHasHouse)

          @house = Helpers::Utils.type_safe_first(procedureStepHasHouse, Parliament::Grom::Decorator::House)
        end
      end
    end
  end
end
