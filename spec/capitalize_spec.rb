require 'rspec'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'name') }
  subject(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#initialize' do
    it 'assigns the nameable instance variable' do
      expect(decorator.nameable).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'capitalizes the result of calling correct_name on the nameable object' do
      expect(decorator.correct_name).to eq('Name')
    end
  end
end