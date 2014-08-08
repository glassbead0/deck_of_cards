require 'rspec'
require './lib/card'
describe Card do
  it 'should be a card' do
    expect(Card.new('heart', 12)).to be_a(Card)
  end

  describe 'properties of the card' do
    subject { Card.new('diamond', 7) }
    it 'should have a suit and a value' do
      expect(subject.suit).to eq('diamond')
      expect(subject.value).to eq(7)
    end

    it 'should reject invalid suits' do
      expect { Card.new('potato', 7) }.to raise_error
    end

    it 'sholuld reject invalid numbers' do
      expect { Card.new('spade', 20) }.to raise_error
    end

    it 'should translate 1 to A and translate face cards to J, Q and K' do
      expect(Card.new('club', 1).value).to eq('A')
      expect(Card.new('club', 11).value).to eq('J')
      expect(Card.new('club', 12).value).to eq('Q')
      expect(Card.new('club', 13).value).to eq('K')
    end

    it 'should be face down by default' do
      expect(subject.face_up).to eq(false)
    end

    subject { Card.new('diamond', 7) }
    it 'should have a flip method' do
      subject.flip
      expect(subject.face_up).to eq(true)
      subject.flip
      expect(subject.face_up).to eq(false)
    end
  end
end
