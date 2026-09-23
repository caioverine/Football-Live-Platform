package com.flp.footballliveplatform.entity;

import jakarta.persistence.*;
import lombok.Getter;

import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Table(name = "club")
public class Team implements Serializable {

    @Id
//    @GeneratedValue
    private Long id;

    @Getter
    @Column(nullable = false)
    private String name;

    @Getter
    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country;

    @Getter
    @Column(name = "state")
    private String state;

    @Getter
    @ManyToOne
    @JoinColumn(name = "stadium_id")
    private Arena arena;

    @Getter
    @Column(name = "founded_at")
    private LocalDate foundedAt;
}
