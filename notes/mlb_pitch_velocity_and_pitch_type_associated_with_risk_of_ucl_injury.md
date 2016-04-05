## MLB pitch velocity and pitch type associated with risk of UCL injury
### Keller et al., 2016

#### Introduction

The number of MLB pitchers requiring UCL reconstruction continues to increase, estimates near 25% of MLB pitchers

previous studies have suggested possible risk factors:

* pitching mechanics
* pitch type
* glenohumeral internal rotation deficit
* pitching fatigue
* chronic overuse
* pitch velocity
* other things (see citations 1,5,8,10,20)

biomechanical studies have attempted to correlate pitch types with torque across the throwing elbow

* some suggest fastballs create more torque
* others found off-speed pitches produce increased stresses

this study evaluated whether MLB pitchers who required UCL-R have higher pitching velocities compared with matched MLB controls - ie. is pitch velocity a specific risk factor for subsequent UCL injury

also aimed to assess whether pitchers requiring UCL-R had different pitching patterns in regards to the % of specific pitch types thrown and whether pitching more of a specific pitch increased the risk of injury

#### Methods

pitcher demographics:

* handedness
* DOB
* age at surgery
* position (reliever or starter)
* height
* weight

pitching performance stats were collected for 2 seasons before UCL injury to establish appropriate, uninjured performance velocities

* evaluated against velocities for 2 years after UCL-R to assess any change in velocity attributed to reconstrutive surgery

metrics collected:

* innings pitched
* average seasonal pitch velocities (incl. fastballs, curveballs, sliders, and change-ups)
* percentage of pitch types thrown (incl. fastballs, curveballs, sliders, and change-ups)

control pitchers were matched for size (height & weight), age, and overuse (pitching role: starter vs. reliever, innings pitched, and major league experience)

control selection process:

1. created database of deidentified MLB pitchers
2. players with known history of UCL-R were removed from the group of possible controls. pitchers were not excluded from control groups if they had sustained other injuries to the elbow, shoulder, or other extremities
3. controls then selected via regression model by attributes in the following order: index year, age, size (height & weight), innings pitched, position (reliever vs. starter), MLB experience

index year was based on last season of play before UCL-R for the respective pitcher in the original cohort

##### statistical analysis
case-controled design

cases first described using means, standard deviations, counts, and percentages

differences and associations were tested with a Welch t test or chi-square test for the 6 matching attributes

testing of predictors of UCL-R was done with univariate conditional logistic regression - each parameter was tested separately

odds ratios and 95% confidence intervals were computed via exact partial likelihood estimation

for comparing pitching speeds before and after surgery:

* univariate generalized estimating equations were used with pitching speeds as the dependent var. and time (before, after) as the independent variable
* clustering on match identification

conditional logistic regression was done with surival package

generalized estimating equations were performed using gee package


#### Results

no statistical differences among the controlled demographics

no sig. diff. seen when pitching speeds between the ucl-r pitchers and controls were compared

ucl-r pitchers pitched a significantly higher % of fastballs than control pitchers

regression model for the odds of having UCL-R compared with % of fastballs thrown odds ratio of 1.02 (95% C.I., 1.00-1.03)

* suggests a 2% increase in risk of a UCL injury for every 1% increase in fastballs thrown

Classification and regression tree (CART) model found a unique predictor of UCL injury was pitching 48% fastballs

* still significant after pitch velocity was added to the model
* ALL PITCHERS WHO EXCEEDED THIS THRESHOLD REQUIRED UCL-R

no statistical difference in %  of curveballs, sliders, or change-ups thrown

no stat. difference was found in fastball velocity (specifically) before and after UCL-R

no stat. difference was found in pitch velocity for controls either

#### Discussion

the results suggest that:

* pitch velocity in MLB pitchers does not appear to be a direct risk factor for UCL injury compared with uninjured controls
* pitch type does appear to be a risk factor

biomechanical studies have shown that the moments of force on the shoulder and elbow as well as valgus torque were lower when pitching curveballs compared with fastballs

this study found that pitcher who required UCL-R pitched on average more than 7% more fastballs than control group

* correlated to a 2% increase risk for UCL injury with every 1% increase in fastball % thrown

also found a threshold of 48% of fastballs thrown as a significant predictor of UCL injury

* all pitchers who threw over that threshold required UCL-R
* no such risk increase was seen in curveballs, sliders, or change-ups

Researchers suggest that although pitch velocity doesn't directly lead to a risk of UCL injury, pitching at a high velocity at a higher rate leads to increased risk of injury

overal results suggest that fatigue and overuse due to increased amount of fastballs pitched is associated with risk of UCL rupture

average velocity of pitches thrown was not sigificant, but throwing at a high velocity for a greater percentage of time appears to put more stress on the elbow, leading to more elbow fatigue and overuse and subsequent UCL injury

evaluation of pitching velocity after surgery found no decrease in velocity after return from UCL-R
