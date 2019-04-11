# frozen_string_literal: true

require './lib/game.rb'

describe Game do
  let(:game) { Game.new }
  let(:player) { double(name: 'Oso', board_piece: 'X') }
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

    context "with a diagonal of 'X false cases'" do
      let(:state) { ['O', '-', '-', '-', 'X', '-', '-', '-', 'X'] }
      it 'return false' do
        expect(game.win?(player, state)).to_not eq(true)
      end
      let(:state) { ['-', '-', 'X', '-', 'O', '-', 'X', '-', '-'] }
      it 'return true' do
        expect(game.win?(player, state)).to be false
      end
    end
  end

  describe '#tie?' do
    let(:pieces) { %w[O X] }
    describe 'with board full' do
      let(:state) { %w[X O X O X O O X O] }
      it 'return true' do
        expect(game.tie?(pieces, state)).to eql(true)
      end
    end
    describe 'with board not full' do
      let(:state) do
        ['X', 'O', 'X', 'O', 'X', 'O', 'O', 'X', '-']
      end
      it 'return false' do
        expect(game.tie?(pieces, state)).to eql(false)
      end
    end
  end

  describe '#end_game' do
    it 'exits the game when called' do
      expect(game.end_game).to eql(true)
    end
  end
end
