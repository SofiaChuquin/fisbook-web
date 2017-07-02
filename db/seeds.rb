# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.delete_all

#Teachers
person1 = Person.create(lastname: 'Hernandez Pujaico', name: 'Juan', dni: 12345676, phone: 123456798,
                        email: 'juan@hotmail.com', gender: 'Masculino', state: 'Activo', rol: 'Docente')
person2 = Person.create(lastname: 'Hernandez Matta',name: 'Jaime', dni: 12342676, phone: 123451798,
                        email: 'jaime@hotmail.com',gender: 'Masculino', state: 'Activo' , rol: 'Docente')
person3 = Person.create(lastname: 'Sotel Pujaico',name: 'Jose', dni: 12341676, phone: 121456798,
                        email: 'jose@hotmail.com',gender: 'Masculino', state: 'Activo' , rol: 'Docente')
#Students
person4 = Person.create(lastname: 'Fernandez Ramirez',name: 'Miguel', dni: 12315676, phone: 123226798,
                        email: 'miguel@hotmail.com',gender: 'Masculino', state: 'Inactivo' , rol: 'Estudiante')
person5 = Person.create(lastname: 'Hernandez Mendez',name: 'Andrea', dni: 12344676, phone: 123956798,
                        email: 'andrea@hotmail.com',gender: 'Femenino', state: 'Activo' , rol: 'Estudiante')
person6 = Person.create(lastname: 'Palacios Pujaico',name: 'Juana', dni: 12342888, phone: 123456798,
                        email: 'juana@hotmail.com',gender: 'Femenino', state: 'Inactivo' , rol: 'Estudiante')
person7 = Person.create(lastname: 'Carrillo Pujaico',name: 'Julian', dni: 12340676, phone: 123456798,
                        email: 'julian@hotmail.com',gender: 'Masculino', state: 'Activo' , rol: 'Estudiante')

#Executives
person8 = Person.create(lastname: 'Casas Pujaico',name: 'Maria', dni: 12348676, phone: 123456798,
                        email: 'maria@hotmail.com',gender: 'Femenino', state: 'Inactivo' , rol: 'Directivo')
person9 = Person.create(lastname: 'Peralta Pujaico',name: 'Omar', dni: 12349676, phone: 123356798,
                        email: 'omar@hotmail.com',gender: 'Masculino', state: 'Activo' , rol: 'Directivo')
person10 = Person.create(lastname: 'Casita Pujaico',name: 'Daniel', dni: 12355676, phone: 122456798,
                        email: 'daniel@hotmail.com',gender: 'Masculino', state: 'Inactivo' , rol: 'Directivo')

teacher1 = Teacher.create(people_id: person1.id, rank: 'Contratado')
teacher2 = Teacher.create(people_id: person2.id, rank: 'Nombrado')
teacher3 = Teacher.create(people_id: person3.id, rank: 'Contratado')

student1 = Student.create(people_id: person4.id, turn: 'Mañana')
student2 = Student.create(people_id: person5.id, turn: 'Tarde')
student3 = Student.create(people_id: person6.id, turn: 'Noche')
student4 = Student.create(people_id: person7.id, turn: 'Mañana')

executive1 = Executive.create(people_id: person8.id, position: 'Secretario')
executive2 = Executive.create(people_id: person9.id, position: 'Director')
executive3 = Executive.create(people_id: person10.id, position: 'Secretario')

Cycle.delete_all

cycle1 = Cycle.create(name: 'Primer Ciclo', semester: '1', year: 2017)
cycle2 = Cycle.create(name: 'Segundo Ciclo', semester: '1', year: 2017)
cycle3 = Cycle.create(name: 'Tercer Ciclo', semester: '1', year: 2017)
cycle4 = Cycle.create(name: 'Cuarto Ciclo', semester: '1', year: 2017)
cycle5 = Cycle.create(name: 'Quinto Ciclo', semester: '1', year: 2017)
cycle6 = Cycle.create(name: 'Sexto Ciclo', semester: '1', year: 2017)
cycle7 = Cycle.create(name: 'Séptimo Ciclo', semester: '1', year: 2017)
cycle8 = Cycle.create(name: 'Octavo Ciclo', semester: '1', year: 2017)
cycle9 = Cycle.create(name: 'Noveno Ciclo', semester: '1', year: 2017)
cycle10 = Cycle.create(name: 'Décimo Ciclo', semester: '1', year: 2017)


Enrollment.delete_all

enrollment1 = Enrollment.create(voucher: 'SIS123', active: true, student_id: student1.id, cycle_id: cycle9.id)
enrollment2 = Enrollment.create(voucher: 'SIS345', active: true, student_id: student2.id, cycle_id: cycle9.id)
enrollment3 = Enrollment.create(voucher: 'SIS678', active: true, student_id: student3.id, cycle_id: cycle9.id)
enrollment4 = Enrollment.create(voucher: 'SIS951', active: true, student_id: student4.id, cycle_id: cycle9.id)

Course.delete_all

course1 = Course.create(name: 'Inteligencia de Negocios', credits: 4, type_evaluation: 'A', hours: 5, teacher_id: teacher1.id, cycle_id: cycle9.id)
course2 = Course.create(name: 'Aplicaciones Empresariales', credits: 5, type_evaluation: 'A', hours: 6, teacher_id: teacher1.id, cycle_id: cycle9.id)
course3 = Course.create(name: 'Sistemas Expertos', credits: 5, type_evaluation: 'B', hours: 4, teacher_id: teacher2.id, cycle_id: cycle9.id)
course4 = Course.create(name: 'E-business', credits: 3, type_evaluation: 'C', hours: 5, teacher_id: teacher3.id, cycle_id: cycle9.id)
