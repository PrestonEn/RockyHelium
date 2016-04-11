### TODO: 4P76 Project

#### Prep

[x] get db details for injury database

[ ] get pitchf/x data  - use R package?

[ ] power analysis for regression analysis

[ ] build up data sets

    for all index years (2010, 2011, 2012, 2013, 2014, 2015)
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

