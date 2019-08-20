# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    Tournament.create(clan_tag: '#VP08QJV', first_place: '#2C9VJYL9',
                      second_place: '#288GP2PU8', best_streak: '#2C9VJYL9',
                      unbeaten: '#2C9VJYL9', players: 2, rounds: 1)
    Tournament.create(clan_tag: '#VP08QJV', first_place: '#288GP2PU8',
                      second_place: '#2C9VJYL9', best_streak: '#288GP2PU8',
                      unbeaten: '#288GP2PU8', players: 2, rounds: 1)