require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'rental'
require_relative 'book'

student_1 = Student.new(20, "classroom1", "Sam")
student_2 = Student.new(18, "classroom1")

classroom_1 = Classroom.new("classroom1")
# puts classroom_1.students

student_1.classroom
classroom_1.add_student(student_1)
student_1.classroom
# student_1.classroom.name
# puts classroom_1.students.count()

student_2.classroom
classroom_1.add_student(student_2)
student_2.classroom
# puts student_2.classroom
# puts classroom_1.students.count()
p student_2.classroom