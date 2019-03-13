namespace :career do
  desc "add value code to careers"
  task :migrate_code => :environment do
    add_value_to_code('career_science.csv')
    add_value_to_code('career_social.csv')
    add_value_to_code('career_technical.csv')
    add_value_to_code('career_vocational.csv')
  end

  desc "create or update careers"
  task :load => :environment do
    options = {}
    Sample::Career.load('career_science', options.merge({category: "បុគ្គលិកលក្ខណៈបុគ្គលបែប វិទ្យាសាស្រ្ត"}))
    Sample::Career.load('career_technical', options.merge({category: "បុគ្គលិកលក្ខណៈបុគ្គលបែប បច្ចេកទេស"}))
    Sample::Career.load('career_social', options.merge({category: "បុគ្គលិកលក្ខណៈបុគ្គល បែបសង្គម"}))
    Sample::Career.load('career_vocational', options.merge({group: 'Vocational', category: "វិជ្ជាជីវៈ"}))
  end

  def add_value_to_code file
    csv_path = Pathname.new(File.join(Dir.pwd, 'db', 'csv'));
    path = File.expand_path(csv_path + file)
    csv = CSV.parse(File.read(path), headers: true)

    csv.each do |csv_row|
      row = csv_row.to_hash
      unless row['name'].nil?
        code = row['code'].strip
        name = row['name'].strip
        career = Career.find_by(name: name)
        career.code = code
        career.save!
      end
    end
  end



end
