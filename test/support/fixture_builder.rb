require "fixture_builder"

FixtureBuilder.configure do |builder|
  builder.files_to_check << Rails.root.join("test/support/factories.rb")

  builder.factory do
  end
end
