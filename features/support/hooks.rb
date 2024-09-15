# features/support/hooks.rb

Before do
  @login_page = LoginPage.new
  @home_page = HomePage.new
  @utilities = Utilities.new
end