class Student < User
  belongs_to  :teacher
  has_many    :quizzes
end
