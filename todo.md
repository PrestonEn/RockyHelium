### TODO: 4P76 Project

#### Prep

**See [Project Proposal](https://github.com/PrestonEn/RockyHelium/blob/master/4p76_project_proposal.md) for details on required data**

[x] get db details for injury database

[ ] scrape pitchf/x data from [Brooks Baseball](http://www.brooksbaseball.net/)

* [Primer of pitchf x](https://fastballs.wordpress.com/2010/04/18/a-pitchfx-primer/)

[ ] scrape fip constants from [FanGraphs](http://www.fangraphs.com/leaders.aspx?pos=all&stats=pit&lg=all&qual=0&type=2&season=2014&month=0&season1=2002&ind=0&team=0,ss&rost=0&age=&filter=&players=0)

[ ] scrape league avg HR / FB rate from [FanGraphs](http://www.fangraphs.com/guts.aspx?type=cn)

[ ] scrape HR, BB, HBP, KO, IP from Lahmen R package

[ ] power analysis for regression analysis

[ ] build up data sets

    for all index years (2010, 2011, 2012, 2013, 2014)
	    grab pitchers for index year with "UCL Reconstruction" contained in descDetails
	    	does pitcher have prior injury data for same year?
	    		encode this somehow - # of days on DL?
	    for these pitchers grab pitchF/x data for 2 prior seasons
	    	use to calculate advanced stats for players

	for each pitcher in injury set above need to match with non TJS pitcher
		match based on demographic details
			ex. age, height, weight, throwing arm, etc. (see prev. studies)

Data should be formatted something like

* name, mlbam_id, index_year, prior_injury_stats, performance_stats
* prior_injury_stats and performance_stats will likely be multiple columns

#### Coding

[ ] regression analysis (R?)

[ ] use NN from A1 or just use R pkg?

#### Report

[ ] introduction

[ ] lit review

[ ] algorithm overview

[ ] results analysis

[ ] discussion

[ ] conclusion
