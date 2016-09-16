class CohortStudentBuilder
  attr_accessor :cohort, :learn_client

  def initialize(cohort, learn_client)
     @cohort = cohort
     @learn_client = learn_client 
  end

  def execute
    students = learn_client.students_for_batch(cohort.learn_batch_id)
    build_students(students)
  end

  def build_students(students)
    students["users"].each do |s|
      if !s["admin"]
        Student.find_or_create_by(learn_uid: s["id"]).tap do |student| 
          student.email = s["email"]
          student.first_name = s["first_name"]
          student.last_name = s["last_name"]
          student.cohort_id = cohort.id
          student.save
       end
      end
    end
  end
end
