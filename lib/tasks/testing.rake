if Rails.env.development? || Rails.env.test?
  load "minitest/rails/tasks/minitest.rake"

  task default: :minitest
end
