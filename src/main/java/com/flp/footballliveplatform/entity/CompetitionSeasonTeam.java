package com.flp.footballliveplatform.entity;

import jakarta.persistence.*;
import lombok.Getter;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "championship_season_club")
public class CompetitionSeasonTeam implements Serializable {

    @Id
//    @GeneratedValue
    private Long id;

    @Getter
    @ManyToOne
    @JoinColumn(name = "championship_season_id")
    private CompetitionSeason competitionSeason;

    @Getter
    @ManyToOne
    @JoinColumn(name = "club_id")
    private Team team;

    @Getter
    @Column(name = "registered_at")
    private LocalDateTime registeredAt;

    @Getter
    @Column(name = "status")
    private String status;
}
