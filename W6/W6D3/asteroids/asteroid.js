(function (root) {
  var Asteroids = root.Asteroids = (root.Asteroids || {});


  var Asteroid = Asteroids.Asteroid = function(pos, vel, radius, color){
    Asteroids.MovingObject.call(this, pos, vel, radius, color);
  };

  Asteroid.inherits(Asteroids.MovingObject);

  Asteroid.RADIUS = 8;
  Asteroid.COLOR = "purple";

  Asteroid.randomAsteroid = function(dimX, dimY) {
    var x = Math.random() * dimX;
    var y = Math.random() * dimY;
    var speed = 10;

    // new random vec has potential to be negative
    var vecx = Math.floor(Math.random() * speed - speed/2);
    var vecy = Math.floor(Math.random() * speed - speed/2);

    if (vecx === 0 && vecy === 0) {
      return Asteroid.randomAsteroid(dimX, dimY);
    };

    var randomPos = [x, y];
    var randomVec = [vecx, vecy];

    return new Asteroid(randomPos, randomVec, Asteroid.RADIUS, Asteroid.COLOR);
  };
})(this);

