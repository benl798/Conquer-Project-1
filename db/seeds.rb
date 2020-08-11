# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print "Creating Users..."
User.destroy_all


u1 = User.create!(
  name:'Ben',
  dob:'17/02/1998',
  sex: 'M',
  age: 22,
  height: 188,
  weight: 100,
  target_weight: 90,
  bio: 'My profile',
  goal: 'Time to lose some weight',
  email: 'ben.l7@hotmail.com',
  password: 'chicken'

)

u2 = User.create!(
  name:'Tom',
  dob:'03/04/2001',
  sex: 'M',
  age: 19,
  height: 185,
  weight: 70,
  target_weight: 80,
  bio: 'My profile',
  goal: 'Time to put on some weight',
  email: 'tjl@hotmail.com',
  password: 'chicken'

)

puts "Created #{ User.count } users:"


print "Creating Workouts..."
Workout.destroy_all

w1 = Workout.create!(
  workout_type: 'Cardio',
  image: 'https://www.besthealthmag.ca/wp-content/uploads/2019/01/what_is_cardio-1024x768.jpg',
  description: 'Killer'
)

w2 = Workout.create!(
  workout_type: 'Hypertrophy',
  image: 'https://cdn.muscleandstrength.com/sites/default/files/field/feature-wide-image/workout/total-package-workout-wide.jpg',
  description: 'Mix'
)

puts "Created #{ Workout.count } workouts:"

print "Creating Exercises..."

Exercise.destroy_all

e1 = Exercise.create!(
  name: 'Deadlift',
  image: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/deadlift-workout-for-back-royalty-free-image-527680187-1553003041.jpg',
  descript: 'The deadlift is a weight training exercise in which a loaded barbell or bar is lifted off the ground to the level of the hips, torso perpendicular to the floor, before being placed back on the ground.',
  link:'https://www.google.com/search?q=deadlift&oq=dead&aqs=chrome.0.69i59j69i57j46l2j0j69i60l3.1407j0j4&sourceid=chrome&ie=UTF-8',
  reps: '10-12',
  tips: 'Dont overload'
)

e2 = Exercise.create!(
  name: 'Squat',
  image: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/deadlift-workout-for-back-royalty-free-image-527680187-1553003041.jpg',
  descript: 'The squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up.',
  link:'https://www.google.com/search?q=squat&oq=squat&aqs=chrome..69i57j0l6j69i60.908j0j4&sourceid=chrome&ie=UTF-8',
  reps: '10-15',
  tips: 'Ass to grass'
)

e3 = Exercise.create!(
  name: 'Bench Press',
  image: 'https://cdn2.coachmag.co.uk/sites/coachmag/files/2017/05/bench-press_0.jpg',
  descript: 'The bench press is an upper-body weight training exercise in which the trainee presses a weight upwards while lying on a weight training bench.',
  link:'https://www.google.com/search?ei=UTMxX4yWO6aQ4-EPwOiXOA&q=bench+press&oq=bench+p&gs_lcp=CgZwc3ktYWIQAxgAMgcIABCxAxBDMgQIABBDMgQIABBDMgQIABBDMgIIADIFCAAQsQMyAggAMgIIADICCAAyAggAOgcIABBHELADOgsILhCxAxDHARCjAjoICC4QxwEQowI6CAgAELEDEIMBOgUIABCRAjoCCC46CAguELEDEIMBUMKIBljdjwZgzpYGaAFwAHgAgAGEAogBoQ6SAQUxLjIuNpgBAKABAaoBB2d3cy13aXrAAQE&sclient=psy-ab',
  reps: '4-8',
  tips: 'Chest out shoulders back'
)

e4 = Exercise.create!(
  name: 'Treadmill',
  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTPict0UZiu9MVqI6kncQbsrLzhRyDn_qfonw&usqp=CAU',
  descript: 'Pure hell.',
  link:'https://www.google.com/search?ei=0zMxX_f7I--E4-EP4r-q2As&q=treadmill&oq=tread&gs_lcp=CgZwc3ktYWIQAxgAMgcIABCxAxBDMgoILhDHARCvARBDMgQIABBDMgcIABCxAxBDMgQIABBDMgQIABBDMggIABCxAxCDATIECAAQQzIFCAAQsQMyAggAOgcIABBHELADOgoIABCxAxCDARBDOgsILhCxAxDHARCjAjoICC4QsQMQgwE6BAguEENQ7u0nWLfzJ2Ds-ydoAXAAeACAAe4BiAGqCZIBBTEuNC4ymAEAoAEBqgEHZ3dzLXdpesABAQ&sclient=psy-ab',
  reps: '30 mins',
  tips: 'Get ready for a fun time'
)

e5 = Exercise.create!(
  name: 'Stair Climber',
  image: 'https://sc02.alicdn.com/kf/HTB1Nu3LOAvoK1RjSZFDq6xY3pXag.jpg',
  descript: 'Up we go.',
  link:'https://www.google.com/search?ei=vDYxX_-KAcbcz7sPs--uoAo&q=stair+climber&oq=stair+c&gs_lcp=CgZwc3ktYWIQAxgAMgcIABCxAxBDMgQIABBDMgIIADICCAAyAggAMgIIADICCAAyBQgAELEDMgIIADIECAAQCjoHCAAQRxCwAzoICC4QxwEQowI6CAgAELEDEIMBOgoILhDHARCjAhBDUPzFBFjN2gRgkeYEaANwAHgAgAHfAYgBywuSAQUxLjcuMZgBAKABAaoBB2d3cy13aXrAAQE&sclient=psy-ab',
  reps: '20-30 mins',
  tips: 'Stairway to heaven boiiii'
)


puts "Created #{ Exercise.count } exercises:"
