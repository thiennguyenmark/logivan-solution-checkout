require 'spec_helper'

describe User, 'user class' do
  describe '#name' do
    let(:user) { User.new }

    it 'returns Demo' do
      expect(user.name).to eq('Demo')
    end
  end
end
