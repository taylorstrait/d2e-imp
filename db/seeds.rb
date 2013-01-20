# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# USERS
puts 'seeding Users...'
[
  {id: 1, email: "admin@d2eimp.com", username: "Administrator", password: "d2eimpadmin", password_confirmation: "d2eimpadmin"}
  ].each do |x|
    u = User.new(x)
    u.skip_confirmation!
    u.save
  end


# GAMES
puts 'seeding Games...'
[
  {id: 1, name: "Descent: Journeys in the Dark 2E", short_name: "Descent 2E", edition: 2, bgg_url: "http://www.boardgamegeek.com/boardgame/104162/descent-journeys-in-the-dark-second-edition"},
  {id: 2, name: "Descent: Journeys in the Dark 2E - Lair of the Wyrm Queen", edition: 2, short_name: "D2E - Lair of the Wyrm", bgg_url: "http://www.boardgamegeek.com/boardgameexpansion/129423/descent-journeys-in-the-dark-second-edition-lair"},
  {id: 3, name: "Descent: Journeys in the Dark", short_name: "Descent 1E", edition: 1, bgg_url: "http://www.boardgamegeek.com/boardgame/17226/descent-journeys-in-the-dark"},
  {id: 4, name: "Descent: The Well of Darkness", short_name: "D1E: Well of Darkness", edition: 1, bgg_url: "http://www.boardgamegeek.com/boardgameexpansion/22361/descent-the-well-of-darkness"},
  {id: 5, name: "Descent: The Altar of Despair", short_name: "D1E: Altar of Despair", edition: 1, bgg_url: "http://www.boardgamegeek.com/boardgameexpansion/24976/descent-the-altar-of-despair"},
  {id: 6, name: "Descent: The Tomb of Ice", short_name: "D1E: Tomb of Ice", edition: 1, bgg_url: "http://www.boardgamegeek.com/boardgameexpansion/36722/descent-the-tomb-of-ice"}
].each {|x| Game.find_or_create_by_name(x)}


# CAMPAIGNS
puts 'seeding Campaigns...'
[
  {id: 1, name: "The Shadow Rune", game_id: 1, user_id: 1},
  {id: 2, name: "Lair of the Wyrm", game_id: 2, user_id: 1}
].each {|x| Campaign.find_or_create_by_name(x)}


# TRAITS
puts 'seeding Traits...'
[
  {id: 1, name: "Civilized", image: "civilized.jpg"},
  {id: 2, name: "Dark", image: "dark.jpg"},
  {id: 3, name: "Building", image: "building.jpg"},
  {id: 4, name: "Mountain", image: "mountain.jpg"},
  {id: 5, name: "Cursed", image: "cursed.jpg"},
  {id: 6, name: "Cold", image: "cold.jpg"},
  {id: 7, name: "Hot", image: "hot.jpg"},
  {id: 8, name: "Water", image: "water.jpg"},
  {id: 9, name: "Wilderness", image: "wilderness.jpg"},
  {id: 10, name: "Cave", image: "cave.jpg"}
].each {|x| Trait.find_or_create_by_name(x)}


# QUESTS
puts 'seeding Quests...'
[
  {id: 1, name: "First Blood", position: 1, act: 1, campaign_id: 1, page: 3, user_id: 1},
  {id: 2, name: "A Fat Goblin", position: 2, act: 1, campaign_id: 1, page: 4, user_id: 1},
  {id: 3, name: "Castle Daerion", position: 3, act: 1, campaign_id: 1, page: 6, user_id: 1},
  {id: 4, name: "The Cardinal's Plight", position: 4, act: 1, campaign_id: 1, page: 8, user_id: 1},
  {id: 5, name: "The Masquarade Ball", position: 5, act: 1, campaign_id: 1, page: 10, user_id: 1},
  {id: 6, name: "Death on the Wing", position: 6, act: 1, campaign_id: 1, page: 12, user_id: 1},
  {id: 7, name: "The Shadow Vault", position: 7, act: 1, campaign_id: 1, page: 14, user_id: 1},
  {id: 8, name: "The Overlord Revealed", position: 8, act: 1, campaign_id: 1, page: 16, user_id: 1},
  {id: 9, name: "The Monster's Hoard", position: 9, act: 2, campaign_id: 1, page: 18, user_id: 1},
  {id: 10, name: "The Frozen Spire", position: 10, act: 2, campaign_id: 1, page: 20, user_id: 1},
  {id: 11, name: "The Dawnblade", position: 11, act: 2, campaign_id: 1, page: 22, user_id: 1},
  {id: 12, name: "The Desecrated Tomb", position: 12, act: 2, campaign_id: 1, page: 24, user_id: 1},
  {id: 13, name: "Enduring the Elements", position: 13, act: 2, campaign_id: 1, page: 26, user_id: 1},
  {id: 14, name: "The Ritual of Shadows", position: 14, act: 2, campaign_id: 1, page: 28, user_id: 1},
  {id: 15, name: "Blood of Heroes", position: 16, act: 2, campaign_id: 1, page: 30, user_id: 1},
  {id: 16, name: "The Twin Idols", position: 17, act: 2, campaign_id: 1, page: 32, user_id: 1},
  {id: 17, name: "The Wyrm Turns", position: 18, act: 2, campaign_id: 1, page: 34, user_id: 1},
  {id: 18, name: "The Wyrm Rises", position: 19, act: 2, campaign_id: 1, page: 36, user_id: 1},
  {id: 19, name: "Gryvorn Unleashed", position: 20, act: 2, campaign_id: 1, page: 38, user_id: 1},
  {id: 20, name: "The Man Who Would Be King", position: 21, act: 2, campaign_id: 1, page: 40, user_id: 1}
].each {|x| Quest.find_or_create_by_name(x)}


