require "spec_helper"

feature "User views reports", %(
  As a user I want to be able to view reports.
  ) do

    scenario "user visits root path, I can see a link" do
      visit '/'

      expect(page).to have_link('Reports', href: '/reports')
    end

    scenario "user visits /reports, I can see a Sales Summary report" do
      visit '/reports'

      expect(page).to have_content("Sales Summary")
    end

    scenario "user visits /reports, I can see a Assets Under Management Summary report" do
      visit '/reports'

      expect(page).to have_content("Assets Under Management Summary")
    end

    scenario "user visits /reports, I can see Break Reports" do
      visit '/reports'

      expect(page).to have_content("Break Reports")
    end

    scenario "user visits /reports, I can see Investor Profit reports" do
      visit '/reports'

      expect(page).to have_content("Investor Profit")
    end
  end
