# frozen_string_literal: true

# == Schema Information
#
# Table name: subjects
#
#  id                              :integer          not null, primary key
#  game_id                         :integer          not null
#  khmerReading                    :string(255)
#  khmerWriting                    :string(255)
#  english                         :string(255)
#  math                            :string(255)
#  socialStudyEthicsAndCitizenship :string(255)
#  socialStudyGeography            :string(255)
#  socialStudyHistory              :string(255)
#  sciencePhysics                  :string(255)
#  scienceChemistry                :string(255)
#  scienceBiology                  :string(255)
#  softSkillCommunication          :string(255)
#  softSkillBrave                  :string(255)
#  softSkillTeamwork               :string(255)
#  softSkillProblemSolving         :string(255)
#  softSkillPublicSpeaking         :string(255)
#

class Subject < ApplicationRecord
  belongs_to :game
end
