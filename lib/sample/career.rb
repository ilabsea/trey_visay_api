# frozen_string_literal: true

require_relative 'base'

module Sample
  class Career < Sample::Base
    CHARACTERISTICS = [
      {
        id: nil,
        title: "បុគ្គលិកលក្ខណៈបុគ្គលបែប វិទ្យាសាស្រ្ត",
        logoName: 'science',
        career_title: 'មុខរបរ ឬការងារ ក្នុងវិស័យវិទ្យាសាស្ត្រ',
        concern_subjects: %w[math sciencePhysics scienceChemistry scienceBiology english softSkillBrave softSkillProblemSolving softSkillPublicSpeaking],
        concern_entries: ['ស្រាវជ្រាវ', 'មានចម្ងល់ជារឿយ', 'គិតស៊ីជំរៅ  និងមានហេតុផល', 'ប្រាកដប្រជា', 'មហិច្ឆតា', 'មានទំនួលខុសត្រូវ', 'មានភាពជាអ្នកដឹកនាំ និងគ្រប់គ្រង'],
      },
      {
        id: nil,
        title: "បុគ្គលិកលក្ខណៈបុគ្គលបែប បច្ចេកទេស",
        logoName: 'technical',
        career_title: 'មុខរបរ ឬការងារ ក្នុងវិស័យបច្ចេកទេស',
        concern_subjects: %w[math sciencePhysics english softSkillBrave softSkillProblemSolving softSkillPublicSpeaking],
        concern_entries: ['មានគំនិតច្នៃប្រឌិត', 'មានទំនុកចិត្ត', 'ឆ្លាត', 'មានឆន្ទៈ', 'មានផែនការ និងគៅដៅច្បាស់លាស់'],
      },
      {
        id: nil,
        title: "បុគ្គលិកលក្ខណៈបុគ្គល បែបសង្គម",
        logoName: 'social',
        career_title: 'មុខរបរ ឬការងារ ក្នុងវិស័យសង្គម',
        concern_subjects: %w[khmerReading khmerWriting socialStudyGeography socialStudyEthicsAndCitizenship english softSkillCommunication softSkillBrave softSkillTeamwork softSkillPublicSpeaking],
        concern_entries: %w[ចូលចិត្តធ្វើការជាមួយមនុស្ស អត់ធ្មត់ ពូកែសម្របសម្រួល មានទំនួលខុសត្រូវ មានទំនាក់ទំនងល្អជាមួយនឹងក្រុមការងារ],
      }
    ]

    def self.load(file, options = {})
      path = File.expand_path(csv_path + "#{file}.csv")
      csv = CSV.parse(File.read(path), headers: true)

      csv.each do |csv_row|
        row = csv_row.to_hash
        assign_career(row, options)
        assign_school(row)
      end

      puts "Loaded #{file.titleize} samples" if options[:verbose]
    end

    def self.export
      contents = assign_characteristic
      contents.push(assing_vocational)

      write_to_file(contents, 'characteristic_jobs')
    end

    private_class_method

    def self.assign_characteristic
      arr = []

      CHARACTERISTICS.each do |char|
        characteristic = Characteristic.where(title: char[:title]).first
        char[:id] = characteristic.id
        char[:entries] = characteristic.entries.pluck(:name)
        char[:recommendation] = characteristic.description
        char[:careers] = []
        characteristic.careers.each do |career|
          char[:careers].push(build_career(career))
        end

        arr.push(char)
      end;

      arr[0][:careers].concat(arr[1][:careers])
      arr
    end

    def self.assing_vocational
      vocational = Vocational.where(title: "វិជ្ជាជីវៈ").first
      obj = {
        id: 4,
        title: 'វិជ្ជាជីវៈ',
        logoName: '',
        entries: [],
        career_title: 'មុខរបរ ឬការងារ ទៅនឹងវិជ្ជាជីវៈ',
        concern_subjects: [],
        concern_entries: [],
        recommendation: vocational.description,
        careers: []
      }

      vocational.careers.each do |career|
        obj[:careers].push(build_career(career))
      end

      obj
    end

    def self.build_career(career)
      {
        id: career.id,
        code: career.code,
        name: career.name,
        description: career.description,
        places_for_work: career.places_for_work,
        unknown_schools: career.unknown_schools,
        schools: career.schools.pluck(:code)
      }
    end

    def self.assign_career(row, options)
      return if row['name'].blank?

      group = Characteristic.where(title: options[:category]).first

      if options[:group] == 'Vocational'
        group = Vocational.where(title: options[:category]).first
      end
      @career = group.careers.find_or_initialize_by(code: row['code'].strip);

      @career.update_attributes!(
        name: row['name'],
        description: row['description'],
        places_for_work: row['places_for_work'],
        schools: [],
        unknown_schools: ''
      )

    end

    def self.assign_school(row)
      return if row['school_code'].blank?
      school_code = row['school_code'].strip
      school = School.where(code: school_code).first

      if school.present?
        @career.schools << school
      else
        arr = @career.unknown_schools.to_s.split(';')
        arr.push(school_code)
        @career.unknown_schools = arr.join('; ')
        @career.save
      end
    end
  end
end
