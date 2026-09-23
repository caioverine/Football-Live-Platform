package com.flp.footballliveplatform.entity;

import jakarta.persistence.*;
import lombok.Getter;

import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Table(name = "championship_season")
public class CompetitionSeason implements Serializable {

    @Id
//    @GeneratedValue
    private Long id;

    @Getter
    @ManyToOne
    @JoinColumn(name = "championship_id")
    private Competition competition;

    @Getter
    @Column(name = "year")
    private Short year;

    @Getter
    @Column(name = "start_date")
    private LocalDate startDate;

    @Getter
    @Column(name = "end_date")
    private LocalDate endDate;

    @Getter
    @Column(name = "status")
    private String status;
}
