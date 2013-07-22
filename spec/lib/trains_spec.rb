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

      @flatland.measure("AB".split("")).should eq(1)
    end

    it "should properly measure multiple edges" do
      @flatland.add_edge "A", "B", 1
      @flatland.add_edge "B", "C", 1

      @flatland.measure("ABC".split("")).should eq(2)
    end

    it "should behave as a monad and return false on no route" do
      @flatland.add_edge "A", "B", 1
      @flatland.add_edge "B", "C", 1

      @flatland.measure("ABCD".split("")).should eq(false)
    end

    it "should find a single 3 stop cycle " do
      @flatland.add_edge "A", "B", 1
      @flatland.add_edge "B", "C", 1
      @flatland.add_edge "C", "A", 1

      @flatland.max_stop_trip("A", "A", 3).should eq(["ABCA".split("")])
    end

    it "should find a the shortest route between two points" do
      pending
      @flatland.add_edge "A", "B", 1
      @flatland.add_edge "B", "C", 1
      @flatland.add_edge "C", "A", 1

      @flatland.shortest_route("A", "A").should eq(["ABCA".split("")])
    end

    it "should find a the shortest route between two in a more complex maze" do
      pending
      @flatland.add_edge "A", "B", 1
      @flatland.add_edge "A", "C", 2
      @flatland.add_edge "B", "C", 2
      @flatland.add_edge "B", "D", 2
      @flatland.add_edge "C", "A", 1
      @flatland.add_edge "C", "B", 2

      @flatland.shortest_route("A", "A").should eq(["ABCA".split("")])
    end

    it "should find all paths less than a certain cost" do
      @flatland.add_edge "A", "B", 1
      @flatland.add_edge "A", "C", 2
      @flatland.add_edge "B", "C", 2
      @flatland.add_edge "B", "D", 2
      @flatland.add_edge "C", "A", 1
      @flatland.add_edge "C", "B", 2

      @flatland.find_route_with_max_cost("A", "C", 5)
    end
  end

  context "in Kiwiland" do
    # Test the train system of Kiwiland
    # (which is a large land-mass a few hundred km east of New Zealand )
    before(:all) do
      @kiwiland = Trains::Network.new

      @kiwiland.add_edge "A", "B", 5
      @kiwiland.add_edge "B", "C", 4
      @kiwiland.add_edge "C", "D", 8
      @kiwiland.add_edge "D", "C", 8
      @kiwiland.add_edge "D", "E", 6
      @kiwiland.add_edge "A", "D", 5
      @kiwiland.add_edge "C", "E", 2
      @kiwiland.add_edge "E", "B", 3
      @kiwiland.add_edge "A", "E", 7
    end

    it "should measure the distance of the route A-B-C" do
      @kiwiland.measure("ABC".split("")).should eq(9)
    end

    it "should measure the distance of the route A-D" do
      @kiwiland.measure("AD".split("")).should eq(5)
    end

    it "should measure the distance of the route A-D-C" do
      @kiwiland.measure("ADC".split("")).should eq(13)
    end

    it "should measure the distance of the route A-E-B-C-D" do
      @kiwiland.measure("AEBCD".split("")).should eq(22)
    end

    it "should measure the distance of the route A-E-D" do
      @kiwiland.measure("AED".split("")).should eq(false)
    end

    it "should measure the number of trips starting at C and ending at C with a maximum of 3 stops. " do
      # In the sample data below, there are two such trips: C-D-C (2 stops). and C-E-B-C (3 stops)

      @kiwiland.max_stop_trip("C", "C", 3)
        .should eq(["CDC".split(""),
                    "CEBC".split("")])

    end

    it "should measure the number of trips starting at A and ending at C with exactly 4 stops. " do
      @kiwiland.max_stop_trip_exact("A", "C", 4)
        .should eq(["ABCDC".split(""),
                    "ADCDC".split(""),
                    "ADEBC".split("")])

    end

    it "should measure the length of the shortest route (in terms of distance to travel) from A to C" do
      pending
    end

    it "should measure the length of the shortest route (in terms of distance to travel) from B to B" do
      pending
    end

    it "should measure the number of different routes from C to C with a distance of less than 30." do
      #pending
      res = @kiwiland.find_route_with_max_cost("C", "C", 30)
      res.uniq.sort.should eq([
          "CDC".split(""),
          "CEBC".split(""),
          "CEBCDC".split(""),
          "CDCEBC".split(""),
          "CDEBC".split(""),
          "CEBCEBC".split(""),
          "CEBCEBCEBC".split("")
        ].uniq.sort)

    end


  end
end
