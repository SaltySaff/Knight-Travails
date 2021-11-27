# frozen_string_literal: true

# Creates a knight and its location on the chess board
class Knight
  attr_accessor :location

  def initialize(location)
    @location = location
  end
end

# Creates a graph through which the shortest path can be calculated
class Graph
  MOVES = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]].freeze

  def initialize(location)
    @knight = Knight.new(location)
  end

  def traverse(target_node)
    # Traverses the graph by calculating each move's neighbours as it goes along. Provides the path taken via 
    # visited_nodes, and an edge list via parent_nodes
    queue = []
    visited_nodes = []
    parent_nodes = []
    queue.push(@knight.location)
    until queue.empty?
      neighbours = calculate_neighbours(queue[0])
      parent_nodes << track_parents(queue[0], neighbours)
      neighbours.each do |neighbour|
        if neighbours.include?(target_node)
          visited_nodes << queue[0]
          visited_nodes << target_node
          return backtrack(visited_nodes, parent_nodes)
        end
        queue.push(neighbour) unless visited_nodes.include?(neighbour) || queue.include?(neighbour)
      end
      visited_nodes << queue[0]
      queue.shift
    end
  end

  def backtrack(visited_nodes, parent_nodes)
    # Backtracks through the path taken in traverse, returning the shortest direct path between the starting
    # and ending nodes
    reverse_path = visited_nodes.reverse
    end_node = reverse_path[0]
    path = []
    path << end_node
    n = -1
    until path.include?(@knight.location)
      parent_nodes[n].each do |node|
        path.unshift(node[0][0]) if node[1].include?(path[0])
      end
      n -= 1
    end
    puts "You made it in #{path.length - 1} moves! Here's your path:"
    path.each { |node| p node }
  end

  def track_parents(node, neighbours)
    # Creates and edge list to represent the parent-child relationship between nodes visited in the graph
    previous_nodes = []
    neighbours.each do |neighbour|
      previous_nodes << [[node], [neighbour]]
    end
    previous_nodes
  end

  def calculate_neighbours(location)
    # Calculates the neighbours of the given board space using the move set of a knight
    neighbour_nodes = []
    MOVES.each do |move|
      neighbour_nodes.push([(move[0] + location[0]), (move[1] + location[1])])
    end
    filter_nodes = neighbour_nodes.select do |moves|
      moves.all? { |numbers| numbers >= 0 && numbers <= 7 }
    end
    filter_nodes
  end
end

graph = Graph.new([0, 0])
graph.traverse([7, 7])
