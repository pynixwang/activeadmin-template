
gem "dotenv-rails", groups: [:development, :test]
gem "activeadmin"
gem "devise"
gem "arctic_admin"
gem "aasm"

after_bundle do
  generate "active_admin:install"
  remove_file "app/assets/stylesheets/application.css"

  copy_file "app/assets/stylesheets/application.scss"
  copy_file "app/assets/javascripts/application.js", force: true
  copy_file "app/assets/stylesheets/active_admin.scss", force: true
  copy_file "app/assets/javascripts/active_admin.js.coffee", force: true
  template "config/database.yml.tt", force: true
  rails_command "db:create"
  rails_command "db:migrate"
  rails_command "db:seed"
end


def source_paths
  [__dir__]
end 
