FactoryGirl.define do

  ##################
  #                #
  #  WORD FACTORY  #
  #                #
  ##################

  factory :hi, class: Word do
    definition_fr  'Salut'
    definition_en  'Hi'
    definition_kh  'សួស្តី'
    definition_ph  'Susdey'
    word_type      'noun'
  end

  factory :thanks, class: Word do
    definition_fr  'Merci'
    definition_en  'Thank you'
    definition_kh  'អរគុណ'
    definition_ph  'Orkon'
    word_type      'noun'
  end

  factory :type_missing, class: Word do
    definition_fr  'Merci'
    definition_en  'Thank you'
    definition_kh  'អរគុណ'
    definition_ph  'Orkon'
  end

  factory :definition_missing, class: Word do
    definition_fr  'Merci'
    definition_ph  'Orkon'
    word_type      'noun'
  end

end
