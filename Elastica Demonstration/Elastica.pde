// Author: Asheesh Sharma
// Msc project
// University of Bristol

// Class to describe a fixed spinning object
import java.awt.MouseInfo;

class Elastica {
  // Our object is two boxes and one joint
  // Consider making the fixed box much smaller and not drawing it
  RevoluteJoint revolutejoint1;
  RevoluteJoint revolutejoint2;
  RevoluteJoint revolutejoint3;
  RevoluteJoint revolutejoint4;
  RevoluteJoint revolutejoint5;
  RevoluteJoint revolutejoint6;
  RevoluteJoint revolutejoint7;
  RevoluteJoint revolutejoint8;
  RevoluteJoint revolutejoint9;
  RevoluteJoint revolutejoint10;

  WeldJoint weldjoint3;
  PrismaticJoint prismaticjoint1;
  PrismaticJoint prismaticjoint2;
  PrismaticJoint prismaticjoint3;
  PrismaticJoint prismaticjoint4;
  PrismaticJoint prismaticjoint5;
  PrismaticJoint prismaticjoint6;
  PrismaticJoint prismaticjoint7;
  PrismaticJoint prismaticjoint8;
  PrismaticJoint prismaticjoint9;
  PrismaticJoint prismaticjoint10;

  Box rotationElement1;
  Box rotationElement2;
  Box rotationElement3;
  Box rotationElement4;
  Box rotationElement5;
  Box rotationElement6;
  Box rotationElement7;
  Box rotationElement8;
  Box rotationElement9;
  Box rotationElement10;

  Box dummy;
  Box dummy2;

  Box translationElement1;
  Box translationElement2;
  Box translationElement3;
  Box translationElement4;
  Box translationElement5;
  Box translationElement6;
  Box translationElement7;
  Box translationElement8;
  Box translationElement9;
  Box translationElement10;

  // Degree to Radian conversion constant. 
  float DEGTORAD=PI/180;
  float krotation=5000;
  float ktranslation=0.5; //min is four //mac is 30
  boolean mousePresent = true;

  public void mouseEntered() {
    mousePresent = true;
  }
  public void mouseExited() {
    mousePresent = false;
  }

  Elastica(float x, float y) {

    // Initialize locations of two boxes
    dummy = new Box(x, y, 50, 10, true);
    dummy2 = new Box(x-10, y, 10, 5, false);

    rotationElement1 = new Box(x, y, 10, 10, false); 
    translationElement1 = new Box(x, y-10, 20, 5, false);

    rotationElement2 = new Box(x, y-10, 10, 10, false); 
    translationElement2 = new Box(x, y-20, 20, 5, false); 

    rotationElement3 = new Box(x, y-20, 10, 10, false);
    translationElement3 = new Box(x, y-30, 20, 5, false); 

    rotationElement4 = new Box(x, y-30, 10, 10, false);
    translationElement4 = new Box(x, y-40, 20, 5, false); 

    rotationElement5 = new Box(x, y-40, 10, 10, false);
    translationElement5 = new Box(x, y-50, 20, 5, false); 

    rotationElement6 = new Box(x, y-50, 10, 10, false);
    translationElement6 = new Box(x, y-60, 20, 5, false); 

    rotationElement7 = new Box(x, y-60, 10, 10, false);
    translationElement7 = new Box(x, y-70, 20, 5, false); 

    rotationElement8 = new Box(x, y-70, 10, 10, false);
    translationElement8 = new Box(x, y-80, 20, 5, false); 

    rotationElement9 = new Box(x, y-90, 10, 10, false);
    translationElement9 = new Box(x, y-100, 20, 5, false); 

    rotationElement10 = new Box(x, y-100, 10, 10, false);
    translationElement10 = new Box(x, y-110, 20, 5, false); 

    // Define joint as between two bodies
    revolutejoint1 = createrevolute(rotationElement1, dummy, new Vec2(0, 0), new Vec2(0, 0));
    prismaticjoint1 = createprismatic(translationElement1, rotationElement1);

    revolutejoint2 = createrevolute(rotationElement2, translationElement1, new Vec2(0, 0), new Vec2(0, 0));
    prismaticjoint2=createprismatic(translationElement2, rotationElement2);

    revolutejoint3 = createrevolute(rotationElement3, translationElement2, new Vec2(0, 0), new Vec2(0, 0));
    prismaticjoint3 = createprismatic(translationElement3, rotationElement3);

    revolutejoint4 = createrevolute(rotationElement4, translationElement3, new Vec2(0, 0), new Vec2(0, 0));
    prismaticjoint4 = createprismatic(translationElement4, rotationElement4);

    revolutejoint5 = createrevolute(rotationElement5, translationElement4, new Vec2(0, 0), new Vec2(0, 0));
    prismaticjoint5 = createprismatic(translationElement5, rotationElement5);

    revolutejoint6 = createrevolute(rotationElement6, translationElement5, new Vec2(0, 0), new Vec2(0, 0));
    prismaticjoint6 = createprismatic(translationElement6, rotationElement6);

    revolutejoint7 = createrevolute(rotationElement7, translationElement6, new Vec2(0, 0), new Vec2(0, 0));
    prismaticjoint7 = createprismatic(translationElement7, rotationElement7);

    revolutejoint8 = createrevolute(rotationElement8, translationElement7, new Vec2(0, 0), new Vec2(0, 0));
    prismaticjoint8 = createprismatic(translationElement8, rotationElement8);

    revolutejoint9 = createrevolute(rotationElement9, translationElement8, new Vec2(0, 0), new Vec2(0, 0));
    prismaticjoint9 = createprismatic(translationElement9, rotationElement9);

    revolutejoint10 = createrevolute(rotationElement10, translationElement9, new Vec2(0, 0), new Vec2(0, 0));
    prismaticjoint10 = createprismatic(translationElement10, rotationElement10);

    weldjoint3=creatWeld(dummy, dummy2);
  }

