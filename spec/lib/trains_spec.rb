require "trains"

describe "Trains" do
  context "need stations" do
    before(:each) do
      @flatland = Trains::Network.new
    end

    # Test the construction of a train network
    it "should add an edge" do
      @flatland.add_edge "A", "B", 1

      @flatland.edges["A"]["B"].should eq(1)
    end

    it "should properly measure nonsense edge as 0" do
      @flatland.measure(["A"]).should eq(0)
    end

    it "should properly measure an edge" do
      @flatland.add_edge "A", "B", 1

      @flatland.measure(["A", "B"]).should eq(1)
    end

    it "should properly measure multiple edges" do
     @flatland.add_edge "A", "B", 1
     @flatland.add_edge "B", "C", 1

     @flatland.measure(["A", "B", "C"]).should eq(2)
    end

    it "should behave as a monad and return false on no route" do
     @flatland.add_edge "A", "B", 1
     @flatland.add_edge "B", "C", 1

     @flatland.measure(["A", "B", "C", "D"]).should eq(false)
    end
  end

  context "in Kiwiland" do
    # Test the train system of Kiwiland
    # (which is a large land-mass a few hundred km east of New Zealand )
    before(:all) do
      @kiwiland = Trains::Network.new
    end

    it "should measure the distance of the route A-B-C" do
      pending
    end

    it "should measure the distance of the route A-D" do
      pending
    end

    it "should measure the distance of the route A-D-C" do
      pending
    end

    it "should measure the distance of the route A-E-B-C-D" do
      pending
    end

    it "should measure the distance of the route A-E-D" do
      pending
    end

    it "should measure the number of trips starting at C and ending at C with a maximum of 3 stops.  In the sample data below, there are two such trips: C-D-C (2 stops). and C-E-B-C (3 stops)" do
      pending
    end

    it "should measure the number of trips starting at A and ending at C with exactly 4 stops.  In the sample data below, there are three such trips: A to C (via B,C,D); A to C (via D,C,D); and A to C (via D,E,B)" do
      pending
    end

    it "should measure the length of the shortest route (in terms of distance to travel) from A to C" do
      pending
    end

    it "should measure the length of the shortest route (in terms of distance to travel) from B to B" do
      pending
    end


    it "should measure the number of different routes from C to C with a distance of less than 30.  In the sample data, the trips are: CDC, CEBC, CEBCDC, CDCEBC, CDEBC, CEBCEBC, CEBCEBCEBC" do
      pending
    end

  end
end
