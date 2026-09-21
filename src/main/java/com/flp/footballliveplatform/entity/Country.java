package com.flp.footballliveplatform.entity;

import jakarta.persistence.*;
import lombok.Getter;
import org.hibernate.annotations.JdbcTypeCode;

import java.io.Serializable;
import java.sql.Types;

@Entity
@Table(name = "country")
public class Country implements Serializable {

    @Id
//    @GeneratedValue
    private Long id;

    @Getter
    @Column(nullable = false)
    private String name;

    @Column(name = "iso_code", length = 2, nullable = false)
    @JdbcTypeCode(Types.CHAR)
    private String isoCode;

    protected Country() {}

    public Country(String name, String isoCode) {
        this.name = name;
        this.isoCode = isoCode;
    }
}
