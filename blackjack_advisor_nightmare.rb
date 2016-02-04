def get_user_cards(state)
  puts "Enter your first card (use J, Q, K or A if you wish): " if state == "first"
  puts "Enter your second card (use J, Q, K or A if you wish): " if state == "second"
  puts "What card did you get? " if state == "hit_me"

  input = gets.chomp
  return convert_input(input)
end

def get_dealer_card
  puts "Enter the dealer's card (use J, Q, K or A if you wish): "

  input = gets.chomp
  return convert_input(input)
end

def convert_input(input)
  input = 11 if input == "A"
  input = 10 if (input == "J" || input == "Q" || input == "K")
  return input.to_i
end

def get_options
  options = { 1 => {
                    "hard" => { 5 => {2..11 => "H"},
                                6 => {2..11 => "H"},
                                7 => {2..11 => "H"},
                                8 => {2..4 => "H", 5..6 => "Dh", 7..11 => "H"},
                                9 => {2..6 => "Dh", 7..11 => "H"},
                                10 => {2..9 => "Dh", 10..11 => "H"},
                                11 => {2..11 => "Dh"},
                                12 => {2..3 => "H", 4..6 => "S", 7..11 => "H"},
                                13 => {2..6 => "S", 7..11 => "H"},
                                14 => {2..6 => "S", 7..11 => "H"},
                                15 => {2..6 => "S", 7..11 => "H"},
                                16 => {2..6 => "S", 7..11 => "H"},
                                17 => {2..11 => "S"},
                                18 => {2..11 => "S"},
                                19 => {2..11 => "S"},
                                20 => {2..11 => "S"},
                                21 => {2..11 => "S"}},
                    "soft" => { 13 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
                                14 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
                                15 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
                                16 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
                                17 => {2..6 => "Dh", 7..11 => "H"},
                                18 => {2 => "S", 3..6 => "Ds", 7..8 => "S", 9..10 => "H", 11 => "S"},
                                19 => {2..5 => "S", 6 => "H", 7..11 => "S"},
                                20 => {2..11 => "S"},
                                21 => {2..11 => "S"}},
                    "pairs" => {2 => {2..7 => "P", 8..11 => "H"},
                                3 => {2..8 => "P", 9..11 => "H"},
                                4 => {2..3 => "H", 4..6 => "P", 7..11 => "H"},
                                5 => {2..9 => "Dh", 10..11 => "H"},
                                6 => {2..7 => "P", 8..11 => "H"},
                                7 => {2..8 => "P", 9 => "H", 10 => "S", 11 => "H"},
                                8 => {2..11 => "P"},
                                9 => {2..6 => "P", 7 => "S", 8..9 => "P", 10..11 => "S"},
                                10 => {2..11 => "S"},
                                11 => {2..11 => "P"}
                           }
                  },
              2 => {
                    "hard" => { 5 => {2..11 => "H"},
                                6 => {2..11 => "H"},
                                7 => {2..11 => "H"},
                                8 => {2..11 => "H"},
                                9 => {2..6 => "Dh", 7..11 => "H"},
                                10 => {2..9 => "Dh", 10..11 => "H"},
                                11 => {2..11 => "Dh"},
                                12 => {2..3 => "H", 4..6 => "S", 7..11 => "H"},
                                13 => {2..6 => "S", 7..11 => "H"},
                                14 => {2..6 => "S", 7..11 => "H"},
                                15 => {2..6 => "S", 7..11 => "H"},
                                16 => {2..6 => "S", 7..11 => "H"},
                                17 => {2..11 => "S"},
                                18 => {2..11 => "S"},
                                19 => {2..11 => "S"},
                                20 => {2..11 => "S"},
                                21 => {2..11 => "S"}},
                    "soft" => { 13 => {2..4 => "H", 5..6 => "Dh", 7..11 => "H"},
                                14 => {2..4 => "H", 5..6 => "Dh", 7..11 => "H"},
                                15 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
                                16 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
                                17 => {2 => "H", 3..6 => "Dh", 7..11 => "H"},
                                18 => {2 => "S", 3..6 => "Ds", 7..8 => "S", 9..11 => "H"},
                                19 => {2..11 => "S"},
                                20 => {2..11 => "S"},
                                21 => {2..11 => "S"}},
                    "pairs" => {2 => {2..7 => "P", 8..11 => "H"},
                                3 => {2..7 => "P", 8..11 => "H"},
                                4 => {2..4 => "H", 5..6 => "P", 7..11 => "H"},
                                5 => {2..9 => "Dh", 10..11 => "H"},
                                6 => {2..7 => "P", 8..11 => "H"},
                                7 => {2..8 => "P", 9..11 => "H"},
                                8 => {2..11 => "P"},
                                9 => {2..6 => "P", 7 => "S", 8..9 => "P", 10..11 => "S"},
                                10 => {2..11 => "S"},
                                11 => {2..11 => "P"}
                           }

                  },
              4 => {
                "hard" => { 5 => {2..11 => "H"},
                            6 => {2..11 => "H"},
                            7 => {2..11 => "H"},
                            8 => {2..11 => "H"},
                            9 => {2 => "H", 3..6 => "Dh", 7..11 => "H"},
                            10 => {2..9 => "Dh", 10..11 => "H"},
                            11 => {2..10 => "Dh", 11 => "H"},
                            12 => {2..3 => "H", 4..6 => "S", 7..11 => "H"},
                            13 => {2..6 => "S", 7..11 => "H"},
                            14 => {2..6 => "S", 7..11 => "H"},
                            15 => {2..6 => "S", 7..11 => "H"},
                            16 => {2..6 => "S", 7..11 => "H"},
                            17 => {2..11 => "S"},
                            18 => {2..11 => "S"},
                            19 => {2..11 => "S"},
                            20 => {2..11 => "S"},
                            21 => {2..11 => "S"}},
                "soft" => { 13 => {2..4 => "H", 5..6 => "Dh", 7..11 => "H"},
                            14 => {2..4 => "H", 5..6 => "Dh", 7..11 => "H"},
                            15 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
                            16 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
                            17 => {2 => "H", 3..6 => "Dh", 7..11 => "H"},
                            18 => {2 => "S", 3..6 => "Ds", 7..8 => "S", 9..11 => "H"},
                            19 => {2..11 => "S"},
                            20 => {2..11 => "S"},
                            21 => {2..11 => "S"}},
                "pairs" => {2 => {2..7 => "P", 8..11 => "H"},
                            3 => {2..7 => "P", 8..11 => "H"},
                            4 => {2..4 => "H", 5..6 => "P", 7..11 => "H"},
                            5 => {2..9 => "Dh", 10..11 => "H"},
                            6 => {2..6 => "P", 7..11 => "H"},
                            7 => {2..7 => "P", 8..11 => "H"},
                            8 => {2..11 => "P"},
                            9 => {2..6 => "P", 7 => "S", 8..9 => "P", 10..11 => "S"},
                            10 => {2..11 => "S"},
                            11 => {2..11 => "P"}
                       }
                  }
            }

  return options
