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

puts "Enter your first card: "
first = gets.chomp.to_i
user = first

puts "Enter your second card: "
second = gets.chomp.to_i
user += second

puts "Please enter the dealer's card: "
dealer = gets.chomp.to_i

hard[user].select{|x| x === dealer}.each{|range, move| puts "Your optimal move is to #{advice[move]}"}
