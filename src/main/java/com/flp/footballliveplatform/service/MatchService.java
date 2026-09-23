package com.flp.footballliveplatform.service;

import com.flp.footballliveplatform.dto.match.MatchResponse;
import com.flp.footballliveplatform.entity.Match;
import com.flp.footballliveplatform.repository.MatchRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MatchService {

    private final MatchRepository matchRepository;

    public List<MatchResponse> getMatches() {
        List<Match> matches = matchRepository.findAll();
        return convertListMatchToResponse(matches);
    }

    public MatchResponse getMatch(Long id) {
        Match match = matchRepository.findById(id);
        return convertMatchToResponse(match);
    }

    private MatchResponse convertMatchToResponse(Match match) {
        return new MatchResponse(
                match.getId(),
                match.getCompetitionSeason().getCompetition().getName() + " - " + match.getCompetitionSeason().getYear(),
                match.getScheduledAt(),
                match.getHomeTeam().getTeam().getName(),
                match.getAwayTeam().getTeam().getName(),
                match.getArena().getName(),
                match.getStatus(),
                match.getHomeScore(),
                match.getAwayScore());
    }

    private List<MatchResponse> convertListMatchToResponse(List<Match> matches) {
        List<MatchResponse> matchResponses = new ArrayList<>();

        matches.forEach(match -> {
            matchResponses.add(convertMatchToResponse(match));
                }
        );

        return matchResponses;
    }
}
