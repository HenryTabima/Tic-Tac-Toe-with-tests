require './lib/game.rb'

describe Game do
  let(:game) { Game.new }
  let(:player) { double(name: 'Oso', board_piece: 'X')}
  describe '#win?' do
    context "with a row of 'X'" do
      let(:state) { ['X', 'X', 'X', '-', '-', '-', '-', '-', '-'] }
      it 'return true' do
        expect(game.win?(player, state)).to eq(true)
      end
    end
    context "with a column of 'X'" do
      let(:state) { ['X', '-', '-', 'X', '-', '-', 'X', '-', '-'] }
      it 'return true' do
        expect(game.win?(player, state)).to eq(true)
      end
    end
    context "with a diagonal of 'X'" do
      let(:state) { ['X', '-', '-', '-', 'X', '-', '-', '-', 'X'] }
      it 'return true' do
        expect(game.win?(player, state)).to eq(true)
      end
      let(:state) { ['-', '-', 'X', '-', 'X', '-', 'X', '-', '-'] }
      it 'return true' do
        expect(game.win?(player, state)).to eq(true)
      end
    end
  end
  describe '#tie?' do
    describe "with board full" do
      it "return true" do
      end
    end
    describe "with board not full" do
      it "return true" do
      end
    end
  end
end
