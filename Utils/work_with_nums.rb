require_relative 'config_manager'

class WorkWithNums

  def self.generate_random_nums(from, to)
    Random.rand(from.to_f..to.to_f).round(1).to_s
  end

  def self.correct_monthly_pay(percent)
    percent.to_f
    i = percent.to_f / 100 / 12
    credit_sum = ConfigManager.get_from_test_data("credit_sum").delete(' ').to_f
    n = ConfigManager.get_from_test_data("credit_period").to_f * 12

    res = '%.2f' % (credit_sum * i * (1 + i) ** n / ((1 + i) ** n - 1)).round(2)
    res.gsub(".", ",")
  end

end