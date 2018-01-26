# frozen_string_literal: true

# == Schema Information
#
# Table name: careers_games
#
#  career_id :integer
#  game_id   :integer
#  is_goal   :boolean          default(FALSE)
#
# Indexes
#
#  index_careers_games_on_career_id  (career_id)
#  index_careers_games_on_game_id    (game_id)
#

class CareerGame < ApplicationRecord
  self.table_name = 'careers_games'

  belongs_to :career
  belongs_to :game
end
