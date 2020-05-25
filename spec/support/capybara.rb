require "capybara/rspec"
require "selenium/webdriver"

options = Selenium::WebDriver::Chrome::Options.new

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :selenium_chrome_headless do |app|
  options.add_argument("--headless")
  options.add_argument("--disable-gpu")
  options.add_argument("--window-size=1280,800")

  driver = Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)

  driver
end

Capybara.javascript_driver =
  if ENV["HEADLESS"]
    :selenium_chrome
  else
    :selenium_chrome_headless
  end
