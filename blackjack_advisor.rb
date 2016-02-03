def get_user_cards(number)
  puts "Enter your first card: " if number == 1
  puts "Enter your second card: " if number == 2

  input = gets.chomp
  convert_input(input)
end

def get_dealer_card
  puts "Enter the dealer's card: "

  input = gets.chomp
  convert_input(input)
end

def convert_input(input)
  input = 11 if input == "A"
  input = 10 if (input == "J" || input == "Q" || input == "K")
  input.to_i
end

advice = {"H" => "hit",
          "S" => "stand",
          "P" => "split",
          "Dh" => "double if possible, otherwise hit",
          "Ds" => "double if possible, otherwise stand"}

hard = {5 => {2..11 => "H"},
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
        21 => {2..11 => "S"}}

soft = {13 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
        14 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
        15 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
        16 => {2..3 => "H", 4..6 => "Dh", 7..11 => "H"},
        17 => {2..6 => "Dh", 7..11 => "H"},
        18 => {2 => "S", 3..6 => "Ds", 7..8 => "S", 9..10 => "H", 11 => "S"},
        19 => {2..5 => "S", 6 => "H", 7..11 => "S"},
        20 => {2..11 => "S"},
        21 => {2..11 => "S"}}

pairs = {2 => {2..7 => "P", 8..11 => "H"},
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

modes = {"hard" => hard, "soft" => soft, "pairs" => pairs}

user_first = get_user_cards(1)
user_second = get_user_cards(2)
dealer = get_dealer_card

if user_first == user_second
  pairs[user_first].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
elsif user_first == 11 || user_second == 11
  user_total = user_first + user_second
  soft[user_total].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
else
  user_total = user_first + user_second
  hard[user_total].select{|x| x === dealer}.each_value{|move| puts "Your optimal move is to #{advice[move]}"}
end
