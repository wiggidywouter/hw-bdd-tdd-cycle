require 'rails_helper'

describe Movie do
  describe "model" do
    before(:each) do
      @movie1 = Movie.create!(:title => "Movie Title", :rating => "Movie Rating", :director => "Jane Doe")
      @movie2 = Movie.create!(:title => "Movie Title", :rating => "Movie Rating", :director => "Jane Doe")
      @movie3 = Movie.create!(:title => "Movie Title", :rating => "Movie Rating", :director => "Hank Doe")
      @result = Movie.find_movies_with_same_director(@movie1)
    end
    
    it "should contain 3 fake movies" do
      Movie.all.should include @movie1
      Movie.all.should include @movie2
      Movie.all.should include @movie3
    end

    it "should find movies by the same director" do
      @result.should include @movie2
      @result.should_not include @movie1
    end
    
    it "should not find movies by different directors" do
      @result.should_not include @movie3
    end
    
  end
end