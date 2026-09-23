package com.flp.footballliveplatform.entity;

import jakarta.persistence.*;
import lombok.Getter;

import java.io.Serializable;

@Entity
@Table(name = "stadium")
public class Arena implements Serializable {

    @Id
//    @GeneratedValue
    private Long id;

    @Getter
    @Column(nullable = false)
    private String name;

    @Getter
    @Column(nullable = false)
    private String city;

    @Getter
    @Column(nullable = true)
    private String state;

    @Getter
    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country;

    @Getter
    @Column(nullable = true)
    private Integer capacity;
}
