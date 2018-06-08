require "spec_helper"

feature "User uploads an article", %(
  As a user I want to be able to upload an article so that other people can view them.

  Acceptance Criteria:
  [] When I the root path, I can see a link that takes me to the form to submit an article
  []
) do

  scenario "user visits root path, I can see a link" do
    visit '/'

    expect(page).to have_link('Submit A New Article', href: 'Submit A New Article')
  end

  scenario "user visits articles/new, I can see a form to upload new article" do
    visit '/articles/new'

    expect(page).to have_selector("form")
    end

    scenario "user visits articles/new, I can see a field to enter an article title" do
      visit '/articles/new'

      expect(page).to have_css('input[id="article_title"]')
      expect(page).to have_css('input[type="text"]')
    end

    scenario "user visits articles/new, I can see a field to enter an article URL" do
      visit '/articles/new'

      expect(page).to have_css('input[id="article_url"]')
      expect(page).to have_css('input[type="url"]')
    end

    scenario "user visits articles/new, I can see a field to enter an article description" do
      visit '/articles/new'

      expect(page).to have_css('input[id="article_description"]')
      expect(page).to have_css('input[type="text"]')
      expect(page).to have_css('input[minlength="20"]')
    end

    scenario "user submits a blank form" do
      visit '/articles/new'
      click_button 'submit'

      expect(page).to have_css('input[required]')
    end
    # 
    # scenario "users submits a complete form" do
    #   visit '/articles/new'
    #   fill_in 'Add New Article Title:'
    #
    # end

  end