# MONSTERS
puts 'seeding Monsters...'
[
  {name: "Baron Zachareth", role: "Lieutenant", attack_type: "Melee", game_id: 1},
  {name: "Belthir", role: "Lieutenant", attack_type: "Melee", game_id: 1},
  {name: "Lady Eliza Farrow", role: "Lieutenant", attack_type: "Ranged", game_id: 1},
  {name: "Lord Merick Farrow", role: "Lieutenant", attack_type: "Ranged", game_id: 1},
  {name: "Sir Alric Farrow", role: "Lieutenant", attack_type: "Melee", game_id: 1},
  {name: "Splig", role: "Lieutenant", attack_type: "Melee", game_id: 1},
  {name: "Valyndra", role: "Lieutenant", attack_type: "Melee", game_id: 2},
  
  {name: "Bane Spider", trait_ids: [2, 10], attack_type: "Ranged", game_id: 3},
  {name: "Barghest", trait_ids: [9, 2], attack_type: "Melee", game_id: 1},
  {name: "Beastman", trait_ids: [4, 9], attack_type: "Melee", game_id: 3},
  {name: "Cave Spider", trait_ids: [9, 10], attack_type: "Melee", game_id: 1},
  {name: "Blood Ape", trait_ids: [10, 7], attack_type: "Melee", game_id: 5},
  {name: "Chaos Beast", trait_ids: [2, 5], attack_type: "Ranged", game_id: 5},
  {name: "Crypt Dragon", trait_ids: [2, 5], attack_type: "Ranged", game_id: 3},
  {name: "Dark Priest", trait_ids: [1, 5], attack_type: "Ranged", game_id: 5},
  {name: "Deep Elf", trait_ids: [2, 10], attack_type: "Melee", game_id: 5},
  {name: "Demon Lord", trait_ids: [7, 5], attack_type: "Ranged", game_id: 3},
  {name: "Ettin", trait_ids: [4, 10], attack_type: "Melee", game_id: 1},
  {name: "Elemental", trait_ids: [6, 7], attack_type: "Ranged", game_id: 1},
  {name: "Ferrox", trait_ids: [10, 8], attack_type: "Melee", game_id: 4},
  {name: "Fire Imps", trait_ids: [7, 5], attack_type: "Ranged", game_id: 2},
  {name: "Flesh Moulder", trait_ids: [5, 1], attack_type: "Ranged", game_id: 1},
  {name: "Giant", trait_ids: [4, 9], attack_type: "Melee", game_id: 3},
  {name: "Goblin Archer", trait_ids: [3, 10], attack_type: "Ranged", game_id: 1},
  {name: "Golem", trait_ids: [4, 3], attack_type: "Melee", game_id: 4},
  {name: "Hellhound", trait_ids: [7, 5], attack_type: "Melee", game_id: 3},
  {name: "Hybrid Sentinel", trait_ids: [4, 10], attack_type: "Melee", game_id: 2},
  {name: "Kobold", trait_ids: [3, 10], attack_type: "Melee", game_id: 4},
  {name: "Ice Wyrm", trait_ids: [6, 10], attack_type: "Melee", game_id: 6},
  {name: "Lava Beetle", trait_ids: [7, 10], attack_type: "Ranged", game_id: 6},
  {name: "Manticore", trait_ids: [9, 2], attack_type: "Ranged", game_id: 3},
  {name: "Medusa", trait_ids: [5, 3], attack_type: "Ranged", game_id: 6},
  {name: "Merriod", trait_ids: [9, 8], attack_type: "Melee", game_id: 1},
  {name: "Naga", trait_ids: [8, 10], attack_type: "Ranged", game_id: 3},
  {name: "Ogre", trait_ids: [3, 10], attack_type: "Melee", game_id: 3},
  {name: "Razorwing", trait_ids: [9, 10], attack_type: "Melee", game_id: 3},
  {name: "Shadow Dragon", trait_ids: [2, 10], attack_type: "Melee", game_id: 1},
  {name: "Skeleton Archer", trait_ids: [5, 1], attack_type: "Ranged", game_id: 3},
  {name: "Shade", trait_ids: [5, 2], attack_type: "Melee", game_id: 6},
  {name: "Sorcerer", trait_ids: [1, 3], attack_type: "Ranged", game_id: 3},
  {name: "Troll", trait_ids: [4, 10], attack_type: "Melee", game_id: 5},
  {name: "Wendigo", trait_ids: [6, 10], attack_type: "Melee", game_id: 6},
  {name: "Zombie", trait_ids: [5, 3], attack_type: "Melee", game_id: 1}
].each {|x| Monster.find_or_create_by_name(x)}

