# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(user_name: "Aivy")
User.create(user_name: "Dallas")
User.create(user_name: "Bob")

Poll.create(title: "Python Questions", author_id: 1)
Poll.create(title: "Ruby Questions", author_id: 2)
Poll.create(title: "JS Questions", author_id: 2)

Question.create(text: "Why JS?", poll_id: 3)
Question.create(text: "What is the 'Rails' way?", poll_id: 2)
Question.create(text: "What is Python?", poll_id: 1)
Question.create(text: "Who invented Ruby?", poll_id: 2)
Question.create(text: "How hard is Python?", poll_id: 1)

AnswerChoice.create(text: "Its fun!", question_id: 1) #1
AnswerChoice.create(text: "It's the best programing language!", question_id: 3) #2
AnswerChoice.create(text: "Its easy!", question_id: 1) #3
AnswerChoice.create(text: "It's super hard!", question_id: 5) #4
AnswerChoice.create(text: "It's easy!", question_id: 5) #5
AnswerChoice.create(text: "MATZ", question_id: 4) #6
AnswerChoice.create(text: "You only have to know JS to make stuff...?", question_id: 1) #7
AnswerChoice.create(text: "It's something", question_id: 2) #8

Response.create(user_id: 1, answer_choice_id: 1)
Response.create(user_id: 2, answer_choice_id: 1)
Response.create(user_id: 2, answer_choice_id: 2)
Response.create(user_id: 2, answer_choice_id: 3)
Response.create(user_id: 1, answer_choice_id: 3)
Response.create(user_id: 1, answer_choice_id: 4)
Response.create(user_id: 2, answer_choice_id: 5)
Response.create(user_id: 3, answer_choice_id: 6)
Response.create(user_id: 2, answer_choice_id: 7)
Response.create(user_id: 3, answer_choice_id: 7)
Response.create(user_id: 2, answer_choice_id: 8)
