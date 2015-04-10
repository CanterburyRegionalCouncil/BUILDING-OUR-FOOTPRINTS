/*
 * A Point class representing a set of coordinates. Only contains two properties: x & y.
 * This objet has the abiltity to calculate the differences between two Points via the
 * `calculateDelta` function. It can also calculate the angle. 
 */
function Point(pointArray) {
	this.x = pointArray[0];
	this.y = pointArray[1];
}

Point.prototype.toString = function() {
	return 'point';
}

/*
 * Must take another Point object in (not: could be extended to also take in an array, but
 * I haven't done that.)
 * Returns a new Point object.
 */
Point.prototype.calculateDelta = function(compareWith) {
	if (compareWith.toString() !== 'point') {
		throw new Error('Was expecting type of point. Received ' + compareWith.toString());
	}

	return new Point([compareWith.x - this.x, compareWith.y - this.y])
}

/*
 * Returns an angle based on some stuff.
 */
Point.prototype.calculateAngle = function() {
  var returnAngle;

  if (this.x == 0) {
    if (this.y > 0) {
      return 90.0;
    } else {
      return 270.0;
    }
  } else if (this.y == 0) {
    if (this.x > 0) {
      return 0.0;
    } else {
      return 180.0;
    }
  }
  else {
    returnAngle = Math.degrees(Math.atan((this.y) / this.x));
    if (this.x < 0) {
      return (returnAngle + 180);
    }
    else if (this.y < 0) {
      return (returnAngle + 360);
    }
	else {
		return returnAngle;
	}
  }
}

/*
 * A bearing object that only has a single property: the degree of the bearing.
 * Is mainly used as a container for a rating calculation based on a second bearing
 * object
 */
function Bearing(degree) {
  this.degree = degree;
}

Bearing.prototype.toString = function() {
  return 'bearing';
}

/*
* Returns an integer 'rating' based on a set of predetermined logic.
*/
Bearing.prototype.calculateRating = function(bearing) {
	if (bearing.toString() !== 'bearing') {
		throw new Error('Was expecting type of bearing. Received ' + bearing.toString());
	}

	var diff = bearing.degree - this.degree;
	if (diff < 0) {
		diff = diff + 360;
	}

	// Note that you could also throw in a switch statement here, but either way it's just
	// a bunch of if/else statements
	if (diff > 85 && diff <= 95) {
		return 10;
	} else if (diff > 175 && diff <= 185) {
		return 9;
	} else if (diff > 115 && diff <= 125) {
		return 8;
	} else if (diff > 125 && diff <= 135) {
		return 6;
	} else if (diff > 265 && diff <= 275) {
		return 7;
	} else if (diff > 275 && diff <= 359) {
		return 5;
	} else if (diff > 185 && diff <= 195) {
		return 4;
	} else if (diff > 45 && diff <= 60) {
		return 3;
	} else if (diff <= 45) {
		return 1;
	} else {
		return 2;
	}
}

/*
 * JavaScript doesn't have a default mechanism for converting from radians to degrees. Let's add it
 * to the Math object
 */
Math.degrees = function(radians) {
	return radians * 180 / Math.PI;
};

/*
 * The main function that does all your calculations. It takes an array of arrays, with each inner array
 * having two values; an x and a y. I've thrown a few comments in here so you can get the gist of what's
 * happening
 */
function vertexRating(geomList) {
	// Declare all our variables up front. Due to JavaScript variable hoisting and the potential to inadvertantly
	// create unnecessary global variables.
	
	var bearingList = [],
	  ratingList = [],
		pointA,
		pointB,
		deltaPoint,
		currentAngle,
    bearingA,
    bearingB,
    bearingDiff,
		totalRating;

	// Loop through the array of array's. Stop at length - 1.
	
	for (var i = 0; i < geomList.length - 1; i++) {
		// Create our two points for comparison
		pointA = new Point(geomList[i]);
		pointB = new Point(geomList[i + 1]);

		// Create a new point based on the delta value between A & B
		deltaPoint = pointA.calculateDelta(pointB);

		// Calculate the delta's angle and throw that into an array
		bearingList.push(deltaPoint.calculateAngle());		
	}
	
	var lastBearing = bearingList[0];
	bearingList.push(lastBearing);

	// Loop through the bearings/angles. Same -1 logic as before
	for (var j = 0; j < bearingList.length - 1; j++) {
		// Create out two bearings for comparison
    bearingA = new Bearing(bearingList[j]);
    bearingB = new Bearing(bearingList[j + 1]);

		// Calculate the rating and push that into an array
		ratingList.push(bearingA.calculateRating(bearingB));		
  }

	//Reduce the ratingList to a single value (`.reduce` reduces each item in an array down to a final
	// value based on the function provided. The `0` at the end there is the starting value)
	totalRating = ratingList.reduce(function(prev, curr) {
		return prev + curr;
	}, 0);

	//Return average
	var rating = (totalRating / ratingList.length);
	return rating;
}

var testlist = [
	[1403003.114,4993000.737], 
	[1403923.866,4993230.925], 
	[1403728.074,4992228.152], 
	[1402992.531,4992267.840], 
	[1403003.114,4993000.737]
]

vertexRating(testlist);