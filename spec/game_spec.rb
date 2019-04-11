# frozen_string_literal: true

require './lib/game.rb'
require './lib/board.rb'
require './lib/prompt.rb'

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

    describe 'with diferent values' do
      context 'in a row' do
        let(:state) { ['-', '-', '-', 'X', 'O', 'O', '-', '-', '-'] }
        it 'return false' do
          expect(game.win?(player, state)).to be false
        end
      end
      context 'in a column' do
        let(:state) { ['-', 'O', '-', '-', 'X', '-', '-', 'O', '-'] }
        it 'return false' do
          expect(game.win?(player, state)).to be false
        end
      end
      context 'in a diagonal' do
        let(:state) { ['O', '-', '-', '-', 'X', '-', '-', '-', 'X'] }
        it 'return false' do
          expect(game.win?(player, state)).to be false
        end
        let(:state) { ['-', '-', 'X', '-', 'O', '-', 'X', '-', '-'] }
        it 'return false' do
          expect(game.win?(player, state)).to be false
        end
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

  describe '#make_move' do
    let(:board) { instance_double('Board') }
    it 'move_cursor_up' do
      expect(board).to receive(:move_cursor_up).once
      game.make_move(Prompt::KEY_UP, 'X', board)
    end

    it 'move cursor_left' do
      expect(board).to receive(:move_cursor_left).once
      game.make_move(Prompt::KEY_LEFT, 'O', board)
    end

    it 'move cursor_right' do
      expect(board).to receive(:move_cursor_right).once
      game.make_move(Prompt::KEY_RIGHT, 'X', board)
    end

    it 'moves_down' do 
      expect(board).to receive(:move_cursor_down).once
      game.make_move(Prompt::KEY_DOWN, 'O', board)
    end
  end
end