  void ikCall(FloatList X1, FloatList X2 ) {
    Vec2 newPos = box2d.coordPixelsToWorld(new Vec2(X1.get(0), X2.get(0)));
    float angle = atan(X1.get(0)/X2.get(0));
    translationElement1.body.setTransform(newPos, (angle));

    newPos = box2d.coordPixelsToWorld(new Vec2(X1.get(1), X2.get(1)));
    angle = atan((X1.get(1) - X1.get(0))/(X2.get(1) - X2.get(0)));
    translationElement2.body.setTransform(newPos, (angle));

    newPos = box2d.coordPixelsToWorld(new Vec2(X1.get(2), X2.get(2)));
    angle = atan((X1.get(2) - X1.get(1))/(X2.get(2) - X2.get(1)));
    translationElement3.body.setTransform(newPos, (angle));

    newPos = box2d.coordPixelsToWorld(new Vec2(X1.get(3), X2.get(3)));
    angle = atan((X1.get(3) - X1.get(2))/(X2.get(3) -X2.get(2)));
    translationElement4.body.setTransform(newPos, (angle));

    newPos = box2d.coordPixelsToWorld(new Vec2(X1.get(4), X2.get(4)));
    angle = atan((X1.get(4) - X1.get(3))/(X2.get(4) -X2.get(3)));
    translationElement5.body.setTransform(newPos, (angle));

    newPos = box2d.coordPixelsToWorld(new Vec2(X1.get(5), X2.get(5)));
    angle = atan((X1.get(5) - X1.get(4))/(X2.get(5) -X2.get(4)));
    translationElement6.body.setTransform(newPos, (angle));

    newPos = box2d.coordPixelsToWorld(new Vec2(X1.get(6), X2.get(6)));
    angle = atan((X1.get(6) - X1.get(5))/(X2.get(6) -X2.get(5)));
    translationElement7.body.setTransform(newPos, (angle));

    newPos = box2d.coordPixelsToWorld(new Vec2(X1.get(7), X2.get(7)));
    angle = atan((X1.get(7) - X1.get(6))/(X2.get(7) -X2.get(6)));
    translationElement8.body.setTransform(newPos, (angle));

    newPos = box2d.coordPixelsToWorld(new Vec2(X1.get(8), X2.get(8)));
    angle = atan((X1.get(8) - X1.get(7))/(X2.get(8) -X2.get(7)));
    translationElement9.body.setTransform(newPos, (angle));

    newPos = box2d.coordPixelsToWorld(new Vec2(X1.get(9), X2.get(9)));
    angle = atan((X1.get(9) - X1.get(8))/(X2.get(9) -X2.get(8)));
    translationElement10.body.setTransform(newPos, (angle));
  }

