# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

words_list = [
  { definition_fr: "météo", definition_en: "weather", definition_kh: "អាកាសធាតុ", definition_ph: "akasotièt", word_type: "noun", fr_tag_list: "Conversation", en_tag_list: "Conversation" },
  { definition_fr: "pomme", definition_en: "apple", definition_kh: "ផ្លែប៉ោម", definition_ph: "pom", word_type: "noun", fr_tag_list: "Fruits et légumes", en_tag_list: "Fruits and vegetables" },
  { definition_fr: "voiture", definition_en: "car", definition_kh: "ឡាន", definition_ph: "lan", word_type: "noun", fr_tag_list: "Transport", en_tag_list: "Transport" },
  { definition_fr: "vélo", definition_en: "bike", definition_kh: "កង់", definition_ph: "cang", word_type: "noun", fr_tag_list: "Transport", en_tag_list: "Transport" },
  { definition_fr: "moto", definition_en: "motorbike", definition_kh: "ម៉ូតូ", definition_ph: "moto", word_type: "noun", fr_tag_list: "Transport", en_tag_list: "Transport" },
  { definition_fr: "salut", definition_en: "hi", definition_kh: "សួស្តី", definition_ph: "susdey", word_type: "noun", fr_tag_list: "Conversation, Présentation", en_tag_list: "Conversation, Introduction" },
  { definition_fr: "merci", definition_en: "thank you", definition_kh: "អរគុណ", definition_ph: "orkon", word_type: "noun", fr_tag_list: "Conversation, Présentation", en_tag_list: "Conversation, Introduction" },
  { definition_fr: "aimer", definition_en: "to love", definition_kh: "ស្រឡាញ់", definition_ph: "srolagne", word_type: "verb", fr_tag_list: "Conversation", en_tag_list: "Conversation" },
  { definition_fr: "petit", definition_en: "small", definition_kh: "តូច", definition_ph: "touy", word_type: "adjective", fr_tag_list: "Description", en_tag_list: "Description" },
  { definition_fr: "grand", definition_en: "big", definition_kh: "ធំ", definition_ph: "throm", word_type: "adjective", fr_tag_list: "Description", en_tag_list: "Description" }
]

words_list.each do |word|
  Word.create!(
    definition_fr: word[:definition_fr],
    definition_en: word[:definition_en],
    definition_kh: word[:definition_kh],
    definition_ph: word[:definition_ph],
    word_type: word[:word_type],
    fr_tag_list: word[:fr_tag_list],
    en_tag_list: word[:en_tag_list]
  )
end
