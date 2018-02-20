# frozen_string_literal: true

# == Schema Information
#
# Table name: characteristics
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  description :text(65535)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Characteristic < ApplicationRecord
  has_and_belongs_to_many :entries
  has_many :careers, as: :categorizable
  has_many :games

  serialize :concern_subjects, Array

  SUBJECTS = {
    khmerSpeaking: 'ការនិយាយ ភាសាខ្មែរ',
    khmerListening: 'ការស្តាប់ ភាសាខ្មែរ',
    khmerReading: 'ការអាន ភាសាខ្មែរ',
    khmerWriting: 'ការសរសេរ ភាសាខ្មែរ',
    english: 'ភាសាអង់គ្លេស/ភាសាបារាំង',
    math: 'គណិតវិទ្យា',
    socialStudyEthicsAndCitizenship: 'សីលធម៌ និង ពលរដ្ឋ',
    socialStudyGeography: 'ភូមិវិទ្យា',
    socialStudyHistory: 'ប្រវត្តិវិទ្យា',
    sciencePhysics: 'រូបវិទ្យា',
    scienceChemistry: 'គីមីវិទ្យា',
    scienceBiology: 'ជីវៈវិទ្យា',
    scienceEarthAndEnvironment: 'ផែនដី និង បរិស្ថាន',
    softSkillCommunication: 'ទំនាក់ទំនង',
    softSkillBrave: 'ក្លាហាន',
    softSkillConfidence: 'ទំនុកចិត្ត',
    softSkillTeamwork: 'ក្រុមការងារ',
    softSkillProblemSolving: 'ដោះស្រាយបញ្ហា',
    softSkillPublicSpeaking: 'ការនិយាយជាសាធារណៈ'
  }.freeze
end