  void display() {
    update();
    //translationElement1.display();
    //translationElement2.display();
    //translationElement3.display();
    //translationElement4.display();
    //translationElement5.display();
    //translationElement6.display();
    //translationElement7.display();
    //translationElement8.display();
    //translationElement9.display();
    //translationElement10.display();

    //if (mousePressed == true) {
    //  if (mouseX < displayWidth && mouseY < displayHeight) {
    //    Vec2 newPos = box2d.coordPixelsToWorld(new Vec2(mouseX, mouseY));
    //    translationElement3.body.setTransform(newPos, 0.0);
    //  }
    //}

    // Draw anchor just for debug
    Vec2 anchor1 = box2d.coordWorldToPixels(rotationElement1.body.getWorldCenter());
    Vec2 anchor2 = box2d.coordWorldToPixels(rotationElement2.body.getWorldCenter());
    Vec2 anchor3 = box2d.coordWorldToPixels(rotationElement3.body.getWorldCenter());
    Vec2 anchor4 = box2d.coordWorldToPixels(rotationElement4.body.getWorldCenter());
    Vec2 anchor5 = box2d.coordWorldToPixels(rotationElement5.body.getWorldCenter());
    Vec2 anchor6 = box2d.coordWorldToPixels(rotationElement6.body.getWorldCenter());
    Vec2 anchor7 = box2d.coordWorldToPixels(rotationElement7.body.getWorldCenter());
    Vec2 anchor8 = box2d.coordWorldToPixels(rotationElement8.body.getWorldCenter());
    Vec2 anchor9 = box2d.coordWorldToPixels(rotationElement9.body.getWorldCenter());
    Vec2 anchor10 = box2d.coordWorldToPixels(translationElement10.body.getWorldCenter());

    //float dist = (sqrt(pow(anchor9.x - anchor10.x, 2) + pow(anchor10.y - anchor9.y, 2))) +
    //  (sqrt(pow(anchor8.x - anchor9.x, 2) + pow(anchor8.y - anchor9.y, 2))) +
    //  (sqrt(pow(anchor7.x - anchor8.x, 2) + pow(anchor7.y - anchor8.y, 2))) +
    //  (sqrt(pow(anchor6.x - anchor7.x, 2) + pow(anchor6.y - anchor7.y, 2))) + 
    //  (sqrt(pow(anchor5.x - anchor6.x, 2) + pow(anchor5.y - anchor6.y, 2))) +
    //  (sqrt(pow(anchor4.x - anchor5.x, 2) + pow(anchor4.y - anchor5.y, 2))) +
    //  (sqrt(pow(anchor3.x - anchor4.x, 2) + pow(anchor3.y - anchor4.y, 2))) +
    //  (sqrt(pow(anchor2.x - anchor3.x, 2) + pow(anchor2.y - anchor3.y, 3))) +
    //  (sqrt(pow(anchor1.x - anchor2.x, 2) + pow(anchor1.y - anchor2.y, 2)));

    //dist = min(min(dist, displayWidth), displayHeight);

    //dist = map(dist, 5, 100, 70, 40);
    //if (dist < 0) {
    //  dist = 5;
    //}

    strokeJoin(ROUND);
    strokeWeight(21);
    noFill();
    beginShape();
    curveVertex(anchor1.x, anchor1.y); // the first control point
    curveVertex(anchor1.x, anchor1.y); // the first control point
    curveVertex(anchor2.x, anchor2.y); // the first control point
    curveVertex(anchor3.x, anchor3.y); // the first control point 
    curveVertex(anchor4.x, anchor4.y); // the first control point 
    curveVertex(anchor5.x, anchor5.y); // the first control point
    curveVertex(anchor6.x, anchor6.y); // the first control point 
    curveVertex(anchor7.x, anchor7.y); // the first control point 
    curveVertex(anchor8.x, anchor8.y); // the first control point 
    curveVertex(anchor9.x, anchor9.y); // the first control point 
    curveVertex(anchor10.x, anchor10.y); // the first control point
    curveVertex(anchor10.x, anchor10.y); // the first control point
    endShape();

    strokeCap(SQUARE);
    strokeJoin(ROUND);
    strokeWeight(0);

    //fill(255, 0, 0);
    //stroke(0);
    //ellipse(anchor1.x, anchor1.y, 4, 4);
    //fill(255, 0, 0);
    //stroke(0);
    //ellipse(anchor2.x, anchor2.y, 4, 4);
    //fill(255, 0, 0);
    //stroke(0);
    //ellipse(anchor3.x, anchor3.y, 4, 4);
    //fill(255, 0, 0);
    //stroke(0);
    //ellipse(anchor4.x, anchor4.y, 4, 4);    

    dummy.display();
  }

  void update() {
    updateprismatic(translationElement10, rotationElement10, prismaticjoint10);
    updaterevolute(revolutejoint10);

    updateprismatic(translationElement9, rotationElement9, prismaticjoint9);
    updaterevolute(revolutejoint9);

    updateprismatic(translationElement8, rotationElement8, prismaticjoint8);
    updaterevolute(revolutejoint8);

    updateprismatic(translationElement7, rotationElement7, prismaticjoint7);
    updaterevolute(revolutejoint7);

    updateprismatic(translationElement6, rotationElement6, prismaticjoint6);
    updaterevolute(revolutejoint6);

    updateprismatic(translationElement5, rotationElement5, prismaticjoint5);
    updaterevolute(revolutejoint5);

    updateprismatic(translationElement4, rotationElement4, prismaticjoint4);
    updaterevolute(revolutejoint4);

    updateprismatic(translationElement3, rotationElement3, prismaticjoint3);
    updaterevolute(revolutejoint3);

    updateprismatic(translationElement2, rotationElement2, prismaticjoint2);
    updaterevolute(revolutejoint2);

    updateprismatic(translationElement1, rotationElement1, prismaticjoint1);
    updaterevolute(revolutejoint1);
  }

