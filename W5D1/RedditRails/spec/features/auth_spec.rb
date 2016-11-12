feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Create a new user!"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', :with => "testing_username"
      fill_in 'password', :with => "biscuits"
      click_on "Create user!"
    end

    scenario "redirects to subs index page after signup" do
      expect(page).to have_content "all the subs!"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "testing_username"
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "testing_username"
      click_on "Create user!"
    end

    scenario "re-renders the signup page if an invalid user is given" do
      expect(page).to have_content "Create a new user!"
    end
  end

end
