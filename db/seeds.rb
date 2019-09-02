# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    Tournament.create(clan_tag: 'VP08QJV', first_place: 'bian',
                      second_place: 'pedro', best_streak: 'bian',
                      unbeaten: 'bian', players: 2, rounds: 1, time_per_round: 20)
    Tournament.create(clan_tag: 'VP08QJV', first_place: 'pedro',
                      second_place: 'bian', best_streak: 'pedro',
                      unbeaten: 'pedro', players: 2, rounds: 1, time_per_round: 15)