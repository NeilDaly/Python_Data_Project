# Function for Calcualting Salary - Lets provide a Doc String underneath it to Explain what the Function does as well
# Doc String: A multi-line comment inside of the Function itself
def calculate_salary(base_salary, bonus_rate=.1):
    """
    Calculate the Total Salary based on the Base Salary and Bonus Rate

    Args:
        base_salary (float): The base salary.
        bonus_rate (float): The bonus rate. Default is .1

    Returns:
        float: The total salary.
    """
    return base_salary * (1 + bonus_rate)

# Function for Calculating Bonus
    # - All it does is takes a Total Salary and Base Salary and then from there Returns the Bonus Rate by Performaing the Calculation
def calculate_bonus(total_salary, base_salary):
    """
    Calculate the Bonus Rate based on the Total Salary and Base Salary

    Args:
        total_salary (float): The total salary.
        base_salary (float): The base salary.

    Returns:
        float: The bonus rate.
    """
    return (total_salary - base_salary) / base_salary