end

def play(user_cards, dealer, decks)

  user_total = 0
  user_cards.each { |x| user_total += x }
  user_pair = 0

  options = get_options

  if user_total >= 21
    return "Bust!"
  elsif has_pair(user_cards) > 0 && user_cards.length == 2
    return get_optimal(has_pair(user_cards), dealer, options[decks]["pairs"])
  elsif user_cards.include?(11)
    return get_optimal(user_total, dealer, options[decks]["soft"])
  else
    return get_optimal(user_total, dealer, options[decks]["hard"])
  end
end

def get_optimal(user, dealer, lookup_hash)
  return (lookup_hash[user].select{|x| x === dealer}.values)[0]
end

def has_pair(user_cards)
  user_pair = 0
  if (user_cards.uniq).length < user_cards.length
    user_cards.each do |x|
      user_pair = x if user_cards.count(x) > 1
    end
    return user_pair
  else
    return user_pair
  end
end

def game

  advice = {"H" => "hit",
            "S" => "stand",
            "P" => "split",
            "Dh" => "double if possible, otherwise hit",
            "Ds" => "double if possible, otherwise stand"}

  puts "How many decks would you like to play with? 1, 2 or 4?"
  decks = gets.chomp.to_i

  user_cards = []
  user_cards << get_user_cards("first")
  user_cards << get_user_cards("second")
  dealer = get_dealer_card

  optimal = play(user_cards, dealer, decks)

  loop do
    if optimal == "H"
      puts "Your optimal move is to #{advice[optimal]}"
      user_cards << get_user_cards("hit_me")
      optimal = play(user_cards, dealer, decks)
    elsif optimal == "Bust!"
      puts "Bust!"
      break
    else
      puts "Your optimal move is to #{advice[optimal]}"
      break
    end
  end

end

game
