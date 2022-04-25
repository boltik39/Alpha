require_relative 'base_form'
require_relative '../Elements/label'

class SettlementForm < BaseForm

  UNIQUE_ELEMENT = Label.new "//canvas[@id='credit-total-chart']", "Settlements canvas"
  MONTHLY_PAYMENT_LABEL = Label.new "//div[contains(@class, 'monthlyPayment')]", "Monthly payment label"

  def initialize(form_name)
    super UNIQUE_ELEMENT, form_name
  end

  def get_monthly_payment
    MONTHLY_PAYMENT_LABEL.get_text
  end

end