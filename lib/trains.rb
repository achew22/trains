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

module Trains
  # Lot's has been written on the problem
  class Network
    # Define a network of train tracks and stations (edges and vertices)
    attr_accessor :edges

    # The way I'm going to implement this can be best thought of as an
    # adjacency matrix.

    # Fig. 1: Example adjacency matrix
    #    EDGES (FROM)
    # E    A B C D E
    # D  A - 2 4 1 8
    # G  B 1 - 2 4 8
    # E  C 1 8 - 5 3
    # T  D 1 2 1 - 3
    # O  E 1 4 3 9 -

    # This data structure allows you to quickly determine how long it will
    # take to travel from point X to point Y. Go along the top and find the
    # starting location, then trace down until you hit the end location.

    # A 2 deep dictionary (hashmap in Ruby) is a memory efficient, O(1) lookup
    # data structure. You can think of it as a sparse 2d integer array.

    def initialize()
      # Define the edges to be a hash, who's default value is an empty hash
      @edges = Hash.new{|hash, key| hash[key] = Hash.new}
    end

    def add_edge(from, to, weight)
      # A network of train stations is created by adding edges
      @edges[from][to] = weight
    end

    def measure_(current, destinations, acc)
      # Using underscore methods as a rough approximation of
      # pattern matching
      return acc if destinations.length == 0

      # Pop (from the beginning) the next item
      to = destinations.shift

      # Use the maybe-monad behavior but with integers and false
      return false if not @edges.has_key?(current)
      return false if not @edges[current].has_key?(to)

      # This should be sufficient to trigger tail-recursion
      return measure_(to, destinations, acc + @edges[current][to])

    end

    def measure(destinations)
      # Again, approximate pattern matching for the edge case of
      # destination  = [_] || []
      return 0 if destinations.length <= 1

      measure_ destinations.shift, destinations, 0
    end

  end
end