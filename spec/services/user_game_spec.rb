require 'rails_helper'

RSpec.describe UserGame do
  describe '#save!' do
    let(:user_attributes) {
      ActionController::Parameters.new(
      {
        data: {
          attributes: {
            id: '',
            full_name: 'sokly',
            password: '123456',
            username: 'sokly',
            sex: 'ស្រី',
            date_of_birth: '23/01/1989',
            phone_number: '010400605',
            nationality: 'ខ្មែរ',
            school_name: 'ផ្សេងៗ',
            grade: 'ផ្សេងៗ',
            address: 'ភូមិចំពុះក្អែក១ សង្កាត់ព្រែកថ្មី ខណ្ឌច្បារអំពៅ រាជធានីភ្នំពេញ',
            father_name: 'ហេង ទឹង',
            father_occupation: 'កសិករ',
            mother_name: 'ឆេង ហ៊ា',
            mother_occupation: 'កសិករ',
            guidance: 'ឪពុកម្តាយ',
            parent_contact_number: '089782600',
            number_of_family_member: '7',
            number_of_sisters: '2',
            number_of_brothers: '3',
            is_divorce: 'false',
            is_disable: 'false',
            is_domestic_violence: 'false',
            is_smoking: 'false',
            is_alcoholic: 'false',
            is_drug: 'false',
            house_type: 'ផ្ទះថ្ម',
            collective_income: 'លើស1លាន',
            games: [
              {
                id: '',
                user_id: '',
                reason: 'I will study hard for my good future and help my family.',
                audio: '',
                characteristic: '1',
                characteristic_entries: ['អត់ធ្មត់', 'ចូលចិត្តវិទ្យាសាស្រ្ត', 'មានគំនិតច្នៃប្រឌិត', 'មហិច្ឆតា', 'ឯករាជ្យ'],
                personal_understandings: [
                  {
                    id: '',
                    user_id: '',
                    game_id: '',
                    are_you_going_to_study_till_grade12: 'Yes',
                    are_your_parents_allow_you_to_study_till_grade12: 'Yes',
                    have_you_ever_thought_of_career: 'Yes',
                    career_name: 'Accountant',
                    how_to_reach_career_goal: 'Continue to university and study',
                    does_parents_agree_with: 'Yes',
                    ever_talked_with_anyone_about_career: 'ឪពុកម្តាយ;បងប្អូន',
                    how_to_reach_job_vacancy: 'វិទ្យុ ទូរទស្សន៍',
                    who_to_reach_job_vacancy: 'បងប្រុស',
                    score: '18',
                  }
                ],
                subject: {
                  game_id: '',
                  khmer_reading: 'មធ្យម',
                  khmer_writing: 'មធ្យម',
                  english: 'មធ្យម',
                  math: 'មធ្យម',
                  social_study_ethics_and_citizenship: 'មធ្យម',
                  social_study_geography: 'មធ្យម',
                  social_study_history: 'មធ្យម',
                  science_physics: 'មធ្យម',
                  science_chemistry: 'មធ្យម',
                  science_biology: 'មធ្យម',
                  soft_skill_communication: 'មធ្យម',
                  soft_skill_brave: 'មធ្យម',
                  soft_skill_teamwork: 'មធ្យម',
                  soft_skill_problemsolving: 'មធ្យម',
                  soft_skill_publicspeaking: 'មធ្យម',
                },
                careers: [
                  { id: '', name: 'វិស្វករសំណង់ស៊ីវិល', is_goal: false },
                  { id: '', name: 'អ្នកគីមីវិទ្យា', is_goal: false },
                  { id: '', name: 'ទន្តពេទ្យ', is_goal: true }
                ]
              }
            ]
          }
        }
      })
    }

    let!(:data_params) {
      user_attributes.require(:data).require(:attributes).permit(
        :id, :full_name, :password, :username, :sex, :date_of_birth, :phone_number,
        :nationality, :school_name, :grade, :address, :father_name, :father_occupation,
        :mother_name, :mother_occupation, :guidance, :parent_contact_number,
        :number_of_family_member, :number_of_sisters, :number_of_brothers, :is_divorce,
        :is_disable, :is_domestic_violence, :is_smoking, :is_alcoholic, :is_drug,
        :house_type, :collective_income,
        :games => [
          :reason, :audio, :characteristic,
          :characteristic_entries => [],
          :careers => [:name, :is_goal],
          :personal_understandings => [
            :are_you_going_to_study_till_grade12,
            :are_your_parents_allow_you_to_study_till_grade12,
            :have_you_ever_thought_of_career,
            :career_name, :how_to_reach_career_goal,
            :does_parents_agree_with, :ever_talked_with_anyone_about_career,
            :how_to_reach_job_vacancy, :who_to_reach_job_vacancy, :score
          ],
          subject: [
            :khmer_reading, :khmer_writing, :english, :math,
            :social_study_ethics_and_citizenship, :social_study_geography,
            :social_study_history, :science_physics, :science_chemistry,
            :science_biology, :soft_skill_communication, :soft_skill_brave,
            :soft_skill_teamwork, :soft_skill_problemsolving, :soft_skill_publicspeaking
          ]
        ]
      )
    }

    context 'new user' do
      it 'creates user' do
        # data = UserGame.new(data_params)
        # binding.pry

        # data.save!
      end

      it 'creates game' do
      end

      it 'creates personal understandings' do
      end
    end

    context 'user exist' do
      it 'updates user information' do
      end

      it 'creates game' do
      end

      it 'creates personal understandings' do
      end
    end
  end
end
