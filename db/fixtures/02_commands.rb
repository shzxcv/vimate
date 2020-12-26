require 'csv'

commands = CSV.read('db/fixtures/commands.csv')

commands.each do |command|
  Command.seed do |s|
    s.id = command[0]
    s.lesson_id = command[1]
    s.question = command[2]
    s.answer_key = command[3]
  end
end
