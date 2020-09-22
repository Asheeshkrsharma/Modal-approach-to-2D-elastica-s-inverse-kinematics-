# 2D-Elastica and a modal approach to its inverse kinematics
![](https://github.com/Asheeshkrsharma/Modal-approach-to-2D-elastica-s-inverse-kinematics-/blob/master/resources/Dem.gif)

## The Elastica
The model consists of angular and linear springs, as shown below:

![](https://github.com/Asheeshkrsharma/Modal-approach-to-2D-elastica-s-inverse-kinematics-/blob/master/resources/model.svg)

For details, please have a look at

[Sharma, A., Hauert, S., & Hauser, H. (2020). Morphological communication for swarms. In J. Bongard, J. Lovato, L. Hebert-Dufresne, R. Dasari, & L. Soros (Eds.), Artificial Life Conference Proceedings (Vol. 32, pp. 549-557). Massachusetts Institute of Technology (MIT) Press. https://doi.org/10.1162/isal_a_00300](https://www.mitpressjournals.org/doi/abs/10.1162/isal_a_00300?mobileUi=0)

## The modal approach to Elastica's kinematics

A backbone curve is defined using two modal functions as described in 

[Chirikjian, G. S., & Burdick, J. W. (1994). A modal approach to hyper-redundant manipulator kinematics. IEEE Transactions on Robotics and Automation, 10(3), 343-354.](https://ieeexplore.ieee.org/document/294209)

However, the pose angles were calculated as

![](https://latex.codecogs.com/png.latex?%5Cdpi%7B120%7D%20%5Cfn_cm%20%5Clarge%20%5Ctilde%7Bq%7D_j%20%3D%20arctan%28%5Cfrac%7Bx_1%28s_j%29%20-%20x_1%28s_%7Bj-1%7D%29%7D%7Bx_2%28s_j%29%20-%20x_2%28s_%7Bj-1%7D%29%7D%29)

## Usage
[BackboneCurveGeneration.ipynb](https://github.com/Asheeshkrsharma/Modal-approach-to-2D-elastica-s-inverse-kinematics-/blob/master/BackboneCurveGeneration.ipynb) is a jupyter notebook which computes a 2 modal backbone curve. The end-effector values `xee` and `yee` can be changed to the desired position. The contribution factor `a1` can be negated to get the alternate pose. The given `xee` and `yee` (or commented) are from the above paper and:

[Chirikjian, G. S., & Burdick, J. W. (1990, May). An obstacle avoidance algorithm for hyper-redundant manipulators. In Proceedings., IEEE International Conference on Robotics and Automation (pp. 625-631). IEEE.](https://ieeexplore.ieee.org/document/126052)

The [Elastica Demonstration](https://github.com/Asheeshkrsharma/Modal-approach-to-2D-elastica-s-inverse-kinematics-/tree/master/Elastica%20Demonstration) contains a processing sketch which demonstrates the inverse kinematics and the physical demonstration of a two dimensional stretchable spring.
