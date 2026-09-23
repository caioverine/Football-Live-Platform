package com.flp.footballliveplatform.entity;

import jakarta.persistence.*;
import lombok.Getter;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "game")
public class Match implements Serializable {

    @Getter
    @Id
//    @GeneratedValue
    private Long id;

    @Getter
    @ManyToOne
    @JoinColumn(name = "championship_season_id")
    private CompetitionSeason competitionSeason;

    @Getter
    @Column(name="scheduled_at")
    private LocalDateTime scheduledAt;

    @Getter
    @ManyToOne
    @JoinColumn(name = "home_championship_season_club_id")
    private CompetitionSeasonTeam homeTeam;

    @Getter
    @ManyToOne
    @JoinColumn(name = "away_championship_season_club_id")
    private CompetitionSeasonTeam awayTeam;

    @Getter
    @ManyToOne
    @JoinColumn(name = "stadium_id")
    private Arena arena;

    @Getter
    @Column(name = "status")
    private String status;

    @Getter
    @Column(name = "home_score")
    private Short homeScore;

    @Getter
    @Column(name = "away_score")
    private Short awayScore;
}
