# 2D-Elastica and a modal approach to its inverse kinematics
<p align="center">
  <img src="https://github.com/Asheeshkrsharma/Modal-approach-to-2D-elastica-s-inverse-kinematics-/blob/master/resources/Dem.gif" width="284" title="hover text">
  <img src="https://github.com/Asheeshkrsharma/Modal-approach-to-2D-elastica-s-inverse-kinematics-/blob/master/resources/Hyper-redundant-waveguide-manipulator.gif" width="430" alt="accessibility text">
</p>

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

### Usage
[BackboneCurveGeneration.ipynb](https://github.com/Asheeshkrsharma/Modal-approach-to-2D-elastica-s-inverse-kinematics-/blob/master/BackboneCurveGeneration.ipynb) is a jupyter notebook which computes a 2 modal backbone curve. The end-effector values `xee` and `yee` can be changed to the desired position. The contribution factor `a1` can be negated to get the alternate pose. The given `xee` and `yee` (or commented) are from the above paper and:

[Chirikjian, G. S., & Burdick, J. W. (1990, May). An obstacle avoidance algorithm for hyper-redundant manipulators. In Proceedings., IEEE International Conference on Robotics and Automation (pp. 625-631). IEEE.](https://ieeexplore.ieee.org/document/126052)

[Fahimi, F. (2009). Autonomous robots. Modeling, Path Planning and Control.](https://link.springer.com/book/10.1007%2F978-0-387-09538-7)

The [Elastica Demonstration](https://github.com/Asheeshkrsharma/Modal-approach-to-2D-elastica-s-inverse-kinematics-/tree/master/Elastica%20Demonstration) contains a processing sketch which demonstrates the inverse kinematics and the physical demonstration of a two dimensional stretchable spring.

### Recomendation
[Mcharg, E. (1965). Erwin Kreyszig, Differential Geometry (2nd ed., Mathematical Expositions No. 11, Toronto and Oxford University Presses, 1964), pp. 377, 68s. Proceedings of the Edinburgh Mathematical Society, 14(4), 339-339. doi:10.1017/S0013091500009032](https://www.cambridge.org/core/journals/proceedings-of-the-edinburgh-mathematical-society/article/kreyszigerwin-differential-geometry-2nd-ed-mathematical-expositions-no-11-toronto-and-oxford-university-presses-1964-pp-377-68s/2C165E4607BEDC69322BE10934EF270F)

[Fahimi, F. (2009). Autonomous robots. Modeling, Path Planning and Control.](https://link.springer.com/book/10.1007%2F978-0-387-09538-7)

## Inverse kinemetics of a hyper-redundant optical waveguide

[Optical-inverse-kinematics-of-a-Hyper-Redundant-Manipulator-Waveguide.ipynb](https://github.com/Asheeshkrsharma/Modal-approach-to-2D-elastica-s-inverse-kinematics-/blob/master/Optical-inverse-kinematics-of-a-Hyper-Redundant-Manipulator-Waveguide.ipynb)

In this notebook, we look at a unique hyper-redundant manipulator which is controlled by manipulating light to create bends as per the modal approach. The objective of this notebook is to visualize the refractive index field as it would look like inside a waveguide with a given back-bone curve. Using this field we can highlight certain areas where the intensity of light must increased.

### Recomendation
[Cao, Yinghui & Mittra, Raj & Liu, Zhenyu & Zheng, Jie. (2017). Sharp bend in two-dimensional optical waveguide based on gradient refractive index structure. Applied Optics. 56. 5336. 10.1364/AO.56.005336. ](https://www.osapublishing.org/ao/abstract.cfm?uri=ao-56-19-5336)
