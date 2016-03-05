# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

words_list = [
  { definition_fr: "météo", definition_en: "weather", definition_kh: "", phonetic: "akasotièt", word_type: "", tag_list: "" },
  { definition_fr: "pomme", definition_en: "apple", definition_kh: "", phonetic: "pom", word_type: "", tag_list: "" },
  { definition_fr: "voiture", definition_en: "car", definition_kh: "", phonetic: "", word_type: "", tag_list: "transport" },
  { definition_fr: "vélo", definition_en: "bike", definition_kh: "", phonetic: "cang", word_type: "", tag_list: "transport" },
  { definition_fr: "moto", definition_en: "motorbike", definition_kh: "", phonetic: "moto", word_type: "", tag_list: "transport" },
  { definition_fr: "salut", definition_en: "hi", definition_kh: "", phonetic: "susdey", word_type: "", tag_list: "" },
  { definition_fr: "merci", definition_en: "thank you", definition_kh: "", phonetic: "orkon", word_type: "", tag_list: "" },
  { definition_fr: "aimer", definition_en: "to love", definition_kh: "", phonetic: "srolagne", word_type: "", tag_list: "" },
  { definition_fr: "petit", definition_en: "small", definition_kh: "", phonetic: "touy", word_type: "", tag_list: "" },
  { definition_fr: "grand", definition_en: "big", definition_kh: "", phonetic: "throm", word_type: "", tag_list: "" }
]

words_list.each do |word|
  Word.create!(
    definition_fr: word[:definition_fr],
    definition_en: word[:definition_en],
    definition_kh: word[:definition_kh],
    phonetic: word[:phonetic],
    word_type: word[:word_type],
    tag_list: word[:word_type])
end
