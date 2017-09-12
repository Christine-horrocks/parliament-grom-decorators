require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::FormalBody, vcr: true do
  before(:each) do
    id = 'tJxPOiSd'
    response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3000',
    builder: Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator).people(id).get
    @formal_body_nodes = response.filter('http://id.ukpds.org/schema/FormalBody')
  end

  context '#name' do
    context 'Grom::Node has a name' do
      it 'will return correct name' do
        expect(@formal_body_nodes[0].name).to eq('Trade Committee')
      end
    end

    context 'Grom::Node has no name' do
      it 'will return an empty string' do
        expect(@formal_body_nodes[1].name).to eq('')
      end
    end
  end


  context '#start_date' do
    context 'Grom::Node has a start date' do
      it 'will return correct start date' do
        expect(@formal_body_nodes[0].start_date).to eq(DateTime.parse('1981-11-12T00:00:00+00:00'))
        expect(@formal_body_nodes[0].start_date.class).to eq(DateTime)
      end
    end

    context 'Grom::Node has no start date' do
      it 'will return nil' do
        expect(@formal_body_nodes[1].start_date).to eq(nil)
      end
    end
  end

  context '#end_date' do
    context 'Grom::Node has an end date' do
      it 'will return correct end date' do
        expect(@formal_body_nodes[0].end_date).to eq(DateTime.parse('1991-11-12T00:00:00+00:00'))
        expect(@formal_body_nodes[0].end_date.class).to eq(DateTime)
      end
    end

    context 'Grom::Node has no end date' do
      it 'will return nil' do
        expect(@formal_body_nodes[1].end_date).to eq(nil)
      end
    end
  end

  context '#current?' do
    context 'is current' do
      it 'will return true' do
        expect(@formal_body_nodes[1].current?).to eq(true)
      end
    end

    context 'is not current' do
      it 'will return false' do
        expect(@formal_body_nodes[1].current?).to eq(false)
      end
    end
  end
end
