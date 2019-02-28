namespace :career do
  desc "add value code to careers"
  task :migrate_code => :environment do
    add_value_to_code('career_science.csv')
    add_value_to_code('career_social.csv')
    add_value_to_code('career_technical.csv')
    add_value_to_code('career_vocational.csv')
  end

  def add_value_to_code file
    csv_path = Pathname.new(File.join(Dir.pwd, 'db', 'csv'));
    path = File.expand_path(csv_path + file)
    csv = CSV.parse(File.read(path), headers: true)

    csv.each do |csv_row|
      row = csv_row.to_hash
      unless row['name'].nil?
        code = row['code']
        name = row['name'].strip
        career = Career.find_by(name: name)
        career.code = code
        career.save!
      end
    end
  end

end
