# frozen_string_literal: true

group = {
  id: 4,
  title: 'វិជ្ជាជីវៈ',
  recommendation: 'បុគ្គលដែលជ្រើសរើសមុខរបរ ទៅនឹងវិជ្ជាជីវៈ ភាគច្រើន ជាបុគ្គលពុំមានលទ្ធភាពបន្តសិក្សាដោយសារកត្តាជីវភាព ឬដោយសារមិនចង់រៀន បែរជាសម្រេចចិត្តចាប់យក ជំនាញមួយដែលខ្លួនស្រឡាញ់ និងគិតថាអាចធ្វើបាន ។ជំនាញវិជ្ជាជីវៈយសារមិនចង់រៀន បែរជា្រេចចិត្តចាប់យក ជំនាញមួយដែលខ្លួនស្រឡាញ់ គិតថាអាចធ្វើបាន នេះ មិនទាមទារឲ្យមានចំណេះដឹងខ្លាំងនោះទេ យ៉ាងហោចណាស់មានចំណេះដឹងមូលដ្ឋានត្រឹមថ្នាក់ទី៩។ ឱកាសការងារ គឺមាននៅតាមហាងនានា និងនៅតាមបណ្តាខេត្ត ឬរាជធានី។ ',
  careers: [
    { 'id': '4_1', 'name': 'អ្នកបច្ចេកទេសមេកានិចយានយន្ត', 'description': '' },
    { 'id': '4_2', 'name': 'អ្នកជូសជុសម៉ាស៊ីនត្រជាក់', 'description': '' },
    { 'id': '4_3', 'name': 'អ្នកផ្គុំដំឡើងបរិក្ខារអេឡិចត្រូនិច', 'description': '' },
    { 'id': '4_4', 'name': 'អ្នកឯកទេសថតរូប', 'description': '' },
    { 'id': '4_5', 'name': 'អ្នកបច្ចេកទេសផ្នែកវិទ្យុ ឬការផ្សាយសំលេង', 'description': '' },
    { 'id': '4_6', 'name': 'អ្នកបញ្ជាគ្រឿងចក្រ', 'description': '' },
    { 'id': '4_7', 'name': 'អ្នកធ្វើគ្រឿងសង្ហារឹម', 'description': '' },
    { 'id': '4_8', 'name': 'អ្នកពន្លត់អគ្គិភ័យ', 'description': '' },
    { 'id': '4_9', 'name': 'ជាងសំនង់', 'description': '' },
    { 'id': '4_10', 'name': 'ជាងប្រពន្ធ័ទឹក', 'description': '' },
    { 'id': '4_11', 'name': 'ជាងលាបថ្នាំ', 'description': '' },
    { 'id': '4_12', 'name': 'អ្នកថែទាំកុមារ', 'description': '' },
    { 'id': '4_13', 'name': 'រូបង្រៀនជនពិការ', 'description': '' },
    { 'id': '4_14', 'name': 'អ្នកបណ្ដុះបណ្ដាលវិជ្ជាជីវៈ', 'description': '' },
    { 'id': '4_15', 'name': 'ជាងកាត់ដេរសម្លៀកបំពាក់', 'description': '' },
    { 'id': '4_16', 'name': 'អ្នកបោះពុម្ពឯកសារ', 'description': '' },
    { 'id': '4_17', 'name': 'អ្នកផាត់មុខ', 'description': '' },
    { 'id': '4_18', 'name': 'ជាងជួសជុលម៉ូតូ', 'description': '' },
    { 'id': '4_19', 'name': 'ចុងភៅ', 'description': '' },
    { 'id': '4_20', 'name': 'ជាងផ្សារដែក', 'description': '' },
    { 'id': '4_21', 'name': 'ជាងមាស', 'description': '' },
    { 'id': '4_22', 'name': 'ជាងកាត់សក់', 'description': '' }
  ]
}

vocational = Vocational.create(title: group[:title], description: group[:recommendation])

group[:careers].each do |career|
  vocational.careers.create(name: career[:name], description: career[:description])
end
