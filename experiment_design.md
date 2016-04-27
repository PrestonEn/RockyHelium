## Experiment Design

extract all TJS and control players that have 3 consecutive years of pitchfxs, pitchcnt, and stats available

bin these by most recent year and select an equal number of cases and controls based on bin year

this will be the data set used for regression and neural network analysis

if the data set appears to be too small we can reduce consecutive years to only 2 (iyr and hyr)

#### input data format:

mlbam_id, group, \*yr\_fips, \*yr\_maxmph\_\*pitchtype, \*yr\_mph\_\*pitchtype, \*yr\_pfx\_x\_\*pitchtype, \*yr\_pfx\_z\_\*pitchtype, \*yr\_bway\_\*pitchtype, \*yr\_hloc\_\*pitchtype, \*yr\_vloc\_\*pitchtype, \*yr\_pitchcnt\_\*pitchtype

\*yr =

- gyr = index year - 2
- hyr = index year - 1
- iyr = index year

*pitchtype =

- Change
- Curve
- Cutter
- Fourseam
- Knuckler
- Sinker
- Slider
- Slow.Curve
- Split

group = 0 or 1 (control or case)

fips = fips scores from stats_tjs_pitchers_clean.csv and stats_control_pitchers_clean.csv

maxmph to vloc = pfx_var for each pitch type from pitchfx_tjs_pitchers.csv and pitchfx_controls_pitchers.csv

pitchcnt = pitch counts for each pitch type from pitchcnt_tjs_pitchers.csv and pitchcnt_control_pitchers.csv