defmodule DerivcoFootball.ProtobufMessages do
  @moduledoc"""
  A Protocol Buffer schema based on the
  ExProtobuf documentation.
  """
  
  use Protobuf, """
    message LeagueSeasonPairs{
      repeated string values = 1;
    }
    
    message LeagueSeasonPairResult{
      required string date = 1;
      required string home_team = 2;
      required string away_team = 3;
      required uint32 fthg = 4;
      required uint32 ftag = 5;
      required string ftr = 6;
      required uint32 hthg = 7;
      required uint32 htag = 8;
      required string htr = 9;
    }

    message LeagueSeasonPairResults{
      repeated LeagueSeasonPairResult leagueSeasonPairResult = 1;
    }
  """
end
