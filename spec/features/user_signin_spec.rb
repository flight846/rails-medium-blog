require "rails_helper"
    
RSpec.feature "User signing in" do
    # Create a user
    background do
        @user = User.create(email: "example@gmail.com", password: "password", password_confirmation: "password")
    end
    
    scenario "successfully" do
        visit new_user_session_path
        fill_in "Email", with: @user.email
        fill_in "Password", with: @user.password
        click_on "Log in"
        
        expect(page).to have_content @user.email
    end
    
    scenario "unsuccessfully" do
        visit new_user_session_path
        fill_in "Email", with: "wrongemail"
        fill_in "Password", with: "wrongpassword"
        click_on "Log in"
        
        expect(page).not_to have_content @user.email
    end
    
end