FactoryGirl.define do
  factory :admin do
    
  end

  ##################
  #                #
  #  USER FACTORY  #
  #                #
  ##################

  factory :user do

  end

  ##################
  #                #
  #  WORD FACTORY  #
  #                #
  ##################

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
    word_type      'noun'
  end

  ##################
  #                #
  #  QUIZ FACTORY  #
  #                #
  ##################

  factory :quiz do
    questions_count 5
    translate_from_default  'fr'
    translate_to_default    'kh'
  end


end
