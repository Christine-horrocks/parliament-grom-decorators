require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::ProcedureStep, vcr: true do
  request_object = Parliament::Request::UrlRequest.new(
    base_url:   'http://localhost:3030/api/v1',
    builder:    Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator
  ).proposed_negative_statutory_instrument_by_id

  # Test #house
  include_examples(
    'type_safe_first',
    {
      request:          request_object,
      filter_type:      'https://id.parliament.uk/schema/ProcedureStep',
      predicate:        :procedureStepHasHouse,
      decorator_method: :house,
      type_klass:       Parliament::Grom::Decorator::House
    }
  )
end
