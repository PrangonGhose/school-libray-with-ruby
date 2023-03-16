require 'rspec'
require_relative '../base_decorator'

describe BaseDecorator do
  let(:nameable) { double('Nameable') }
  subject(:decorator) { BaseDecorator.new(nameable) }

  describe '#initialize' do
    it 'assigns the nameable instance variable' do
      expect(decorator.nameable).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'calls correct_name on the nameable object' do
      expect(nameable).to receive(:correct_name)
      decorator.correct_name
    end
  end
end
