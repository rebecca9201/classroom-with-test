require "rails_helper"

describe "user sign in and sign out", :type => :feature do
  before :each do
    @user = User.create(:email => "user@example.com", :password => "password")
  end

  it "sign_in the user" do
    new_session_page.sign_in("user@example.com", "password")

    expect(page).to have_content "user@example.com"
  end


  it "user signs out" do

    new_session_page.sign_in("user@example.com", "password")

    navbar.sign_out @user.email

    expect(page).not_to have_text "user@example.com"
  end

  private

  def home_page
    PageObjects::Pages::Home.new
  end

  def navbar
    PageObjects::Application::Navbar.new
  end

  def new_session_page
    home_page.go
    navbar.sign_in
  end
end
