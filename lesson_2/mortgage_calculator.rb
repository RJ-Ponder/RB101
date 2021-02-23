def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  /\A\d+(\.(\d+))?\z/.match?(number)
end

def format_numbers(number)
  two_decimal = format('%.2f', number)
  parts = two_decimal.to_s.split('.')
  parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
  parts.join('.')
end # taken from https://stackoverflow.com/questions/1078347/rails-is-there-a-rails-trick-to-adding-commas-to-large-numbers

prompt("Welcome to Mortgage Calculator")

loop do # main loop
  loan_amount = ''
  loop do
    prompt("What is your loan amount?")
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      break
    else
      prompt("Please enter a valid loan amount.")
    end
  end

  interest_rate = ''
  loop do
    prompt("What is your annual percent interest rate? (%)")
    interest_rate = gets.chomp
    if valid_number?(interest_rate)
      break
    else
      prompt("Please enter a valid interest rate")
    end
  end

  monthly_interest_rate = interest_rate.to_f / (100 * 12)

  loan_term = ''
  loop do
    prompt("What is your loan term in months?")
    loan_term = gets.chomp
    if valid_number?(loan_term) && loan_term != '0'
      break
    else
      prompt("Please enter a valid term length in months.")
    end
  end

  if monthly_interest_rate == 0
    monthly_payment = loan_amount.to_f / loan_term.to_f
  else
    monthly_payment = loan_amount.to_f *
                      (monthly_interest_rate /
                      (1 - (1 + monthly_interest_rate)**(-loan_term.to_f)))
  end

  monthly_payment_formatted = format_numbers(monthly_payment)
  loan_amount_formatted = format_numbers(loan_amount)

  prompt("You need to pay $#{monthly_payment_formatted} per month
         to pay off your $#{loan_amount_formatted} loan
         in #{loan_term} months at an APR of #{interest_rate}%.")

  prompt("Would you like to calculate another mortgage? (Y to calculate again)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thanks for using this calculator! Bye!")
# in the future, change the months ask to years; convert to months
# Keep that as an integer maybe.
