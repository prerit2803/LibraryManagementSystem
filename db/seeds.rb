# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



user = User.create!([{full_name: 'Super-Admin', email: 'superadmin@ncsu.edu', password:'sup123',password_confirm:'sup123',usertype:0 , admin: true, check: 0},
                    {full_name: 'Animesh S', email: 'assinsin@ncsu.edu', password:'ani123',password_confirm:'ani123',usertype:1 , admin: true, check: 0},
                     {full_name: 'Demo-User', email: 'user@ncsu.edu', password:'123456',password_confirm:'123456',usertype:2 , admin: false, check: 0}])

room1 = Room.create!([{room_no: 1100, size: 4, lib_name: 'James.B.Hunt', status: 'Available'},
                      {room_no: 1011, size: 4, lib_name: 'James.B.Hunt', status: 'Available'},
                      {room_no: 1010, size: 4, lib_name: 'D.H.Hill', status: 'Available'},
                      {room_no: 1310, size: 4, lib_name: 'James.B.Hunt', status: 'Available'},
                      {room_no: 1021, size: 4, lib_name: 'James.B.Hunt', status: 'Available'},
                      {room_no: 1011, size: 4, lib_name: 'D.H.Hill', status: 'Available'},
                      {room_no: 1010, size: 4, lib_name: 'James.B.Hunt', status: 'Not'},
                      {room_no: 2200, size: 4, lib_name: 'D.H.Hill', status: 'Available'},
                      {room_no: 2010, size: 4, lib_name: 'James.B.Hunt', status: 'Available'},
                      {room_no: 1210, size: 4, lib_name: 'D.H.Hill', status: 'Available'},
                      {room_no: 3110, size: 4, lib_name: 'James.B.Hunt', status: 'Available'},
                      {room_no: 2010, size: 4, lib_name: 'D.H.Hill', status: 'Available'}])
