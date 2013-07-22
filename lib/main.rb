#########################################################
## Andrew Z Allen's DG implementation for ThoughtWorks ##
#########################################################

# The local commuter railroad services a number of towns in Kiwiland.  Because
# of monetary concerns, all of the tracks are 'one-way.'  That is, a route from
# Kaitaia to Invercargill does not imply the existence of a route from
# Invercargill to Kaitaia.  In fact, even if both of these routes do happen to
# exist, they are distinct and are not necessarily the same distance!

# The purpose of this problem is to help the railroad provide its customers with
# information about the routes.  In particular, you will compute the distance
# along a certain route, the number of different routes between two towns, and
# the shortest route between two towns.

module trains
  # Lot's has been written on the problem
  context "#choo-choo" do
    it "should measure the distance of the route A-B-C" do
      skip
    end

    it "should measure the distance of the route A-D" do
      skip
    end

    it "should measure the distance of the route A-D-C" do
      skip
    end

    it "should measure the distance of the route A-E-B-C-D" do
      skip
    end

    it "should measure the distance of the route A-E-D" do
      skip
    end

    it "should measure the number of trips starting at C and ending at C with a maximum of 3 stops.  In the sample data below, there are two such trips: C-D-C (2 stops). and C-E-B-C (3 stops)" do
      skip
    end

    it "should measure the number of trips starting at A and ending at C with exactly 4 stops.  In the sample data below, there are three such trips: A to C (via B,C,D); A to C (via D,C,D); and A to C (via D,E,B)" do
      skip
    end

    it "should measure the length of the shortest route (in terms of distance to travel) from A to C" do
      skip
    end

    it "should measure the length of the shortest route (in terms of distance to travel) from B to B" do
      skip
    end


    it "should measure the number of different routes from C to C with a distance of less than 30.  In the sample data, the trips are: CDC, CEBC, CEBCDC, CDCEBC, CDEBC, CEBCEBC, CEBCEBCEBC" do
      skip
    end

  end
end