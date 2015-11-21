require 'rails_helper'

describe MoviesController do
  
  describe "method to find movies with same director" do
    
    before(:each) do
      @movie_1 = Movie.create!(:title => "title", :rating => "rating", :director => "director", :release_date => Time.now)
      @movie_2 = Movie.create!(:title => "title", :rating => "rating", :director => "", :release_date => Time.now)
      @fake_results = [double("movie"), double("movie")]
      Movie.stub(:find_movies_with_same_director).and_return(@fake_results)
    end
    
    it "should call the model method that finds movies with same director" do
      Movie.should_receive(:find_movies_with_same_director).with(@movie_1)
      get :same_director, :id => @movie_1.id
    end
    
    describe "When the specified movie has a director, it should" do
      subject { get :same_director, :id => @movie_1.id }

      it "render template 'same_director'" do 
        subject.should render_template("same_director")
      end

    end
    
    describe "When the specified movie has no director, it should" do
      subject { get :same_director, :id => @movie_2.id }
      
      it "redirect to 'index'" do
         subject.should redirect_to(movies_path)
      end
    end
  end
  
end