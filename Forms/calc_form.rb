require_relative 'base_form'
require_relative '../Elements/form'
require_relative '../Elements/label'
require_relative '../Elements/text_field'
require_relative '../Elements/pull_down_menu'
require_relative '../Elements/button'
require_relative '../Elements/check_box'

class CalcForm < BaseForm

  UNIQUE_ELEMENT = Form.new "//form[@action='/kalkulyator-ipoteki']", "Same Calc form"
  MORTGAGE_CALC_LABEL = Label.new "//ul[@class='breadcrumb']", "Mortgage calc label"
  BY_PROPERTY_VALUE_LABEL = Label.new "//a[contains(@class, 'calc-toggle') and contains(@class, 'current')]",
                                      "By property value link"
  BY_CREDIT_SUM_LABEL = Label.new "//a[contains(@class, 'calc-toggle') and not(contains(@class, 'current'))]",
                                  "By credit sum link"
  PROPERTY_VALUE_LABEL = Label.new "//input[@name='cost']//ancestor::div[@class='calc-fright']
//preceding-sibling::div[@class='calc-fleft']", "Property value label"
  INITIAL_PAYMENT_LABEL = Label.new "//input[@name='start_sum']//ancestor::div[@class='calc-fright']
//preceding-sibling::div[@class='calc-fleft']", "Initial payment label"
  CREDIT_SUM_LABEL = Label.new "//span[contains(@class, 'credit_sum_value')]//ancestor::div[@class='calc-fright']
//preceding-sibling::div[@class='calc-fleft']", "Credit sum label"
  CREDIT_PERIOD_LABEL = Label.new "//input[@name='period']//ancestor::div[@class='calc-fright']
//preceding-sibling::div[@class='calc-fleft']", "Credit period label"
  INTEREST_RATE_LABEL = Label.new "//input[@name='percent']//ancestor::div[@class='calc-fright']
//preceding-sibling::div[@class='calc-fleft']", "Interest rate label"
  PAYMENT_TYPE_LABEL = Label.new "//input[@name='payment_type']//ancestor::div[@class='calc-fright']
//preceding-sibling::div[@class='calc-fleft']", "Payment type label"
  PROPERTY_VALUE_INPUT = TextField.new "//input[@name='cost']", "Property value input"
  INIT_PAY_PULL_DOWN_MENU = PullDownMenu.new "//select[@name='start_sum_type']",
                                             "Initial payment pull down menu"
  PERCENT_ITEM_BUTTON = Button.new "//select[@name='start_sum_type']/option[@value='2']",
                                   "Percent item in initial payment pull down menu"
  INIT_PAY_INPUT = TextField.new "//input[@name='start_sum']", "Initial payment input"
  SUM_INITIAL_PAY_LABEL = Label.new "//div[contains(@class, 'start_sum_equiv')]", "Sum of init pay"
  SUM_CREDIT_LABEL = Label.new "//span[contains(@class, 'credit_sum_value')]", "Sum of credit"
  CREDIT_PERIOD_INPUT = TextField.new "//input[@name='period']", "Credit period input"
  INTEREST_RATE_INPUT = TextField.new "//input[@name='percent']", "Interest rate input"
  ANNUITY_CHECK_BOX = CheckBox.new "//input[@id='payment-type-1']", "Annuity check box"
  DIFFERENTIATED = CheckBox.new "//input[@id='payment-type-2']", 'Differentiated check box'
  CALCULATE_BUTTON = Button.new "//input[@class='calc-submit']", "Calculate button"

  def initialize(form_name)
    super UNIQUE_ELEMENT, form_name
  end

  def mortgage_calc_is_displayed
    MORTGAGE_CALC_LABEL.is_displayed
  end

  def by_property_val_is_displayed
    BY_PROPERTY_VALUE_LABEL.is_displayed
  end

  def by_credit_sum_is_displayed
    BY_CREDIT_SUM_LABEL.is_displayed
  end

  def property_value_is_displayed
    PROPERTY_VALUE_LABEL.is_displayed
  end

  def initial_payment_is_displayed
    INITIAL_PAYMENT_LABEL.is_displayed
  end

  def credit_sum_is_displayed
    CREDIT_SUM_LABEL.is_displayed
  end

  def credit_period_is_displayed
    CREDIT_PERIOD_LABEL.is_displayed
  end

  def interest_rate_is_displayed
    INTEREST_RATE_LABEL.is_displayed
  end

  def payment_type_is_displayed
    PAYMENT_TYPE_LABEL.is_displayed
  end

  def write_sum_in_property_value(sum)
    PROPERTY_VALUE_INPUT.write_some_text sum
  end

  def open_init_pay_pull_down_menu
    INIT_PAY_PULL_DOWN_MENU.click
  end

  def choose_percent_item_init_pay
    PERCENT_ITEM_BUTTON.wait_and_click
  end

  def write_sum_in_init_pay(sum)
    INIT_PAY_INPUT.write_some_text sum
  end

  def sum_of_init_pay
    SUM_INITIAL_PAY_LABEL.get_text
  end

  def sum_of_credit
    SUM_CREDIT_LABEL.get_text
  end

  def write_years_in_credit_period(years)
    CREDIT_PERIOD_INPUT.write_some_text years
  end

  def write_num_in_interest_rate(num)
    INTEREST_RATE_INPUT.write_some_text num
  end

  def annuity_is_checked
    ANNUITY_CHECK_BOX.is_checked
  end

  def diff_is_not_checked
    !DIFFERENTIATED.is_checked
  end

  def click_calc_button
    CALCULATE_BUTTON.click
  end

end