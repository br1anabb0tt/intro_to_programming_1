public class Planet{						// declares new class called Planet
  int[] loc;								// declares array of integers called loc
  color myColor;							// declares color variable myColor
  int mySize;								// declares integer variable mySize
  int dx, dy;								// declares integer variables dx and dy
  String name;								// declares string variable name
  
  public Planet(){							// starts defining function Planet()
    println("making an planet");			// prints text to console
    loc = new int[2];						// creates array loc with 2 variables
    assignDefaultValues();					// calls fn that assigns values to variables
  }
  
  void assignDefaultValues(){				// fn to give values to variables in array loc
    println("assigning values");			// prints text to console
    name = "a planet";						// assigns value "a planet" to variable name
    loc[0] = 100;							// assigns value 100 to first array element
    loc[1] = 200;							// assigns value 200 to second array element
    myColor = color(255,255,0);				// sets color to yellow
    mySize = 50;							// sets size to 50px
    dx = dy = 10;							// sets speed and direction of animation
  }
  
  void drawPlanet(){													// starts defining method drawPlanet of class Planet
    fill(myColor);														// value of var myColor determines fill color
    ellipse(loc[0], loc[1], mySize, mySize);							// draws ellipse with center at an x,y point determined by values of first & second elements of array loc. width & height determined by value of variable mySize
    if( loc[0] + mySize / 2 >= 600 || loc[0] - mySize / 2 <= 0 ){		// if EITHER (loc[0] value + half of mySize value) is at least 600 OR (loc[0] value - half of mySize value) is zero or less... 
      dx *= -1;															// then change whether dx is positive or negative
    }
    if( loc[1] + mySize / 2 >= 600 || loc[1] - mySize / 2 <= 0 ){		// does the same as above but with loc[1] - these prevent objects from moving off screen
    
      dy *= -1;
    }
    loc[0] += dx;														// adds value of variable dx to value of first element in array loc
    loc[1] += dy;														// adds value of variable dy to value of second element in array loc
//    println(name+ " loc: " + loc[0] + ", " + loc[1]);					\\ when uncommented prints name and x,y location of objects in class Planet
  }
}

public class Meteor extends Planet {									// declares new subclass Meteor that inherits from Planet
  
  boolean followMouse;													// declares true/false variable followMouse
  
  public Meteor(){														// starts defining function Meteor()
    super();															// has something to do with superclass of Meteor, i.e. Planet, but not sure exactly what or why it's necessary
    println("actually im a meteor");									// prints text to console
    
    myColor = color( random(255), random(255), random(255) );			// generates random numbers up to 255 for rgb values 
    
    dx = (int) random(3, 17);											// generates random numbers 
    dy = (int) random(3, 17);
    
    followMouse = false;												// sets value of variable followMouse to false
  }
  
  void drawPlanet(){									// starts defining method drawPlanet() of class Meteor
    if ( followMouse ) {								// if value of variable followMouse is true
      fill(myColor);									// fill color comes from value of myColor
      loc[0] = mouseX;									// loc[0] i.e. x-coordinate determined by x-coordinate location of mouse
      loc[1] = mouseY;									// loc[1] i.e. y-coordinate determined by y-coordinate location of mouse
      ellipse(loc[0], loc[1], mySize, mySize);			// draws ellipse in location based on mouse position and with size mySize
    }
    else{												// or if value of variable followMouse if false
      super.drawPlanet();								// call function drawPlanet() of class Planet (instead of class Meteor)
    }
    
  }
  
}
