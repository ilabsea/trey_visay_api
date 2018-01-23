class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.integer :game_id, null: false
      t.string  :khmerReading
      t.string  :khmerWriting
      t.string  :english
      t.string  :math
      t.string  :socialStudyEthicsAndCitizenship
      t.string  :socialStudyGeography
      t.string  :socialStudyHistory
      t.string  :sciencePhysics
      t.string  :scienceChemistry
      t.string  :scienceBiology
      t.string  :softSkillCommunication
      t.string  :softSkillBrave
      t.string  :softSkillTeamwork
      t.string  :softSkillProblemSolving
      t.string  :softSkillPublicSpeaking
    end
  end
end
