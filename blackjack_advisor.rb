
def get_user_cards(number)
  puts "Enter your first card (use J, Q, K or A if you wish): " if number == 1
  puts "Enter your second card (use J, Q, K or A if you wish): " if number == 2

  input = gets.chomp
  convert_input(input)
end

def get_dealer_card
  puts "Enter the dealer's card (use J, Q, K or A if you wish): "

  input = gets.chomp
  convert_input(input)
end

def convert_input(input)
  input = 11 if input == "A"
  input = 10 if (input == "J" || input == "Q" || input == "K")
  input.to_i
end

def play_one_deck
  advice = {"H" => "hit",
            "S" => "stand",
            "P" => "split",
            "Dh" => "double if possible, otherwise hit",
            "Ds" => "double if possible, otherwise stand"}

  options = {
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
  }

  user_first = get_user_cards(1)
  user_second = get_user_cards(2)
  dealer = get_dealer_card

  if user_first == user_second
    options["pairs"][user_first].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
  elsif user_first == 11 || user_second == 11
    user_total = user_first + user_second
    options["soft"][user_total].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
  else
    user_total = user_first + user_second
    options["hard"][user_total].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
  end
end

def play_two_decks
  advice = {"H" => "hit",
            "S" => "stand",
            "P" => "split",
            "Dh" => "double if possible, otherwise hit",
            "Ds" => "double if possible, otherwise stand"}

  options = {
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
  }

  user_first = get_user_cards(1)
  user_second = get_user_cards(2)
  dealer = get_dealer_card

  if user_first == user_second
    options["pairs"][user_first].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
  elsif user_first == 11 || user_second == 11
    user_total = user_first + user_second
    options["soft"][user_total].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
  else
    user_total = user_first + user_second
    options["hard"][user_total].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
  end
end

def play_four_decks
  advice = {"H" => "hit",
            "S" => "stand",
            "P" => "split",
            "Dh" => "double if possible, otherwise hit",
            "Ds" => "double if possible, otherwise stand"}

  options = {
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

  user_first = get_user_cards(1)
  user_second = get_user_cards(2)
  dealer = get_dealer_card

  if user_first == user_second
    options["pairs"][user_first].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
  elsif user_first == 11 || user_second == 11
    user_total = user_first + user_second
    options["soft"][user_total].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
  else
    user_total = user_first + user_second
    options["hard"][user_total].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
  end
end

def play_game(decks)
  play_one_deck if decks == 1
  play_two_decks if decks == 2
  play_four_decks if decks >= 4
  puts "Sorry, you can't play with #{decks} decks" if decks == 3
end

puts "How many decks would you like to play blackjack with?"
play_game(gets.chomp.to_i)
