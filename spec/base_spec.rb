require 'spec_helper'

describe Base do
  describe 'attributes' do
    let(:base) { Base.new }

    it 'returns right attributes' do
      expect(base.errors).to eq([])
      expect(base.success?).to be true
    end
  end
end
