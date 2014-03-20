Planet earth;							// declares object earth of class Planet
Planet sun;								// declares object sun of class Planet

ArrayList<Meteor> mets;					// declares ArrayList mets to hold Meteor objects

void setup() {							// sets initial values (runs once)
  size(600, 600);						// draws 600x600px window
  frameRate(25);						// sets framerate to 25 per second
  background(0);						// sets background color to black
  earth = new Planet();					// creates instance/object earth of class Planet
  earth.name = "Earth";					// names earth Earth
  earth.myColor = color(0, 0, 255);		// sets color of earth using rgb values (blue)
  earth.dx = earth.dy = -5;				// sets speed and direction of earth animation
  earth.loc[0] = 58;					// sets initial location of earth

  sun = new Planet();					// creates instance/object sun of class Planet
  sun.name = "Sun";						// names sun Sun
  sun.mySize = 150;						// sets size of sun in px
  sun.dx = sun.dy = 5;					// sets speed and direction of sun animation

  mets = new ArrayList<Meteor>();		// creates empty ArrayList mets
}

void draw() {							// draw function (runs continuously)
  background(0);						// sets background color to black

  sun.drawPlanet();						// calls function drawPlanet() for object sun
  earth.drawPlanet();					// calls function drawPlanet() for object earth

  for ( Meteor met : mets) {			// initiates for loop, declares object met of class Meteor in Arraylist mets
    met.drawPlanet();					// calls function drawPlanet() for object met
  }	
}

void mouseClicked() {					// when mouse is clicked
  mets.add( new Meteor() );				// adds new object Meteor to ArrayList
}

// void keyPressed() {						// when a key is pressed
//  if ( !mets.isEmpty() ) {				// if ArrayList mets is not empty, i.e. if there is at least one Meteor instance/object
//    mets.remove(0);						// remove first element in ArrayList mets
//  }
//}

void keyPressed() {										// when a key is pressed

	if (key == 'r' || key == 'R'){						// if that key is r or R
		if (!mets.isEmpty() ) {							// and if ArrayList mets is not empty, i.e. if there is at least one Meteor instance/object
			mets.remove(0);								// remove first element in ArrayList mets
		}
	} else if (key == 'f' || key == 'F') {				// if that key is f or F
		for (Meteor met:mets) {							// initiates for loop, declares object met of class Meteor in Arraylist mets
			if (!met.followMouse){						// if value of variable followMouse for object met is false?
				met.followMouse = true;					// then set value of followMouse for met to true
				break;									// ends for loop
			}
		}
	} else if (key == 's' || key == 'S') {				// if that key is s or S
		for (Meteor met:mets) {							// initiates for loop, declares object met of class Meteor in Arraylist mets
			if (met.followMouse){						// if value of variable followMouse for object met is true?
				met.followMouse = false;				// then set value of followMouse for met to false
				break;									// ends for loop
			}
		}
	}

}