  void updaterevolute(RevoluteJoint revolutejointie_) {
    //Calculating the dynamics.  
    // 1. Get the current angle of bodies  
    double angle1=revolutejointie_.getJointAngle() * (180/PI);

    // 2. Calculate torques for the motors. The relation is that the torque must be 
    // increased as the angle increases.
    float T1 = krotation * abs((float)angle1/100);

    // 3. Calculate angular speed, motors should move in the opposite direction w.r.t
    // the tilt.
    float V1=(float)-angle1/(15);

    // 4. Update the the internal body joints    
    if (abs((float)angle1) > 0.2) {
      revolutejointie_.setMaxMotorTorque(T1);
      revolutejointie_.setMotorSpeed(V1);
      revolutejointie_.enableMotor(true);
    } else {
      revolutejointie_.enableMotor(false);
    }
  }

  void updateprismatic(Box a_, Box b_, PrismaticJoint prismaticjointe_) {   
    Vec2 world2v = a_.body.m_linearVelocity;
    Vec2 world1v = b_.body.m_linearVelocity;
    Vec2 vdiff = world2v.sub(world1v);

    float  pjt = prismaticjointe_.getJointTranslation();
    float pjs = prismaticjointe_.getJointSpeed();
    float force = ktranslation*5*(pjt+100) +5* pjs; // ktranslation is the spring constant, 5 is the damping constant.
    //Note the the desired ditance is devided by two because the entire spring has been devided by 2.
    prismaticjointe_.setMaxMotorForce(force); 
    prismaticjointe_.setMotorSpeed(-prismaticjointe_.getJointTranslation()*vdiff.normalize());
  }

  PrismaticJoint createprismatic(Box a_, Box b_) {
    PrismaticJointDef tjd= new PrismaticJointDef();
    tjd.initialize(a_.body, b_.body, b_.body.getWorldCenter(), new Vec2(0, 1));
    //tjd.upperTranslation = 0.0f;
    //tjd.lowerTranslation = 3f;
    //tjd.enableLimit = true;
    tjd.enableMotor = true;
    return (PrismaticJoint) box2d.world.createJoint(tjd);
  }

  RevoluteJoint createrevolute(Box a_, Box b_, Vec2 anchorA, Vec2 anchorB) {
    // Define joint as between two bodies
    RevoluteJointDef rjd = new RevoluteJointDef();
    rjd.bodyA=a_.body;
    rjd.bodyB=b_.body;

    if (anchorA!=new Vec2(0, 0) && anchorB != new Vec2(0, 0)) {
      rjd.localAnchorA = anchorA;
      rjd.localAnchorB = anchorB;
    }
    // Turning on a motor (optional)
    rjd.enableMotor = false;      // is it on?
    rjd.motorSpeed = 0;       // how fast?
    rjd.maxMotorTorque = 0; // how powerful?

    // 5. The motors must have upper and lower limits. This directly relates
    // How much the stiffness of the spring in the y direction (normal to the)
    // axis of the motor.
    rjd.enableLimit=true; //enable limits
    rjd.lowerAngle = (float) -90 * DEGTORAD;
    rjd.upperAngle = (float) 90 * DEGTORAD;

    // There are many other properties you can set for a Revolute joint
    // For example, you can limit its angle between a minimum and a maximum
    // See box2d manual for more
    // Create the joint
    return (RevoluteJoint) box2d.world.createJoint(rjd);
  }

  WeldJoint creatWeld(Box BoxA, Box BoxB) {
    WeldJointDef welddef = new WeldJointDef();
    welddef.initialize(BoxA.body, BoxB.body, BoxA.body.getWorldCenter());
    welddef.frequencyHz=0;
    welddef.dampingRatio=1;
    return (WeldJoint) box2d.world.createJoint(welddef);
  }

  //Utilities
  float[] translat(float[] line, float x, float y) {
    line[0]=line[0]+x;
    line[1]=line[1]+y;
    line[2]=line[2]+x;
    line[3]=line[3]+y;
    return line;
  }
  Vec2 rotate(Vec2 point, Vec2 center, float angle) {
    float x1 = point.x - center.x;
    float y1 = point.y - center.y;
    float x2 = x1 * cos(angle) - y1 * sin(angle);
    float y2 = x1 * sin(angle) + y1 * cos(angle);
    point.x = x2 + center.x;
    point.y = y2 + center.y;
    return point;
  }

  //Update the spring behaviour
  float springupdate() {
    float currentDistance = 10*cos(frameCount*0.05); //Calculate the rest length of the spring
    //return currentDistance;
    return currentDistance;
  }
}
