# knight-travails

This project was a challenging one, but equally satisfying when I eventually got things working.

It was made more difficult by the fact that I took a break from coding between starting this project and ending it, with a large part of the project consisting of me refamiliarizing myself with Ruby. This is also why the project was entirely completed in one commit; I coded it in repl.it while I was reinstalling my virtual environment, and added it to git when everything was back up and running.

Having come from coding a binary search tree before starting this project, I had some idea of what coding and using a data structure to solve a problem was like. A lot of my time was spent trying to code the graph like I did with the BST, using a node class to create instances of each vertex, and using an array to link to all of the surrounding vertices. This created a lot of problems however, and in the end, I went with a solution that essentially calculated the structure of the graph as it was traversed, and only up until the point where the target vertex was found.

In future iterations of this project I hope to continue to refactor the code, and in particular the two main methods that traverse the graph and calculate the shortest route: both of which are a bit long and unwiedly. I'd also like to work more with this problem, using the graph to work out more than just the shortest route. Perhaps adding a visual representation of the knight moving around the board, and calculating each variation of the shortest route to the objective.