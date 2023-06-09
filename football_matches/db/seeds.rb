# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

team1 = Team.create(name: 'Команда 1')
team2 = Team.create(name: 'Команда 2')

team1.players.create(
  [
    { full_name: 'Игрок 11' },
    { full_name: 'Игрок 12' },
    { full_name: 'Игрок 13' },
    { full_name: 'Игрок 14' },
    { full_name: 'Игрок 15' },
    { full_name: 'Игрок 16' },
    { full_name: 'Игрок 17' }
  ]
)

team2.players.create(
  [
    { full_name: 'Игрок 21' },
    { full_name: 'Игрок 22' },
    { full_name: 'Игрок 23' },
    { full_name: 'Игрок 24' },
    { full_name: 'Игрок 25' },
    { full_name: 'Игрок 26' },
    { full_name: 'Игрок 27' }
  ]
)

matches = Match.create(
  10.times.map { { time_start: DateTime.new(rand(1999..2100)), team1: team1, team2: team2 } }
)

matches.each do |match|
  [match.team1, match.team2].each do |team|
    team.players.each_with_index do |player, index|
      PlayerMetric.create(
        player: player,
        match: match,
        passes: 5 * index,
        passes_success: 4 * index,
        goals: index,
        kilometers_run: 3 * index
      )
    end
  end
end
