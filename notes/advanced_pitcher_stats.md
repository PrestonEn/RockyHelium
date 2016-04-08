## Advanced Pitcher Stats

#### FIP

*Reference*: [FIP: Fan Graphs](http://www.fangraphs.com/library/pitching/fip/)

FIP is a measurement of a pitcher’s performance that strips out the role of defense, luck, and sequencing, making it a more stable indicator of how a pitcher actually performed over a given period of time than a runs allowed based statistic that would be highly dependent on the quality of defense played behind him

Certain pitchers have shown an ability to consistently post lower ERAs than their FIP suggests, but overall FIP captures most pitchers’ true performance quite well

**Equation**

    FIP = ((13*HR)+(3*(BB+HBP))-(2*K))/IP + constant

The constant is solely to bring FIP onto an ERA scale and is generally around 3.10

[Historic FIP constants](http://www.fangraphs.com/guts.aspx?type=cn)

FIP is designed so that league average ERA and league average FIP are the same. To find the constant for any year, all you need to do is the following:

    FIP Constant = lgERA – (((13*lgHR)+(3*(lgBB+lgHBP))-(2*lgK))/lgIP)
    
The individual weights for home runs, walks/HBP, and strikeouts are based on the relative values of those actions with respect to run prevention

ERA or RA9 do a terrific job telling us how many runs were scored while the pitched was on the mound, but they do not necessarily tell us how well the pitcher performed because the number of runs a pitcher allowed is also dependent on their defense, luck, and the order in which events happened (often called sequencing)

FIP is an attempt to isolate the performance of the pitcher by using only those outcomes we know do not involve luck on balls in play or defense; strikeouts, walks, hit batters, and home runs allowed

Essentially, FIP is an attempt to measure how well a pitcher actually performed independent of factors outside of his control that contribute to runs allowed based statistics. FIP is not perfect and there are certain pitchers who have the skills to allow fewer runs than their FIP suggests, but they are reasonably rare and FIP remains highly accurate and extremely simple at the same time.

using FIP is extremely easy because it’s designed to look exactly like ERA. This means that you can read and use FIP exactly like you would typically use ERA. If a pitcher has a 3.15 FIP, that’s just like saying they have a 3.15 ERA as far as making comparisons among players is concerned.

using FIP requires a bit of caution and it is best to think of it as a starting place for the analysis of pitcher performance, especially if you are interesting in determining how a pitcher is likely to perform in the future

#### xFIP

*Reference*: [xFIP: Fan Graphs](http://www.fangraphs.com/library/pitching/xfip/)

Expected Fielding Independent Pitching (xFIP) is a regressed version of Fielding Independent Pitching (FIP). It’s calculated in the same way as FIP, except it replaces a pitcher’s home run total with an estimate of how many home runs they should have allowed given the number of fly balls they surrendered while assuming a league average home run to fly ball percentage (between 9 and 10% depending on the year).

Home run rates are generally unstable over time and fluctuate around league-average, so by estimating a pitcher’s home run total, xFIP attempts to isolate a player’s ability level. 

HR/FB ratios can be very difficult to predict because they contain a lot of noise, so xFIP attempts to correct for that and provide you with a sense of the pitcher’s underlying performance.

In traditional FIP, you would use the pitcher’s home run total, but in xFIP, you derive an expected number of home runs by taking the pitcher’s fly balls allowed multiplied by the league average home run per fly ball rate.

[League average HR/FB%](http://www.fangraphs.com/leaders.aspx?pos=all&stats=pit&lg=all&qual=0&type=2&season=2014&month=0&season1=2002&ind=0&team=0,ss&rost=0&age=&filter=&players=0)

    xFIP = ((13*(Fly balls * lgHR/FB%))+(3*(BB+HBP))-(2*K))/IP + constant
    
constant is same as normal FIP (see above)

moving from FIP to xFIP is useful because it tries to remove some of the randomness in the pitcher’s actual performance

the number of fly balls that go for home runs is very sensitive to sample size meaning that over the course of a season, the number of home runs a pitcher allows may be higher or lower than their true talent indicates. This is not to say pitcher’s aren’t responsible for the home runs they did allow, but rather to say that if you want to judge about how well they pitched, xFIP will remove some of those fluctuations in HR/FB% and will give you a better idea

**_not sure this is really better than normal FIP for our purposes_**

#### SIERA

*Reference:* [SIERA: Fan Graphs](http://www.fangraphs.com/library/pitching/siera/)

