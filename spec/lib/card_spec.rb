require 'rspec'
require './lib/card'

describe Card do
  subject { Card.new(card_suit, value) }
  let(:card_suit) { 'diamond' }
  let(:value) { 7 }

  it 'should be a card' do
    expect(subject).to be_a(Card)
  end

  describe '#suit' do
    context 'diamond' do
      it 'should have a suit' do
        expect(subject.suit).to eq('diamond')
      end
    end

    context 'invalid suits' do
      let(:card_suit) { 'potato' }
      it 'should reject invalid suits' do
        expect { subject }.to raise_error
      end
    end
  end

  describe '#value' do
    context 'has a value' do
      let(:suit) { 'diamonds' }
      let(:value) { 2 }
      it 'should have a value' do
        expect(subject.value).to eq(2)
      end
    end

    context 'invalid numbers' do
      let(:value) { 20 }
      it 'should reject invalid numbers' do
        expect { subject }.to raise_error
      end
      it 'should translate 1 to A and translate face cards to J, Q and K' do
        expect(Card.new('club', 1).value).to eq('A')
        expect(Card.new('club', 11).value).to eq('J')
        expect(Card.new('club', 12).value).to eq('Q')
        expect(Card.new('club', 13).value).to eq('K')
      end
    end
  end

  describe 'card methods' do

    it 'should be face down by default' do
      expect(subject.face_up).to eq(false)
    end

    let(:card_suit) { 'diamond' }
    let(:value) { 7 }
    it 'should have a flip method' do
      subject.flip
      expect(subject.face_up).to eq(true)
      subject.flip
      expect(subject.face_up).to eq(false)
    end
  end
end
