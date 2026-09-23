package com.flp.footballliveplatform.repository;

import com.flp.footballliveplatform.entity.Match;
import org.springframework.data.repository.Repository;

import java.util.List;

public interface MatchRepository extends Repository<Match, Long> {

    List<Match> findAll();

    Match findById(Long id);
}
