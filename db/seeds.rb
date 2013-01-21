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
  {id: 6, name: "Descent: The Tomb of Ice", short_name: "D1E: Tomb of Ice", edition: 1, bgg_url: "http://www.boardgamegeek.com/boardgameexpansion/36722/descent-the-tomb-of-ice"},
  {id: 7, name: "Descent: The Sea of Blood", short_name: "D1E: Sea of Blood", edition: 1, bgg_url: "http://boardgamegeek.com/boardgameexpansion/55150/descent-the-sea-of-blood"},
  {id: 8, name: "Dungeon Quest", short_name: "Dungeon Quest", edition: 1, bgg_url: "http://boardgamegeek.com/boardgame/71061/dungeonquest-third-edition"},
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


# HEROES
puts 'seeding Heroes...'
Hero.find_or_create_by_name(name: "Andira Runehand", archetype: "Healer", game_id: 3, speed: 4, health: 12, stamina: 4, defense: "{GREY}", might: 2, knowledge: 3, willpower: 4, awareness: 2, ability: "Each time you suffer 1 or more {HEALTH} from an adjacent figure, that figure suffers 1 {HEALTH}.", feat: "{ACTION}: Attack a monster adjacent to you and choose yourself or a hero within 3 spaces of you. The chosen hero recovers {HEALTH} equal to the {HEALTH} you deal on the attack.")
Hero.find_or_create_by_name(name: "Aurim", archetype: "Healer", game_id: 5, speed: 5, health: 8, stamina: 5, defense: "{GREY}", might: 2, knowledge: 4, willpower: 3, awareness: 2, ability: "Each time you use a Potion, you and each hero adjacent to you are affected.", feat: "Use at the start of your turn to draw a Search card.")
Hero.find_or_create_by_name(name: "Brother Gherinn", archetype: "Healer", game_id: 8, speed: 3, health: 12, stamina: 3, defense: "{GREY}", might: 1, knowledge: 4, willpower: 4, awareness: 2, ability: "Each time you perform an attack, before the dice are rolled, you may suffer 1 {HEALTH} to gain +1 {HEALTH} to the results.", feat: "Use after you defeat a monster to roll 2 red power dice. You and each hero within 3 spaces of you recover {HEALTH} equal to the {HEALTH} rolled.")
Hero.find_or_create_by_name(name: "Brother Glyr", archetype: "Healer", game_id: 8, speed: 2, health: 12, stamina: 3, defense: "{GREY}", might: 4, knowledge: 1, willpower: 3, awareness: 3, ability: "In addition to your 2 actions on your turn, you always receive 2 movement points.", feat: "Use at the start of your turn to recover all {FATIGUE}. Until the start of your next turn, each time you suffer 1 or more {HEALTH}, you suffer 1 fewer {HEALTH}, to a minimum of 0.", game_id: 4)
Hero.find_or_create_by_name(name: "Ispher", archetype: "Healer", speed: 4, health: 8, stamina: 4, defense: "{GREY}", might: 2, knowledge: 3, willpower: 3, awareness: 3, ability: "You cannot be Poisoned. At the start of your turn, recover 1 {HEALTH}.", feat: "{ACTION}: Recover all {HEALTH}.", game_id: 3)
Hero.find_or_create_by_name(name: "Jonas the Kind", archetype: "Healer", speed: 4, health: 8, stamina: 4, defense: "{GREY}", might: 2, knowledge: 3, willpower: 4, awareness: 2, ability: "During each round in which you do not perform an attack, you gain 1 additional brown dice to your defense pool.", feat: "{ACTION}: Test {WILLPOWER} for each minion monster within 3 spaces of you. For each test you pass, that monster performs 1 attack, declaring itself as the target. You may spend any surges and make other decisions for the attack.")
Hero.find_or_create_by_name(name: "Okaluk and Rakash", archetype: "Healer", speed: 2, health: 8, stamina: 5, defense: "{GREY}", might: 3, knowledge: 2, willpower: 3, awareness: 3, ability: "In addition to your 2 actions on your turn, you always receive 4 movement points.", feat: "{ACTION}: You may revive all knocked out heroes within 3 spaces of you. Make one roll and apply it to all knocked out heroes.", game_id: 6)
Hero.find_or_create_by_name(name: "Sahla", archetype: "Healer", speed: 4, health: 10, stamina: 4, defense: "{GREY}", might: 2, knowledge: 3, willpower: 3, awareness: 3, ability: "At the start of your turn, you may test {WILLPOWER}. If you pass, discard 1 Condition card from yourself or an adjacent hero.", feat: "Use at the start of your turn and choose a hero in your line of sight. Until the end of your turn, you may use any 1 of that hero's skills as if it were your own.", game_id: 5)
Hero.find_or_create_by_name(name: "Elder Mok", archetype: "Healer", game_id: 3, speed: 4, health: 10, stamina: 4, defense: "{GREY}", might: 2, knowledge: 3, willpower: 4, awareness: 2, ability: "Each time another hero within 3 spaces of you recovers 1 or more {HEALTH}, you recover 1 {HEALTH}, Each time another hero within 3 spaces of you recovers 1 or more {FATIGUE}, you recover {FATIGUE}.", feat: "Use at the start of your turn to look at the overlord's cards. Discard 1 card of your choice.")
Hero.find_or_create_by_name(name: "Challara", archetype: "Mage", game_id: 8, speed: 3, health: 10, stamina: 5, defense: "{GREY}", might: 3, knowledge: 4, willpower: 3, awareness: 1, ability: "You have the Brightblaze familiar. At the beginning of each encounter, place Brightblaze in your space.", feat: "{ACTION}: Perform an attack. Before the attack roll, you may move Brightblaze to an empty space adjacent to your target.")
Hero.find_or_create_by_name(name: "Landrec the Wise", archetype: "Mage", speed: 3, health: 10, stamina: 4, defense: "{BROWN}", might: 1, knowledge: 5, willpower: 3, awareness: 2, ability: "Each time you attack and do not roll at least one {SURGE}, gain 1 {SURGE}.", feat: "Use when performing an attack, before rolling dice. This attack gains: {SURGE}{SURGE}: +5 {HEALTH}", game_id: 3)
Hero.find_or_create_by_name(name: "Lyssa", archetype: "Mage", speed: 5, health: 8, stamina: 5, defense: "{GREY}", might: 2, knowledge: 3, willpower: 2, awareness: 4, ability: "Each time you are attacked, you may reroll 1 of your defense dice. You must keep the new result.", feat: "Use after an attack against you fails to deal at least 1 {HEALTH} to you. You may immediately move up to your Speed and perform an attack.", game_id: 3)
Hero.find_or_create_by_name(name: "Mad Carthos", archetype: "Mage", speed: 4, health: 8, stamina: 3, defense: "{GREY}", might: 1, knowledge: 4, willpower: 4, awareness: 2, ability: "Once per turn, when you use a skill that costs 1 {FATIGUE}, reduce the cost to 0 {FATIGUE}.", feat: "{ACTION}: Perform an attack with a Magic weapon. This attack deals +3 {HEALTH}.", game_id: 3)
Hero.find_or_create_by_name(name: "Master Thorn", archetype: "Mage", game_id: 4, speed: 5, health: 8, stamina: 4, defense: "{GREY}", might: 1, knowledge: 5, willpower: 3, awareness: 2, ability: "Each of your attacks gains: {SURGE}: Move 2 spaces after resolving this attack.", feat: "{ACTION}: Choose a space in your line of sight. Immediately drop any objective tokens you are carrying to remove your figure from the map and place it in the chosen space.")
Hero.find_or_create_by_name(name: "Astarra", archetype: "Mage", game_id: 3, speed: 4, health: 10, stamina: 5, defense: "{GREY}", might: 1, knowledge: 4, willpower: 4, awareness: 2, ability: "Once per turn, you may spend 1 movement point to choose a hero within 3 spaces of you and move to an empty space adjacent to that hero.", feat: "Use at the start of your turn to move each monster adjacent to you up to 2 spaces in any direction.")
Hero.find_or_create_by_name(name: "Shiver", archetype: "Mage", speed: 4, health: 8, stamina: 4, defense: "{GREY}", might: 2, knowledge: 3, willpower: 3, awareness: 3, ability: "Monsters must spend 1 additional movement point to enter a space adjacent to you.", feat: "{ACTION}: Each figure adjacent to you is Immobilized.", game_id: 6)
Hero.find_or_create_by_name(name: "Truthseer Kel", archetype: "Mage", speed: 4, health: 10, stamina: 4, defense: "{GREY}", might: 1, knowledge: 4, willpower: 2, awareness: 4, ability: "Figures and obstacles do not block your line of sight. Doors still block your line of sight as normal.", feat: "Use during your turn to look at the top 5 cards of the Overlord deck. Place 1 of the cards on the bottom of the deck and randomly place the rest back on top.")
Hero.find_or_create_by_name(name: "Zyla", archetype: "Mage", speed: 4, health: 8, stamina: 5, defense: "{GREY}", might: 1, knowledge: 4, willpower: 3, awareness: 3, ability: "You ignore all figures and terrain while moving. You must end your movement in an empty space.", feat: "Use before any figure is activated. Remove your figure from the map and place a hero token in your space. At the start of your next turn, replace the hero token with your figure.", game_id: 6)
Hero.find_or_create_by_name(name: "Arvel Worldwalker", archetype: "Scout", speed: 4, health: 10, stamina: 4, defense: "{GREY}", might: 3, knowledge: 3, willpower: 3, awareness: 3, ability: "When you fail an attribute test, you may reroll it. Limit once per round.", feat: "Use on your turn to discard 1 of your hero skills. Immediately gain any number of hero skills from your Class deck worth the same amount of experience points as the discarded skill.", game_id: 6)
Hero.find_or_create_by_name(name: "Borgan the Shadow", archetype: "Scout", speed: 4, health: 10, stamina: 4, defense: "{GREY}", might: 2, knowledge: 2, willpower: 3, awareness: 4, ability: "Each time you attack a monster adjacent to another hero, your attack gains +1 {HEALTH}.", feat: "{ACTION}: Perform an attack, then place a hero token in your space and remove your figure from the map. At the start of your next turn, replace the hero token with your figure.", game_id: 3)
Hero.find_or_create_by_name(name: "Grey Ker", archetype: "Scout", speed: 4, health: 10, stamina: 5, defense: "{GREY}", might: 2, knowledge: 2, willpower: 3, awareness: 4, ability: "If you perform only 1 action on your turn, the later this round you make take a second turn, during which you receive only 1 action. Your second turn must be taken after a hero's turn and before the overlord's turn.", feat: "Use at the start of your turn to immediately perform 1 free action. This is in addition to your 2 actions on your turn.", game_id: 3)
Hero.find_or_create_by_name(name: "Kirga", archetype: "Scout", speed: 4, health: 12, stamina: 3, defense: "{GREY}", might: 3, knowledge: 2, willpower: 1, awareness: 5, ability: "A monster may only target you with an atack if there are no other heroes cloer to that monsters and in its line of sight.", feat: "Use during another figure's activation to immediately performa  move action. You may not interrupt another player's action unless it is a move action.", game_id: 5)
Hero.find_or_create_by_name(name: "Laurel of Bloodwood", archetype: "Scout", speed: 4, health: 8, stamina: 3, defense: "{GREY}", might: 2, knowledge: 3, willpower: 2, awareness: 4, ability: "Each time you make a Ranged attack and the total range result is more than was necessary to reach your target, deal +1 {HEALTH}.", feat: "{ACTION}: Perform an attack with a Ranged weapon, ignoring the range rolled. This attack cannot miss due to rolling an X or insufficient damage.", game_id: 4)
Hero.find_or_create_by_name(name: "Lindel", archetype: "Scout", game_id: 8, speed: 5, health: 10, stamina: 5, defense: "{GREY}", might: 3, knowledge: 3, willpower: 3, awareness: 3, ability: "When making an attribute test, you roll 2 gray defense dice instead of 1 gray and 1 black defense dice.", feat: "{ACTION}: Perform an attack. Rather than rolling the attack dice, place it showing the face of your choice. Roll the rest of your dice as normal.")
Hero.find_or_create_by_name(name: "Red Scorpion", archetype: "Scout", speed: 5, health: 8, stamina: 5, defense: "{GREY}", might: 3, knowledge: 3, willpower: 3, awareness: 3, ability: "At the end of your turn, you may suffer 1 {FATIGUE} to recover 1 {HEALTH}, or suffer 1 {HEALTH} to recover 1 {FATIGUE}.", feat: "Use when you are attacked to force the attacking monster to reroll some of all of the attack dice (you choose which dice). The new results must be applied.", game_id: 3)
Hero.find_or_create_by_name(name: "Silhouette", archetype: "Scout", speed: 5, health: 10, stamina: 4, defense: "{GREY}", might: 3, knowledge: 2, willpower: 1, awareness: 5, ability: "Each time you roll an X on your attack roll, you may deal 1 {HEALTH} to 1 monster adjacent to you.", feat: "{ACTION}: Move double your Speed. You may search any number of search tokens you move adjacent to during this movement without performing an action to do so.", game_id: 3)
Hero.find_or_create_by_name(name: "Tatianna", archetype: "Scout", game_id: 8, speed: 5, health: 12, stamina: 4, defense: "{GREY}", might: 2, knowledge: 2, willpower: 2, awareness: 5, ability: "Each of your attacks gain +1 range. Each Ranged attack that targets you gains -1 range.", feat: "Use after defense dice are rolled against one of your attacks. Ignore the results from the die that rolled the most {DEFENSE}.")
Hero.find_or_create_by_name(name: "Tetherys", archetype: "Scout", speed: 4, health: 10, stamina: 4, defense: "{GREY}", might: 3, knowledge: 2, willpower: 1, awareness: 5, ability: "You may always roll your attack dice before your target rolls its defense dice. Each time after tolling your attack dice, you may choose to instead attack a different valid target. This new attack uses the same attack roll.", feat: "Use after rolling your attack dice to choose a second valid target for your attack. Both targets are affected by the attack and roll defense dice separately.", game_id: 4)
Hero.find_or_create_by_name(name: "Tobin Farslayer", archetype: "Scout", speed: 4, health: 12, stamina: 3, defense: "{GREY}", might: 3, knowledge: 2, willpower: 2, awareness: 4, ability: "Each of your attacks that targets a monster that is at least 3 spaces away from you gains: {SURGE}: +2 {HEALTH}.", feat: "Use after attacking a monster that is at least 5 spaces away from you (after attack dice are rolled) to deal +3 {HEALTH} to that monster.")
Hero.find_or_create_by_name(name: "Vyrah the Falconer", archetype: "Scout", speed: 4, health: 10, stamina: 4, defense: "{GREY}", might: 3, knowledge: 2, willpower: 2, awareness: 4, ability: "You have the Skye familiar. At the start of your turn, if Skye is not on the map, place him in your space.", feat: "{ACTION}: Place Skye in any space in your line of sight. Skye then attacks an adjacent monter with a blue, red, and yellow die. This attack gains: {SURGE}: Stun", game_id: 3)
Hero.find_or_create_by_name(name: "Corbin", archetype: "Warrior", speed: 3, health: 12, stamina: 5, defense: "{GREY}", might: 5, knowledge: 2, willpower: 2, awareness: 2, ability: "Each time you suffer 2 or more {HEALTH}, you suffer 1 less {HEALTH}.", feat: "Use when attacked, before rolling defense dice. Instead of rolling your defense dice, place them showing any face you choose.", game_id: 5)
Hero.find_or_create_by_name(name: "Eliam", archetype: "Warrior", speed: 5, health: 12, stamina: 5, defense: "{BROWN}", might: 3, knowledge: 2, willpower: 3, awareness: 3, ability: "While you have 2 Melee weapons equipped, each time you attack an adjacent monster and do not roll an X, deal 1 {HEALTH} to 1 other monster adjacent to you.", feat: "Use at the end of your turn. Until the start of your next turn, each time you are attacked by an adjacent monster, you may suffer 1 {FATIGUE} to attack that monster before it rolls its attack dice.", game_id: 5)
Hero.find_or_create_by_name(name: "Hugo the Glorious", archetype: "Warrior", speed: 3, health: 12, stamina: 3, defense: "{GREY}", might: 4, knowledge: 1, willpower: 4, awareness: 2, ability: "If you do not move this round, you may reroll 1 of your defense dice each time you are attacked.", feat: "Use at the start of your turn. Double the {HEALTH} on your attack roll for each attack you perform this turn.", game_id: 8)
Hero.find_or_create_by_name(name: "Karnon", archetype: "Warrior", speed: 4, health: 14, stamina: 3, defense: "{GREY}", might: 6, knowledge: 1, willpower: 2, awareness: 2, ability: "Each time a monster attacks you, after rolling dice, you may suffer 1 {FATIGUE} to cancel 1 {SURGE} rolled on the attack.", feat: "{ACTION}: Choose a minion monster adjacent to you and roll the blue attack die. If you roll an X, you miss. Otherwise, that monster is defeated. Regardless of the outcome, you suffer 1 {FATIGUE}.", game_id: 6)
Hero.find_or_create_by_name(name: "Krutzbeck", archetype: "Warrior", speed: 3, health: 12, stamina: 3, defense: "{GREY}", might: 4, knowledge: 2, willpower: 3, awareness: 2, ability: "While you have at least 6 {HEALTH}, each of your attacks gains +2 {HEALTH}.", feat: "Use when attacking, after dice are rolled. Roll 1 red power die, suffer {HEALTH} equal to the {HEALTH} rolled, and add the same amount of {HEALTH} to your attack roll.", game_id: 8)
Hero.find_or_create_by_name(name: "Laughin Buldar", archetype: "Warrior", speed: 3, health: 14, stamina: 3, defense: "{GREY}", might: 4, knowledge: 2, willpower: 2, awareness: 3, ability: "You may treat 1 of your equipped Melee weapons as if it only had 1 hand icon (even if it has 2 hand icons).", feat: "Use as your entire activation to perform 3 attack actions. If you do, you cannot move this turn, even by suffering {FATIGUE}.", game_id: 6)
Hero.find_or_create_by_name(name: "Lord Hawthorne", archetype: "Warrior", speed: 4, health: 12, stamina: 3, defense: "{GREY}", might: 4, knowledge: 3, willpower: 2, awareness: 2, ability: "When attacking with a Melee weapon, each of your attacks gains Reach.", feat: "{ACTION}: Perform an attack, then you may move up to 2 spaces and perform another attack against a different target.", game_id: 4)
Hero.find_or_create_by_name(name: "Mordog", archetype: "Warrior", speed: 3, health: 14, stamina: 3, defense: "{GREY}", might: 5, knowledge: 1, willpower: 3, awareness: 2, ability: "Wach time you suffer an amount of {HEALTH}, yo may recover 1 {FATIGUE}.", feat: "{ACTION}: Perform an attack. If your attack does not defeat your targetm you may make a second attack against that target.", game_id: 3)
Hero.find_or_create_by_name(name: "Nanok of the Blade", archetype: "Warrior", speed: 4, health: 12, stamina: 4, defense: "{BLACK}", might: 4, knowledge: 2, willpower: 2, awareness: 3, ability: "If you do not have any armor equipped, each of your attacks gains 1 {SURGE}.", feat: "Use when you are attacked, after the dice are rolled. You are not affected by this attack.", game_id: 4)
Hero.find_or_create_by_name(name: "Nara the Fang", archetype: "Warrior", speed: 5, health: 10, stamina: 4, defense: "{GREY}", might: 4, knowledge: 1, willpower: 2, awareness: 4, ability: "Each time you attack a monster that was at least 3 spaces away from you at the start of your turn, your attack gains +1 {HEALTH}.", feat: "{ACTION}: Choose a monster in your line of sight and at least 3 spaces away from you. Move to an empty space adjacent to that monster and perform an attack against that monster. This attack gains +2 {HEALTH}.", game_id: 7)
Hero.find_or_create_by_name(name: "One Fist", archetype: "Warrior", speed: 4, health: 10, stamina: 4, defense: "{GREY}", might: 3, knowledge: 2, willpower: 3, awareness: 3, ability: "You can only equip 1 hand icon worth of equipment. On each of your turns, you may perform 1 free Melee attack using 1 blue attack die and 1 yellow power die (this does not require an action).", feat: "Use when you are defeated to perform an attack action. After that attack is resolved, you are knocked out.", game_id: 3)
Hero.find_or_create_by_name(name: "Sir Valadir", archetype: "Warrior", speed: 4, health: 12, stamina: 3, defense: "{GREY}", might: 3, knowledge: 3, willpower: 4, awareness: 1, ability: "Once per turn, after dice are rolled, you may suffer 1 {FATIGUE} to add 1 {SURGE} to your attack roll.", feat: "{ACTION}: Suffer any amount of {HEALTH}. An adjacent hero recovers the same amount of {HEALTH}.", game_id: 3)
Hero.find_or_create_by_name(name: "Steelhorns", archetype: "Warrior", speed: 4, health: 14, stamina: 3, defense: "{GREY}", might: 5, knowledge: 1, willpower: 3, awareness: 2, ability: "If you perform 2 move actions on your turn, you may suffer 1 {FATIGUE} to attack at the end of your turn.", feat: "{ACTION}: Move your Speed. During this movement, you may enter space occupied by monster figures and move those figures into an adjacent empty space (or closest empty space) of your choice.", game_id: 3)
Hero.find_or_create_by_name(name: "Tahlia", archetype: "Warrior", speed: 3, health: 14, stamina: 3, defense: "{GREY}", might: 3, knowledge: 2, willpower: 3, awareness: 3, ability: "Each time you defeat a monster, you receive 2 movement points.", feat: "Use before a monster activates, or when a monster moves into a space adjacent to you. You may immediately perform an attack against that monster. After the attack is resolved, the monster's turn then resumes.", game_id: 5)
Hero.find_or_create_by_name(name: "Trenloe the Strong", archetype: "Warrior", speed: 3, health: 12, stamina: 3, defense: "{GREY}", might: 4, knowledge: 1, willpower: 4, awareness: 2, ability: "Each time you attack, you may reroll 1 power die. Limit once per attack.", feat: "Use when you perform an attack action. Before dice are rolled, choose and remove 1 defense dice from the defense pool of your target.", game_id: 3)
Hero.find_or_create_by_name(name: "Varkas the Dead", archetype: "Warrior", speed: 3, health: 12, stamina: 3, defense: "{GREY}", might: 4, knowledge: 2, willpower: 3, awareness: 2, ability: "At the start of your turn, recover 1 {FATIGUE}.", feat: "Use at the start of your turn if you are knocked out. Recover all {HEALTH} and {FATIGUE}. You may still perform 2 actions this turn.", game_id: 3)
Hero.find_or_create_by_name(name: "Ronan of the Wild", archetype: "Scout", speed: 4, health: 10, stamina: 5, defense: "{GREY}", might: 3, knowledge: 1, willpower: 4, awareness: 3, ability: "You have the Pico familiar. At the beginning of each encounter, place the Pico familiar token on your Hero sheet. Any hero may give Pico to an adjacent hero following the normal rules for trading items.", feat: "{ACTION}: Move up to 10 space. You must end this movement in a space adjacent to the hero that currently has Pico on his Hero sheet.", game_id: 3)
Hero.find_or_create_by_name(name: "Jain Fairwood", archetype: "Scout", speed: 5, health: 8, stamina: 5, defense: "{GREY}", might: 2, knowledge: 3, willpower: 2, awareness: 4, ability: "When you suffer any amount of {HEALTH} from an attack, you may choose to suffer some or all of that amount as {FATIGUE} instead; you cannot suffer {FATIGUE} in excess of your Stamina.", feat: "{ACTION}: You may move double your Speed and perform an attack. This attack may be performed before, after, or during this movement.", game_id: 1)
Hero.find_or_create_by_name(name: "Tomble Burrowell", archetype: "Scout", speed: 4, health: 8, stamina: 5, defense: "{GREY}", might: 1, knowledge: 2, willpower: 3, awareness: 3, ability: "If you are attacked while adjacent to at least one other hero, you may choose an adjacent hero and add the defense pool of that hero to your own.", feat: "{ACTION}: Remove your figure from the map and place a hero token in your space. At the start of your next turn, place your figure in any empty space within 4 spaces of your hero token.", game_id: 1)
Hero.find_or_create_by_name(name: "Ashrian", archetype: "Healer", speed: 5, health: 10, stamina: 4, defense: "{GREY}", might: 2, knowledge: 2, willpower: 3, awareness: 4, ability: "When a minion monster begins its activation adjacent to you, it is Stunned.", feat: "{ACTION}: Choose a monster within 3 spaces of you. Each monster in that group is Stunned.", game_id: 1)
Hero.find_or_create_by_name(name: "Avric Albright", archetype: "Healer", speed: 4, health: 12, stamina: 4, defense: "{GREY}", might: 2, knowledge: 3, willpower: 4, awareness: 2, ability: "Each hero within 3 spaces of you (including yourself) gains: '{SURGE}: Recover 1 {HEALTH}' on all attack rolls.", feat: "{ACTION}: Roll 2 red power dice. Each hero within 3 spaces of you (including yourself) may recover {HEALTH} equal to the amount of {HEALTH} rolled.", game_id: 1)
Hero.find_or_create_by_name(name: "High Mage Quellen", archetype: "Mage", speed: 4, health: 10, stamina: 4, defense: "{GREY}", might: 1, knowledge: 5, willpower: 3, awareness: 2, ability: "At the start of your turn, you may choose another hero within 3 spaces of you. If the chosen hero has at least 1 fatigue token on his Hero sheet, you recover 1 {FATIGUE}. If he has fatigue tokens equal to his Stamina, you recover 2 {FATIGUE}.", feat: "Use at the start of your turn to increase your Stamina by 4 for the remainder of this turn. At the end of your turn, recover all of your {FATIGUE}.", game_id: 2)
Hero.find_or_create_by_name(name: "Widow Tarha", archetype: "Mage", speed: 4, health: 10, stamina: 4, defense: "{GREY}", might: 2, knowledge: 4, willpower: 3, awareness: 2, ability: "Once per round, after you roll dice for an attack, you may reroll 1 attack or power die. You must keep the new result.", feat: "{ACTION}: Perform an attack. This attack affects 2 different monsters in your line of sight. 1 attack roll is made but each monster rolls defense dice separately. Both monsters are considered targets of the attack.", game_id: 1)
Hero.find_or_create_by_name(name: "Jaes the Exhile", archetype: "Mage", speed: 4, health: 12, stamina: 3, defense: "{GREY}", might: 3, knowledge: 4, willpower: 2, awareness: 2, ability: "You may always equip Runes, regardless of the limitations of your armor. you gain +1 Stamina for each Rune you have equipped.", feat: "{ACTION}: Perform an attack with a Magic weapon. This attack gains Pierce 3.", game_id: 3)
Hero.find_or_create_by_name(name: "Leoric of the Book", archetype: "Mage", speed: 4, health: 8, stamina: 5, defense: "{GREY}", might: 1, knowledge: 5, willpower: 2, awareness: 3, ability: "Each monster within 3 spaces of you receives -1 {HEALTH} on all attack rolls (to a minimum of 1).", feat: "{ACTION}: Perform an attack with a Magic weapon. This attack ignores range and targets each figure adjacent to you. 1 attack roll is made but each figure rolls defense dice separately.", game_id: 1)
Hero.find_or_create_by_name(name: "Syndrael", archetype: "Warrior", speed: 4, health: 12, stamina: 4, defense: "{GREY}", might: 4, knowledge: 3, willpower: 2, awareness: 2, ability: "If you have not moved during this turn, you recover 2 {FATIGUE} at the end of your turn.", feat: "Use during your turn to choose a hero within 3 spaces of you. You and that hero may each immediately perform a move action. This is in addition to the 2 actions each hero receives on his turn.", game_id: 1)
Hero.find_or_create_by_name(name: "Reynhart the Worthy", archetype: "Warrior", speed: 4, health: 12, stamina: 4, defense: "{GREY}", might: 3, knowledge: 1, willpower: 4, awareness: 3, ability: "If you roll an X during an attack roll, you may suffer 1 {FATIGUE} to reroll 1 attack die. Limit once per attack.", feat: "Use after rolling an X during your attack roll to recover all of your {FATIGUE} and to reroll an or all of the dice in your attack pool.", game_id: 2)
Hero.find_or_create_by_name(name: "Grisban the Thirsty", archetype: "Warrior", speed: 3, health: 14, stamina: 4, defense: "{GREY}", might: 5, knowledge: 2, willpower: 3, awareness: 1, ability: "Each time you recover fatigue from performing a rest action, you may also immediately discard 1 Condition card from yourself.", feat: "Use during your turn to perform 1 attack action. This is in addition to your 2 actions on your turn.", game_id: 1)