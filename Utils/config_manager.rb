require 'json'

class ConfigManager

  CONFIG_PATH = "Configs/configs.json"
  TEST_DATA_PATH = "Configs/test_data.json"

  @config_dict = JSON.parse(File.read(CONFIG_PATH))
  @test_data_dict = JSON.parse(File.read(TEST_DATA_PATH))


  @instance = new

  private_class_method :new

  def self.instance
    @instance
  end

  def self.get_from_config(param)
    @config_dict[param]
  end

  def self.get_from_test_data(param)
    @test_data_dict[param]
  end

end