# DerivcoFootball

## Description

    DerivcoFootball is a simple OTP application to provide football
    data. The data is organized into lines that look like this:
    
    div season     date    home_team  away_team fthg ftag ftr hthg htag htr
    SP1 201617 19/08/2016  La Coruna    Eibar     2    1   H   0    0    D

    When treated as a pair, 'div' (referred to as league in the
    code and some docs) and 'season' act as a "selector" for
    retrieving results. The API is centered around the idea of
    providing the game data based on league/season pairs.
    
    This readme gives a general overview to get you started.
    For a more detailed treatment, look at the @moduledocs and
    the rather extensive code @docs and comments.

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
    
## Installation

    After copying the `DerivcoFootball` directory to your local
    machine do the following:
    
    `cd DerivcoFootball`
    `mix deps.get`
    
    To run for development purposes, i.e., outside of the docker
    environment, use:
    
    `mix run --no halt`
    
    The production version uses three instances of DerivcoFootball,
    load balanced by HAProxy. To launch, use:
    
    `docker-compose up`

## Architecture

    As mentioned above, DerivcoFootball is an OTP application.
    The supervisor launcher two child processes.
    
    A data server, `DerivcoFootball.LeagueDataServer`:
    This is a GenServer that processes the csv game data and
    stores it in etl tables. However the league/season pairs
    are stored as part of the GenServer state. The data is 
    processed once when `init` is called. The etl tables are
    organized by league/season pair, i.e., all the results
    for a league/season pair are contained in the same table.
    This way, given the API specification, there is no reason
    to do any querying, filtering, or other lookups. Though
    orgininally in spreadsheet form, a csv export is used
    in DerivcoFootball. Additionally, as the data is coming
    in from external systems, we're going to make the
    assumption that the data has been validated before it's
    been made avalible. If this weren't the case, we'd have
    to deal with data validation bleeding across all
    system/service boundaries. This makes error handling and
    testing much more complicated and breaks encapsulation.

    A Cowboy-based HTTP server,
    `DerivcoFootball.LeagueDataEndpointServer`:
    As this is a very simple headless HTTP API, there's no
    need for something heavier like a full Phoenix app. Plug
    is used for routing and sending responses.

## Something You'll Want to Know

    ExProtobuf is the library that's used for Protocol Buffer
    encoding. While it seems to have good features, be stable,
    and widely used, its documentation is somewhat lacking.
    So much so that it can be a bit difficult in some cases
    to get encoding to work. If you encounter a problem, I 
    suggest using a lot of `IO.inspects`, minimal test cases,
    and asking someone if you get stuck.
    
