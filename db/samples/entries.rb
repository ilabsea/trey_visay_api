# frozen_string_literal: true

entries = [
  'មានទំនាក់ទំនងល្អជាមួយនឹងក្រុមការងារ',
  'ស្រាវជ្រាវ',
  'ឯករាជ្យ',
  'មហិច្ឆតា',
  'មានទំនុកចិត្ត',
  'មានផែនការ និងគៅដៅច្បាស់លាស់',
  'ហ្មត់ចត់នឹងការងារ',
  'មានទេពកោសល្យ',
  'មានចម្ងល់ជារឿយ',
  'មានទំនួលខុសត្រូវ',
  'គិតស៊ីជំរៅ និងមានហេតុផល',
  'ប្រាកដប្រជា',
  'ជាបុគ្គលឆ្នើម',
  'មានស្មារតីប្រុងប្រយត្ន័',
  'មានភាពជាអ្នកដឹកនាំ និងគ្រប់គ្រង',
  'អនុវត្តន៍ការងារជាក់ស្តែង',
  'គ្រប់គ្រងពេលវេលា​បានល្អ',
  'មានក្រមវិន័យល្អ',
  'មានឆន្ទៈ',
  'ឆ្លាត',
  'ចូលចិត្តវិទ្យាសាស្រ្ត',
  'មានគំនិតច្នៃប្រឌិត',
  'ចូលចិត្តធ្វើការជាមួយ នឹងបច្ចេកវិទ្យា និង គ្រឿងម៉ាស៊ីន',
  'មានដំណោះស្រាយល្អ',
  'ពូកែចរចារ',
  'ចេះសម្របខ្លួនតាមស្ថានភាពជាក់ស្ដែង',
  'អត់ធ្មត់',
  'ពូកែសម្របសម្រួល',
  'ចូលចិត្តធ្វើការជាមួយមនុស្ស',
  'ស្លូតបូត និងសុភាពរាបសារ',
  'ជួយផ្ដល់យោបល់ឲ្យអ្នកដទៃ',
  'ចូលចិត្តទទួលការរិៈគន់ក្នុងន័យស្ថាបនា',
  'ចេះចែករំលែកបទពិសោធន៍ការងារ និងចំណេះដឹង',
  'មានប្រាស្រ័យល្អក្នុងសហគមន៍',
  'រួសរាយរាក់ទាក់'
]

entries.each do |entry|
  Entry.create(name: entry)
end
