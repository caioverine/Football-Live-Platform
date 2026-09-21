package com.flp.footballliveplatform.service;

import com.flp.footballliveplatform.dto.competition.CompetitionResponse;
import com.flp.footballliveplatform.entity.Competition;
import com.flp.footballliveplatform.repository.CompetitionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CompetitionService {

    private final CompetitionRepository competitionRepository;

    public List<CompetitionResponse> getCompetitions(){
        List<Competition> competitions = competitionRepository.findAll();
        return convertListCompetitionToResponse(competitions);
    }

    private CompetitionResponse convertCompetitionToResponse(Competition competition) {
        return new CompetitionResponse(null, competition.getName(), competition.getCountry().getName());
    }

    private List<CompetitionResponse> convertListCompetitionToResponse(List<Competition> competitions) {
        List<CompetitionResponse> competitionResponses = new ArrayList<>();

        competitions.forEach(competition -> {
                competitionResponses.add(convertCompetitionToResponse(competition));
            }
        );

        return competitionResponses;
    }
}
