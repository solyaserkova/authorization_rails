namespace :custom do
  desc "создание учетной записи"

  task :help_login do
    User.create(email: "admin@admin.dev", password: "qwerty1234")
  end
end
