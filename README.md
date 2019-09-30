# DerivcoFootball

## Description

## API

  **/api/json/league_season_pairs**

  Retrieve all of the unique combinations of league (aka 'div')
  and season. Together these form a "primary key" for the results.
  As such, this endpoint should be called at least once so the
  results APIs can be called. Those APIs require a vaild league
  season pair as a parameter.

  This particular endpoint returns the league/season pairs in
  JSON.
  
  **/api/json/league_season_results/:league_season_pair**

  Retrieve all the game results for a league (aka 'div') and
  season.

  This particular endpoint returns game results in
  JSON.

  **/api/protobuf/league_season_pairs**

  Retrieve all of the unique combinations of league (aka 'div')
  and season. Together these form a "primary key" for the results.
  As such, this endpoint should be called at least once so the
  results APIs can be called. Those APIs require a vaild league
  season pair as a parameter.

  This particular endpoint returns the league/season pairs in
  a Protocal Buffer.
  
  **/api/protobuf/league_season_results/:league_season_pair**  

  Retrieve all the game results for a league (aka 'div') and
  season.

  This particular endpoint returns game results in
  a Protocol Buffer.


## Architecture


## Installation

## Things You'll Want to Know

