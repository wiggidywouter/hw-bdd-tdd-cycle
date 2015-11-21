Given(/^the following movies exist:$/) do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # following adds that movie to the database.
    Movie.create!(movie)
  end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  expect(Movie.find_by_title(arg1).director).to eq(arg2)
end