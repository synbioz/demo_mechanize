namespace :github do
  desc 'Connection to the web site'
  task connection: :environment do
    agent = Mechanize.new
    home_page = agent.get('https://github.com/')

    signin_page = agent.click(home_page.link_with(text: "Sign in"))

    my_page = signin_page.form_with(action: "/session") do |form|
      form["login"]  = "user@example.com"
      form["password"] = "password"
    end.submit
  end

  desc 'Download file'
  task download: :environment do
    agent = Mechanize.new
    home_page = agent.get('https://github.com/synbioz/api_rails_grape_2')

    agent.click(home_page.link_with(href: "/synbioz/api_rails_grape_2/archive/master.zip")).save_as Rails.root.join("demo_mechanize.zip")
  end
end
