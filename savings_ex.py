

def get_amount_in_period(savings, rate = 0.05, periods = 1 ):
    return savings * ((1 + rate) ** periods)

savings_str = input("Please enter your savings, integer number:\n") 
rate_str = input("Please enter the saving rate percentage without % sign (0 to 100), integer number:\n")
period_str = input("Please enter the peridos number, integer number:\n")

try:
    savings = int(savings_str)
    rate = int(rate_str)/100
    periods = int(period_str)
    amount = get_amount_in_period(savings, rate = rate, periods = periods)
    print(f'Your {savings} savings today  in {periods} year with a rate of {rate_str} % periods is: {amount}')
except Exception as e:
    print(e)
