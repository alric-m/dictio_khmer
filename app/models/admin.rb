class Admin < User
  has_many :quizzes, foreign_key: "student_id"
end
