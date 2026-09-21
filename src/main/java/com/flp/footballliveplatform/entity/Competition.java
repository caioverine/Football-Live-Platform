package com.flp.footballliveplatform.entity;

import jakarta.persistence.*;
import lombok.Getter;

import java.io.Serializable;

@Entity
@Table(name = "championship")
public class Competition implements Serializable {

    @Id
//    @GeneratedValue
    private Long id;

    @Getter
    @Column(nullable = false)
    private String name;

    @Getter
    @ManyToOne
    @JoinColumn(name="country_id")
    private Country country;

    protected Competition(){}

    public Competition(String name, Country country) {
        this.name = name;
        this.country = country;
    }

}
