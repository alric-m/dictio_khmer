class Quiz < ActiveRecord::Base

  has_many  :questions, dependent: :destroy

  scope :done,     -> { where(done: true) }
  scope :not_done, -> { where(done: false) }

  # before_action :correct_quiz

  def next_question
    questions.not_done.first
  end

  def build_questions
    words = Word.all

    words = words.tagged_with(default_tags) unless default_tags.blank?
    words = words.where(word_type: default_word_type) unless default_word_type.blank?

    words = words.sort_by { rand }.slice(0, questions_count)
    words.each do |w|
      question_type = default_question_type || ["fr_to_kh", "fr_to_ph", "en_to_kh",
        "en_to_ph", "kh_to_fr", "ph_to_fr", "kh_to_en", "ph_to_en"].shuffle[0]
      word_type = default_word_type || ["Nom", "Adjectif", "Verbe"].shuffle[0]
      tags = default_tags || Word.all_tags.shuffle[0]
      q = Question.create!(quiz_id: self.id, word: w, question_type: question_type, word_type: word_type, themes: tags)
    end
  end

  def correct_quiz

  end

end
