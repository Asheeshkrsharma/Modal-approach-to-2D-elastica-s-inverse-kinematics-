// Author: Asheesh Sharma
// Msc project
// University of Bristol

// A rectangular box

import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.Stream;

class IK {

  float length;
  float a1 = 0;
  float a2 = 0;
  FloatList X1 = new FloatList();
  FloatList X2 = new FloatList();
  // Constructor
  IK(float l) {
    length = l;
  }

  // Drawing the box
  void solve(float xee, float yee, boolean negative) {
    
    // Map the actual coordinates to between 0 and 1
    xee = map(xee, 0, width, -1., 1.);
    yee = map(yee, 0, height, +1., -1.);
    
    //print(xee, yee);
    //xee = 0.3433;
    //yee = 0.2733;
    
    float S = 1;
    float L = 1;
    int numPoints = 200;
    
    // a₂ = Arctan2(xee, yee) equation 16
    a2 = atan2(xee, yee);

    // Calculating the inverse bessel function
    // xee = sin(a₂(t)) J₀[√(a₁²(t) +a₂²(t))]
    // or J₀[√(a₁²(t) + a₂²(t))] = xee / sin(a₂(t))
    // or J₀-¹ (xee / sin(a₂)) = J₀-¹ (J₀[√(a₁²(t) + a₂²(t))])
    
    // It can be shown that J₀-¹J₀(x) = 1, for 0<x<μ where μ
    // is the first local minima.
    // => a₁ = √(J₀-¹(xee / sin(a₂))² - a₂²(t)) ... eq(1)
    // let μn = [0 ... μ] be an equidistant list in range (0, μ)
    // let x = xee / sin(a₂), xamin = argmin(abs(x - J₀(μn)))
    // Then J₀-¹(xee / sin(a₂) can re-written as the value of
    // μn at xamin

    float xn[] = new float[3832];
    for (int i=0; i<3832; i++) {
      xn[i] = abs(xee / sin(a2) - j0[i]);
    }

    int xamin = argMin(xn);
    // then a₁ = √(μn[xamin])² - a₂²(t))
    a1 = sqrt(pow(muN[xamin], 2) - pow(a2, 2));
    if (negative) {a1 = -a1;}
    
    X1 = new FloatList();
    X2 = new FloatList();
    
    float step = S / numPoints;
    for (float s = 0; s < S + step; s += step) {
      X1.append(x1js(L, 0., s, 50));
      X2.append(x2js(L, 0., s, 50));
    }

    IntList indeces = linspace(0, X1.size(), 10, true);

    FloatList X1b = new FloatList();
    FloatList X2b = new FloatList();
    for (int i=0; i<indeces.size(); i++) {
      X1b.append(map(X1.get(indeces.get(i)), -1., 1, -200, 200)+ 200);
      X2b.append(map(X2.get(indeces.get(i)), 1., -1, -200, 200)+ 200);
    }
    X1 = X1b;
    X2 = X2b;
    //println("----------_");
    //println(X1, X2);
  }

  float x1js(float L, float a, float b, int N){
    //Simpson's rule approximates the integral \int_a^b f(x) dx by the sum:
    //(dx/3) \sum_{k=1}^{N/2} (f(x_{2i-2} + 4f(x_{2i-1}) + f(x_{2i}))
    //where x_i = a + i*dx and dx = (b - a)/N.
    float dx = (b - a) / N;
    FloatList x = linspace2(a, b, N+1, true);
    FloatList y = new FloatList();
    
    for (int i=0; i<x.size(); i++){
      y.append(eqA(L, x.get(i)));
    }
    
    FloatList p1 = new FloatList();
    for (int i=0; i<x.size()-1; ){
      p1.append(y.get(i));
      i+=2;
    }
    
    FloatList p2 = new FloatList();
    for (int i=1; i<x.size()-1;){
      p2.append(y.get(i));
      i+=2;
    }
    
    FloatList p3 = new FloatList();
    for (int i=2; i<x.size()-1;){
      p3.append(y.get(i));
     i+=2;
    }
    p3.append(0.); // as this would have one less element then the others
   
    float sum = 0;
    for (int i=0; i<p1.size() -1; i++){
      sum += p1.get(i) + 4 * p2.get(i) + p3.get(i); 
    }
    return dx / 3 * sum;
  }
  
