module ApplicationHelper

  def word_count
    Word.all.count
  end

  def getTypes
    ["Nom", "Adjectif", "Verbe"]
  end

  def getQuestionTypes
    [["Francais vers Khmer","nl_to_kh"], ["Francais vers Phonétique", "nl_to_ph"],
    ["Khmer vers Francais", "kh_to_nl"], ["Phonétique vers Francais", "ph_to_nl"]]
  end

  def getThemes
    Word.all_tags
  end

end
