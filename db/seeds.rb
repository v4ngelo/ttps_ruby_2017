#Database clean up. Delete everything and then seed.
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# Testing User - DEVISE
User.create(email: "test@test.com", password: "test123", password_confirmation: "test123")
User.create(email: "ncuesta@info.unlp.edu.ar", password: "ncuesta@info.unlp.edu.ar", password_confirmation: "ncuesta@info.unlp.edu.ar")

Course.create("anio" => "2018")
Course.create("anio" => "2019")

pe1 = Date.new(2018,9,9)
se1 = Date.new(2018,11,11)
te1 = Date.new(2018,12,12)
tf1 = Date.new(2019,2,9)
f1 = Date.new(2019,3,15)

pe2 = Date.new(2019,9,9)
se2 = Date.new(2019,11,11)
te2 = Date.new(2019,12,12)
tf2 = Date.new(2019,2,9)
f2 = Date.new(2019,3,15)

@courses = Course.all

Evaluation.create(course_id: @courses[0].id, "title" => "Primer Parcial", "evaluation_date" => pe1, "minimum_note" => 7);
Evaluation.create(course_id: @courses[0].id, "title" => "Segundo Parcial", "evaluation_date" => se1, "minimum_note" => 8);
Evaluation.create(course_id: @courses[0].id, "title" => "Tercer Parcial", "evaluation_date" => te1, "minimum_note" => 6);
Evaluation.create(course_id: @courses[0].id, "title" => "Trabajo Final", "evaluation_date" => tf1, "minimum_note" => 6);
Evaluation.create(course_id: @courses[0].id, "title" => "Final", "evaluation_date" => f1, "minimum_note" => 6);

Evaluation.create(course_id: @courses[1].id, "title" => "Primer Parcial", "evaluation_date" => pe2, "minimum_note" => 7);
Evaluation.create(course_id: @courses[1].id, "title" => "Segundo Parcial", "evaluation_date" => se2, "minimum_note" => 8);
Evaluation.create(course_id: @courses[1].id, "title" => "Tercer Parcial", "evaluation_date" => te2, "minimum_note" => 6);
Evaluation.create(course_id: @courses[1].id, "title" => "Trabajo Final", "evaluation_date" => tf2, "minimum_note" => 6);
Evaluation.create(course_id: @courses[1].id, "title" => "Final", "evaluation_date" => f2, "minimum_note" => 6);


@courses.each do |c|
  Student.create(course_id: c.id, "name" => "Luke", "surname" => "Skywalker", "dni"=>"1111", "student_number"=>"1111/1", "email"=> "luke.skywalker@mail.com")
  Student.create(course_id: c.id, "name" => "Leia", "surname" => "Organa", "dni"=>"2222", "student_number"=>"2222/2", "email"=> "leia.organa@mail.com")
  Student.create(course_id: c.id, "name" => "Chewbacca", "surname" => "Wookiee", "dni"=>"3333", "student_number"=>"3333/3", "email"=> "luke.skywalker@mail.com")
  Student.create(course_id: c.id, "name" => "Padmé", "surname" => "Amidala", "dni"=>"4444", "student_number"=>"4444/4", "email"=> "padme.amidala@mail.com")
  Student.create(course_id: c.id, "name" => "Jar Jar", "surname" => "Binks", "dni"=>"5555", "student_number"=>"5555/5", "email"=> "jarjar.binks@mail.com")
  Student.create(course_id: c.id, "name" => "Armitage", "surname" => "Hux", "dni"=>"6666", "student_number"=>"6666/6", "email"=> "armitage.hux@mail.com")
  Student.create(course_id: c.id, "name" => "Obi-Wan", "surname" => "Kenobi", "dni"=>"7777", "student_number"=>"7777/7", "email"=> "obiwan.kenobi@mail.com")
  Student.create(course_id: c.id, "name" => "Darth", "surname" => "Sidious", "dni"=>"8888", "student_number"=>"8888/8", "email"=> "darth.sidious@mail.com")
  Student.create(course_id: c.id, "name" => "Darth", "surname" => "Vader", "dni"=>"9999", "student_number"=>"9999/9", "email"=> "darth.vader@mail.com")
  Student.create(course_id: c.id, "name" => "Kylo", "surname" => "Ren", "dni"=>"1010", "student_number"=>"1010/1", "email"=> "kylo.ren@mail.com")
end
