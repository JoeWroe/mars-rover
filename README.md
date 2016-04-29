# :satellite: MARS ROVER :satellite:

##ThoughtWorks Tech Assignment

For the next stage of the ThoughtWorks application process, I have been asked to complete the Mars Rover Kata, to demonstrate my current programming ability and the accompanying skill areas. This document should be all you need to understand setup and control of a hypothetical mars rover.

##Problem (The Kata)

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

####Input:

- The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.
- The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau.
- The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation.
- Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.

####Output:

 The output for each rover should be its final co-ordinates and heading.

####Input and Output

**Test Input:**

5 5  
1 2 N  
LMLMLMLMM  
3 3 E  
MMRMMRMRRM  

**Expected Output:**

1 3 N  
5 1 E  

In the administration of our assessments, ThoughtWorks strives to provide an equal testing opportunity for all candidates. Therefore, we will provide reasonable adjustment to our standard test taking procedures for applicants who have a documented disability within the meaning of the Equality Act. Please let us know when we contact you to schedule the assessments if you require any reasonable adjustment to the standard test taking procedures.

Copyright 2012 ThoughtWorks, Inc


####Design

Since this project is designed to demonstrate skills, and given that the majority of my development history has been in the Ruby programming language, Ruby has been chosen as the language to write this project in. Given that the kata has not asked for any record of the rovers actions to persist and there has not been any mention of a graphical user interface (GUI), the decision has been taken to not implement any database and to keep the program as a Command Line Application.

##Setup

This application has been designed to be run from the command line, for that reason there is little setup required. Simply unzip the file  if one has been provided or fork the repository at  (https://github.com/JoeWroe/mars-rover), and clone it down to your local machine.

From the command line, navigate to the folder containing the application an open up a REPL (such as IRB or PRY). Once in a REPL, run the following commands to make sure you have required the necessary files:

  `require './lib/controller.rb'`  
  `require './lib/plateau.rb'`  
  `require './lib/navigational_grid.rb'`  
  `require './lib/mars_rover.rb'`  
  `require './lib/compass.rb'`  

Once all files have been required, run the following in order to create the appropriate objects:

  `compass = Compass.new(["N", "E", "S", "W"])`  
  `mars_rover = MarsRover.new(compass: compass)`  
  `plateau = Plateau.new`  
  `controller = Controller.new(plateau: plateau)`  

This leaves you in a position to start using the application. Without exiting your REPL, try out a selection of the methods defined under the following heading "**Code Example**"

##Code Example

This application has been design for use by a NASA controller, therefore all key functionality can be accessed from the controller class, as follows:

- *First off, we will need to set up the navigational grid on the mars plateau. Since the plateau that the controller will be managing was injected upon the controllers creation, we simply have to use the following method, the arguments are the size of the grid that is required.*

`controller.add_navigational_grid(5, 5)`

=> { :x_coord=>5, :y_coord=>5 }

- *Next, we will need to land a rover on the plateau.*

`controller.land(mars_rover, "1 2 N")`

=> ["1", "2", "N"]

- *As you will have noticed, the previous method returned an array. For presentation purposes, this may be required as a string.*

`controller.check_rover_position(mars_rover)`

=> "1 2 N"

- *You can now create and add as many rovers to the plateau as you like. At this point, it has been assumed that a grid square can hold any number of rovers. To find out the rovers that are present on the plateau, run:*

`controller.check_currently_landed_rovers`

=> [mars_rover] *Returns the rovers you have landed*

- *Finally a NASA controller may wish to alter the position of a rover.*

`controller.change_rover_position(mars_rover, "LMLMLMLMM")`

=> "1 3 N"

- *Since the problem mentions a camera, but does not go into great detail about the behaviour required from that camera, scaffolding for a future class has been included.*

`require './lib/camera.rb'`
`camera = camera.new(mars_rover: mars_rover)`
`controller.toggle_camera(camera)`

=> true *(this is the state of camera#recording)*

##Testing

RSpec has been used to test the application. In order to run the tests, setup the application as described above, then once you have navigated to the correct folder, run:

`rspec`

##User Stories

####Explaination on creation of User Stories

Based on the problem laid out above, in order to break down the challenge, a number of User Stories have been extracted. These User Stories will form the basis on which the tests are written, the code will then be written in order to pass the minimum requirements of those tests.

User Stories have been constructed by analysing each sentence of the challenge. The sentences have been taken one at a time, and the Stakeholder/Motivation/Action format has been used to develop the stories, for example:

**The sentence:**

*A squad of robotic rovers are to be landed by NASA on a plateau on Mars.*

**The Stakeholder:**

*NASA*

**The Motivation:**

*Perhaps not clear from this sentence alone, further reading and context given makes it clear that the motivation is scientific exploration of Mars*

**The Action:**

*Land a robotic rover on a plateau on Mars*

**The constructed User Story:**

*As a NASA controller,
So that I can explore a particular part of Mars,
I would like to be able to land a Mars Rover on the plateau.*

**N.B.** Where NASA is the stakeholder, it has been assumed that this refers to 'a NASA controller'. This is due to NASA being a large organisation and therefore not really referring to an individual stakeholder.

Above each User Story is the sentence that has formed the basis for its development.

####The constructed User Stories

**User Story 1:**
*This is basic functionality required - the controller must be able to communicate with the rover. No specific sentence has formed the basis of this User Story* :heavy_check_mark:
```
As a NASA controller,
So that NASA can explore Mars,
I'd like to interact with an online Mars Rover.
```

**User Story 2:**
*A squad of robotic rovers are to be landed by NASA on a plateau on Mars.* :heavy_check_mark:
```
As a NASA controller,
So that I can explore a particular part of Mars,
I'd like to be able to land a Mars Rover on the plateau.
```

**User Story 3:**
*This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.* :heavy_check_mark:
```
As a NASA controller,
So that I can get a complete view of the surrounding terrain to send back to Earth,
I'd like to be able to start and stop our camera from recording.
```

**User Story 4:**
*A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points.* :heavy_check_mark:
```
As a NASA controller,
So that I know the position and location of a rover,
I'd like to be able to check a rovers current position and location.
```

**User Story 5:**
*The plateau is divided up into a grid to simplify navigation.* :heavy_check_mark:
```
As a NASA controller,
So that I can simplify navigation,
I'd like to be able to divide the plateau into a grid.
```

**User Story 6**
*In order to control a rover, NASA sends a simple string of letters... ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot.* :heavy_check_mark:
```
As a NASA controller,
So that I can change a rovers heading,
I'd like to be able to spin a rover 90 degrees left and right.
```

**User Story 7**
*In order to control a rover, NASA sends a simple string of letters... ‘M’ means move forward one grid point, and maintain the same heading.* :heavy_check_mark:
```
As a NASA controller,
So that I can advance on the grid,
I'd like to be able to move the rover forward one grid point.
```

##Author

[Joe Wroe](https://github.com/JoeWroe)
