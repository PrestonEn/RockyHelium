SELECT
    players.key_mlbam,
    players.name_last,
    players.name_first,
    players.birth_year,
    players.birth_month,
    players.birth_day,
    players.bats,
    players.throws,
    players.height,
    players.weight,
    players.key_fangraphs,
    dl.dl_id,
    dl.isPrevYear,
    dl.isMESY,
    dl.prev_dl_id,
    dl.isReagg,
    dl.DateOn,
    dl.DateOff,
    dl.newPosition,
    dl.newdxDesc,
    dl.descDetail,
    dl.newSide,
    dl.Surgery_Date,
    dl.isYrEnd,
    dl.isNonDL15,
    dl.isKnownInjection,
    dl.isSurgery,
    dl.newMechanism,
    dl.newMechDetail
FROM
    baseballic_dl_list1.dl
JOIN baseballic_dl_list1.players ON players.key_mlbam = dl.mlbamID
WHERE
    dl.newBPD = 12 AND
    dl.newLevel = 1
;
