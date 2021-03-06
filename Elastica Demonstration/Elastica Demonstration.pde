// Author: Asheesh Sharma
// Msc project
// University of Bristol

// Example demonstrating revolute joint

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
Box2DProcessing box2d;

// An object to describe a Elastica (two bodies and one joint)
Elastica elastica;

// An ArrayList of particles that will fall on the surface
ArrayList<Particle> particles;

IK inverseKinematicsSolver;

void setup() {
  size(400, 300);
  smooth();

  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  // Make the elastica at an x,y location
  elastica = new Elastica(200, 200);

  // Create the empty list
  particles = new ArrayList<Particle>();

  inverseKinematicsSolver = new IK(1.);
}

void draw() {
  background(255);

  if (random(1) < 0.1) {
    float sz = random(0.5, 4);
    particles.add(new Particle(random(150, 250), -20, sz));
  }


  // We must always step through time!
  box2d.step();

  // Look at all particles
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
    // Particles that leave the screen, we delete them
    // (note they have to be deleted from both the box2d world and our list
    if (p.done()) {
      particles.remove(i);
    }
  }

  // Draw the elastica
  elastica.display();
  if (mousePressed == true) {
    try {
      inverseKinematicsSolver.solve(mouseX, mouseY, false);
      boolean notFound = inverseKinematicsSolver.X1.hasValue(Float.NaN) || inverseKinematicsSolver.X2.hasValue(Float.NaN);
      if (notFound){
        // Try with negative a1
        inverseKinematicsSolver.solve(mouseX, mouseY, true);
      }
      // If we found a solution display it
      if (!notFound){
        elastica.ikCall(inverseKinematicsSolver.X1, inverseKinematicsSolver.X2);
        inverseKinematicsSolver.display();        
      }
    } catch(ArrayIndexOutOfBoundsException e){
    }
      
  }
}
