package com.flp.footballliveplatform.repository;

import com.flp.footballliveplatform.entity.Competition;
import org.springframework.data.repository.Repository;

import java.util.List;

public interface CompetitionRepository extends Repository<Competition, Long> {

    List<Competition> findAll();
}
