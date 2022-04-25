require_relative '../../Driver/browser'
require_relative '../../Utils/config_manager'
require_relative '../../Forms/main_page'

Browser.open_url ConfigManager.get_from_config("main_page_url")
Browser.max_page