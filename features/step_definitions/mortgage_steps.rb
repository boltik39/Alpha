require_relative '../../Driver/browser'
require_relative '../../Utils/config_manager'
require_relative '../../Forms/main_page'
require_relative '../../Utils/work_with_nums'

main_page = MainPage.new "Main Page"
random_num = nil

When(/^I open browser and go to the link$/) do
end

Then(/^Mortgage calculator page is opened$/) do
  expect(main_page.is_page_open).to eq(true)
end

Then(/^Mortgage calculator label is displayed$/) do
  expect(main_page.is_mortgage_calc_displayed).to eq(true)
end

Then(/^By property value link is displayed$/) do
  expect(main_page.is_by_property_val_displayed).to eq(true)
end

Then(/^By credit sum link is displayed$/) do
  expect(main_page.is_by_credit_sum_displayed).to eq(true)
end

Then(/^Property value label is displayed$/) do
  expect(main_page.is_property_val_displayed).to eq(true)
end

Then(/^Initial payment label is displayed$/) do
  expect(main_page.is_initial_payment_displayed).to eq(true)
end

Then(/^Credit sum label is displayed$/) do
  expect(main_page.is_credit_sum_displayed).to eq(true)
end

Then(/^Credit period label is displayed$/) do
  expect(main_page.is_credit_period_displayed).to eq(true)
end

Then(/^Interest rate label is displayed$/) do
  expect(main_page.is_interest_rate_displayed).to eq(true)
end

Then(/^Payment type label is displayed$/) do
  expect(main_page.is_payment_type_displayed).to eq(true)
end

Given(/^I write property value$/) do
  main_page.write_property_value ConfigManager.get_from_test_data('property_value')
end

Given(/^I choose Down payment in percent$/) do
  main_page.choose_percent_item_init_pay
end

Given(/^I write down payment in percent$/) do
  main_page.write_init_payment ConfigManager.get_from_test_data('initial_pay_percent')
end

Then(/^The desired value appeared$/) do
  expect(main_page.get_init_pay_sum).to eq(ConfigManager.get_from_test_data 'initial_pay_sum')
end

Then(/^The sum corresponds to the expected$/) do
  expect(main_page.get_credit_sum).to eq(ConfigManager.get_from_test_data 'credit_sum')
end

Given(/^I write credit period$/) do
  main_page.write_credit_period_years ConfigManager.get_from_test_data('credit_period')
end

Given(/^I generate random interest rate$/) do
  random_num = WorkWithNums.generate_random_nums ConfigManager.get_from_test_data('percent_from'),
                                                 ConfigManager.get_from_test_data('percent_to')
end

Given(/^I write generated interest rate$/) do
  main_page.write_interest_rate random_num
end

Then(/^I check that annuity check box is checked$/) do
  expect(main_page.is_annuity_checked).to eq(true)
end

Then(/^I check that diff check box is unchecked$/) do
  expect(main_page.is_diff_not_checked).to eq(true)
end

Given(/^I click calculate button$/) do
  main_page.calculate
end

Then(/^Canvas is displayed$/) do
  expect(main_page.is_settlements_displayed).to eq(true)
end

Then(/^Calculated monthly pay and monthly pay from the website are equals$/) do
  expect(WorkWithNums.correct_monthly_pay random_num).to eq(main_page.get_monthly_payment.delete(" "))
end