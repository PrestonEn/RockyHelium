### 4P76 Project Proposal

#### Demographic controls

handedness

age

position (reliever or starter)

height

weight

#### Inputs

    index year: year tjs player had surgery
    tjs: (boolean) is the player in tjs class
    for index year, index year - 1 & index year - 2
        fip: fielding independent pitching stat (see ref. for calculation)
        for each pitch type (pitchf/x data from brooksbaseball.net)
            avg release speed
            max release speed
            horizontal movement
            vertical movement
            vertical movement + gravity
            horizontal release point
            vertical release point
            horizontal pitch location
            vertical pitch location
            grooved pitches
        prior elbow injury
        number of days on dl prior to prior to injury

*Pitchf/x data:* values should be taken based on year

* deeper analysis of month, game can talked about in future directions part of discussion.

*FIP:* these calculations require

* home runs
* walks
* hit by pitch
* strikeouts
* innings pitched
* fip constant


#### Methods to be used

Linear Regression

Neural Network

##### Statistics

Power analysis for all inputs

Test for normality?

T-tests?

ANOVA?

Compare within group before and after index year

Compare between groups before and after index year