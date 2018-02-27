# frozen_string_literal: true

class Api::V1::GamesController < ApiController
  def index
    @games = Game.all
    render json: @games.to_json
  end

  def create
    params['data'] = JSON.parse(params['data'])
    game_params = filter_params
    user = User.find_by_uuid(params['data']['user_uuid'])
    head :forbidden unless user
    game_params[:user_id] = user.id
    @game = Game.new(game_params)
    @game.audio = params[:audio]
    if @game.save!

      params['data']['personal_understandings'].each do |personal_understandings|
        ps = PersonalUnderstanding.new(generate_personal_understanding_params(personal_understandings))
        ps['game_id'] = @game.id
        ps['user_id'] = user.id
        ps.save!
      end

      subject = Subject.new(generate_subject_params(params['data']['game_subject']))
      subject['game_id'] = @game.id
      subject.save!

      params['data']['careers'].each do |career|
        career_obj = CareerGame.new(is_goal: career[:is_goal])
        career_obj['career_id'] = Career.find_by_name(career[:name]).id
        career_obj['game_id'] = @game.id
        career_obj.save!
      end

      params['data']['characteristic_entries'].each do |entry|
        @game.entries << Entry.find_by(name: entry)
        @game.save!
      end
    end
    render json: @game, status: :created
  end

  private

  def filter_params
    params.require(:data).permit(
      :reason, :audio, :characteristic_id, :goal
    )
  end

  def generate_game_params
    data = {}
    %i[reason audio characteristic user_id].each do |field|
      data[field] = params['data'][field]
    end
    data
  end

  def generate_personal_understanding_params(p)
    data = {}
    %i[are_you_going_to_study_till_grade12
       are_your_parents_allow_you_to_study_till_grade12
       have_you_ever_thought_of_career
       career_name
       how_to_reach_career_goal
       does_parents_agree_with
       ever_talked_with_anyone_about_career
       how_to_reach_job_vacancy
       who_to_reach_job_vacancy
       score].each do |field|
      data[field] = p[field]
    end
    data
  end

  def generate_subject_params(p)
    data = {}
    %i[khmer_reading khmer_writing english math
       social_study_ethics_and_citizenship social_study_geography
       social_study_history science_physics science_chemistry
       science_biology soft_skill_communication soft_skill_brave
       soft_skill_teamwork soft_skill_problemsolving soft_skill_publicspeaking].each do |field|
      data[field] = p[field]
    end
    data
  end
end
