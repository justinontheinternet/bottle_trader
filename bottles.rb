@cash = 0
@extra_cash = 0
@full_bottles = 0
@empty_bottles = 0
@bottle_tally = 0
@caps = 0
@empty_exchange_tally = 0
@cap_exchange_tally = 0

def game_the_system
  loop do
    enter_money
    buy_bottles(@cash)
    loop do
      drink_bottles
      trade_for_bottles
      break if @new_bottles == 0
    end
    break if total_bottles
  end
end


def enter_money
  puts "How much money do you have?"
  @cash = gets.chomp.to_i
end

def buy_bottles(money)
  @full_bottles = money / 2
  @bottle_tally = @full_bottles
  @extra_cash = money % 2
end


def drink_bottles
  @empty_bottles += @full_bottles
  @caps += @full_bottles
  @full_bottles = 0
end


def trade_for_bottles
  @cap_exchange_tally += @caps / 4
  @empty_exchange_tally += @empty_bottles / 2
  @new_bottles =  @empty_bottles / 2 + @caps / 4
  @full_bottles = @new_bottles
  @bottle_tally += @new_bottles
  @empty_bottles %= 2
  @caps %= 4
end


def total_bottles
  puts "With $#{@cash} you could get #{@bottle_tally} bottle(s) and still have #{@empty_bottles} bottle(s), #{@caps} cap(s), and $#{@extra_cash} left over.
  That's #{@empty_exchange_tally} from trading bottles and #{@cap_exchange_tally} from trading caps."
  puts "Try again? ('yes' or 'no')"
  choice = gets.chomp
  case choice
  when "yes" then false
  when "no" then true
  end
end


game_the_system