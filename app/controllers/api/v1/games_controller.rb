class Api::V1::GamesController < ApiController
  def index
    @games = Game.all
    render json: @games.to_json
  end

  def create
    params["data"] = JSON.parse(params["data"])
    @game = Game.new(filter_params)
    @game.save!
    render json: @game, status: :created
  end

  private

  def filter_params
    params.require(:data).require(:attributes).permit(
      :reason, :audio, :characteristic,
      characteristic_entries: [],
      careers: %i[name is_goal],
      personal_understandings: %i[
        are_you_going_to_study_till_grade12
        are_your_parents_allow_you_to_study_till_grade12
        have_you_ever_thought_of_career
        career_name how_to_reach_career_goal
        does_parents_agree_with ever_talked_with_anyone_about_career
        how_to_reach_job_vacancy who_to_reach_job_vacancy score
      ],
      subject: %i[
        khmer_reading khmer_writing english math
        social_study_ethics_and_citizenship social_study_geography
        social_study_history science_physics science_chemistry
        science_biology soft_skill_communication soft_skill_brave
        soft_skill_teamwork soft_skill_problemsolving soft_skill_publicspeaking
      ]
    )
  end
end