  float x2js(float L, float a, float b, int N){
    //Simpson's rule approximates the integral \int_a^b f(x) dx by the sum:
    //(dx/3) \sum_{k=1}^{N/2} (f(x_{2i-2} + 4f(x_{2i-1}) + f(x_{2i}))
    //where x_i = a + i*dx and dx = (b - a)/N.
    float dx = (b - a) / N;
    FloatList x = linspace2(a, b, N+1, true);
    FloatList y = new FloatList();
    
    for (int i=0; i<x.size(); i++){
      y.append(eqB(L, x.get(i)));
    }
    
    FloatList p1 = new FloatList();
    for (int i=0; i<x.size()-1; ){
      p1.append(y.get(i));
      i+=2;
    }
    
    FloatList p2 = new FloatList();
    for (int i=1; i<x.size()-1;){
      p2.append(y.get(i));
      i+=2;
    }
    
    FloatList p3 = new FloatList();
    for (int i=2; i<x.size()-1;){
      p3.append(y.get(i));
     i+=2;
    }
    p3.append(0.); // as this would have one less element then the others
   
    float sum = 0;
    for (int i=0; i<p1.size() -1; i++){
      sum += p1.get(i) + 4 * p2.get(i) + p3.get(i); 
    }
    return dx / 3 * sum;
  }
  
  float eqA (float L, float s) {
    // ϕ(s) = a₁ sin(2πs) + a₂(1 - cos(2πs)) (equation 14)
    float phis = a1 * sin(2 * PI * s) + a2 * (1 - cos(2  * PI * s));    
    return L * sin(phis);
  }
  
  float eqB (float L, float s){
    // ϕ(s) = a₁ sin(2πs) + a₂(1 - cos(2πs)) (equation 14)
    float phis = a1 * sin(2 * PI * s) + a2 * (1 - cos(2  * PI * s));    
    return L * cos(phis);
  }

  int argMin(float[] a) {
    float v = 99999999999999999.;
    int ind = -1;
    for (int i = 0; i < a.length; i++) {
      if (a[i] < v) {
        v = a[i];
        ind = i;
      }
    }
    return ind;
  }

  IntList linspace(int start, int stop, int num, boolean endpoint) {
    start = start * 1;
    stop = stop * 1;
    IntList ind = new IntList();

    if (num == 1) {
      ind.append(stop);
    }
    int step = 0;
    if (endpoint) {
      step = (stop - start) / (num - 1);
    } else {
      step = (stop - start) / num;
    }
    for (int i=0; i<num; i++) {
      ind.append((int) start + step * i);
    }
    return ind;
  }

  FloatList linspace2(float start, float stop, int num, boolean endpoint) {
    start = start * 1;
    stop = stop * 1;
    FloatList ind = new FloatList();

    if (num == 1) {
      ind.append(stop);
    }
    float step = 0;
    if (endpoint) {
      step = (stop - start) / (float)(num - 1);
    } else {
      step = (stop - start) / (float) num;
    }
    for (int i=0; i<num; i++) {
      ind.append(start + step * i);
    }
    return ind;
  }
  
  void display() {
    //pushMatrix();
    //translate(200, 200);
    //rotate(-radians(180));
    strokeJoin(ROUND);
    strokeWeight(3);
    stroke(255,0,0);
    noFill();
    beginShape();
    curveVertex(X1.get(0), X2.get(0)); // the first control point
    curveVertex(X1.get(0), X2.get(0)); // the first control point
    circle(X1.get(0), X2.get(0), 5);
    for (int i=1; i<X1.size(); i++) {
      curveVertex(X1.get(i), X2.get(i)); // the first control point
      circle(X1.get(i), X2.get(i), 5);
    }
    curveVertex(X1.get(X1.size() - 1), X2.get(X2.size() - 1)); // the first control point 
    endShape();
    stroke(0,0,0);
    //popMatrix();
  }
}
