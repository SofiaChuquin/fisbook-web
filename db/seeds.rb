# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.delete_all

person1 = Person.create(lastname: 'Hernandez Pujaico', name: 'Juan', dni: 12345676, phone: 123456798,
                        email: 'juan@hotmail.com', gender: 'Masculino', state: 'Activo', rol: 'Directivo')
person2 = Person.create(lastname: 'Hernandez Matta',name: 'Juancho', dni: 12342676, phone: 123451798,
                        email: 'juancho@hotmail.com',gender: 'Masculino', state: 'Activo' , rol: 'Estudiante')
person3 = Person.create(lastname: 'Sotel Pujaico',name: 'Jose', dni: 12341676, phone: 121456798,
                        email: 'jose@hotmail.com',gender: 'Masculino', state: 'Activo' , rol: 'Directivo')
person4 = Person.create(lastname: 'Nuria Juila',name: 'Julia', dni: 12315676, phone: 123226798,
                        email: 'julia@hotmail.com',gender: 'Femenino', state: 'Inactivo' , rol: 'Estudiante')
person5 = Person.create(lastname: 'Hernandez Malta',name: 'Miguel', dni: 12344676, phone: 123956798,
                        email: 'miguel@hotmail.com',gender: 'Femenino', state: 'Activo' , rol: 'Estudiante')
person6 = Person.create(lastname: 'Palacios Pujaico',name: 'Juana', dni: 12342676, phone: 123456798,
                        email: 'juana@hotmail.com',gender: 'Femenino', state: 'Inactivo' , rol: 'Estudiante')
person7 = Person.create(lastname: 'Carrillo Pujaico',name: 'Juliana', dni: 12340676, phone: 123456798,
                        email: 'juliana@hotmail.com',gender: 'Femenino', state: 'Activo' , rol: 'Directivo')
person8 = Person.create(lastname: 'Casas Pujaico',name: 'Maria', dni: 12348676, phone: 123456798,
                        email: 'maria@hotmail.com',gender: 'Masculino', state: 'Inactivo' , rol: 'Docente')
person9 = Person.create(lastname: 'Peralta Pujaico',name: 'Omar', dni: 12349676, phone: 123356798,
                        email: 'omar@hotmail.com',gender: 'Masculino', state: 'Activo' , rol: 'Docente')
person10 = Person.create(lastname: 'Casita Pujaico',name: 'Oscar', dni: 12355676, phone: 122456798,
                        email: 'oscar@hotmail.com',gender: 'Masculino', state: 'Inactivo' , rol: 'Docente')

teacher1 = Teacher.create(people_id: person8.id, rank: 'Contratado')
teacher2 = Teacher.create(people_id: person9.id, rank: 'Nombrado')
teacher3 = Teacher.create(people_id: person10.id, rank: 'Contratado')

student1 = Student.create(people_id: person2.id, turn: 'Mañana')
student2 = Student.create(people_id: person4.id, turn: 'Tarde')
student3 = Student.create(people_id: person5.id, turn: 'Noche')
student4 = Student.create(people_id: person6.id, turn: 'Mañana')

executive1 = Executive.create(people_id: person1.id, position: 'Secretario')
executive2 = Executive.create(people_id: person3.id, position: 'Director')
executive3 = Executive.create(people_id: person7.id, position: 'Secretario')
