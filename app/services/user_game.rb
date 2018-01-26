# frozen_string_literal: true

class UserGame
  attr_accessor :user

  def initialize(options = {})
    setup_data(options)
  end

  def save!
    persist!
  end

  private

  def setup_data(params)
    game_params = params.delete(:games)

    # user
    @user = User.new(params)

    # games
    game_params.each do |game_param|
      # binding.pry
      game = @user.games.new(reason: game_param[:reason], characteristic_id: game_param[:characteristic].to_i)

      # personal understandings
      game_param[:personal_understandings].each do |personal_param|
        game.personal_understandings.new(personal_param)
      end

      # subject
      game.build_subject(game_param[:subject])

      # entries
      game_param[:characteristic_entries].each do |entry|
        game.entries << Entry.find_by(name: entry)
      end

      # careers
      game_param[:careers].each do |career|
        game.career_games.new(
          career_id: Career.find_by(name: career[:name], categorizable_id: game_param[:characteristic].to_i, categorizable_type: 'Characteristic').id,
          is_goal: career[:is_goal]
        )
      end
    end
  end

  def persist!
    User.transaction do
      @user.save!
      @user.games.each(&:save!)
    end
  end
end

# {
#   data: {
#     attributes: {
#       id: ''
#       full_name: '',
#       password: '',
#       username: '',
#       sex: '',
#       date_of_birth: '',
#       phone_number: '',
#       nationality: '',
#       school_name: '',
#       grade: '',
#       address: '',
#       father_name: '',
#       father_occupation: '',
#       mother_name: '',
#       mother_occupation: '',
#       guidance: '',
#       parent_contact_number: '',
#       number_of_family_member: '',
#       number_of_sisters: '',
#       number_of_brothers: '',
#       is_divorce: '',
#       is_disable: '',
#       is_domestic_violence: '',
#       is_smoking: '',
#       is_alcoholic: '',
#       is_drug: '',
#       house_type: '',
#       collective_income: '',
#       games: [
#         {
#           id: '',
#           user_id: '',
#           reason: '',
#           audio: '',
#           personal_understandings: [
#             {
#               id: '',
#               user_id: '',
#               game_id: '',
#               are_you_going_to_study_till_grade12: '',
#               are_your_parents_allow_you_to_study_till_grade12: '',
#               have_you_ever_thought_of_career: '',
#               career_name: '',
#               how_to_reach_career_goal: '',
#               does_parents_agree_with: '',
#               ever_talked_with_anyone_about_career: '',
#               how_to_reach_job_vacancy: '',
#               who_to_reach_job_vacancy: '',
#               score: '',
#             },
#             ...
#           ]
#           subject: {
#             game_id: '',
#             khmer_reading: '',
#             khmer_writing: '',
#             english: '',
#             math: '',
#             social_study_ethics_and_citizenship: '',
#             social_study_geography: '',
#             social_study_history: '',
#             science_physics: '',
#             science_chemistry: '',
#             science_biology: '',
#             soft_skill_communication: '',
#             soft_skill_brave: '',
#             soft_skill_teamwork: '',
#             soft_skill_problemsolving: '',
#             soft_skill_publicspeaking: '',
#           },
#           characteristic_entries: [],
#           careers: [
#             { id: '', name: '', is_goal: false },
#             { id: '', name: '', is_goal: false },
#             { id: '', name: '', is_goal: true }
#           ]
#         },
#         ...
#       ]

#     },
#   }
# }
