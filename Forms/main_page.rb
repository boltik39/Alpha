require_relative '../Elements/label'
require_relative 'base_form'
require_relative 'calc_form'
require_relative 'settlement_form'

class MainPage < BaseForm

  UNIQUE_ELEMENT = Label.new "//a[@class='d-lg-none']", "Main Page logo"
  CALCULATOR = CalcForm.new "Calculator"
  SETTLEMENTS = SettlementForm.new "Settlements"

  def initialize(name)
    super UNIQUE_ELEMENT, name
  end

  def is_mortgage_calc_displayed
    CALCULATOR.mortgage_calc_is_displayed
  end

  def is_by_property_val_displayed
    CALCULATOR.by_property_val_is_displayed
  end

  def is_by_credit_sum_displayed
    CALCULATOR.by_credit_sum_is_displayed
  end

  def is_property_val_displayed
    CALCULATOR.property_value_is_displayed
  end

  def is_initial_payment_displayed
    CALCULATOR.initial_payment_is_displayed
  end

  def is_credit_sum_displayed
    CALCULATOR.credit_sum_is_displayed
  end

  def is_credit_period_displayed
    CALCULATOR.credit_period_is_displayed
  end

  def is_interest_rate_displayed
    CALCULATOR.interest_rate_is_displayed
  end

  def is_payment_type_displayed
    CALCULATOR.payment_type_is_displayed
  end

  def write_property_value(sum)
    CALCULATOR.write_sum_in_property_value sum
  end

  def choose_percent_item_init_pay
    CALCULATOR.open_init_pay_pull_down_menu
    CALCULATOR.choose_percent_item_init_pay
  end

  def write_init_payment(sum)
    CALCULATOR.write_sum_in_init_pay sum
  end

  def get_init_pay_sum
    CALCULATOR.sum_of_init_pay
  end

  def get_credit_sum
    CALCULATOR.sum_of_credit
  end

  def write_credit_period_years(years)
    CALCULATOR.write_years_in_credit_period years
  end

  def write_interest_rate(percent)
    CALCULATOR.write_num_in_interest_rate percent
  end

  def is_annuity_checked
    CALCULATOR.annuity_is_checked
  end

  def is_diff_not_checked
    CALCULATOR.diff_is_not_checked
  end

  def is_settlements_displayed
    SETTLEMENTS.wait_for_displayed
  end

  def calculate
    CALCULATOR.click_calc_button
  end

  def get_monthly_payment
    SETTLEMENTS.get_monthly_payment
  end

end