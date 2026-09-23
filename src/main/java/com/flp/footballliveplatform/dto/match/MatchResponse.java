package com.flp.footballliveplatform.dto.match;

import java.time.LocalDateTime;

public record MatchResponse(
        Long id,
        String competitionSeason,
        LocalDateTime scheduledAt,
        String homeTeam,
        String awayTeam,
        String arena,
        String status,
        Short homeScore,
        Short awayScore
) {
}
