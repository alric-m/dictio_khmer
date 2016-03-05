module ApplicationHelper

  def word_count
    Word.all.count
  end

  def getTypes
    ["Nom", "Adjectif", "Verbe"]
  end

  def getQuestionTypes
    [
      ["Francais vers Khmer","fr_to_kh"],
      ["Francais vers Phonétique", "fr_to_ph"],
      ["Anglais vers Khmer","en_to_kh"],
      ["Anglais vers Phonétique", "en_to_ph"],
      ["Khmer vers Francais", "kh_to_fr"],
      ["Phonétique vers Francais", "ph_to_fr"],
      ["Khmer vers Anglais", "kh_to_en"],
      ["Phonétique vers Anglais", "ph_to_en"]
    ]
  end

  def getThemes
    Word.all_tags
  end

end
