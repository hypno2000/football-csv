defmodule DerivcoFootball.LeagueData do
  @moduledoc"""
  The data, and a subset for test, in csv format.

  As the data is coming in from external systems,
  we're going to make the assumption that the data
  has been validated before it's been made avalible.
  If this weren't the case, we'd have to deal with
  data validation bleeding across all system/service
  boundaries. This makes error handling and testing
  much more complicated and breaks encapsulation.
  """

  @doc"""
  A simple function to return the data with a special
  case for testing because Mock isn't able to change
  csvData outside of the actual test code. So we'll
  conditionally change the data based on if we're in
  the test environment. The test data set include all
  the unique league season pairs in the full data set.
  """
  def csvData() do
    if Mix.env() == :test do
      """
      SP1,201617,20/08/2016,Barcelona,Betis,6,2,H,3,1,H
      SP1,201516,30/04/2016,Ath Madrid,Vallecano,1,0,H,0,0,D
      SP2,201617,11/06/2017,Numancia,Mirandes,0,2,A,0,0,D
      SP2,201516,22/08/2015,Alcorcon,Mallorca,2,0,H,1,0,H
      E0,201617,21/08/2016,West Ham,Bournemouth,1,0,H,0,0,D
      D1,201617,13/05/2017,Freiburg,Ingolstadt,1,1,D,1,1,D
      """
    else
      """
      SP1,201617,19/08/2016,La Coruna,Eibar,2,1,H,0,0,D
      SP1,201617,19/08/2016,Malaga,Osasuna,1,1,D,0,0,D
      SP1,201617,20/08/2016,Barcelona,Betis,6,2,H,3,1,H
      SP1,201617,20/08/2016,Granada,Villarreal,1,1,D,0,0,D
      SP1,201617,20/08/2016,Sevilla,Espanol,6,4,H,3,3,D
      SP1,201617,21/08/2016,Ath Madrid,Alaves,1,1,D,0,0,D
      SP1,201617,21/08/2016,Sociedad,Real Madrid,0,3,A,0,2,A
      SP1,201617,21/08/2016,Sp Gijon,Ath Bilbao,2,1,H,0,0,D
      SP1,201617,22/08/2016,Celta,Leganes,0,1,A,0,0,D
      SP1,201617,22/08/2016,Valencia,Las Palmas,2,4,A,2,3,A
      SP1,201617,26/08/2016,Betis,La Coruna,0,0,D,0,0,D
      SP1,201617,26/08/2016,Espanol,Malaga,2,2,D,1,0,H
      SP1,201617,27/08/2016,Eibar,Valencia,1,0,H,0,0,D
      SP1,201617,27/08/2016,Leganes,Ath Madrid,0,0,D,0,0,D
      SP1,201617,27/08/2016,Osasuna,Sociedad,0,2,A,0,1,A
      SP1,201617,27/08/2016,Real Madrid,Celta,2,1,H,0,0,D
      SP1,201617,28/08/2016,Alaves,Sp Gijon,0,0,D,0,0,D
      SP1,201617,28/08/2016,Ath Bilbao,Barcelona,0,1,A,0,1,A
      SP1,201617,28/08/2016,Las Palmas,Granada,5,1,H,1,1,D
      SP1,201617,28/08/2016,Villarreal,Sevilla,0,0,D,0,0,D
      SP1,201617,09/09/2016,Sociedad,Espanol,1,1,D,0,0,D
      SP1,201617,10/09/2016,Barcelona,Alaves,1,2,A,0,1,A
      SP1,201617,10/09/2016,Celta,Ath Madrid,0,4,A,0,0,D
      SP1,201617,10/09/2016,Malaga,Villarreal,0,2,A,0,2,A
      SP1,201617,10/09/2016,Real Madrid,Osasuna,5,2,H,3,0,H
      SP1,201617,10/09/2016,Sevilla,Las Palmas,2,1,H,0,1,A
      SP1,201617,11/09/2016,Granada,Eibar,1,2,A,0,1,A
      SP1,201617,11/09/2016,La Coruna,Ath Bilbao,0,1,A,0,1,A
      SP1,201617,11/09/2016,Sp Gijon,Leganes,2,1,H,2,0,H
      SP1,201617,11/09/2016,Valencia,Betis,2,3,A,0,1,A
      SP1,201617,16/09/2016,Betis,Granada,2,2,D,1,2,A
      SP1,201617,17/09/2016,Ath Madrid,Sp Gijon,5,0,H,3,0,H
      SP1,201617,17/09/2016,Eibar,Sevilla,1,1,D,0,1,A
      SP1,201617,17/09/2016,Las Palmas,Malaga,1,0,H,1,0,H
      SP1,201617,17/09/2016,Leganes,Barcelona,1,5,A,0,3,A
      SP1,201617,18/09/2016,Ath Bilbao,Valencia,2,1,H,2,1,H
      SP1,201617,18/09/2016,Espanol,Real Madrid,0,2,A,0,1,A
      SP1,201617,18/09/2016,Osasuna,Celta,0,0,D,0,0,D
      SP1,201617,18/09/2016,Villarreal,Sociedad,2,1,H,2,1,H
      SP1,201617,19/09/2016,Alaves,La Coruna,0,0,D,0,0,D
      SP1,201617,20/09/2016,Malaga,Eibar,2,1,H,1,1,D
      SP1,201617,20/09/2016,Sevilla,Betis,1,0,H,0,0,D
      SP1,201617,21/09/2016,Barcelona,Ath Madrid,1,1,D,1,0,H
      SP1,201617,21/09/2016,Celta,Sp Gijon,2,1,H,0,0,D
      SP1,201617,21/09/2016,Granada,Ath Bilbao,1,2,A,1,1,D
      SP1,201617,21/09/2016,Real Madrid,Villarreal,1,1,D,0,1,A
      SP1,201617,21/09/2016,Sociedad,Las Palmas,4,1,H,3,0,H
      SP1,201617,22/09/2016,La Coruna,Leganes,1,2,A,1,0,H
      SP1,201617,22/09/2016,Osasuna,Espanol,1,2,A,0,1,A
      SP1,201617,22/09/2016,Valencia,Alaves,2,1,H,1,1,D
      SP1,201617,23/09/2016,Betis,Malaga,1,0,H,1,0,H
      SP1,201617,24/09/2016,Ath Bilbao,Sevilla,3,1,H,1,0,H
      SP1,201617,24/09/2016,Eibar,Sociedad,2,0,H,0,0,D
      SP1,201617,24/09/2016,Las Palmas,Real Madrid,2,2,D,1,1,D
      SP1,201617,24/09/2016,Sp Gijon,Barcelona,0,5,A,0,2,A
      SP1,201617,25/09/2016,Ath Madrid,La Coruna,1,0,H,0,0,D
      SP1,201617,25/09/2016,Espanol,Celta,0,2,A,0,0,D
      SP1,201617,25/09/2016,Leganes,Valencia,1,2,A,1,1,D
      SP1,201617,25/09/2016,Villarreal,Osasuna,3,1,H,3,1,H
      SP1,201617,26/09/2016,Alaves,Granada,3,1,H,0,0,D
      SP1,201617,30/09/2016,Sociedad,Betis,1,0,H,0,0,D
      SP1,201617,01/10/2016,Granada,Leganes,0,1,A,0,0,D
      SP1,201617,01/10/2016,La Coruna,Sp Gijon,2,1,H,1,0,H
      SP1,201617,01/10/2016,Osasuna,Las Palmas,2,2,D,2,0,H
      SP1,201617,01/10/2016,Sevilla,Alaves,2,1,H,0,0,D
      SP1,201617,02/10/2016,Celta,Barcelona,4,3,H,3,0,H
      SP1,201617,02/10/2016,Espanol,Villarreal,0,0,D,0,0,D
      SP1,201617,02/10/2016,Malaga,Ath Bilbao,2,1,H,0,1,A
      SP1,201617,02/10/2016,Real Madrid,Eibar,1,1,D,1,1,D
      SP1,201617,02/10/2016,Valencia,Ath Madrid,0,2,A,0,0,D
      SP1,201617,14/10/2016,Las Palmas,Espanol,0,0,D,0,0,D
      SP1,201617,15/10/2016,Ath Madrid,Granada,7,1,H,2,1,H
      SP1,201617,15/10/2016,Barcelona,La Coruna,4,0,H,3,0,H
      SP1,201617,15/10/2016,Betis,Real Madrid,1,6,A,0,4,A
      SP1,201617,15/10/2016,Leganes,Sevilla,2,3,A,0,1,A
      SP1,201617,16/10/2016,Alaves,Malaga,1,1,D,1,0,H
      SP1,201617,16/10/2016,Ath Bilbao,Sociedad,3,2,H,0,1,A
      SP1,201617,16/10/2016,Sp Gijon,Valencia,1,2,A,1,1,D
      SP1,201617,16/10/2016,Villarreal,Celta,5,0,H,3,0,H
      SP1,201617,17/10/2016,Eibar,Osasuna,2,3,A,2,2,D
      SP1,201617,21/10/2016,Osasuna,Betis,1,2,A,0,1,A
      SP1,201617,22/10/2016,Espanol,Eibar,3,3,D,0,3,A
      SP1,201617,22/10/2016,Granada,Sp Gijon,0,0,D,0,0,D
      SP1,201617,22/10/2016,Sociedad,Alaves,3,0,H,1,0,H
      SP1,201617,22/10/2016,Valencia,Barcelona,2,3,A,0,1,A
      SP1,201617,23/10/2016,Celta,La Coruna,4,1,H,1,1,D
      SP1,201617,23/10/2016,Malaga,Leganes,4,0,H,2,0,H
      SP1,201617,23/10/2016,Real Madrid,Ath Bilbao,2,1,H,1,1,D
      SP1,201617,23/10/2016,Sevilla,Ath Madrid,1,0,H,0,0,D
      SP1,201617,23/10/2016,Villarreal,Las Palmas,2,1,H,0,1,A
      SP1,201617,28/10/2016,Leganes,Sociedad,0,2,A,0,1,A
      SP1,201617,29/10/2016,Alaves,Real Madrid,1,4,A,1,2,A
      SP1,201617,29/10/2016,Ath Madrid,Malaga,4,2,H,3,1,H
      SP1,201617,29/10/2016,Barcelona,Granada,1,0,H,0,0,D
      SP1,201617,29/10/2016,Sp Gijon,Sevilla,1,1,D,1,1,D
      SP1,201617,30/10/2016,Ath Bilbao,Osasuna,1,1,D,1,1,D
      SP1,201617,30/10/2016,Betis,Espanol,0,1,A,0,0,D
      SP1,201617,30/10/2016,Eibar,Villarreal,2,1,H,0,1,A
      SP1,201617,30/10/2016,Las Palmas,Celta,3,3,D,0,3,A
      SP1,201617,31/10/2016,La Coruna,Valencia,1,1,D,1,0,H
      SP1,201617,04/11/2016,Malaga,Sp Gijon,3,2,H,1,1,D
      SP1,201617,05/11/2016,Granada,La Coruna,1,1,D,0,0,D
      SP1,201617,05/11/2016,Las Palmas,Eibar,1,0,H,0,0,D
      SP1,201617,05/11/2016,Osasuna,Alaves,0,1,A,0,0,D
      SP1,201617,05/11/2016,Sociedad,Ath Madrid,2,0,H,0,0,D
      SP1,201617,06/11/2016,Celta,Valencia,2,1,H,1,1,D
      SP1,201617,06/11/2016,Espanol,Ath Bilbao,0,0,D,0,0,D
      SP1,201617,06/11/2016,Real Madrid,Leganes,3,0,H,2,0,H
      SP1,201617,06/11/2016,Sevilla,Barcelona,1,2,A,1,1,D
      SP1,201617,06/11/2016,Villarreal,Betis,2,0,H,1,0,H
      SP1,201617,18/11/2016,Betis,Las Palmas,2,0,H,2,0,H
      SP1,201617,19/11/2016,Ath Madrid,Real Madrid,0,3,A,0,1,A
      SP1,201617,19/11/2016,Barcelona,Malaga,0,0,D,0,0,D
      SP1,201617,19/11/2016,Eibar,Celta,1,0,H,1,0,H
      SP1,201617,19/11/2016,La Coruna,Sevilla,2,3,A,2,1,H
      SP1,201617,20/11/2016,Alaves,Espanol,0,1,A,0,0,D
      SP1,201617,20/11/2016,Ath Bilbao,Villarreal,1,0,H,0,0,D
      SP1,201617,20/11/2016,Sp Gijon,Sociedad,1,3,A,1,1,D
      SP1,201617,20/11/2016,Valencia,Granada,1,1,D,0,1,A
      SP1,201617,21/11/2016,Leganes,Osasuna,2,0,H,1,0,H
      SP1,201617,25/11/2016,Eibar,Betis,3,1,H,2,0,H
      SP1,201617,26/11/2016,Espanol,Leganes,3,0,H,0,0,D
      SP1,201617,26/11/2016,Malaga,La Coruna,4,3,H,2,1,H
      SP1,201617,26/11/2016,Real Madrid,Sp Gijon,2,1,H,2,1,H
      SP1,201617,26/11/2016,Sevilla,Valencia,2,1,H,0,0,D
      SP1,201617,27/11/2016,Celta,Granada,3,1,H,2,0,H
      SP1,201617,27/11/2016,Osasuna,Ath Madrid,0,3,A,0,2,A
      SP1,201617,27/11/2016,Sociedad,Barcelona,1,1,D,0,0,D
      SP1,201617,27/11/2016,Villarreal,Alaves,0,2,A,0,2,A
      SP1,201617,28/11/2016,Las Palmas,Ath Bilbao,3,1,H,1,0,H
      SP1,201617,03/12/2016,Ath Madrid,Espanol,0,0,D,0,0,D
      SP1,201617,03/12/2016,Barcelona,Real Madrid,1,1,D,0,0,D
      SP1,201617,03/12/2016,Granada,Sevilla,2,1,H,1,0,H
      SP1,201617,03/12/2016,Leganes,Villarreal,0,0,D,0,0,D
      SP1,201617,04/12/2016,Alaves,Las Palmas,1,1,D,1,0,H
      SP1,201617,04/12/2016,Ath Bilbao,Eibar,3,1,H,1,0,H
      SP1,201617,04/12/2016,Betis,Celta,3,3,D,1,1,D
      SP1,201617,04/12/2016,Sp Gijon,Osasuna,3,1,H,1,0,H
      SP1,201617,04/12/2016,Valencia,Malaga,2,2,D,2,1,H
      SP1,201617,05/12/2016,La Coruna,Sociedad,5,1,H,3,0,H
      SP1,201617,09/12/2016,Malaga,Granada,1,1,D,1,0,H
      SP1,201617,10/12/2016,Las Palmas,Leganes,1,1,D,1,0,H
      SP1,201617,10/12/2016,Osasuna,Barcelona,0,3,A,0,0,D
      SP1,201617,10/12/2016,Real Madrid,La Coruna,3,2,H,0,0,D
      SP1,201617,10/12/2016,Sociedad,Valencia,3,2,H,2,1,H
      SP1,201617,11/12/2016,Betis,Ath Bilbao,1,0,H,1,0,H
      SP1,201617,11/12/2016,Celta,Sevilla,0,3,A,0,0,D
      SP1,201617,11/12/2016,Eibar,Alaves,0,0,D,0,0,D
      SP1,201617,11/12/2016,Espanol,Sp Gijon,2,1,H,0,0,D
      SP1,201617,12/12/2016,Villarreal,Ath Madrid,3,0,H,2,0,H
      SP1,201617,16/12/2016,Alaves,Betis,1,0,H,0,0,D
      SP1,201617,17/12/2016,Ath Madrid,Las Palmas,1,0,H,0,0,D
      SP1,201617,17/12/2016,Granada,Sociedad,0,2,A,0,0,D
      SP1,201617,17/12/2016,Sevilla,Malaga,4,1,H,4,0,H
      SP1,201617,17/12/2016,Sp Gijon,Villarreal,1,3,A,0,2,A
      SP1,201617,18/12/2016,Barcelona,Espanol,4,1,H,1,0,H
      SP1,201617,18/12/2016,La Coruna,Osasuna,2,0,H,2,0,H
      SP1,201617,18/12/2016,Leganes,Eibar,1,1,D,1,0,H
      SP1,201617,19/12/2016,Ath Bilbao,Celta,2,1,H,0,0,D
      SP1,201617,06/01/2017,Espanol,La Coruna,1,1,D,0,0,D
      SP1,201617,07/01/2017,Eibar,Ath Madrid,0,2,A,0,0,D
      SP1,201617,07/01/2017,Las Palmas,Sp Gijon,1,0,H,0,0,D
      SP1,201617,07/01/2017,Real Madrid,Granada,5,0,H,4,0,H
      SP1,201617,07/01/2017,Sociedad,Sevilla,0,4,A,0,2,A
      SP1,201617,08/01/2017,Ath Bilbao,Alaves,0,0,D,0,0,D
      SP1,201617,08/01/2017,Betis,Leganes,2,0,H,0,0,D
      SP1,201617,08/01/2017,Celta,Malaga,3,1,H,1,0,H
      SP1,201617,08/01/2017,Villarreal,Barcelona,1,1,D,0,0,D
      SP1,201617,09/01/2017,Osasuna,Valencia,3,3,D,1,2,A
      SP1,201617,14/01/2017,Ath Madrid,Betis,1,0,H,1,0,H
      SP1,201617,14/01/2017,Barcelona,Las Palmas,5,0,H,1,0,H
      SP1,201617,14/01/2017,La Coruna,Villarreal,0,0,D,0,0,D
      SP1,201617,14/01/2017,Leganes,Ath Bilbao,0,0,D,0,0,D
      SP1,201617,15/01/2017,Celta,Alaves,1,0,H,0,0,D
      SP1,201617,15/01/2017,Granada,Osasuna,1,1,D,0,1,A
      SP1,201617,15/01/2017,Sevilla,Real Madrid,2,1,H,0,0,D
      SP1,201617,15/01/2017,Sp Gijon,Eibar,2,3,A,1,3,A
      SP1,201617,15/01/2017,Valencia,Espanol,2,1,H,1,0,H
      SP1,201617,16/01/2017,Malaga,Sociedad,0,2,A,0,0,D
      SP1,201617,20/01/2017,Las Palmas,La Coruna,1,1,D,1,0,H
      SP1,201617,21/01/2017,Alaves,Leganes,2,2,D,1,1,D
      SP1,201617,21/01/2017,Espanol,Granada,3,1,H,2,1,H
      SP1,201617,21/01/2017,Real Madrid,Malaga,2,1,H,2,0,H
      SP1,201617,21/01/2017,Villarreal,Valencia,0,2,A,0,2,A
      SP1,201617,22/01/2017,Ath Bilbao,Ath Madrid,2,2,D,1,1,D
      SP1,201617,22/01/2017,Betis,Sp Gijon,0,0,D,0,0,D
      SP1,201617,22/01/2017,Eibar,Barcelona,0,4,A,0,1,A
      SP1,201617,22/01/2017,Osasuna,Sevilla,3,4,A,1,1,D
      SP1,201617,22/01/2017,Sociedad,Celta,1,0,H,0,0,D
      SP1,201617,27/01/2017,Osasuna,Malaga,1,1,D,0,0,D
      SP1,201617,28/01/2017,Alaves,Ath Madrid,0,0,D,0,0,D
      SP1,201617,28/01/2017,Eibar,La Coruna,3,1,H,2,1,H
      SP1,201617,28/01/2017,Leganes,Celta,0,2,A,0,1,A
      SP1,201617,28/01/2017,Villarreal,Granada,2,0,H,1,0,H
      SP1,201617,29/01/2017,Ath Bilbao,Sp Gijon,2,1,H,0,1,A
      SP1,201617,29/01/2017,Betis,Barcelona,1,1,D,0,0,D
      SP1,201617,29/01/2017,Espanol,Sevilla,3,1,H,2,1,H
      SP1,201617,29/01/2017,Real Madrid,Sociedad,3,0,H,1,0,H
      SP1,201617,30/01/2017,Las Palmas,Valencia,3,1,H,1,1,D
      SP1,201617,04/02/2017,Ath Madrid,Leganes,2,0,H,1,0,H
      SP1,201617,04/02/2017,Barcelona,Ath Bilbao,3,0,H,2,0,H
      SP1,201617,04/02/2017,Malaga,Espanol,0,1,A,0,1,A
      SP1,201617,04/02/2017,Valencia,Eibar,0,4,A,0,2,A
      SP1,201617,05/02/2017,Sevilla,Villarreal,0,0,D,0,0,D
      SP1,201617,05/02/2017,Sociedad,Osasuna,3,2,H,0,1,A
      SP1,201617,05/02/2017,Sp Gijon,Alaves,2,4,A,0,1,A
      SP1,201617,06/02/2017,Granada,Las Palmas,1,0,H,1,0,H
      SP1,201617,10/02/2017,Espanol,Sociedad,1,2,A,1,1,D
      SP1,201617,11/02/2017,Alaves,Barcelona,0,6,A,0,2,A
      SP1,201617,11/02/2017,Ath Bilbao,La Coruna,2,1,H,0,1,A
      SP1,201617,11/02/2017,Betis,Valencia,0,0,D,0,0,D
      SP1,201617,11/02/2017,Osasuna,Real Madrid,1,3,A,1,1,D
      SP1,201617,12/02/2017,Ath Madrid,Celta,3,2,H,1,1,D
      SP1,201617,12/02/2017,Las Palmas,Sevilla,0,1,A,0,0,D
      SP1,201617,12/02/2017,Leganes,Sp Gijon,0,2,A,0,0,D
      SP1,201617,12/02/2017,Villarreal,Malaga,1,1,D,0,1,A
      SP1,201617,13/02/2017,Eibar,Granada,4,0,H,2,0,H
      SP1,201617,17/02/2017,Granada,Betis,4,1,H,3,0,H
      SP1,201617,18/02/2017,La Coruna,Alaves,0,1,A,0,0,D
      SP1,201617,18/02/2017,Real Madrid,Espanol,2,0,H,1,0,H
      SP1,201617,18/02/2017,Sevilla,Eibar,2,0,H,1,0,H
      SP1,201617,18/02/2017,Sp Gijon,Ath Madrid,1,4,A,0,0,D
      SP1,201617,19/02/2017,Barcelona,Leganes,2,1,H,1,0,H
      SP1,201617,19/02/2017,Celta,Osasuna,3,0,H,1,0,H
      SP1,201617,19/02/2017,Sociedad,Villarreal,0,1,A,0,0,D
      SP1,201617,19/02/2017,Valencia,Ath Bilbao,2,0,H,2,0,H
      SP1,201617,20/02/2017,Malaga,Las Palmas,2,1,H,2,1,H
      SP1,201617,22/02/2017,Valencia,Real Madrid,2,1,H,2,1,H
      SP1,201617,24/02/2017,Las Palmas,Sociedad,0,1,A,0,0,D
      SP1,201617,25/02/2017,Alaves,Valencia,2,1,H,0,0,D
      SP1,201617,25/02/2017,Betis,Sevilla,1,2,A,1,0,H
      SP1,201617,25/02/2017,Eibar,Malaga,3,0,H,1,0,H
      SP1,201617,25/02/2017,Leganes,La Coruna,4,0,H,2,0,H
      SP1,201617,26/02/2017,Ath Bilbao,Granada,3,1,H,2,1,H
      SP1,201617,26/02/2017,Ath Madrid,Barcelona,1,2,A,0,0,D
      SP1,201617,26/02/2017,Espanol,Osasuna,3,0,H,1,0,H
      SP1,201617,26/02/2017,Sp Gijon,Celta,1,1,D,0,0,D
      SP1,201617,26/02/2017,Villarreal,Real Madrid,2,3,A,0,0,D
      SP1,201617,28/02/2017,Malaga,Betis,1,2,A,1,0,H
      SP1,201617,28/02/2017,Sociedad,Eibar,2,2,D,1,1,D
      SP1,201617,28/02/2017,Valencia,Leganes,1,0,H,1,0,H
      SP1,201617,01/03/2017,Barcelona,Sp Gijon,6,1,H,3,1,H
      SP1,201617,01/03/2017,Celta,Espanol,2,2,D,2,2,D
      SP1,201617,01/03/2017,Granada,Alaves,2,1,H,1,0,H
      SP1,201617,01/03/2017,Osasuna,Villarreal,1,4,A,0,2,A
      SP1,201617,01/03/2017,Real Madrid,Las Palmas,3,3,D,1,1,D
      SP1,201617,02/03/2017,La Coruna,Ath Madrid,1,1,D,1,0,H
      SP1,201617,02/03/2017,Sevilla,Ath Bilbao,1,0,H,1,0,H
      SP1,201617,03/03/2017,Betis,Sociedad,2,3,A,1,2,A
      SP1,201617,04/03/2017,Barcelona,Celta,5,0,H,2,0,H
      SP1,201617,04/03/2017,Eibar,Real Madrid,1,4,A,0,3,A
      SP1,201617,04/03/2017,Leganes,Granada,1,0,H,0,0,D
      SP1,201617,04/03/2017,Villarreal,Espanol,2,0,H,1,0,H
      SP1,201617,05/03/2017,Ath Bilbao,Malaga,1,0,H,0,0,D
      SP1,201617,05/03/2017,Ath Madrid,Valencia,3,0,H,1,0,H
      SP1,201617,05/03/2017,Las Palmas,Osasuna,5,2,H,1,2,A
      SP1,201617,05/03/2017,Sp Gijon,La Coruna,0,1,A,0,1,A
      SP1,201617,06/03/2017,Alaves,Sevilla,1,1,D,0,1,A
      SP1,201617,08/03/2017,La Coruna,Betis,1,1,D,0,0,D
      SP1,201617,10/03/2017,Espanol,Las Palmas,4,3,H,2,1,H
      SP1,201617,11/03/2017,Granada,Ath Madrid,0,1,A,0,0,D
      SP1,201617,11/03/2017,Malaga,Alaves,1,2,A,0,1,A
      SP1,201617,11/03/2017,Sevilla,Leganes,1,1,D,1,1,D
      SP1,201617,11/03/2017,Valencia,Sp Gijon,1,1,D,0,0,D
      SP1,201617,12/03/2017,Celta,Villarreal,0,1,A,0,1,A
      SP1,201617,12/03/2017,La Coruna,Barcelona,2,1,H,1,0,H
      SP1,201617,12/03/2017,Real Madrid,Betis,2,1,H,1,1,D
      SP1,201617,12/03/2017,Sociedad,Ath Bilbao,0,2,A,0,1,A
      SP1,201617,13/03/2017,Osasuna,Eibar,1,1,D,0,0,D
      SP1,201617,17/03/2017,Las Palmas,Villarreal,1,0,H,1,0,H
      SP1,201617,18/03/2017,Alaves,Sociedad,1,0,H,1,0,H
      SP1,201617,18/03/2017,Ath Bilbao,Real Madrid,1,2,A,0,1,A
      SP1,201617,18/03/2017,Betis,Osasuna,2,0,H,2,0,H
      SP1,201617,18/03/2017,Eibar,Espanol,1,1,D,1,0,H
      SP1,201617,19/03/2017,Ath Madrid,Sevilla,3,1,H,1,0,H
      SP1,201617,19/03/2017,Barcelona,Valencia,4,2,H,2,2,D
      SP1,201617,19/03/2017,La Coruna,Celta,0,1,A,0,0,D
      SP1,201617,19/03/2017,Leganes,Malaga,0,0,D,0,0,D
      SP1,201617,19/03/2017,Sp Gijon,Granada,3,1,H,0,0,D
      SP1,201617,31/03/2017,Espanol,Betis,2,1,H,0,0,D
      SP1,201617,01/04/2017,Malaga,Ath Madrid,0,2,A,0,1,A
      SP1,201617,01/04/2017,Osasuna,Ath Bilbao,1,2,A,0,2,A
      SP1,201617,01/04/2017,Sociedad,Leganes,1,1,D,0,1,A
      SP1,201617,01/04/2017,Villarreal,Eibar,2,3,A,1,0,H
      SP1,201617,02/04/2017,Granada,Barcelona,1,4,A,0,1,A
      SP1,201617,02/04/2017,Real Madrid,Alaves,3,0,H,1,0,H
      SP1,201617,02/04/2017,Sevilla,Sp Gijon,0,0,D,0,0,D
      SP1,201617,02/04/2017,Valencia,La Coruna,3,0,H,2,0,H
      SP1,201617,03/04/2017,Celta,Las Palmas,3,1,H,2,0,H
      SP1,201617,04/04/2017,Ath Bilbao,Espanol,2,0,H,2,0,H
      SP1,201617,04/04/2017,Ath Madrid,Sociedad,1,0,H,1,0,H
      SP1,201617,04/04/2017,Betis,Villarreal,0,1,A,0,0,D
      SP1,201617,05/04/2017,Alaves,Osasuna,0,1,A,0,0,D
      SP1,201617,05/04/2017,Barcelona,Sevilla,3,0,H,3,0,H
      SP1,201617,05/04/2017,La Coruna,Granada,0,0,D,0,0,D
      SP1,201617,05/04/2017,Leganes,Real Madrid,2,4,A,2,3,A
      SP1,201617,05/04/2017,Sp Gijon,Malaga,0,1,A,0,1,A
      SP1,201617,06/04/2017,Eibar,Las Palmas,3,1,H,2,0,H
      SP1,201617,06/04/2017,Valencia,Celta,3,2,H,1,1,D
      SP1,201617,07/04/2017,Villarreal,Ath Bilbao,3,1,H,1,1,D
      SP1,201617,08/04/2017,Espanol,Alaves,1,0,H,0,0,D
      SP1,201617,08/04/2017,Malaga,Barcelona,2,0,H,1,0,H
      SP1,201617,08/04/2017,Real Madrid,Ath Madrid,1,1,D,0,0,D
      SP1,201617,08/04/2017,Sevilla,La Coruna,4,2,H,3,2,H
      SP1,201617,09/04/2017,Celta,Eibar,0,2,A,0,1,A
      SP1,201617,09/04/2017,Granada,Valencia,1,3,A,0,2,A
      SP1,201617,09/04/2017,Las Palmas,Betis,4,1,H,1,0,H
      SP1,201617,09/04/2017,Osasuna,Leganes,2,1,H,1,1,D
      SP1,201617,10/04/2017,Sociedad,Sp Gijon,3,1,H,2,0,H
      SP1,201617,14/04/2017,Ath Bilbao,Las Palmas,5,1,H,3,1,H
      SP1,201617,15/04/2017,Ath Madrid,Osasuna,3,0,H,1,0,H
      SP1,201617,15/04/2017,Barcelona,Sociedad,3,2,H,3,2,H
      SP1,201617,15/04/2017,La Coruna,Malaga,2,0,H,0,0,D
      SP1,201617,15/04/2017,Sp Gijon,Real Madrid,2,3,A,1,1,D
      SP1,201617,16/04/2017,Betis,Eibar,2,0,H,1,0,H
      SP1,201617,16/04/2017,Granada,Celta,0,3,A,0,1,A
      SP1,201617,16/04/2017,Leganes,Espanol,0,1,A,0,0,D
      SP1,201617,16/04/2017,Valencia,Sevilla,0,0,D,0,0,D
      SP1,201617,17/04/2017,Alaves,Villarreal,2,1,H,2,0,H
      SP1,201617,21/04/2017,Sevilla,Granada,2,0,H,1,0,H
      SP1,201617,22/04/2017,Espanol,Ath Madrid,0,1,A,0,0,D
      SP1,201617,22/04/2017,Malaga,Valencia,2,0,H,2,0,H
      SP1,201617,22/04/2017,Osasuna,Sp Gijon,2,2,D,1,0,H
      SP1,201617,22/04/2017,Villarreal,Leganes,2,1,H,0,0,D
      SP1,201617,23/04/2017,Celta,Betis,0,1,A,0,0,D
      SP1,201617,23/04/2017,Las Palmas,Alaves,1,1,D,1,0,H
      SP1,201617,23/04/2017,Real Madrid,Barcelona,2,3,A,1,1,D
      SP1,201617,23/04/2017,Sociedad,La Coruna,1,0,H,1,0,H
      SP1,201617,24/04/2017,Eibar,Ath Bilbao,0,1,A,0,0,D
      SP1,201617,25/04/2017,Ath Madrid,Villarreal,0,1,A,0,0,D
      SP1,201617,25/04/2017,Granada,Malaga,0,2,A,0,0,D
      SP1,201617,25/04/2017,Sp Gijon,Espanol,1,1,D,1,0,H
      SP1,201617,26/04/2017,Barcelona,Osasuna,7,1,H,2,0,H
      SP1,201617,26/04/2017,La Coruna,Real Madrid,2,6,A,1,3,A
      SP1,201617,26/04/2017,Leganes,Las Palmas,3,0,H,0,0,D
      SP1,201617,26/04/2017,Valencia,Sociedad,2,3,A,0,2,A
      SP1,201617,27/04/2017,Alaves,Eibar,0,0,D,0,0,D
      SP1,201617,27/04/2017,Ath Bilbao,Betis,2,1,H,0,0,D
      SP1,201617,27/04/2017,Sevilla,Celta,2,1,H,0,0,D
      SP1,201617,28/04/2017,Villarreal,Sp Gijon,3,1,H,1,0,H
      SP1,201617,29/04/2017,Espanol,Barcelona,0,3,A,0,0,D
      SP1,201617,29/04/2017,Las Palmas,Ath Madrid,0,5,A,0,3,A
      SP1,201617,29/04/2017,Real Madrid,Valencia,2,1,H,1,0,H
      SP1,201617,29/04/2017,Sociedad,Granada,2,1,H,1,0,H
      SP1,201617,30/04/2017,Betis,Alaves,1,4,A,1,0,H
      SP1,201617,30/04/2017,Celta,Ath Bilbao,0,3,A,0,1,A
      SP1,201617,30/04/2017,Eibar,Leganes,2,0,H,0,0,D
      SP1,201617,30/04/2017,Osasuna,La Coruna,2,2,D,1,1,D
      SP1,201617,01/05/2017,Malaga,Sevilla,4,2,H,1,1,D
      SP1,201617,05/05/2017,Sevilla,Sociedad,1,1,D,1,0,H
      SP1,201617,06/05/2017,Ath Madrid,Eibar,1,0,H,0,0,D
      SP1,201617,06/05/2017,Barcelona,Villarreal,4,1,H,2,1,H
      SP1,201617,06/05/2017,Granada,Real Madrid,0,4,A,0,4,A
      SP1,201617,06/05/2017,Sp Gijon,Las Palmas,1,0,H,0,0,D
      SP1,201617,07/05/2017,Alaves,Ath Bilbao,1,0,H,0,0,D
      SP1,201617,07/05/2017,La Coruna,Espanol,1,2,A,0,2,A
      SP1,201617,07/05/2017,Malaga,Celta,3,0,H,1,0,H
      SP1,201617,07/05/2017,Valencia,Osasuna,4,1,H,2,0,H
      SP1,201617,08/05/2017,Leganes,Betis,4,0,H,2,0,H
      SP1,201617,13/05/2017,Espanol,Valencia,0,1,A,0,0,D
      SP1,201617,13/05/2017,Osasuna,Granada,2,1,H,1,1,D
      SP1,201617,14/05/2017,Alaves,Celta,3,1,H,3,0,H
      SP1,201617,14/05/2017,Ath Bilbao,Leganes,1,1,D,1,0,H
      SP1,201617,14/05/2017,Betis,Ath Madrid,1,1,D,0,0,D
      SP1,201617,14/05/2017,Eibar,Sp Gijon,0,1,A,0,1,A
      SP1,201617,14/05/2017,Las Palmas,Barcelona,1,4,A,0,2,A
      SP1,201617,14/05/2017,Real Madrid,Sevilla,4,1,H,2,0,H
      SP1,201617,14/05/2017,Sociedad,Malaga,2,2,D,1,1,D
      SP1,201617,14/05/2017,Villarreal,La Coruna,0,0,D,0,0,D
      SP1,201617,17/05/2017,Celta,Real Madrid,1,4,A,0,1,A
      SP1,201617,19/05/2017,Granada,Espanol,1,2,A,1,2,A
      SP1,201617,20/05/2017,La Coruna,Las Palmas,3,0,H,3,0,H
      SP1,201617,20/05/2017,Leganes,Alaves,1,1,D,0,0,D
      SP1,201617,20/05/2017,Sevilla,Osasuna,5,0,H,3,0,H
      SP1,201617,20/05/2017,Sp Gijon,Betis,2,2,D,1,1,D
      SP1,201617,21/05/2017,Ath Madrid,Ath Bilbao,3,1,H,2,0,H
      SP1,201617,21/05/2017,Barcelona,Eibar,4,2,H,0,1,A
      SP1,201617,21/05/2017,Celta,Sociedad,2,2,D,0,0,D
      SP1,201617,21/05/2017,Malaga,Real Madrid,0,2,A,0,1,A
      SP1,201617,21/05/2017,Valencia,Villarreal,1,3,A,0,1,A
      SP1,201516,21/08/2015,Malaga,Sevilla,0,0,D,0,0,D
      SP1,201516,22/08/2015,Ath Madrid,Las Palmas,1,0,H,1,0,H
      SP1,201516,22/08/2015,Espanol,Getafe,1,0,H,1,0,H
      SP1,201516,22/08/2015,La Coruna,Sociedad,0,0,D,0,0,D
      SP1,201516,22/08/2015,Vallecano,Valencia,0,0,D,0,0,D
      SP1,201516,23/08/2015,Ath Bilbao,Barcelona,0,1,A,0,0,D
      SP1,201516,23/08/2015,Betis,Villarreal,1,1,D,0,1,A
      SP1,201516,23/08/2015,Levante,Celta,1,2,A,0,1,A
      SP1,201516,23/08/2015,Sp Gijon,Real Madrid,0,0,D,0,0,D
      SP1,201516,24/08/2015,Granada,Eibar,1,3,A,0,2,A
      SP1,201516,28/08/2015,Villarreal,Espanol,3,1,H,0,1,A
      SP1,201516,29/08/2015,Barcelona,Malaga,1,0,H,0,0,D
      SP1,201516,29/08/2015,Celta,Vallecano,3,0,H,1,0,H
      SP1,201516,29/08/2015,Real Madrid,Betis,5,0,H,2,0,H
      SP1,201516,29/08/2015,Sociedad,Sp Gijon,0,0,D,0,0,D
      SP1,201516,30/08/2015,Eibar,Ath Bilbao,2,0,H,1,0,H
      SP1,201516,30/08/2015,Getafe,Granada,1,2,A,0,2,A
      SP1,201516,30/08/2015,Las Palmas,Levante,0,0,D,0,0,D
      SP1,201516,30/08/2015,Sevilla,Ath Madrid,0,3,A,0,1,A
      SP1,201516,30/08/2015,Valencia,La Coruna,1,1,D,1,1,D
      SP1,201516,11/09/2015,Levante,Sevilla,1,1,D,0,1,A
      SP1,201516,12/09/2015,Ath Madrid,Barcelona,1,2,A,0,0,D
      SP1,201516,12/09/2015,Betis,Sociedad,1,0,H,1,0,H
      SP1,201516,12/09/2015,Espanol,Real Madrid,0,6,A,0,4,A
      SP1,201516,12/09/2015,Sp Gijon,Valencia,0,1,A,0,0,D
      SP1,201516,13/09/2015,Ath Bilbao,Getafe,3,1,H,2,0,H
      SP1,201516,13/09/2015,Celta,Las Palmas,3,3,D,2,1,H
      SP1,201516,13/09/2015,Granada,Villarreal,1,3,A,0,0,D
      SP1,201516,13/09/2015,Malaga,Eibar,0,0,D,0,0,D
      SP1,201516,14/09/2015,Vallecano,La Coruna,1,3,A,1,2,A
      SP1,201516,18/09/2015,Getafe,Malaga,1,0,H,1,0,H
      SP1,201516,19/09/2015,Eibar,Ath Madrid,0,2,A,0,0,D
      SP1,201516,19/09/2015,Real Madrid,Granada,1,0,H,0,0,D
      SP1,201516,19/09/2015,Sociedad,Espanol,2,3,A,1,1,D
      SP1,201516,19/09/2015,Valencia,Betis,0,0,D,0,0,D
      SP1,201516,20/09/2015,Barcelona,Levante,4,1,H,0,0,D
      SP1,201516,20/09/2015,La Coruna,Sp Gijon,2,3,A,2,3,A
      SP1,201516,20/09/2015,Las Palmas,Vallecano,0,1,A,0,1,A
      SP1,201516,20/09/2015,Sevilla,Celta,1,2,A,0,2,A
      SP1,201516,20/09/2015,Villarreal,Ath Bilbao,3,1,H,1,0,H
      SP1,201516,22/09/2015,Ath Madrid,Getafe,2,0,H,1,0,H
      SP1,201516,22/09/2015,Espanol,Valencia,1,0,H,1,0,H
      SP1,201516,22/09/2015,Granada,Sociedad,0,3,A,0,2,A
      SP1,201516,23/09/2015,Ath Bilbao,Real Madrid,1,2,A,0,1,A
      SP1,201516,23/09/2015,Celta,Barcelona,4,1,H,2,0,H
      SP1,201516,23/09/2015,Las Palmas,Sevilla,2,0,H,1,0,H
      SP1,201516,23/09/2015,Levante,Eibar,2,2,D,0,1,A
      SP1,201516,23/09/2015,Malaga,Villarreal,0,1,A,0,0,D
      SP1,201516,23/09/2015,Vallecano,Sp Gijon,2,1,H,1,0,H
      SP1,201516,24/09/2015,Betis,La Coruna,1,2,A,0,0,D
      SP1,201516,25/09/2015,Valencia,Granada,1,0,H,1,0,H
      SP1,201516,26/09/2015,Barcelona,Las Palmas,2,1,H,1,0,H
      SP1,201516,26/09/2015,Eibar,Celta,1,1,D,1,0,H
      SP1,201516,26/09/2015,Real Madrid,Malaga,0,0,D,0,0,D
      SP1,201516,26/09/2015,Sevilla,Vallecano,3,2,H,2,0,H
      SP1,201516,26/09/2015,Villarreal,Ath Madrid,1,0,H,1,0,H
      SP1,201516,27/09/2015,Getafe,Levante,3,0,H,0,0,D
      SP1,201516,27/09/2015,La Coruna,Espanol,3,0,H,2,0,H
      SP1,201516,27/09/2015,Sociedad,Ath Bilbao,0,0,D,0,0,D
      SP1,201516,27/09/2015,Sp Gijon,Betis,1,2,A,1,0,H
      SP1,201516,02/10/2015,Celta,Getafe,0,0,D,0,0,D
      SP1,201516,03/10/2015,Espanol,Sp Gijon,1,2,A,0,1,A
      SP1,201516,03/10/2015,Granada,La Coruna,1,1,D,0,1,A
      SP1,201516,03/10/2015,Las Palmas,Eibar,0,2,A,0,1,A
      SP1,201516,03/10/2015,Malaga,Sociedad,3,1,H,2,1,H
      SP1,201516,03/10/2015,Sevilla,Barcelona,2,1,H,0,0,D
      SP1,201516,04/10/2015,Ath Bilbao,Valencia,3,1,H,1,1,D
      SP1,201516,04/10/2015,Ath Madrid,Real Madrid,1,1,D,0,1,A
      SP1,201516,04/10/2015,Levante,Villarreal,1,0,H,0,0,D
      SP1,201516,04/10/2015,Vallecano,Betis,0,2,A,0,1,A
      SP1,201516,17/10/2015,Barcelona,Vallecano,5,2,H,2,1,H
      SP1,201516,17/10/2015,Betis,Espanol,1,3,A,0,1,A
      SP1,201516,17/10/2015,Eibar,Sevilla,1,1,D,1,0,H
      SP1,201516,17/10/2015,Real Madrid,Levante,3,0,H,2,0,H
      SP1,201516,17/10/2015,Valencia,Malaga,3,0,H,2,0,H
      SP1,201516,18/10/2015,Getafe,Las Palmas,4,0,H,2,0,H
      SP1,201516,18/10/2015,La Coruna,Ath Bilbao,2,2,D,0,1,A
      SP1,201516,18/10/2015,Sociedad,Ath Madrid,0,2,A,0,1,A
      SP1,201516,18/10/2015,Villarreal,Celta,1,2,A,0,1,A
      SP1,201516,19/10/2015,Sp Gijon,Granada,3,3,D,1,2,A
      SP1,201516,23/10/2015,Vallecano,Espanol,3,0,H,1,0,H
      SP1,201516,24/10/2015,Celta,Real Madrid,1,3,A,0,2,A
      SP1,201516,24/10/2015,Granada,Betis,1,1,D,1,1,D
      SP1,201516,24/10/2015,Malaga,La Coruna,2,0,H,0,0,D
      SP1,201516,24/10/2015,Sevilla,Getafe,5,0,H,2,0,H
      SP1,201516,25/10/2015,Ath Madrid,Valencia,2,1,H,2,0,H
      SP1,201516,25/10/2015,Barcelona,Eibar,3,1,H,1,1,D
      SP1,201516,25/10/2015,Las Palmas,Villarreal,0,0,D,0,0,D
      SP1,201516,25/10/2015,Levante,Sociedad,0,4,A,0,2,A
      SP1,201516,26/10/2015,Ath Bilbao,Sp Gijon,3,0,H,2,0,H
      SP1,201516,30/10/2015,La Coruna,Ath Madrid,1,1,D,0,1,A
      SP1,201516,31/10/2015,Getafe,Barcelona,0,2,A,0,1,A
      SP1,201516,31/10/2015,Real Madrid,Las Palmas,3,1,H,3,1,H
      SP1,201516,31/10/2015,Sociedad,Celta,2,3,A,2,1,H
      SP1,201516,31/10/2015,Valencia,Levante,3,0,H,0,0,D
      SP1,201516,31/10/2015,Villarreal,Sevilla,2,1,H,1,0,H
      SP1,201516,01/11/2015,Betis,Ath Bilbao,1,3,A,0,2,A
      SP1,201516,01/11/2015,Eibar,Vallecano,1,0,H,1,0,H
      SP1,201516,01/11/2015,Espanol,Granada,1,1,D,0,0,D
      SP1,201516,01/11/2015,Sp Gijon,Malaga,1,0,H,1,0,H
      SP1,201516,06/11/2015,Las Palmas,Sociedad,2,0,H,1,0,H
      SP1,201516,07/11/2015,Celta,Valencia,1,5,A,1,2,A
      SP1,201516,07/11/2015,Eibar,Getafe,3,1,H,2,1,H
      SP1,201516,07/11/2015,Levante,La Coruna,1,1,D,0,1,A
      SP1,201516,07/11/2015,Malaga,Betis,0,1,A,0,0,D
      SP1,201516,07/11/2015,Vallecano,Granada,2,1,H,2,0,H
      SP1,201516,08/11/2015,Ath Bilbao,Espanol,2,1,H,1,0,H
      SP1,201516,08/11/2015,Ath Madrid,Sp Gijon,1,0,H,0,0,D
      SP1,201516,08/11/2015,Barcelona,Villarreal,3,0,H,0,0,D
      SP1,201516,08/11/2015,Sevilla,Real Madrid,3,2,H,1,1,D
      SP1,201516,21/11/2015,Espanol,Malaga,2,0,H,2,0,H
      SP1,201516,21/11/2015,La Coruna,Celta,2,0,H,1,0,H
      SP1,201516,21/11/2015,Real Madrid,Barcelona,0,4,A,0,2,A
      SP1,201516,21/11/2015,Sociedad,Sevilla,2,0,H,0,0,D
      SP1,201516,21/11/2015,Valencia,Las Palmas,1,1,D,1,0,H
      SP1,201516,22/11/2015,Betis,Ath Madrid,0,1,A,0,1,A
      SP1,201516,22/11/2015,Granada,Ath Bilbao,2,0,H,1,0,H
      SP1,201516,22/11/2015,Sp Gijon,Levante,0,3,A,0,3,A
      SP1,201516,22/11/2015,Villarreal,Eibar,1,1,D,0,1,A
      SP1,201516,23/11/2015,Getafe,Vallecano,1,1,D,0,0,D
      SP1,201516,27/11/2015,Levante,Betis,0,1,A,0,1,A
      SP1,201516,28/11/2015,Ath Madrid,Espanol,1,0,H,1,0,H
      SP1,201516,28/11/2015,Barcelona,Sociedad,4,0,H,2,0,H
      SP1,201516,28/11/2015,Celta,Sp Gijon,2,1,H,1,0,H
      SP1,201516,28/11/2015,Las Palmas,La Coruna,0,2,A,0,1,A
      SP1,201516,28/11/2015,Malaga,Granada,2,2,D,1,0,H
      SP1,201516,29/11/2015,Eibar,Real Madrid,0,2,A,0,1,A
      SP1,201516,29/11/2015,Getafe,Villarreal,2,0,H,1,0,H
      SP1,201516,29/11/2015,Sevilla,Valencia,1,0,H,0,0,D
      SP1,201516,29/11/2015,Vallecano,Ath Bilbao,0,3,A,0,2,A
      SP1,201516,05/12/2015,Betis,Celta,1,1,D,0,1,A
      SP1,201516,05/12/2015,Granada,Ath Madrid,0,2,A,0,1,A
      SP1,201516,05/12/2015,La Coruna,Sevilla,1,1,D,1,0,H
      SP1,201516,05/12/2015,Real Madrid,Getafe,4,1,H,4,0,H
      SP1,201516,05/12/2015,Valencia,Barcelona,1,1,D,0,0,D
      SP1,201516,06/12/2015,Ath Bilbao,Malaga,0,0,D,0,0,D
      SP1,201516,06/12/2015,Sociedad,Eibar,2,1,H,1,1,D
      SP1,201516,06/12/2015,Sp Gijon,Las Palmas,3,1,H,1,1,D
      SP1,201516,06/12/2015,Villarreal,Vallecano,2,1,H,0,1,A
      SP1,201516,07/12/2015,Espanol,Levante,1,1,D,0,1,A
      SP1,201516,11/12/2015,Getafe,Sociedad,1,1,D,0,0,D
      SP1,201516,12/12/2015,Barcelona,La Coruna,2,2,D,1,0,H
      SP1,201516,12/12/2015,Celta,Espanol,1,0,H,1,0,H
      SP1,201516,12/12/2015,Las Palmas,Betis,1,0,H,0,0,D
      SP1,201516,12/12/2015,Levante,Granada,1,2,A,0,0,D
      SP1,201516,12/12/2015,Sevilla,Sp Gijon,2,0,H,0,0,D
      SP1,201516,13/12/2015,Ath Madrid,Ath Bilbao,2,1,H,1,1,D
      SP1,201516,13/12/2015,Eibar,Valencia,1,1,D,1,0,H
      SP1,201516,13/12/2015,Vallecano,Malaga,1,2,A,1,0,H
      SP1,201516,13/12/2015,Villarreal,Real Madrid,1,0,H,1,0,H
      SP1,201516,19/12/2015,Betis,Sevilla,0,0,D,0,0,D
      SP1,201516,19/12/2015,Espanol,Las Palmas,1,0,H,0,0,D
      SP1,201516,19/12/2015,La Coruna,Eibar,2,0,H,1,0,H
      SP1,201516,19/12/2015,Valencia,Getafe,2,2,D,2,2,D
      SP1,201516,20/12/2015,Ath Bilbao,Levante,2,0,H,0,0,D
      SP1,201516,20/12/2015,Granada,Celta,0,2,A,0,2,A
      SP1,201516,20/12/2015,Malaga,Ath Madrid,1,0,H,0,0,D
      SP1,201516,20/12/2015,Real Madrid,Vallecano,10,2,H,4,2,H
      SP1,201516,20/12/2015,Sociedad,Villarreal,0,2,A,0,1,A
      SP1,201516,30/12/2015,Barcelona,Betis,4,0,H,2,0,H
      SP1,201516,30/12/2015,Celta,Ath Bilbao,0,1,A,0,0,D
      SP1,201516,30/12/2015,Eibar,Sp Gijon,2,0,H,0,0,D
      SP1,201516,30/12/2015,Getafe,La Coruna,0,0,D,0,0,D
      SP1,201516,30/12/2015,Las Palmas,Granada,4,1,H,1,0,H
      SP1,201516,30/12/2015,Levante,Malaga,0,1,A,0,0,D
      SP1,201516,30/12/2015,Real Madrid,Sociedad,3,1,H,1,0,H
      SP1,201516,30/12/2015,Sevilla,Espanol,2,0,H,2,0,H
      SP1,201516,30/12/2015,Vallecano,Ath Madrid,0,2,A,0,0,D
      SP1,201516,31/12/2015,Villarreal,Valencia,1,0,H,0,0,D
      SP1,201516,02/01/2016,Ath Madrid,Levante,1,0,H,0,0,D
      SP1,201516,02/01/2016,Espanol,Barcelona,0,0,D,0,0,D
      SP1,201516,02/01/2016,Malaga,Celta,2,0,H,2,0,H
      SP1,201516,03/01/2016,Ath Bilbao,Las Palmas,2,2,D,1,0,H
      SP1,201516,03/01/2016,Betis,Eibar,0,4,A,0,2,A
      SP1,201516,03/01/2016,Granada,Sevilla,2,1,H,2,1,H
      SP1,201516,03/01/2016,La Coruna,Villarreal,1,2,A,0,1,A
      SP1,201516,03/01/2016,Valencia,Real Madrid,2,2,D,1,1,D
      SP1,201516,03/01/2016,Vallecano,Sociedad,2,2,D,1,1,D
      SP1,201516,04/01/2016,Sp Gijon,Getafe,1,2,A,1,0,H
      SP1,201516,09/01/2016,Barcelona,Granada,4,0,H,2,0,H
      SP1,201516,09/01/2016,Getafe,Betis,1,0,H,0,0,D
      SP1,201516,09/01/2016,Levante,Vallecano,2,1,H,0,0,D
      SP1,201516,09/01/2016,Real Madrid,La Coruna,5,0,H,2,0,H
      SP1,201516,09/01/2016,Sevilla,Ath Bilbao,2,0,H,1,0,H
      SP1,201516,10/01/2016,Celta,Ath Madrid,0,2,A,0,0,D
      SP1,201516,10/01/2016,Eibar,Espanol,2,1,H,1,1,D
      SP1,201516,10/01/2016,Las Palmas,Malaga,1,1,D,0,0,D
      SP1,201516,10/01/2016,Sociedad,Valencia,2,0,H,0,0,D
      SP1,201516,10/01/2016,Villarreal,Sp Gijon,2,0,H,1,0,H
      SP1,201516,16/01/2016,Celta,Levante,4,3,H,2,0,H
      SP1,201516,16/01/2016,Sevilla,Malaga,2,1,H,2,0,H
      SP1,201516,16/01/2016,Sociedad,La Coruna,1,1,D,0,1,A
      SP1,201516,16/01/2016,Villarreal,Betis,0,0,D,0,0,D
      SP1,201516,17/01/2016,Barcelona,Ath Bilbao,6,0,H,2,0,H
      SP1,201516,17/01/2016,Getafe,Espanol,3,1,H,2,1,H
      SP1,201516,17/01/2016,Las Palmas,Ath Madrid,0,3,A,0,1,A
      SP1,201516,17/01/2016,Real Madrid,Sp Gijon,5,1,H,5,0,H
      SP1,201516,17/01/2016,Valencia,Vallecano,2,2,D,0,1,A
      SP1,201516,18/01/2016,Eibar,Granada,5,1,H,2,0,H
      SP1,201516,22/01/2016,Sp Gijon,Sociedad,5,1,H,3,1,H
      SP1,201516,23/01/2016,Espanol,Villarreal,2,2,D,2,1,H
      SP1,201516,23/01/2016,Granada,Getafe,3,2,H,2,0,H
      SP1,201516,23/01/2016,Malaga,Barcelona,1,2,A,1,1,D
      SP1,201516,23/01/2016,Vallecano,Celta,3,0,H,3,0,H
      SP1,201516,24/01/2016,Ath Bilbao,Eibar,5,2,H,3,1,H
      SP1,201516,24/01/2016,Ath Madrid,Sevilla,0,0,D,0,0,D
      SP1,201516,24/01/2016,Betis,Real Madrid,1,1,D,1,0,H
      SP1,201516,24/01/2016,La Coruna,Valencia,1,1,D,1,0,H
      SP1,201516,25/01/2016,Levante,Las Palmas,3,2,H,1,0,H
      SP1,201516,30/01/2016,Barcelona,Ath Madrid,2,1,H,2,1,H
      SP1,201516,30/01/2016,Eibar,Malaga,1,2,A,0,1,A
      SP1,201516,30/01/2016,Getafe,Ath Bilbao,0,1,A,0,1,A
      SP1,201516,30/01/2016,Sociedad,Betis,2,1,H,2,0,H
      SP1,201516,30/01/2016,Villarreal,Granada,1,0,H,0,0,D
      SP1,201516,31/01/2016,Las Palmas,Celta,2,1,H,1,1,D
      SP1,201516,31/01/2016,Real Madrid,Espanol,6,0,H,4,0,H
      SP1,201516,31/01/2016,Sevilla,Levante,3,1,H,1,0,H
      SP1,201516,31/01/2016,Valencia,Sp Gijon,0,1,A,0,0,D
      SP1,201516,01/02/2016,La Coruna,Vallecano,2,2,D,1,2,A
      SP1,201516,05/02/2016,Malaga,Getafe,3,0,H,3,0,H
      SP1,201516,06/02/2016,Ath Bilbao,Villarreal,0,0,D,0,0,D
      SP1,201516,06/02/2016,Ath Madrid,Eibar,3,1,H,0,0,D
      SP1,201516,06/02/2016,Sp Gijon,La Coruna,1,1,D,1,1,D
      SP1,201516,06/02/2016,Vallecano,Las Palmas,2,0,H,1,0,H
      SP1,201516,07/02/2016,Betis,Valencia,1,0,H,0,0,D
      SP1,201516,07/02/2016,Celta,Sevilla,1,1,D,0,1,A
      SP1,201516,07/02/2016,Granada,Real Madrid,1,2,A,0,1,A
      SP1,201516,07/02/2016,Levante,Barcelona,0,2,A,0,1,A
      SP1,201516,08/02/2016,Espanol,Sociedad,0,5,A,0,2,A
      SP1,201516,12/02/2016,Sp Gijon,Vallecano,2,2,D,2,1,H
      SP1,201516,13/02/2016,La Coruna,Betis,2,2,D,1,2,A
      SP1,201516,13/02/2016,Real Madrid,Ath Bilbao,4,2,H,3,1,H
      SP1,201516,13/02/2016,Valencia,Espanol,2,1,H,0,0,D
      SP1,201516,13/02/2016,Villarreal,Malaga,1,0,H,1,0,H
      SP1,201516,14/02/2016,Barcelona,Celta,6,1,H,1,1,D
      SP1,201516,14/02/2016,Eibar,Levante,2,0,H,1,0,H
      SP1,201516,14/02/2016,Getafe,Ath Madrid,0,1,A,0,1,A
      SP1,201516,14/02/2016,Sevilla,Las Palmas,2,0,H,0,0,D
      SP1,201516,14/02/2016,Sociedad,Granada,3,0,H,2,0,H
      SP1,201516,17/02/2016,Sp Gijon,Barcelona,1,3,A,1,2,A
      SP1,201516,19/02/2016,Levante,Getafe,3,0,H,2,0,H
      SP1,201516,20/02/2016,Betis,Sp Gijon,1,1,D,0,0,D
      SP1,201516,20/02/2016,Celta,Eibar,3,2,H,2,0,H
      SP1,201516,20/02/2016,Espanol,La Coruna,1,0,H,0,0,D
      SP1,201516,20/02/2016,Las Palmas,Barcelona,1,2,A,1,2,A
      SP1,201516,21/02/2016,Ath Bilbao,Sociedad,0,1,A,0,1,A
      SP1,201516,21/02/2016,Ath Madrid,Villarreal,0,0,D,0,0,D
      SP1,201516,21/02/2016,Granada,Valencia,1,2,A,0,0,D
      SP1,201516,21/02/2016,Malaga,Real Madrid,1,1,D,0,1,A
      SP1,201516,21/02/2016,Vallecano,Sevilla,2,2,D,1,2,A
      SP1,201516,26/02/2016,Eibar,Las Palmas,0,1,A,0,1,A
      SP1,201516,27/02/2016,Betis,Vallecano,2,2,D,2,0,H
      SP1,201516,27/02/2016,Getafe,Celta,0,1,A,0,0,D
      SP1,201516,27/02/2016,Real Madrid,Ath Madrid,0,1,A,0,0,D
      SP1,201516,27/02/2016,Sociedad,Malaga,1,1,D,0,0,D
      SP1,201516,27/02/2016,Sp Gijon,Espanol,2,4,A,1,1,D
      SP1,201516,28/02/2016,Barcelona,Sevilla,2,1,H,1,1,D
      SP1,201516,28/02/2016,La Coruna,Granada,0,1,A,0,1,A
      SP1,201516,28/02/2016,Valencia,Ath Bilbao,0,3,A,0,0,D
      SP1,201516,28/02/2016,Villarreal,Levante,3,0,H,2,0,H
      SP1,201516,01/03/2016,Ath Madrid,Sociedad,3,0,H,1,0,H
      SP1,201516,01/03/2016,Las Palmas,Getafe,4,0,H,2,0,H
      SP1,201516,02/03/2016,Ath Bilbao,La Coruna,4,1,H,2,0,H
      SP1,201516,02/03/2016,Celta,Villarreal,0,0,D,0,0,D
      SP1,201516,02/03/2016,Levante,Real Madrid,1,3,A,1,2,A
      SP1,201516,02/03/2016,Malaga,Valencia,1,2,A,1,1,D
      SP1,201516,02/03/2016,Sevilla,Eibar,1,0,H,1,0,H
      SP1,201516,03/03/2016,Espanol,Betis,0,3,A,0,2,A
      SP1,201516,03/03/2016,Granada,Sp Gijon,2,0,H,0,0,D
      SP1,201516,03/03/2016,Vallecano,Barcelona,1,5,A,0,2,A
      SP1,201516,05/03/2016,Getafe,Sevilla,1,1,D,0,0,D
      SP1,201516,05/03/2016,La Coruna,Malaga,3,3,D,1,1,D
      SP1,201516,05/03/2016,Real Madrid,Celta,7,1,H,1,0,H
      SP1,201516,05/03/2016,Villarreal,Las Palmas,0,1,A,0,1,A
      SP1,201516,06/03/2016,Betis,Granada,2,0,H,0,0,D
      SP1,201516,06/03/2016,Eibar,Barcelona,0,4,A,0,2,A
      SP1,201516,06/03/2016,Sociedad,Levante,1,1,D,1,1,D
      SP1,201516,06/03/2016,Sp Gijon,Ath Bilbao,0,2,A,0,1,A
      SP1,201516,06/03/2016,Valencia,Ath Madrid,1,3,A,1,1,D
      SP1,201516,07/03/2016,Espanol,Vallecano,2,1,H,1,0,H
      SP1,201516,11/03/2016,Malaga,Sp Gijon,1,0,H,1,0,H
      SP1,201516,12/03/2016,Ath Madrid,La Coruna,3,0,H,1,0,H
      SP1,201516,12/03/2016,Barcelona,Getafe,6,0,H,4,0,H
      SP1,201516,12/03/2016,Celta,Sociedad,1,0,H,1,0,H
      SP1,201516,12/03/2016,Vallecano,Eibar,1,1,D,1,1,D
      SP1,201516,13/03/2016,Ath Bilbao,Betis,3,1,H,2,0,H
      SP1,201516,13/03/2016,Las Palmas,Real Madrid,1,2,A,0,1,A
      SP1,201516,13/03/2016,Levante,Valencia,1,0,H,0,0,D
      SP1,201516,13/03/2016,Sevilla,Villarreal,4,2,H,1,2,A
      SP1,201516,14/03/2016,Granada,Espanol,1,1,D,1,0,H
      SP1,201516,18/03/2016,Getafe,Eibar,1,1,D,1,0,H
      SP1,201516,19/03/2016,Betis,Malaga,0,1,A,0,0,D
      SP1,201516,19/03/2016,Granada,Vallecano,2,2,D,1,1,D
      SP1,201516,19/03/2016,La Coruna,Levante,2,1,H,1,0,H
      SP1,201516,19/03/2016,Sociedad,Las Palmas,0,1,A,0,1,A
      SP1,201516,19/03/2016,Sp Gijon,Ath Madrid,2,1,H,0,1,A
      SP1,201516,20/03/2016,Espanol,Ath Bilbao,2,1,H,0,1,A
      SP1,201516,20/03/2016,Real Madrid,Sevilla,4,0,H,1,0,H
      SP1,201516,20/03/2016,Valencia,Celta,0,2,A,0,0,D
      SP1,201516,20/03/2016,Villarreal,Barcelona,2,2,D,0,2,A
      SP1,201516,01/04/2016,Vallecano,Getafe,2,0,H,1,0,H
      SP1,201516,02/04/2016,Ath Madrid,Betis,5,1,H,2,0,H
      SP1,201516,02/04/2016,Barcelona,Real Madrid,1,2,A,0,0,D
      SP1,201516,02/04/2016,Celta,La Coruna,1,1,D,1,1,D
      SP1,201516,02/04/2016,Las Palmas,Valencia,2,1,H,0,1,A
      SP1,201516,03/04/2016,Ath Bilbao,Granada,1,1,D,1,0,H
      SP1,201516,03/04/2016,Eibar,Villarreal,1,2,A,1,1,D
      SP1,201516,03/04/2016,Malaga,Espanol,1,1,D,1,1,D
      SP1,201516,03/04/2016,Sevilla,Sociedad,1,2,A,0,2,A
      SP1,201516,04/04/2016,Levante,Sp Gijon,0,0,D,0,0,D
      SP1,201516,08/04/2016,Granada,Malaga,0,0,D,0,0,D
      SP1,201516,09/04/2016,Betis,Levante,1,0,H,0,0,D
      SP1,201516,09/04/2016,Espanol,Ath Madrid,1,3,A,1,1,D
      SP1,201516,09/04/2016,Real Madrid,Eibar,4,0,H,4,0,H
      SP1,201516,09/04/2016,Sociedad,Barcelona,1,0,H,1,0,H
      SP1,201516,10/04/2016,Ath Bilbao,Vallecano,1,0,H,0,0,D
      SP1,201516,10/04/2016,Sp Gijon,Celta,0,1,A,0,0,D
      SP1,201516,10/04/2016,Valencia,Sevilla,2,1,H,1,0,H
      SP1,201516,10/04/2016,Villarreal,Getafe,2,0,H,1,0,H
      SP1,201516,11/04/2016,La Coruna,Las Palmas,1,3,A,0,0,D
      SP1,201516,15/04/2016,Levante,Espanol,2,1,H,1,1,D
      SP1,201516,16/04/2016,Celta,Betis,1,1,D,0,1,A
      SP1,201516,16/04/2016,Eibar,Sociedad,2,1,H,1,1,D
      SP1,201516,16/04/2016,Getafe,Real Madrid,1,5,A,0,2,A
      SP1,201516,16/04/2016,Las Palmas,Sp Gijon,1,1,D,1,0,H
      SP1,201516,17/04/2016,Ath Madrid,Granada,3,0,H,1,0,H
      SP1,201516,17/04/2016,Barcelona,Valencia,1,2,A,0,2,A
      SP1,201516,17/04/2016,Malaga,Ath Bilbao,0,1,A,0,0,D
      SP1,201516,17/04/2016,Sevilla,La Coruna,1,1,D,1,0,H
      SP1,201516,17/04/2016,Vallecano,Villarreal,2,1,H,1,1,D
      SP1,201516,19/04/2016,Betis,Las Palmas,1,0,H,0,0,D
      SP1,201516,19/04/2016,Espanol,Celta,1,1,D,1,1,D
      SP1,201516,20/04/2016,Ath Bilbao,Ath Madrid,0,1,A,0,1,A
      SP1,201516,20/04/2016,La Coruna,Barcelona,0,8,A,0,2,A
      SP1,201516,20/04/2016,Malaga,Vallecano,1,1,D,0,0,D
      SP1,201516,20/04/2016,Real Madrid,Villarreal,3,0,H,1,0,H
      SP1,201516,20/04/2016,Sp Gijon,Sevilla,2,1,H,1,1,D
      SP1,201516,20/04/2016,Valencia,Eibar,4,0,H,3,0,H
      SP1,201516,21/04/2016,Granada,Levante,5,1,H,3,0,H
      SP1,201516,21/04/2016,Sociedad,Getafe,1,2,A,1,1,D
      SP1,201516,22/04/2016,Las Palmas,Espanol,4,0,H,1,0,H
      SP1,201516,23/04/2016,Ath Madrid,Malaga,1,0,H,0,0,D
      SP1,201516,23/04/2016,Barcelona,Sp Gijon,6,0,H,1,0,H
      SP1,201516,23/04/2016,Eibar,La Coruna,1,1,D,1,0,H
      SP1,201516,23/04/2016,Vallecano,Real Madrid,2,3,A,2,1,H
      SP1,201516,24/04/2016,Getafe,Valencia,2,2,D,0,0,D
      SP1,201516,24/04/2016,Levante,Ath Bilbao,2,2,D,1,0,H
      SP1,201516,24/04/2016,Sevilla,Betis,2,0,H,0,0,D
      SP1,201516,24/04/2016,Villarreal,Sociedad,0,0,D,0,0,D
      SP1,201516,25/04/2016,Celta,Granada,2,1,H,1,0,H
      SP1,201516,29/04/2016,Sp Gijon,Eibar,2,0,H,1,0,H
      SP1,201516,30/04/2016,Ath Madrid,Vallecano,1,0,H,0,0,D
      SP1,201516,30/04/2016,Betis,Barcelona,0,2,A,0,0,D
      SP1,201516,30/04/2016,Granada,Las Palmas,3,2,H,2,2,D
      SP1,201516,30/04/2016,Sociedad,Real Madrid,0,1,A,0,0,D
      SP1,201516,01/05/2016,Ath Bilbao,Celta,2,1,H,1,1,D
      SP1,201516,01/05/2016,Espanol,Sevilla,1,0,H,0,0,D
      SP1,201516,01/05/2016,La Coruna,Getafe,0,2,A,0,1,A
      SP1,201516,01/05/2016,Valencia,Villarreal,0,2,A,0,2,A
      SP1,201516,02/05/2016,Malaga,Levante,3,1,H,1,1,D
      SP1,201516,08/05/2016,Barcelona,Espanol,5,0,H,1,0,H
      SP1,201516,08/05/2016,Celta,Malaga,1,0,H,1,0,H
      SP1,201516,08/05/2016,Eibar,Betis,1,1,D,0,1,A
      SP1,201516,08/05/2016,Getafe,Sp Gijon,1,1,D,0,0,D
      SP1,201516,08/05/2016,Las Palmas,Ath Bilbao,0,0,D,0,0,D
      SP1,201516,08/05/2016,Levante,Ath Madrid,2,1,H,1,1,D
      SP1,201516,08/05/2016,Real Madrid,Valencia,3,2,H,2,0,H
      SP1,201516,08/05/2016,Sevilla,Granada,1,4,A,0,1,A
      SP1,201516,08/05/2016,Sociedad,Vallecano,2,1,H,1,0,H
      SP1,201516,08/05/2016,Villarreal,La Coruna,0,2,A,0,1,A
      SP1,201516,13/05/2016,Valencia,Sociedad,0,1,A,0,0,D
      SP1,201516,14/05/2016,Ath Bilbao,Sevilla,3,1,H,2,0,H
      SP1,201516,14/05/2016,Ath Madrid,Celta,2,0,H,0,0,D
      SP1,201516,14/05/2016,Granada,Barcelona,0,3,A,0,2,A
      SP1,201516,14/05/2016,La Coruna,Real Madrid,0,2,A,0,2,A
      SP1,201516,15/05/2016,Betis,Getafe,2,1,H,0,0,D
      SP1,201516,15/05/2016,Espanol,Eibar,4,2,H,2,0,H
      SP1,201516,15/05/2016,Malaga,Las Palmas,4,1,H,2,1,H
      SP1,201516,15/05/2016,Sp Gijon,Villarreal,2,0,H,1,0,H
      SP1,201516,15/05/2016,Vallecano,Levante,3,1,H,2,0,H
      SP2,201617,19/08/2016,Almeria,Cadiz,1,1,D,0,0,D
      SP2,201617,19/08/2016,Mirandes,Getafe,1,1,D,0,0,D
      SP2,201617,20/08/2016,Alcorcon,Huesca,0,0,D,0,0,D
      SP2,201617,20/08/2016,Cordoba,Tenerife,1,0,H,1,0,H
      SP2,201617,20/08/2016,Elche,Vallecano,2,1,H,2,1,H
      SP2,201617,20/08/2016,Mallorca,Reus Deportiu,0,1,A,0,0,D
      SP2,201617,21/08/2016,Gimnastic,Lugo,2,2,D,0,2,A
      SP2,201617,21/08/2016,Numancia,Levante,0,1,A,0,0,D
      SP2,201617,21/08/2016,Sevilla B,Girona,3,3,D,1,0,H
      SP2,201617,21/08/2016,Valladolid,Oviedo,1,0,H,1,0,H
      SP2,201617,22/08/2016,Zaragoza,UCAM Murcia,3,1,H,3,0,H
      SP2,201617,26/08/2016,Getafe,Numancia,0,0,D,0,0,D
      SP2,201617,26/08/2016,Tenerife,Sevilla B,1,1,D,0,1,A
      SP2,201617,27/08/2016,Girona,Elche,3,1,H,2,0,H
      SP2,201617,27/08/2016,Lugo,Zaragoza,3,3,D,1,1,D
      SP2,201617,27/08/2016,Oviedo,Almeria,2,0,H,0,0,D
      SP2,201617,27/08/2016,Reus Deportiu,Mirandes,1,1,D,1,1,D
      SP2,201617,28/08/2016,Cadiz,Mallorca,1,1,D,1,0,H
      SP2,201617,28/08/2016,Huesca,Gimnastic,1,1,D,0,0,D
      SP2,201617,28/08/2016,Levante,Alcorcon,2,0,H,2,0,H
      SP2,201617,28/08/2016,UCAM Murcia,Cordoba,1,1,D,0,0,D
      SP2,201617,28/08/2016,Vallecano,Valladolid,0,0,D,0,0,D
      SP2,201617,02/09/2016,Cordoba,Lugo,3,3,D,1,1,D
      SP2,201617,02/09/2016,Sevilla B,UCAM Murcia,1,1,D,0,0,D
      SP2,201617,03/09/2016,Almeria,Vallecano,3,0,H,2,0,H
      SP2,201617,03/09/2016,Elche,Tenerife,3,1,H,1,0,H
      SP2,201617,03/09/2016,Getafe,Reus Deportiu,1,1,D,0,0,D
      SP2,201617,03/09/2016,Mirandes,Cadiz,3,2,H,0,2,A
      SP2,201617,03/09/2016,Valladolid,Girona,2,1,H,2,0,H
      SP2,201617,04/09/2016,Gimnastic,Levante,1,1,D,0,0,D
      SP2,201617,04/09/2016,Mallorca,Oviedo,0,0,D,0,0,D
      SP2,201617,04/09/2016,Numancia,Alcorcon,1,1,D,1,1,D
      SP2,201617,04/09/2016,Zaragoza,Huesca,1,0,H,0,0,D
      SP2,201617,10/09/2016,Levante,Zaragoza,4,2,H,3,1,H
      SP2,201617,10/09/2016,Lugo,Sevilla B,1,0,H,0,0,D
      SP2,201617,10/09/2016,Reus Deportiu,Numancia,1,1,D,0,0,D
      SP2,201617,10/09/2016,Tenerife,Valladolid,1,0,H,1,0,H
      SP2,201617,11/09/2016,Alcorcon,Gimnastic,1,0,H,0,0,D
      SP2,201617,11/09/2016,Cadiz,Getafe,3,0,H,1,0,H
      SP2,201617,11/09/2016,Girona,Almeria,3,3,D,2,1,H
      SP2,201617,11/09/2016,Huesca,Cordoba,3,0,H,2,0,H
      SP2,201617,11/09/2016,Oviedo,Mirandes,0,0,D,0,0,D
      SP2,201617,11/09/2016,UCAM Murcia,Elche,1,1,D,0,1,A
      SP2,201617,11/09/2016,Vallecano,Mallorca,1,0,H,0,0,D
      SP2,201617,17/09/2016,Cordoba,Levante,1,0,H,1,0,H
      SP2,201617,17/09/2016,Elche,Lugo,0,3,A,0,2,A
      SP2,201617,17/09/2016,Numancia,Gimnastic,1,0,H,1,0,H
      SP2,201617,17/09/2016,Reus Deportiu,Cadiz,1,0,H,0,0,D
      SP2,201617,17/09/2016,Valladolid,UCAM Murcia,0,1,A,0,0,D
      SP2,201617,17/09/2016,Zaragoza,Alcorcon,2,0,H,1,0,H
      SP2,201617,18/09/2016,Almeria,Tenerife,0,1,A,0,0,D
      SP2,201617,18/09/2016,Getafe,Oviedo,2,1,H,0,1,A
      SP2,201617,18/09/2016,Mallorca,Girona,1,0,H,1,0,H
      SP2,201617,18/09/2016,Mirandes,Vallecano,2,1,H,1,1,D
      SP2,201617,18/09/2016,Sevilla B,Huesca,2,0,H,0,0,D
      SP2,201617,20/09/2016,Alcorcon,Cordoba,0,1,A,0,0,D
      SP2,201617,20/09/2016,Cadiz,Numancia,1,0,H,0,0,D
      SP2,201617,20/09/2016,Gimnastic,Zaragoza,0,0,D,0,0,D
      SP2,201617,20/09/2016,Lugo,Valladolid,1,0,H,1,0,H
      SP2,201617,21/09/2016,Huesca,Elche,0,3,A,0,0,D
      SP2,201617,21/09/2016,Levante,Sevilla B,1,0,H,0,0,D
      SP2,201617,21/09/2016,UCAM Murcia,Almeria,4,0,H,1,0,H
      SP2,201617,22/09/2016,Girona,Mirandes,1,1,D,0,0,D
      SP2,201617,22/09/2016,Oviedo,Reus Deportiu,0,1,A,0,0,D
      SP2,201617,22/09/2016,Tenerife,Mallorca,0,0,D,0,0,D
      SP2,201617,22/09/2016,Vallecano,Getafe,2,0,H,1,0,H
      SP2,201617,24/09/2016,Almeria,Lugo,0,0,D,0,0,D
      SP2,201617,24/09/2016,Cordoba,Gimnastic,2,0,H,1,0,H
      SP2,201617,24/09/2016,Elche,Levante,0,1,A,0,0,D
      SP2,201617,24/09/2016,Sevilla B,Alcorcon,1,1,D,1,0,H
      SP2,201617,24/09/2016,Valladolid,Huesca,1,2,A,0,0,D
      SP2,201617,25/09/2016,Cadiz,Oviedo,0,2,A,0,2,A
      SP2,201617,25/09/2016,Getafe,Girona,0,2,A,0,1,A
      SP2,201617,25/09/2016,Mallorca,UCAM Murcia,0,0,D,0,0,D
      SP2,201617,25/09/2016,Mirandes,Tenerife,3,2,H,2,0,H
      SP2,201617,25/09/2016,Numancia,Zaragoza,2,1,H,1,1,D
      SP2,201617,25/09/2016,Reus Deportiu,Vallecano,1,1,D,1,0,H
      SP2,201617,01/10/2016,Alcorcon,Elche,1,0,H,0,0,D
      SP2,201617,01/10/2016,Gimnastic,Sevilla B,1,1,D,1,1,D
      SP2,201617,01/10/2016,Huesca,Almeria,2,0,H,1,0,H
      SP2,201617,01/10/2016,Lugo,Mallorca,3,1,H,2,1,H
      SP2,201617,01/10/2016,Zaragoza,Cordoba,1,1,D,1,1,D
      SP2,201617,02/10/2016,Girona,Reus Deportiu,1,0,H,0,0,D
      SP2,201617,02/10/2016,Levante,Valladolid,3,2,H,1,1,D
      SP2,201617,02/10/2016,Oviedo,Numancia,2,2,D,1,1,D
      SP2,201617,02/10/2016,Tenerife,Getafe,0,0,D,0,0,D
      SP2,201617,02/10/2016,UCAM Murcia,Mirandes,2,2,D,1,2,A
      SP2,201617,02/10/2016,Vallecano,Cadiz,3,0,H,1,0,H
      SP2,201617,08/10/2016,Elche,Gimnastic,4,4,D,2,1,H
      SP2,201617,08/10/2016,Getafe,UCAM Murcia,2,0,H,0,0,D
      SP2,201617,08/10/2016,Numancia,Cordoba,1,1,D,1,0,H
      SP2,201617,08/10/2016,Reus Deportiu,Tenerife,0,0,D,0,0,D
      SP2,201617,08/10/2016,Sevilla B,Zaragoza,2,1,H,0,0,D
      SP2,201617,08/10/2016,Valladolid,Alcorcon,2,0,H,2,0,H
      SP2,201617,09/10/2016,Almeria,Levante,2,2,D,1,0,H
      SP2,201617,09/10/2016,Cadiz,Girona,0,0,D,0,0,D
      SP2,201617,09/10/2016,Mallorca,Huesca,3,0,H,2,0,H
      SP2,201617,09/10/2016,Mirandes,Lugo,2,2,D,0,2,A
      SP2,201617,09/10/2016,Oviedo,Vallecano,2,0,H,1,0,H
      SP2,201617,15/10/2016,Alcorcon,Almeria,0,0,D,0,0,D
      SP2,201617,15/10/2016,Girona,Oviedo,0,0,D,0,0,D
      SP2,201617,15/10/2016,Huesca,Mirandes,3,0,H,1,0,H
      SP2,201617,15/10/2016,Levante,Mallorca,2,1,H,1,1,D
      SP2,201617,15/10/2016,Lugo,Getafe,0,1,A,0,0,D
      SP2,201617,16/10/2016,Cordoba,Sevilla B,0,1,A,0,0,D
      SP2,201617,16/10/2016,Gimnastic,Valladolid,1,2,A,1,1,D
      SP2,201617,16/10/2016,Tenerife,Cadiz,1,1,D,0,0,D
      SP2,201617,16/10/2016,UCAM Murcia,Reus Deportiu,0,2,A,0,2,A
      SP2,201617,16/10/2016,Vallecano,Numancia,3,3,D,1,1,D
      SP2,201617,16/10/2016,Zaragoza,Elche,1,3,A,0,3,A
      SP2,201617,22/10/2016,Elche,Cordoba,1,1,D,1,0,H
      SP2,201617,22/10/2016,Getafe,Huesca,1,1,D,0,0,D
      SP2,201617,22/10/2016,Numancia,Sevilla B,1,2,A,1,1,D
      SP2,201617,22/10/2016,Reus Deportiu,Lugo,2,1,H,2,0,H
      SP2,201617,22/10/2016,Vallecano,Girona,1,0,H,0,0,D
      SP2,201617,23/10/2016,Almeria,Gimnastic,3,0,H,1,0,H
      SP2,201617,23/10/2016,Cadiz,UCAM Murcia,2,2,D,2,0,H
      SP2,201617,23/10/2016,Mallorca,Alcorcon,1,0,H,0,0,D
      SP2,201617,23/10/2016,Mirandes,Levante,0,3,A,0,1,A
      SP2,201617,23/10/2016,Oviedo,Tenerife,2,0,H,1,0,H
      SP2,201617,23/10/2016,Valladolid,Zaragoza,0,0,D,0,0,D
      SP2,201617,29/10/2016,Cordoba,Valladolid,1,1,D,1,1,D
      SP2,201617,29/10/2016,Huesca,Reus Deportiu,2,1,H,0,1,A
      SP2,201617,29/10/2016,Tenerife,Vallecano,3,2,H,2,1,H
      SP2,201617,29/10/2016,Zaragoza,Almeria,2,1,H,1,0,H
      SP2,201617,30/10/2016,Alcorcon,Mirandes,1,0,H,0,0,D
      SP2,201617,30/10/2016,Gimnastic,Mallorca,2,2,D,1,0,H
      SP2,201617,30/10/2016,Girona,Numancia,3,0,H,3,0,H
      SP2,201617,30/10/2016,Levante,Getafe,1,1,D,1,1,D
      SP2,201617,30/10/2016,Lugo,Cadiz,0,1,A,0,0,D
      SP2,201617,30/10/2016,Sevilla B,Elche,2,0,H,0,0,D
      SP2,201617,30/10/2016,UCAM Murcia,Oviedo,0,1,A,0,1,A
      SP2,201617,05/11/2016,Cadiz,Huesca,1,0,H,0,0,D
      SP2,201617,05/11/2016,Girona,Tenerife,1,1,D,1,1,D
      SP2,201617,05/11/2016,Mallorca,Zaragoza,2,2,D,0,1,A
      SP2,201617,05/11/2016,Valladolid,Sevilla B,2,0,H,0,0,D
      SP2,201617,05/11/2016,Vallecano,UCAM Murcia,0,1,A,0,0,D
      SP2,201617,06/11/2016,Almeria,Cordoba,3,1,H,3,1,H
      SP2,201617,06/11/2016,Getafe,Alcorcon,1,0,H,0,0,D
      SP2,201617,06/11/2016,Mirandes,Gimnastic,0,1,A,0,0,D
      SP2,201617,06/11/2016,Numancia,Elche,2,2,D,2,0,H
      SP2,201617,06/11/2016,Oviedo,Lugo,1,1,D,0,1,A
      SP2,201617,06/11/2016,Reus Deportiu,Levante,0,1,A,0,0,D
      SP2,201617,11/11/2016,Cordoba,Mallorca,0,2,A,0,0,D
      SP2,201617,12/11/2016,Alcorcon,Reus Deportiu,1,0,H,0,0,D
      SP2,201617,12/11/2016,Elche,Valladolid,2,0,H,1,0,H
      SP2,201617,12/11/2016,Gimnastic,Getafe,1,0,H,1,0,H
      SP2,201617,12/11/2016,Huesca,Oviedo,4,0,H,3,0,H
      SP2,201617,12/11/2016,Levante,Cadiz,0,0,D,0,0,D
      SP2,201617,12/11/2016,Tenerife,Numancia,1,1,D,1,0,H
      SP2,201617,13/11/2016,Lugo,Vallecano,1,0,H,1,0,H
      SP2,201617,13/11/2016,Sevilla B,Almeria,1,0,H,1,0,H
      SP2,201617,13/11/2016,UCAM Murcia,Girona,0,1,A,0,0,D
      SP2,201617,13/11/2016,Zaragoza,Mirandes,2,0,H,2,0,H
      SP2,201617,18/11/2016,Almeria,Elche,2,1,H,1,1,D
      SP2,201617,19/11/2016,Girona,Lugo,3,1,H,2,1,H
      SP2,201617,19/11/2016,Mallorca,Sevilla B,2,2,D,0,2,A
      SP2,201617,19/11/2016,Numancia,Valladolid,2,1,H,1,0,H
      SP2,201617,19/11/2016,Oviedo,Levante,2,0,H,0,0,D
      SP2,201617,20/11/2016,Cadiz,Alcorcon,4,1,H,0,1,A
      SP2,201617,20/11/2016,Getafe,Zaragoza,1,0,H,0,0,D
      SP2,201617,20/11/2016,Mirandes,Cordoba,1,1,D,1,0,H
      SP2,201617,20/11/2016,Reus Deportiu,Gimnastic,1,0,H,0,0,D
      SP2,201617,20/11/2016,Tenerife,UCAM Murcia,2,1,H,2,1,H
      SP2,201617,20/11/2016,Vallecano,Huesca,2,2,D,1,1,D
      SP2,201617,25/11/2016,Gimnastic,Cadiz,1,0,H,0,0,D
      SP2,201617,26/11/2016,Alcorcon,Oviedo,5,1,H,2,0,H
      SP2,201617,26/11/2016,Lugo,Tenerife,1,3,A,1,1,D
      SP2,201617,26/11/2016,UCAM Murcia,Numancia,3,2,H,0,1,A
      SP2,201617,26/11/2016,Valladolid,Almeria,0,0,D,0,0,D
      SP2,201617,26/11/2016,Zaragoza,Reus Deportiu,2,2,D,1,0,H
      SP2,201617,27/11/2016,Cordoba,Getafe,1,3,A,0,1,A
      SP2,201617,27/11/2016,Elche,Mallorca,1,0,H,0,0,D
      SP2,201617,27/11/2016,Huesca,Girona,1,2,A,1,2,A
      SP2,201617,27/11/2016,Sevilla B,Mirandes,1,0,H,1,0,H
      SP2,201617,02/12/2016,Getafe,Sevilla B,2,0,H,1,0,H
      SP2,201617,03/12/2016,Cadiz,Zaragoza,3,0,H,1,0,H
      SP2,201617,03/12/2016,Mirandes,Elche,1,0,H,1,0,H
      SP2,201617,03/12/2016,Numancia,Almeria,1,0,H,1,0,H
      SP2,201617,03/12/2016,UCAM Murcia,Lugo,1,2,A,1,1,D
      SP2,201617,04/12/2016,Girona,Levante,2,1,H,1,0,H
      SP2,201617,04/12/2016,Mallorca,Valladolid,0,3,A,0,0,D
      SP2,201617,04/12/2016,Oviedo,Gimnastic,1,0,H,1,0,H
      SP2,201617,04/12/2016,Reus Deportiu,Cordoba,1,2,A,0,1,A
      SP2,201617,04/12/2016,Tenerife,Huesca,1,1,D,1,0,H
      SP2,201617,04/12/2016,Vallecano,Alcorcon,2,0,H,0,0,D
      SP2,201617,09/12/2016,Sevilla B,Reus Deportiu,0,1,A,0,0,D
      SP2,201617,10/12/2016,Elche,Getafe,2,2,D,0,2,A
      SP2,201617,10/12/2016,Gimnastic,Vallecano,0,1,A,0,0,D
      SP2,201617,10/12/2016,Huesca,UCAM Murcia,5,2,H,2,1,H
      SP2,201617,10/12/2016,Levante,Tenerife,1,0,H,0,0,D
      SP2,201617,11/12/2016,Alcorcon,Girona,2,1,H,2,0,H
      SP2,201617,11/12/2016,Almeria,Mallorca,2,1,H,1,0,H
      SP2,201617,11/12/2016,Cordoba,Cadiz,1,3,A,0,0,D
      SP2,201617,11/12/2016,Lugo,Numancia,3,1,H,1,1,D
      SP2,201617,11/12/2016,Valladolid,Mirandes,5,0,H,2,0,H
      SP2,201617,11/12/2016,Zaragoza,Oviedo,2,1,H,1,0,H
      SP2,201617,14/12/2016,Levante,Vallecano,1,0,H,1,0,H
      SP2,201617,16/12/2016,Reus Deportiu,Elche,0,1,A,0,0,D
      SP2,201617,17/12/2016,Getafe,Valladolid,3,1,H,0,0,D
      SP2,201617,17/12/2016,Girona,Gimnastic,4,2,H,1,2,A
      SP2,201617,17/12/2016,Lugo,Huesca,1,1,D,0,1,A
      SP2,201617,17/12/2016,Oviedo,Cordoba,1,2,A,0,1,A
      SP2,201617,17/12/2016,Tenerife,Alcorcon,2,0,H,1,0,H
      SP2,201617,18/12/2016,Cadiz,Sevilla B,4,1,H,1,0,H
      SP2,201617,18/12/2016,Mirandes,Almeria,2,1,H,0,0,D
      SP2,201617,18/12/2016,Numancia,Mallorca,3,1,H,2,1,H
      SP2,201617,18/12/2016,Vallecano,Zaragoza,1,2,A,0,0,D
      SP2,201617,06/01/2017,Almeria,Getafe,0,1,A,0,0,D
      SP2,201617,06/01/2017,Mallorca,Mirandes,2,0,H,0,0,D
      SP2,201617,06/01/2017,Numancia,Huesca,0,0,D,0,0,D
      SP2,201617,06/01/2017,Valladolid,Reus Deportiu,1,0,H,0,0,D
      SP2,201617,07/01/2017,Cordoba,Vallecano,0,0,D,0,0,D
      SP2,201617,07/01/2017,Levante,Lugo,1,0,H,0,0,D
      SP2,201617,08/01/2017,Alcorcon,UCAM Murcia,0,0,D,0,0,D
      SP2,201617,08/01/2017,Elche,Cadiz,2,3,A,1,1,D
      SP2,201617,08/01/2017,Gimnastic,Tenerife,1,1,D,0,1,A
      SP2,201617,08/01/2017,Sevilla B,Oviedo,5,3,H,3,0,H
      SP2,201617,08/01/2017,Zaragoza,Girona,0,2,A,0,0,D
      SP2,201617,11/01/2017,UCAM Murcia,Levante,0,2,A,0,1,A
      SP2,201617,13/01/2017,Cadiz,Valladolid,0,1,A,0,1,A
      SP2,201617,14/01/2017,Mirandes,Numancia,0,3,A,0,1,A
      SP2,201617,14/01/2017,Oviedo,Elche,2,1,H,0,0,D
      SP2,201617,14/01/2017,Tenerife,Zaragoza,1,0,H,0,0,D
      SP2,201617,14/01/2017,UCAM Murcia,Gimnastic,1,1,D,0,1,A
      SP2,201617,14/01/2017,Vallecano,Sevilla B,1,1,D,0,1,A
      SP2,201617,15/01/2017,Getafe,Mallorca,1,1,D,0,1,A
      SP2,201617,15/01/2017,Girona,Cordoba,2,0,H,1,0,H
      SP2,201617,15/01/2017,Huesca,Levante,0,2,A,0,1,A
      SP2,201617,15/01/2017,Lugo,Alcorcon,1,0,H,0,0,D
      SP2,201617,15/01/2017,Reus Deportiu,Almeria,1,0,H,1,0,H
      SP2,201617,21/01/2017,Huesca,Alcorcon,0,1,A,0,0,D
      SP2,201617,21/01/2017,Lugo,Gimnastic,2,3,A,1,0,H
      SP2,201617,21/01/2017,Oviedo,Valladolid,1,0,H,1,0,H
      SP2,201617,21/01/2017,Tenerife,Cordoba,2,0,H,0,0,D
      SP2,201617,21/01/2017,UCAM Murcia,Zaragoza,1,0,H,1,0,H
      SP2,201617,21/01/2017,Vallecano,Elche,1,1,D,0,1,A
      SP2,201617,22/01/2017,Cadiz,Almeria,1,0,H,0,0,D
      SP2,201617,22/01/2017,Getafe,Mirandes,1,1,D,1,0,H
      SP2,201617,22/01/2017,Girona,Sevilla B,2,0,H,0,0,D
      SP2,201617,22/01/2017,Levante,Numancia,1,0,H,1,0,H
      SP2,201617,22/01/2017,Reus Deportiu,Mallorca,1,1,D,0,1,A
      SP2,201617,27/01/2017,Elche,Girona,1,0,H,0,0,D
      SP2,201617,28/01/2017,Alcorcon,Levante,2,0,H,2,0,H
      SP2,201617,28/01/2017,Gimnastic,Huesca,0,0,D,0,0,D
      SP2,201617,28/01/2017,Mirandes,Reus Deportiu,1,1,D,1,0,H
      SP2,201617,28/01/2017,Sevilla B,Tenerife,0,0,D,0,0,D
      SP2,201617,28/01/2017,Valladolid,Vallecano,2,1,H,0,1,A
      SP2,201617,29/01/2017,Almeria,Oviedo,3,0,H,0,0,D
      SP2,201617,29/01/2017,Cordoba,UCAM Murcia,1,1,D,1,0,H
      SP2,201617,29/01/2017,Mallorca,Cadiz,0,0,D,0,0,D
      SP2,201617,29/01/2017,Numancia,Getafe,2,0,H,1,0,H
      SP2,201617,29/01/2017,Zaragoza,Lugo,1,1,D,0,0,D
      SP2,201617,03/02/2017,UCAM Murcia,Sevilla B,1,0,H,0,0,D
      SP2,201617,04/02/2017,Alcorcon,Numancia,2,3,A,1,1,D
      SP2,201617,04/02/2017,Cadiz,Mirandes,2,1,H,1,1,D
      SP2,201617,04/02/2017,Huesca,Zaragoza,2,3,A,0,0,D
      SP2,201617,04/02/2017,Lugo,Cordoba,1,0,H,1,0,H
      SP2,201617,04/02/2017,Tenerife,Elche,2,0,H,1,0,H
      SP2,201617,05/02/2017,Girona,Valladolid,2,1,H,1,0,H
      SP2,201617,05/02/2017,Levante,Gimnastic,2,1,H,0,0,D
      SP2,201617,05/02/2017,Oviedo,Mallorca,2,1,H,1,1,D
      SP2,201617,05/02/2017,Reus Deportiu,Getafe,1,1,D,0,1,A
      SP2,201617,05/02/2017,Vallecano,Almeria,1,0,H,1,0,H
      SP2,201617,10/02/2017,Sevilla B,Lugo,1,1,D,0,0,D
      SP2,201617,11/02/2017,Almeria,Girona,0,0,D,0,0,D
      SP2,201617,11/02/2017,Getafe,Cadiz,3,2,H,2,1,H
      SP2,201617,11/02/2017,Gimnastic,Alcorcon,1,1,D,1,1,D
      SP2,201617,11/02/2017,Zaragoza,Levante,0,1,A,0,1,A
      SP2,201617,12/02/2017,Cordoba,Huesca,0,2,A,0,0,D
      SP2,201617,12/02/2017,Elche,UCAM Murcia,1,1,D,1,0,H
      SP2,201617,12/02/2017,Mallorca,Vallecano,2,1,H,2,0,H
      SP2,201617,12/02/2017,Mirandes,Oviedo,0,2,A,0,1,A
      SP2,201617,12/02/2017,Numancia,Reus Deportiu,1,0,H,1,0,H
      SP2,201617,12/02/2017,Valladolid,Tenerife,0,0,D,0,0,D
      SP2,201617,17/02/2017,Lugo,Elche,1,2,A,1,2,A
      SP2,201617,18/02/2017,Gimnastic,Numancia,2,0,H,0,0,D
      SP2,201617,18/02/2017,Girona,Mallorca,1,0,H,0,0,D
      SP2,201617,18/02/2017,Levante,Cordoba,3,1,H,1,1,D
      SP2,201617,18/02/2017,Tenerife,Almeria,1,0,H,1,0,H
      SP2,201617,18/02/2017,UCAM Murcia,Valladolid,1,3,A,0,2,A
      SP2,201617,19/02/2017,Alcorcon,Zaragoza,1,1,D,0,0,D
      SP2,201617,19/02/2017,Cadiz,Reus Deportiu,0,0,D,0,0,D
      SP2,201617,19/02/2017,Huesca,Sevilla B,2,1,H,2,0,H
      SP2,201617,19/02/2017,Oviedo,Getafe,2,1,H,1,0,H
      SP2,201617,19/02/2017,Vallecano,Mirandes,1,2,A,0,0,D
      SP2,201617,24/02/2017,Reus Deportiu,Oviedo,1,1,D,1,0,H
      SP2,201617,25/02/2017,Cordoba,Alcorcon,1,0,H,0,0,D
      SP2,201617,25/02/2017,Elche,Huesca,1,1,D,0,1,A
      SP2,201617,25/02/2017,Getafe,Vallecano,1,0,H,0,0,D
      SP2,201617,25/02/2017,Mallorca,Tenerife,1,4,A,1,0,H
      SP2,201617,25/02/2017,Mirandes,Girona,0,2,A,0,0,D
      SP2,201617,26/02/2017,Almeria,UCAM Murcia,2,3,A,1,1,D
      SP2,201617,26/02/2017,Numancia,Cadiz,0,3,A,0,0,D
      SP2,201617,26/02/2017,Sevilla B,Levante,1,1,D,0,1,A
      SP2,201617,26/02/2017,Valladolid,Lugo,1,1,D,1,1,D
      SP2,201617,26/02/2017,Zaragoza,Gimnastic,1,2,A,1,1,D
      SP2,201617,03/03/2017,Tenerife,Mirandes,1,1,D,1,1,D
      SP2,201617,04/03/2017,Alcorcon,Sevilla B,0,0,D,0,0,D
      SP2,201617,04/03/2017,Girona,Getafe,5,1,H,3,0,H
      SP2,201617,04/03/2017,Oviedo,Cadiz,2,1,H,1,1,D
      SP2,201617,04/03/2017,Vallecano,Reus Deportiu,0,0,D,0,0,D
      SP2,201617,05/03/2017,Gimnastic,Cordoba,2,1,H,1,1,D
      SP2,201617,05/03/2017,Huesca,Valladolid,1,0,H,0,0,D
      SP2,201617,05/03/2017,Levante,Elche,2,1,H,0,1,A
      SP2,201617,05/03/2017,Lugo,Almeria,1,2,A,0,1,A
      SP2,201617,05/03/2017,UCAM Murcia,Mallorca,1,1,D,0,1,A
      SP2,201617,05/03/2017,Zaragoza,Numancia,3,0,H,2,0,H
      SP2,201617,10/03/2017,Elche,Alcorcon,0,0,D,0,0,D
      SP2,201617,11/03/2017,Cordoba,Zaragoza,2,1,H,0,1,A
      SP2,201617,11/03/2017,Mallorca,Lugo,1,1,D,0,1,A
      SP2,201617,11/03/2017,Mirandes,UCAM Murcia,1,1,D,0,0,D
      SP2,201617,11/03/2017,Numancia,Oviedo,0,0,D,0,0,D
      SP2,201617,11/03/2017,Valladolid,Levante,0,4,A,0,2,A
      SP2,201617,12/03/2017,Almeria,Huesca,0,0,D,0,0,D
      SP2,201617,12/03/2017,Cadiz,Vallecano,1,0,H,1,0,H
      SP2,201617,12/03/2017,Getafe,Tenerife,2,2,D,1,0,H
      SP2,201617,12/03/2017,Reus Deportiu,Girona,1,2,A,0,0,D
      SP2,201617,12/03/2017,Sevilla B,Gimnastic,2,2,D,0,1,A
      SP2,201617,17/03/2017,Gimnastic,Elche,1,3,A,0,3,A
      SP2,201617,18/03/2017,Cordoba,Numancia,0,0,D,0,0,D
      SP2,201617,18/03/2017,Huesca,Mallorca,2,1,H,0,0,D
      SP2,201617,18/03/2017,Lugo,Mirandes,2,1,H,0,0,D
      SP2,201617,18/03/2017,UCAM Murcia,Getafe,2,0,H,2,0,H
      SP2,201617,18/03/2017,Zaragoza,Sevilla B,1,2,A,0,1,A
      SP2,201617,19/03/2017,Alcorcon,Valladolid,1,2,A,1,2,A
      SP2,201617,19/03/2017,Girona,Cadiz,1,2,A,0,2,A
      SP2,201617,19/03/2017,Levante,Almeria,1,0,H,1,0,H
      SP2,201617,19/03/2017,Tenerife,Reus Deportiu,0,1,A,0,1,A
      SP2,201617,19/03/2017,Vallecano,Oviedo,2,0,H,1,0,H
      SP2,201617,25/03/2017,Almeria,Alcorcon,3,1,H,1,0,H
      SP2,201617,25/03/2017,Mallorca,Levante,1,1,D,0,1,A
      SP2,201617,25/03/2017,Numancia,Vallecano,0,0,D,0,0,D
      SP2,201617,25/03/2017,Oviedo,Girona,2,0,H,0,0,D
      SP2,201617,25/03/2017,Valladolid,Gimnastic,1,2,A,0,1,A
      SP2,201617,26/03/2017,Cadiz,Tenerife,0,1,A,0,0,D
      SP2,201617,26/03/2017,Elche,Zaragoza,0,3,A,0,3,A
      SP2,201617,26/03/2017,Getafe,Lugo,2,0,H,1,0,H
      SP2,201617,26/03/2017,Mirandes,Huesca,1,3,A,1,2,A
      SP2,201617,26/03/2017,Reus Deportiu,UCAM Murcia,0,0,D,0,0,D
      SP2,201617,26/03/2017,Sevilla B,Cordoba,1,0,H,1,0,H
      SP2,201617,31/03/2017,Alcorcon,Mallorca,1,0,H,0,0,D
      SP2,201617,01/04/2017,Girona,Vallecano,1,3,A,1,2,A
      SP2,201617,01/04/2017,Huesca,Getafe,0,0,D,0,0,D
      SP2,201617,01/04/2017,Levante,Mirandes,2,1,H,1,0,H
      SP2,201617,01/04/2017,UCAM Murcia,Cadiz,1,1,D,1,1,D
      SP2,201617,02/04/2017,Cordoba,Elche,1,0,H,0,0,D
      SP2,201617,02/04/2017,Gimnastic,Almeria,0,1,A,0,0,D
      SP2,201617,02/04/2017,Lugo,Reus Deportiu,1,0,H,0,0,D
      SP2,201617,02/04/2017,Tenerife,Oviedo,1,0,H,1,0,H
      SP2,201617,02/04/2017,Zaragoza,Valladolid,1,1,D,1,1,D
      SP2,201617,03/04/2017,Sevilla B,Numancia,1,1,D,1,1,D
      SP2,201617,07/04/2017,Mirandes,Alcorcon,2,0,H,0,0,D
      SP2,201617,08/04/2017,Cadiz,Lugo,1,1,D,1,1,D
      SP2,201617,08/04/2017,Getafe,Levante,2,0,H,2,0,H
      SP2,201617,08/04/2017,Mallorca,Gimnastic,0,0,D,0,0,D
      SP2,201617,08/04/2017,Vallecano,Tenerife,1,1,D,1,1,D
      SP2,201617,09/04/2017,Almeria,Zaragoza,2,2,D,2,2,D
      SP2,201617,09/04/2017,Elche,Sevilla B,3,2,H,1,1,D
      SP2,201617,09/04/2017,Numancia,Girona,0,2,A,0,0,D
      SP2,201617,09/04/2017,Oviedo,UCAM Murcia,2,0,H,1,0,H
      SP2,201617,09/04/2017,Reus Deportiu,Huesca,0,1,A,0,0,D
      SP2,201617,09/04/2017,Valladolid,Cordoba,2,1,H,1,0,H
      SP2,201617,15/04/2017,Elche,Numancia,1,3,A,0,1,A
      SP2,201617,15/04/2017,Gimnastic,Mirandes,4,1,H,1,1,D
      SP2,201617,15/04/2017,Huesca,Cadiz,1,1,D,0,0,D
      SP2,201617,15/04/2017,Tenerife,Girona,3,3,D,1,2,A
      SP2,201617,16/04/2017,Alcorcon,Getafe,0,3,A,0,2,A
      SP2,201617,16/04/2017,Cordoba,Almeria,1,0,H,1,0,H
      SP2,201617,16/04/2017,Lugo,Oviedo,2,1,H,1,1,D
      SP2,201617,16/04/2017,Sevilla B,Valladolid,6,2,H,4,0,H
      SP2,201617,16/04/2017,UCAM Murcia,Vallecano,0,1,A,0,1,A
      SP2,201617,16/04/2017,Zaragoza,Mallorca,1,0,H,1,0,H
      SP2,201617,17/04/2017,Levante,Reus Deportiu,0,0,D,0,0,D
      SP2,201617,21/04/2017,Oviedo,Huesca,1,1,D,1,0,H
      SP2,201617,22/04/2017,Cadiz,Levante,1,1,D,0,1,A
      SP2,201617,22/04/2017,Getafe,Gimnastic,1,1,D,1,0,H
      SP2,201617,22/04/2017,Girona,UCAM Murcia,1,2,A,1,1,D
      SP2,201617,22/04/2017,Valladolid,Elche,2,1,H,1,1,D
      SP2,201617,22/04/2017,Vallecano,Lugo,2,0,H,0,0,D
      SP2,201617,23/04/2017,Almeria,Sevilla B,2,1,H,1,0,H
      SP2,201617,23/04/2017,Mallorca,Cordoba,1,1,D,1,1,D
      SP2,201617,23/04/2017,Mirandes,Zaragoza,0,1,A,0,1,A
      SP2,201617,23/04/2017,Numancia,Tenerife,1,1,D,0,0,D
      SP2,201617,23/04/2017,Reus Deportiu,Alcorcon,0,0,D,0,0,D
      SP2,201617,28/04/2017,Elche,Almeria,2,3,A,0,1,A
      SP2,201617,29/04/2017,Levante,Oviedo,1,0,H,0,0,D
      SP2,201617,29/04/2017,UCAM Murcia,Tenerife,1,0,H,1,0,H
      SP2,201617,29/04/2017,Valladolid,Numancia,1,1,D,0,0,D
      SP2,201617,29/04/2017,Zaragoza,Getafe,1,2,A,1,0,H
      SP2,201617,30/04/2017,Alcorcon,Cadiz,0,2,A,0,1,A
      SP2,201617,30/04/2017,Cordoba,Mirandes,1,1,D,0,0,D
      SP2,201617,30/04/2017,Lugo,Girona,1,2,A,0,2,A
      SP2,201617,30/04/2017,Sevilla B,Mallorca,2,3,A,0,1,A
      SP2,201617,01/05/2017,Gimnastic,Reus Deportiu,0,1,A,0,0,D
      SP2,201617,01/05/2017,Huesca,Vallecano,2,0,H,0,0,D
      SP2,201617,05/05/2017,Oviedo,Alcorcon,0,1,A,0,0,D
      SP2,201617,06/05/2017,Girona,Huesca,3,1,H,2,1,H
      SP2,201617,06/05/2017,Mallorca,Elche,1,0,H,0,0,D
      SP2,201617,06/05/2017,Numancia,UCAM Murcia,1,0,H,1,0,H
      SP2,201617,06/05/2017,Vallecano,Levante,2,1,H,1,1,D
      SP2,201617,07/05/2017,Almeria,Valladolid,0,3,A,0,1,A
      SP2,201617,07/05/2017,Cadiz,Gimnastic,0,0,D,0,0,D
      SP2,201617,07/05/2017,Getafe,Cordoba,2,0,H,1,0,H
      SP2,201617,07/05/2017,Mirandes,Sevilla B,0,1,A,0,0,D
      SP2,201617,07/05/2017,Reus Deportiu,Zaragoza,1,0,H,1,0,H
      SP2,201617,07/05/2017,Tenerife,Lugo,2,1,H,1,0,H
      SP2,201617,12/05/2017,Sevilla B,Getafe,2,1,H,1,0,H
      SP2,201617,12/05/2017,Zaragoza,Cadiz,1,1,D,1,0,H
      SP2,201617,13/05/2017,Alcorcon,Vallecano,2,0,H,0,0,D
      SP2,201617,13/05/2017,Almeria,Numancia,2,0,H,2,0,H
      SP2,201617,13/05/2017,Cordoba,Reus Deportiu,1,0,H,0,0,D
      SP2,201617,13/05/2017,Elche,Mirandes,0,1,A,0,0,D
      SP2,201617,13/05/2017,Gimnastic,Oviedo,2,2,D,0,2,A
      SP2,201617,13/05/2017,Huesca,Tenerife,2,2,D,0,2,A
      SP2,201617,13/05/2017,Levante,Girona,2,1,H,1,0,H
      SP2,201617,13/05/2017,Valladolid,Mallorca,2,1,H,1,0,H
      SP2,201617,14/05/2017,Lugo,UCAM Murcia,0,0,D,0,0,D
      SP2,201617,19/05/2017,Getafe,Elche,2,0,H,1,0,H
      SP2,201617,19/05/2017,Vallecano,Gimnastic,2,0,H,0,0,D
      SP2,201617,20/05/2017,Cadiz,Cordoba,1,1,D,0,0,D
      SP2,201617,20/05/2017,Girona,Alcorcon,0,0,D,0,0,D
      SP2,201617,20/05/2017,Mallorca,Almeria,1,0,H,1,0,H
      SP2,201617,20/05/2017,Oviedo,Zaragoza,0,0,D,0,0,D
      SP2,201617,20/05/2017,Reus Deportiu,Sevilla B,2,1,H,1,0,H
      SP2,201617,20/05/2017,Tenerife,Levante,0,0,D,0,0,D
      SP2,201617,20/05/2017,UCAM Murcia,Huesca,3,1,H,2,0,H
      SP2,201617,21/05/2017,Mirandes,Valladolid,2,2,D,0,2,A
      SP2,201617,21/05/2017,Numancia,Lugo,0,1,A,0,0,D
      SP2,201617,26/05/2017,Levante,UCAM Murcia,3,1,H,1,1,D
      SP2,201617,27/05/2017,Almeria,Mirandes,2,0,H,1,0,H
      SP2,201617,27/05/2017,Huesca,Lugo,1,0,H,1,0,H
      SP2,201617,27/05/2017,Sevilla B,Cadiz,3,3,D,2,0,H
      SP2,201617,27/05/2017,Valladolid,Getafe,1,0,H,0,0,D
      SP2,201617,28/05/2017,Alcorcon,Tenerife,1,3,A,0,2,A
      SP2,201617,28/05/2017,Cordoba,Oviedo,4,2,H,3,0,H
      SP2,201617,28/05/2017,Elche,Reus Deportiu,1,1,D,0,0,D
      SP2,201617,28/05/2017,Gimnastic,Girona,3,1,H,0,1,A
      SP2,201617,28/05/2017,Mallorca,Numancia,0,0,D,0,0,D
      SP2,201617,28/05/2017,Zaragoza,Vallecano,1,1,D,1,0,H
      SP2,201617,02/06/2017,Lugo,Levante,1,0,H,0,0,D
      SP2,201617,04/06/2017,Cadiz,Elche,2,1,H,0,0,D
      SP2,201617,04/06/2017,Getafe,Almeria,4,0,H,2,0,H
      SP2,201617,04/06/2017,Girona,Zaragoza,0,0,D,0,0,D
      SP2,201617,04/06/2017,Huesca,Numancia,0,0,D,0,0,D
      SP2,201617,04/06/2017,Mirandes,Mallorca,2,2,D,2,1,H
      SP2,201617,04/06/2017,Oviedo,Sevilla B,1,0,H,1,0,H
      SP2,201617,04/06/2017,Reus Deportiu,Valladolid,2,0,H,2,0,H
      SP2,201617,04/06/2017,Tenerife,Gimnastic,0,1,A,0,0,D
      SP2,201617,04/06/2017,UCAM Murcia,Alcorcon,0,1,A,0,1,A
      SP2,201617,04/06/2017,Vallecano,Cordoba,1,2,A,1,1,D
      SP2,201617,09/06/2017,Sevilla B,Vallecano,1,2,A,0,1,A
      SP2,201617,10/06/2017,Alcorcon,Lugo,3,0,H,1,0,H
      SP2,201617,10/06/2017,Almeria,Reus Deportiu,1,0,H,1,0,H
      SP2,201617,10/06/2017,Cordoba,Girona,2,1,H,0,0,D
      SP2,201617,10/06/2017,Elche,Oviedo,0,2,A,0,0,D
      SP2,201617,10/06/2017,Gimnastic,UCAM Murcia,1,0,H,0,0,D
      SP2,201617,10/06/2017,Levante,Huesca,1,2,A,0,0,D
      SP2,201617,10/06/2017,Mallorca,Getafe,3,3,D,1,1,D
      SP2,201617,10/06/2017,Valladolid,Cadiz,1,0,H,0,0,D
      SP2,201617,10/06/2017,Zaragoza,Tenerife,1,2,A,0,1,A
      SP2,201617,11/06/2017,Numancia,Mirandes,0,2,A,0,0,D
      SP2,201516,22/08/2015,Alcorcon,Mallorca,2,0,H,1,0,H
      SP2,201516,22/08/2015,Cordoba,Valladolid,1,0,H,0,0,D
      SP2,201516,22/08/2015,Huesca,Alaves,2,3,A,0,1,A
      SP2,201516,22/08/2015,Llagostera,Osasuna,0,2,A,0,0,D
      SP2,201516,23/08/2015,Almeria,Leganes,3,2,H,3,0,H
      SP2,201516,23/08/2015,Gimnastic,Albacete,2,2,D,0,0,D
      SP2,201516,23/08/2015,Mirandes,Zaragoza,1,1,D,0,0,D
      SP2,201516,23/08/2015,Numancia,Tenerife,6,3,H,1,2,A
      SP2,201516,23/08/2015,Oviedo,Lugo,2,2,D,1,1,D
      SP2,201516,23/08/2015,Ponferradina,Elche,2,0,H,0,0,D
      SP2,201516,24/08/2015,Ath Bilbao B,Girona,0,1,A,0,0,D
      SP2,201516,29/08/2015,Albacete,Huesca,1,1,D,1,1,D
      SP2,201516,29/08/2015,Girona,Numancia,2,3,A,1,1,D
      SP2,201516,29/08/2015,Leganes,Cordoba,3,1,H,2,0,H
      SP2,201516,29/08/2015,Lugo,Llagostera,1,0,H,0,0,D
      SP2,201516,29/08/2015,Zaragoza,Almeria,3,2,H,1,1,D
      SP2,201516,30/08/2015,Alaves,Oviedo,2,0,H,2,0,H
      SP2,201516,30/08/2015,Elche,Ath Bilbao B,2,1,H,0,0,D
      SP2,201516,30/08/2015,Mallorca,Ponferradina,1,0,H,1,0,H
      SP2,201516,30/08/2015,Osasuna,Mirandes,1,0,H,0,0,D
      SP2,201516,30/08/2015,Tenerife,Gimnastic,1,2,A,0,0,D
      SP2,201516,30/08/2015,Valladolid,Alcorcon,2,0,H,0,0,D
      SP2,201516,05/09/2015,Gimnastic,Girona,1,0,H,0,0,D
      SP2,201516,05/09/2015,Huesca,Tenerife,1,1,D,1,1,D
      SP2,201516,05/09/2015,Mirandes,Lugo,1,1,D,0,1,A
      SP2,201516,05/09/2015,Numancia,Elche,0,0,D,0,0,D
      SP2,201516,06/09/2015,Almeria,Osasuna,2,1,H,0,1,A
      SP2,201516,06/09/2015,Ath Bilbao B,Mallorca,3,1,H,1,1,D
      SP2,201516,06/09/2015,Cordoba,Alcorcon,1,3,A,1,1,D
      SP2,201516,06/09/2015,Leganes,Zaragoza,1,1,D,1,0,H
      SP2,201516,06/09/2015,Llagostera,Alaves,3,0,H,1,0,H
      SP2,201516,06/09/2015,Oviedo,Albacete,3,1,H,2,1,H
      SP2,201516,06/09/2015,Ponferradina,Valladolid,3,0,H,1,0,H
      SP2,201516,12/09/2015,Alaves,Mirandes,2,3,A,0,2,A
      SP2,201516,12/09/2015,Elche,Gimnastic,1,0,H,1,0,H
      SP2,201516,12/09/2015,Osasuna,Leganes,2,1,H,1,0,H
      SP2,201516,12/09/2015,Valladolid,Ath Bilbao B,1,0,H,1,0,H
      SP2,201516,12/09/2015,Zaragoza,Cordoba,0,1,A,0,1,A
      SP2,201516,13/09/2015,Albacete,Llagostera,1,0,H,1,0,H
      SP2,201516,13/09/2015,Alcorcon,Ponferradina,1,0,H,0,0,D
      SP2,201516,13/09/2015,Girona,Huesca,0,0,D,0,0,D
      SP2,201516,13/09/2015,Lugo,Almeria,1,0,H,0,0,D
      SP2,201516,13/09/2015,Mallorca,Numancia,0,0,D,0,0,D
      SP2,201516,13/09/2015,Tenerife,Oviedo,0,2,A,0,1,A
      SP2,201516,19/09/2015,Ath Bilbao B,Alcorcon,1,0,H,0,0,D
      SP2,201516,19/09/2015,Leganes,Lugo,0,0,D,0,0,D
      SP2,201516,19/09/2015,Llagostera,Tenerife,0,2,A,0,0,D
      SP2,201516,19/09/2015,Mirandes,Albacete,1,1,D,1,0,H
      SP2,201516,19/09/2015,Oviedo,Girona,1,2,A,1,1,D
      SP2,201516,20/09/2015,Almeria,Alaves,0,2,A,0,1,A
      SP2,201516,20/09/2015,Cordoba,Ponferradina,1,0,H,1,0,H
      SP2,201516,20/09/2015,Gimnastic,Mallorca,1,0,H,1,0,H
      SP2,201516,20/09/2015,Huesca,Elche,1,3,A,0,1,A
      SP2,201516,20/09/2015,Numancia,Valladolid,2,2,D,0,1,A
      SP2,201516,20/09/2015,Zaragoza,Osasuna,0,1,A,0,1,A
      SP2,201516,26/09/2015,Alcorcon,Numancia,1,1,D,1,1,D
      SP2,201516,26/09/2015,Lugo,Zaragoza,0,0,D,0,0,D
      SP2,201516,26/09/2015,Mallorca,Huesca,0,1,A,0,0,D
      SP2,201516,26/09/2015,Osasuna,Cordoba,0,0,D,0,0,D
      SP2,201516,26/09/2015,Ponferradina,Ath Bilbao B,1,0,H,0,0,D
      SP2,201516,27/09/2015,Alaves,Leganes,0,0,D,0,0,D
      SP2,201516,27/09/2015,Albacete,Almeria,3,0,H,2,0,H
      SP2,201516,27/09/2015,Elche,Oviedo,1,1,D,1,0,H
      SP2,201516,27/09/2015,Girona,Llagostera,2,2,D,1,0,H
      SP2,201516,27/09/2015,Tenerife,Mirandes,3,0,H,1,0,H
      SP2,201516,27/09/2015,Valladolid,Gimnastic,0,0,D,0,0,D
      SP2,201516,03/10/2015,Almeria,Tenerife,2,2,D,0,1,A
      SP2,201516,03/10/2015,Cordoba,Ath Bilbao B,1,0,H,1,0,H
      SP2,201516,03/10/2015,Gimnastic,Alcorcon,0,2,A,0,0,D
      SP2,201516,03/10/2015,Numancia,Ponferradina,1,0,H,1,0,H
      SP2,201516,03/10/2015,Zaragoza,Alaves,1,0,H,1,0,H
      SP2,201516,04/10/2015,Huesca,Valladolid,1,1,D,0,1,A
      SP2,201516,04/10/2015,Leganes,Albacete,3,2,H,0,1,A
      SP2,201516,04/10/2015,Llagostera,Elche,4,1,H,2,0,H
      SP2,201516,04/10/2015,Mirandes,Girona,1,0,H,0,0,D
      SP2,201516,04/10/2015,Osasuna,Lugo,4,0,H,3,0,H
      SP2,201516,04/10/2015,Oviedo,Mallorca,1,1,D,1,1,D
      SP2,201516,10/10/2015,Alaves,Osasuna,3,0,H,1,0,H
      SP2,201516,10/10/2015,Ath Bilbao B,Numancia,0,0,D,0,0,D
      SP2,201516,10/10/2015,Elche,Mirandes,1,4,A,0,0,D
      SP2,201516,10/10/2015,Ponferradina,Gimnastic,2,2,D,0,0,D
      SP2,201516,10/10/2015,Tenerife,Leganes,0,0,D,0,0,D
      SP2,201516,11/10/2015,Albacete,Zaragoza,1,3,A,0,3,A
      SP2,201516,11/10/2015,Alcorcon,Huesca,0,1,A,0,0,D
      SP2,201516,11/10/2015,Girona,Almeria,1,1,D,1,1,D
      SP2,201516,11/10/2015,Lugo,Cordoba,1,2,A,1,1,D
      SP2,201516,11/10/2015,Mallorca,Llagostera,1,0,H,0,0,D
      SP2,201516,11/10/2015,Valladolid,Oviedo,2,3,A,1,2,A
      SP2,201516,17/10/2015,Gimnastic,Ath Bilbao B,2,1,H,1,0,H
      SP2,201516,17/10/2015,Leganes,Girona,2,2,D,1,0,H
      SP2,201516,17/10/2015,Mirandes,Mallorca,2,2,D,2,0,H
      SP2,201516,17/10/2015,Osasuna,Albacete,1,0,H,1,0,H
      SP2,201516,17/10/2015,Oviedo,Alcorcon,3,2,H,1,0,H
      SP2,201516,18/10/2015,Almeria,Elche,2,3,A,1,1,D
      SP2,201516,18/10/2015,Cordoba,Numancia,3,2,H,2,1,H
      SP2,201516,18/10/2015,Huesca,Ponferradina,1,1,D,1,0,H
      SP2,201516,18/10/2015,Llagostera,Valladolid,3,1,H,1,0,H
      SP2,201516,18/10/2015,Lugo,Alaves,1,0,H,1,0,H
      SP2,201516,18/10/2015,Zaragoza,Tenerife,2,0,H,1,0,H
      SP2,201516,24/10/2015,Alaves,Cordoba,3,2,H,1,2,A
      SP2,201516,24/10/2015,Alcorcon,Llagostera,6,1,H,5,0,H
      SP2,201516,24/10/2015,Ath Bilbao B,Huesca,0,0,D,0,0,D
      SP2,201516,24/10/2015,Elche,Leganes,0,0,D,0,0,D
      SP2,201516,24/10/2015,Girona,Zaragoza,0,0,D,0,0,D
      SP2,201516,25/10/2015,Albacete,Lugo,2,0,H,1,0,H
      SP2,201516,25/10/2015,Mallorca,Almeria,1,0,H,0,0,D
      SP2,201516,25/10/2015,Numancia,Gimnastic,1,1,D,0,0,D
      SP2,201516,25/10/2015,Ponferradina,Oviedo,4,2,H,2,1,H
      SP2,201516,25/10/2015,Tenerife,Osasuna,2,2,D,1,1,D
      SP2,201516,25/10/2015,Valladolid,Mirandes,2,1,H,2,0,H
      SP2,201516,31/10/2015,Cordoba,Gimnastic,2,0,H,2,0,H
      SP2,201516,31/10/2015,Huesca,Numancia,2,0,H,1,0,H
      SP2,201516,31/10/2015,Llagostera,Ponferradina,0,1,A,0,0,D
      SP2,201516,31/10/2015,Lugo,Tenerife,2,0,H,2,0,H
      SP2,201516,31/10/2015,Mirandes,Alcorcon,3,0,H,2,0,H
      SP2,201516,01/11/2015,Alaves,Albacete,1,1,D,1,1,D
      SP2,201516,01/11/2015,Almeria,Valladolid,1,1,D,0,0,D
      SP2,201516,01/11/2015,Leganes,Mallorca,0,0,D,0,0,D
      SP2,201516,01/11/2015,Osasuna,Girona,0,1,A,0,1,A
      SP2,201516,01/11/2015,Oviedo,Ath Bilbao B,0,0,D,0,0,D
      SP2,201516,01/11/2015,Zaragoza,Elche,2,0,H,0,0,D
      SP2,201516,07/11/2015,Mallorca,Zaragoza,0,0,D,0,0,D
      SP2,201516,07/11/2015,Ponferradina,Mirandes,2,2,D,1,1,D
      SP2,201516,07/11/2015,Tenerife,Alaves,2,0,H,0,0,D
      SP2,201516,07/11/2015,Valladolid,Leganes,1,1,D,1,0,H
      SP2,201516,08/11/2015,Albacete,Cordoba,2,0,H,0,0,D
      SP2,201516,08/11/2015,Alcorcon,Almeria,0,0,D,0,0,D
      SP2,201516,08/11/2015,Elche,Osasuna,2,1,H,1,1,D
      SP2,201516,08/11/2015,Gimnastic,Huesca,2,0,H,2,0,H
      SP2,201516,08/11/2015,Girona,Lugo,0,1,A,0,0,D
      SP2,201516,08/11/2015,Numancia,Oviedo,1,0,H,0,0,D
      SP2,201516,09/11/2015,Ath Bilbao B,Llagostera,2,0,H,1,0,H
      SP2,201516,14/11/2015,Alaves,Girona,1,0,H,1,0,H
      SP2,201516,14/11/2015,Albacete,Tenerife,1,2,A,1,1,D
      SP2,201516,14/11/2015,Leganes,Alcorcon,3,0,H,2,0,H
      SP2,201516,14/11/2015,Lugo,Elche,1,1,D,1,0,H
      SP2,201516,14/11/2015,Mirandes,Ath Bilbao B,3,0,H,2,0,H
      SP2,201516,15/11/2015,Almeria,Ponferradina,1,1,D,1,1,D
      SP2,201516,15/11/2015,Cordoba,Huesca,1,1,D,0,0,D
      SP2,201516,15/11/2015,Llagostera,Numancia,2,1,H,2,0,H
      SP2,201516,15/11/2015,Osasuna,Mallorca,2,1,H,2,1,H
      SP2,201516,15/11/2015,Oviedo,Gimnastic,2,0,H,2,0,H
      SP2,201516,15/11/2015,Zaragoza,Valladolid,0,2,A,0,1,A
      SP2,201516,21/11/2015,Ath Bilbao B,Almeria,0,0,D,0,0,D
      SP2,201516,21/11/2015,Elche,Alaves,0,1,A,0,0,D
      SP2,201516,21/11/2015,Huesca,Oviedo,0,1,A,0,0,D
      SP2,201516,21/11/2015,Mallorca,Lugo,1,1,D,0,0,D
      SP2,201516,21/11/2015,Numancia,Mirandes,2,2,D,0,1,A
      SP2,201516,22/11/2015,Alcorcon,Zaragoza,1,0,H,1,0,H
      SP2,201516,22/11/2015,Gimnastic,Llagostera,2,0,H,1,0,H
      SP2,201516,22/11/2015,Girona,Albacete,3,0,H,2,0,H
      SP2,201516,22/11/2015,Ponferradina,Leganes,1,0,H,0,0,D
      SP2,201516,22/11/2015,Tenerife,Cordoba,1,1,D,0,0,D
      SP2,201516,22/11/2015,Valladolid,Osasuna,0,1,A,0,0,D
      SP2,201516,28/11/2015,Alaves,Mallorca,1,0,H,1,0,H
      SP2,201516,28/11/2015,Almeria,Numancia,1,1,D,1,0,H
      SP2,201516,28/11/2015,Leganes,Ath Bilbao B,1,0,H,1,0,H
      SP2,201516,28/11/2015,Llagostera,Huesca,2,0,H,1,0,H
      SP2,201516,28/11/2015,Osasuna,Alcorcon,1,2,A,0,1,A
      SP2,201516,29/11/2015,Albacete,Elche,1,0,H,0,0,D
      SP2,201516,29/11/2015,Cordoba,Oviedo,2,1,H,2,1,H
      SP2,201516,29/11/2015,Lugo,Valladolid,1,1,D,0,0,D
      SP2,201516,29/11/2015,Mirandes,Gimnastic,0,1,A,0,0,D
      SP2,201516,29/11/2015,Tenerife,Girona,1,1,D,1,1,D
      SP2,201516,29/11/2015,Zaragoza,Ponferradina,2,0,H,2,0,H
      SP2,201516,05/12/2015,Alcorcon,Lugo,1,1,D,0,1,A
      SP2,201516,05/12/2015,Elche,Tenerife,0,0,D,0,0,D
      SP2,201516,05/12/2015,Gimnastic,Almeria,2,2,D,2,1,H
      SP2,201516,05/12/2015,Valladolid,Alaves,1,2,A,0,1,A
      SP2,201516,06/12/2015,Girona,Cordoba,1,2,A,0,0,D
      SP2,201516,06/12/2015,Huesca,Mirandes,1,2,A,0,1,A
      SP2,201516,06/12/2015,Mallorca,Albacete,2,0,H,0,0,D
      SP2,201516,06/12/2015,Numancia,Leganes,1,2,A,0,1,A
      SP2,201516,06/12/2015,Oviedo,Llagostera,2,1,H,2,1,H
      SP2,201516,06/12/2015,Ponferradina,Osasuna,3,0,H,2,0,H
      SP2,201516,07/12/2015,Ath Bilbao B,Zaragoza,0,1,A,0,1,A
      SP2,201516,12/12/2015,Alaves,Alcorcon,1,1,D,0,0,D
      SP2,201516,12/12/2015,Cordoba,Llagostera,2,0,H,1,0,H
      SP2,201516,12/12/2015,Girona,Elche,0,1,A,0,1,A
      SP2,201516,12/12/2015,Lugo,Ponferradina,3,1,H,1,1,D
      SP2,201516,12/12/2015,Tenerife,Mallorca,2,1,H,0,1,A
      SP2,201516,13/12/2015,Albacete,Valladolid,0,1,A,0,1,A
      SP2,201516,13/12/2015,Almeria,Huesca,1,2,A,0,2,A
      SP2,201516,13/12/2015,Leganes,Gimnastic,1,0,H,1,0,H
      SP2,201516,13/12/2015,Mirandes,Oviedo,1,2,A,1,0,H
      SP2,201516,13/12/2015,Osasuna,Ath Bilbao B,1,1,D,0,1,A
      SP2,201516,13/12/2015,Zaragoza,Numancia,2,2,D,1,0,H
      SP2,201516,18/12/2015,Elche,Cordoba,2,1,H,2,1,H
      SP2,201516,19/12/2015,Gimnastic,Zaragoza,3,1,H,1,0,H
      SP2,201516,19/12/2015,Mallorca,Girona,1,1,D,1,0,H
      SP2,201516,19/12/2015,Numancia,Osasuna,1,3,A,0,0,D
      SP2,201516,19/12/2015,Ponferradina,Alaves,0,1,A,0,0,D
      SP2,201516,20/12/2015,Alcorcon,Albacete,1,0,H,1,0,H
      SP2,201516,20/12/2015,Huesca,Leganes,1,1,D,0,0,D
      SP2,201516,20/12/2015,Llagostera,Mirandes,0,0,D,0,0,D
      SP2,201516,20/12/2015,Oviedo,Almeria,1,0,H,1,0,H
      SP2,201516,20/12/2015,Valladolid,Tenerife,4,1,H,2,1,H
      SP2,201516,21/12/2015,Ath Bilbao B,Lugo,1,1,D,1,1,D
      SP2,201516,02/01/2016,Alaves,Ath Bilbao B,3,0,H,2,0,H
      SP2,201516,02/01/2016,Elche,Mallorca,1,1,D,1,0,H
      SP2,201516,02/01/2016,Osasuna,Gimnastic,1,1,D,0,0,D
      SP2,201516,03/01/2016,Albacete,Ponferradina,2,2,D,1,0,H
      SP2,201516,03/01/2016,Almeria,Llagostera,2,1,H,0,0,D
      SP2,201516,03/01/2016,Cordoba,Mirandes,1,2,A,0,1,A
      SP2,201516,03/01/2016,Leganes,Oviedo,1,1,D,1,0,H
      SP2,201516,03/01/2016,Lugo,Numancia,2,3,A,1,1,D
      SP2,201516,03/01/2016,Zaragoza,Huesca,3,3,D,1,0,H
      SP2,201516,04/01/2016,Girona,Valladolid,1,0,H,0,0,D
      SP2,201516,04/01/2016,Tenerife,Alcorcon,1,2,A,0,2,A
      SP2,201516,09/01/2016,Alcorcon,Girona,1,0,H,1,0,H
      SP2,201516,09/01/2016,Ath Bilbao B,Albacete,0,1,A,0,0,D
      SP2,201516,09/01/2016,Gimnastic,Lugo,1,2,A,0,0,D
      SP2,201516,09/01/2016,Numancia,Alaves,0,1,A,0,0,D
      SP2,201516,09/01/2016,Valladolid,Elche,1,1,D,0,0,D
      SP2,201516,10/01/2016,Cordoba,Mallorca,3,1,H,2,0,H
      SP2,201516,10/01/2016,Huesca,Osasuna,0,1,A,0,1,A
      SP2,201516,10/01/2016,Llagostera,Leganes,0,1,A,0,1,A
      SP2,201516,10/01/2016,Mirandes,Almeria,1,1,D,0,0,D
      SP2,201516,10/01/2016,Oviedo,Zaragoza,1,0,H,1,0,H
      SP2,201516,10/01/2016,Ponferradina,Tenerife,0,1,A,0,0,D
      SP2,201516,16/01/2016,Albacete,Numancia,0,2,A,0,1,A
      SP2,201516,16/01/2016,Elche,Alcorcon,2,0,H,1,0,H
      SP2,201516,16/01/2016,Osasuna,Oviedo,0,0,D,0,0,D
      SP2,201516,16/01/2016,Tenerife,Ath Bilbao B,2,0,H,2,0,H
      SP2,201516,16/01/2016,Zaragoza,Llagostera,1,0,H,1,0,H
      SP2,201516,17/01/2016,Alaves,Gimnastic,1,3,A,0,1,A
      SP2,201516,17/01/2016,Almeria,Cordoba,0,1,A,0,0,D
      SP2,201516,17/01/2016,Girona,Ponferradina,4,0,H,1,0,H
      SP2,201516,17/01/2016,Leganes,Mirandes,4,0,H,3,0,H
      SP2,201516,17/01/2016,Lugo,Huesca,1,1,D,1,0,H
      SP2,201516,17/01/2016,Mallorca,Valladolid,0,1,A,0,0,D
      SP2,201516,23/01/2016,Alaves,Huesca,1,0,H,1,0,H
      SP2,201516,23/01/2016,Girona,Ath Bilbao B,2,1,H,1,1,D
      SP2,201516,23/01/2016,Leganes,Almeria,2,1,H,2,0,H
      SP2,201516,23/01/2016,Lugo,Oviedo,2,2,D,2,2,D
      SP2,201516,23/01/2016,Mallorca,Alcorcon,1,0,H,0,0,D
      SP2,201516,24/01/2016,Albacete,Gimnastic,1,1,D,0,0,D
      SP2,201516,24/01/2016,Elche,Ponferradina,1,0,H,0,0,D
      SP2,201516,24/01/2016,Osasuna,Llagostera,3,0,H,1,0,H
      SP2,201516,24/01/2016,Tenerife,Numancia,0,0,D,0,0,D
      SP2,201516,24/01/2016,Valladolid,Cordoba,2,0,H,2,0,H
      SP2,201516,24/01/2016,Zaragoza,Mirandes,1,2,A,1,1,D
      SP2,201516,30/01/2016,Alcorcon,Valladolid,0,0,D,0,0,D
      SP2,201516,30/01/2016,Cordoba,Leganes,2,3,A,1,0,H
      SP2,201516,30/01/2016,Huesca,Albacete,3,1,H,1,0,H
      SP2,201516,30/01/2016,Llagostera,Lugo,0,0,D,0,0,D
      SP2,201516,30/01/2016,Oviedo,Alaves,1,1,D,1,0,H
      SP2,201516,31/01/2016,Almeria,Zaragoza,2,1,H,0,0,D
      SP2,201516,31/01/2016,Ath Bilbao B,Elche,0,1,A,0,0,D
      SP2,201516,31/01/2016,Gimnastic,Tenerife,2,1,H,2,0,H
      SP2,201516,31/01/2016,Mirandes,Osasuna,4,0,H,0,0,D
      SP2,201516,31/01/2016,Numancia,Girona,1,1,D,1,0,H
      SP2,201516,31/01/2016,Ponferradina,Mallorca,0,2,A,0,0,D
      SP2,201516,06/02/2016,Albacete,Oviedo,2,2,D,2,0,H
      SP2,201516,06/02/2016,Elche,Numancia,0,0,D,0,0,D
      SP2,201516,06/02/2016,Tenerife,Huesca,1,1,D,1,0,H
      SP2,201516,06/02/2016,Valladolid,Ponferradina,0,0,D,0,0,D
      SP2,201516,06/02/2016,Zaragoza,Leganes,1,0,H,0,0,D
      SP2,201516,07/02/2016,Alaves,Llagostera,1,0,H,0,0,D
      SP2,201516,07/02/2016,Alcorcon,Cordoba,3,3,D,2,2,D
      SP2,201516,07/02/2016,Girona,Gimnastic,1,1,D,0,1,A
      SP2,201516,07/02/2016,Lugo,Mirandes,1,4,A,0,1,A
      SP2,201516,07/02/2016,Mallorca,Ath Bilbao B,2,3,A,1,1,D
      SP2,201516,07/02/2016,Osasuna,Almeria,0,0,D,0,0,D
      SP2,201516,13/02/2016,Almeria,Lugo,0,2,A,0,0,D
      SP2,201516,13/02/2016,Ath Bilbao B,Valladolid,0,1,A,0,1,A
      SP2,201516,13/02/2016,Gimnastic,Elche,1,0,H,1,0,H
      SP2,201516,13/02/2016,Mirandes,Alaves,0,0,D,0,0,D
      SP2,201516,13/02/2016,Ponferradina,Alcorcon,0,0,D,0,0,D
      SP2,201516,14/02/2016,Cordoba,Zaragoza,0,2,A,0,1,A
      SP2,201516,14/02/2016,Huesca,Girona,0,1,A,0,1,A
      SP2,201516,14/02/2016,Leganes,Osasuna,2,0,H,1,0,H
      SP2,201516,14/02/2016,Llagostera,Albacete,2,0,H,0,0,D
      SP2,201516,14/02/2016,Numancia,Mallorca,2,0,H,1,0,H
      SP2,201516,14/02/2016,Oviedo,Tenerife,1,0,H,1,0,H
      SP2,201516,20/02/2016,Albacete,Mirandes,1,1,D,1,0,H
      SP2,201516,20/02/2016,Alcorcon,Ath Bilbao B,1,0,H,0,0,D
      SP2,201516,20/02/2016,Lugo,Leganes,1,2,A,1,1,D
      SP2,201516,20/02/2016,Mallorca,Gimnastic,2,2,D,0,2,A
      SP2,201516,20/02/2016,Ponferradina,Cordoba,1,3,A,0,2,A
      SP2,201516,21/02/2016,Alaves,Almeria,1,1,D,0,1,A
      SP2,201516,21/02/2016,Elche,Huesca,1,1,D,0,1,A
      SP2,201516,21/02/2016,Girona,Oviedo,1,1,D,0,0,D
      SP2,201516,21/02/2016,Osasuna,Zaragoza,1,1,D,0,1,A
      SP2,201516,21/02/2016,Tenerife,Llagostera,3,1,H,2,1,H
      SP2,201516,21/02/2016,Valladolid,Numancia,2,2,D,1,1,D
      SP2,201516,27/02/2016,Ath Bilbao B,Ponferradina,4,2,H,2,1,H
      SP2,201516,27/02/2016,Cordoba,Osasuna,0,1,A,0,0,D
      SP2,201516,27/02/2016,Llagostera,Girona,0,1,A,0,0,D
      SP2,201516,27/02/2016,Numancia,Alcorcon,1,1,D,1,0,H
      SP2,201516,28/02/2016,Almeria,Albacete,1,0,H,0,0,D
      SP2,201516,28/02/2016,Gimnastic,Valladolid,1,1,D,1,1,D
      SP2,201516,28/02/2016,Leganes,Alaves,2,0,H,1,0,H
      SP2,201516,28/02/2016,Mirandes,Tenerife,1,2,A,0,1,A
      SP2,201516,28/02/2016,Oviedo,Elche,3,0,H,0,0,D
      SP2,201516,28/02/2016,Zaragoza,Lugo,3,1,H,0,0,D
      SP2,201516,05/03/2016,Ath Bilbao B,Cordoba,1,2,A,0,1,A
      SP2,201516,05/03/2016,Elche,Llagostera,1,1,D,0,0,D
      SP2,201516,05/03/2016,Girona,Mirandes,2,0,H,0,0,D
      SP2,201516,05/03/2016,Lugo,Osasuna,2,0,H,0,0,D
      SP2,201516,05/03/2016,Mallorca,Oviedo,1,0,H,0,0,D
      SP2,201516,06/03/2016,Alaves,Zaragoza,0,0,D,0,0,D
      SP2,201516,06/03/2016,Albacete,Leganes,0,3,A,0,2,A
      SP2,201516,06/03/2016,Alcorcon,Gimnastic,1,1,D,0,0,D
      SP2,201516,06/03/2016,Ponferradina,Numancia,1,0,H,0,0,D
      SP2,201516,06/03/2016,Tenerife,Almeria,0,0,D,0,0,D
      SP2,201516,06/03/2016,Valladolid,Huesca,0,1,A,0,1,A
      SP2,201516,12/03/2016,Almeria,Girona,1,0,H,1,0,H
      SP2,201516,12/03/2016,Mirandes,Elche,1,2,A,1,0,H
      SP2,201516,12/03/2016,Numancia,Ath Bilbao B,3,2,H,1,1,D
      SP2,201516,12/03/2016,Oviedo,Valladolid,2,4,A,1,3,A
      SP2,201516,12/03/2016,Zaragoza,Albacete,1,0,H,0,0,D
      SP2,201516,13/03/2016,Cordoba,Lugo,1,2,A,0,2,A
      SP2,201516,13/03/2016,Gimnastic,Ponferradina,1,1,D,0,1,A
      SP2,201516,13/03/2016,Huesca,Alcorcon,1,0,H,1,0,H
      SP2,201516,13/03/2016,Leganes,Tenerife,0,1,A,0,0,D
      SP2,201516,13/03/2016,Llagostera,Mallorca,3,0,H,1,0,H
      SP2,201516,13/03/2016,Osasuna,Alaves,3,1,H,3,1,H
      SP2,201516,16/03/2016,Huesca,Mallorca,1,2,A,0,2,A
      SP2,201516,19/03/2016,Alaves,Lugo,0,0,D,0,0,D
      SP2,201516,19/03/2016,Albacete,Osasuna,3,1,H,2,1,H
      SP2,201516,19/03/2016,Alcorcon,Oviedo,1,0,H,0,0,D
      SP2,201516,19/03/2016,Elche,Almeria,0,0,D,0,0,D
      SP2,201516,19/03/2016,Valladolid,Llagostera,3,0,H,1,0,H
      SP2,201516,20/03/2016,Ath Bilbao B,Gimnastic,0,4,A,0,1,A
      SP2,201516,20/03/2016,Girona,Leganes,1,1,D,0,0,D
      SP2,201516,20/03/2016,Mallorca,Mirandes,1,1,D,1,1,D
      SP2,201516,20/03/2016,Numancia,Cordoba,1,1,D,1,1,D
      SP2,201516,20/03/2016,Ponferradina,Huesca,2,1,H,1,0,H
      SP2,201516,20/03/2016,Tenerife,Zaragoza,0,0,D,0,0,D
      SP2,201516,26/03/2016,Gimnastic,Numancia,1,0,H,0,0,D
      SP2,201516,26/03/2016,Huesca,Ath Bilbao B,1,2,A,0,0,D
      SP2,201516,26/03/2016,Leganes,Elche,0,0,D,0,0,D
      SP2,201516,26/03/2016,Osasuna,Tenerife,0,0,D,0,0,D
      SP2,201516,26/03/2016,Oviedo,Ponferradina,3,0,H,2,0,H
      SP2,201516,27/03/2016,Almeria,Mallorca,1,1,D,0,0,D
      SP2,201516,27/03/2016,Cordoba,Alaves,1,2,A,0,0,D
      SP2,201516,27/03/2016,Llagostera,Alcorcon,4,0,H,3,0,H
      SP2,201516,27/03/2016,Lugo,Albacete,2,1,H,1,0,H
      SP2,201516,27/03/2016,Mirandes,Valladolid,4,1,H,2,0,H
      SP2,201516,27/03/2016,Zaragoza,Girona,0,3,A,0,2,A
      SP2,201516,02/04/2016,Alcorcon,Mirandes,1,0,H,0,0,D
      SP2,201516,02/04/2016,Elche,Zaragoza,2,1,H,1,1,D
      SP2,201516,02/04/2016,Mallorca,Leganes,3,0,H,0,0,D
      SP2,201516,02/04/2016,Ponferradina,Llagostera,1,0,H,0,0,D
      SP2,201516,03/04/2016,Albacete,Alaves,0,1,A,0,0,D
      SP2,201516,03/04/2016,Gimnastic,Cordoba,4,4,D,2,3,A
      SP2,201516,03/04/2016,Girona,Osasuna,0,0,D,0,0,D
      SP2,201516,03/04/2016,Numancia,Huesca,3,2,H,1,1,D
      SP2,201516,03/04/2016,Tenerife,Lugo,1,0,H,0,0,D
      SP2,201516,03/04/2016,Valladolid,Almeria,1,1,D,0,0,D
      SP2,201516,04/04/2016,Ath Bilbao B,Oviedo,2,1,H,1,1,D
      SP2,201516,09/04/2016,Almeria,Alcorcon,1,1,D,1,1,D
      SP2,201516,09/04/2016,Leganes,Valladolid,4,0,H,2,0,H
      SP2,201516,09/04/2016,Llagostera,Ath Bilbao B,2,1,H,0,0,D
      SP2,201516,09/04/2016,Lugo,Girona,1,1,D,1,1,D
      SP2,201516,09/04/2016,Mirandes,Ponferradina,1,0,H,1,0,H
      SP2,201516,10/04/2016,Alaves,Tenerife,2,2,D,1,1,D
      SP2,201516,10/04/2016,Cordoba,Albacete,2,3,A,0,1,A
      SP2,201516,10/04/2016,Huesca,Gimnastic,2,0,H,1,0,H
      SP2,201516,10/04/2016,Osasuna,Elche,0,0,D,0,0,D
      SP2,201516,10/04/2016,Oviedo,Numancia,1,0,H,0,0,D
      SP2,201516,10/04/2016,Zaragoza,Mallorca,2,1,H,1,1,D
      SP2,201516,16/04/2016,Ath Bilbao B,Mirandes,1,1,D,0,0,D
      SP2,201516,16/04/2016,Elche,Lugo,2,0,H,1,0,H
      SP2,201516,16/04/2016,Girona,Alaves,1,0,H,1,0,H
      SP2,201516,16/04/2016,Numancia,Llagostera,1,1,D,0,0,D
      SP2,201516,16/04/2016,Valladolid,Zaragoza,1,2,A,1,1,D
      SP2,201516,17/04/2016,Alcorcon,Leganes,2,0,H,1,0,H
      SP2,201516,17/04/2016,Gimnastic,Oviedo,0,0,D,0,0,D
      SP2,201516,17/04/2016,Huesca,Cordoba,0,2,A,0,1,A
      SP2,201516,17/04/2016,Mallorca,Osasuna,1,1,D,1,0,H
      SP2,201516,17/04/2016,Ponferradina,Almeria,1,3,A,0,2,A
      SP2,201516,17/04/2016,Tenerife,Albacete,1,0,H,0,0,D
      SP2,201516,23/04/2016,Alaves,Elche,0,0,D,0,0,D
      SP2,201516,23/04/2016,Albacete,Girona,0,3,A,0,1,A
      SP2,201516,23/04/2016,Leganes,Ponferradina,3,0,H,1,0,H
      SP2,201516,23/04/2016,Llagostera,Gimnastic,1,1,D,0,0,D
      SP2,201516,23/04/2016,Oviedo,Huesca,0,1,A,0,0,D
      SP2,201516,24/04/2016,Almeria,Ath Bilbao B,3,2,H,1,1,D
      SP2,201516,24/04/2016,Cordoba,Tenerife,0,0,D,0,0,D
      SP2,201516,24/04/2016,Lugo,Mallorca,2,1,H,1,0,H
      SP2,201516,24/04/2016,Mirandes,Numancia,0,2,A,0,2,A
      SP2,201516,24/04/2016,Osasuna,Valladolid,1,0,H,1,0,H
      SP2,201516,24/04/2016,Zaragoza,Alcorcon,3,1,H,2,1,H
      SP2,201516,30/04/2016,Alcorcon,Osasuna,0,1,A,0,1,A
      SP2,201516,30/04/2016,Huesca,Llagostera,3,1,H,3,0,H
      SP2,201516,30/04/2016,Mallorca,Alaves,0,0,D,0,0,D
      SP2,201516,30/04/2016,Numancia,Almeria,2,0,H,1,0,H
      SP2,201516,01/05/2016,Elche,Albacete,1,1,D,0,0,D
      SP2,201516,01/05/2016,Gimnastic,Mirandes,3,2,H,0,1,A
      SP2,201516,01/05/2016,Girona,Tenerife,1,0,H,0,0,D
      SP2,201516,01/05/2016,Oviedo,Cordoba,1,0,H,1,0,H
      SP2,201516,01/05/2016,Ponferradina,Zaragoza,1,1,D,0,0,D
      SP2,201516,01/05/2016,Valladolid,Lugo,1,1,D,0,0,D
      SP2,201516,02/05/2016,Ath Bilbao B,Leganes,1,2,A,1,0,H
      SP2,201516,07/05/2016,Almeria,Gimnastic,1,2,A,1,1,D
      SP2,201516,07/05/2016,Llagostera,Oviedo,2,0,H,1,0,H
      SP2,201516,07/05/2016,Lugo,Alcorcon,1,2,A,1,1,D
      SP2,201516,07/05/2016,Osasuna,Ponferradina,0,0,D,0,0,D
      SP2,201516,07/05/2016,Tenerife,Elche,1,1,D,0,0,D
      SP2,201516,08/05/2016,Alaves,Valladolid,2,1,H,0,0,D
      SP2,201516,08/05/2016,Albacete,Mallorca,1,0,H,0,0,D
      SP2,201516,08/05/2016,Cordoba,Girona,1,0,H,0,0,D
      SP2,201516,08/05/2016,Leganes,Numancia,2,2,D,0,1,A
      SP2,201516,08/05/2016,Mirandes,Huesca,1,0,H,1,0,H
      SP2,201516,08/05/2016,Zaragoza,Ath Bilbao B,2,0,H,1,0,H
      SP2,201516,14/05/2016,Mallorca,Tenerife,1,0,H,0,0,D
      SP2,201516,14/05/2016,Numancia,Zaragoza,2,2,D,1,2,A
      SP2,201516,14/05/2016,Oviedo,Mirandes,4,1,H,1,0,H
      SP2,201516,14/05/2016,Valladolid,Albacete,1,0,H,1,0,H
      SP2,201516,15/05/2016,Alcorcon,Alaves,0,1,A,0,0,D
      SP2,201516,15/05/2016,Ath Bilbao B,Osasuna,0,0,D,0,0,D
      SP2,201516,15/05/2016,Elche,Girona,1,1,D,0,1,A
      SP2,201516,15/05/2016,Gimnastic,Leganes,0,0,D,0,0,D
      SP2,201516,15/05/2016,Huesca,Almeria,2,1,H,0,1,A
      SP2,201516,15/05/2016,Llagostera,Cordoba,1,0,H,1,0,H
      SP2,201516,15/05/2016,Ponferradina,Lugo,2,1,H,1,0,H
      SP2,201516,21/05/2016,Albacete,Alcorcon,0,2,A,0,0,D
      SP2,201516,21/05/2016,Cordoba,Elche,3,1,H,1,0,H
      SP2,201516,21/05/2016,Girona,Mallorca,1,0,H,0,0,D
      SP2,201516,21/05/2016,Leganes,Huesca,2,3,A,1,1,D
      SP2,201516,21/05/2016,Tenerife,Valladolid,3,1,H,2,0,H
      SP2,201516,22/05/2016,Alaves,Ponferradina,2,0,H,2,0,H
      SP2,201516,22/05/2016,Almeria,Oviedo,3,1,H,0,0,D
      SP2,201516,22/05/2016,Lugo,Ath Bilbao B,2,0,H,1,0,H
      SP2,201516,22/05/2016,Mirandes,Llagostera,0,0,D,0,0,D
      SP2,201516,22/05/2016,Osasuna,Numancia,3,2,H,1,2,A
      SP2,201516,22/05/2016,Zaragoza,Gimnastic,0,1,A,0,0,D
      SP2,201516,24/05/2016,Alcorcon,Tenerife,2,1,H,1,0,H
      SP2,201516,24/05/2016,Mallorca,Elche,2,1,H,1,0,H
      SP2,201516,24/05/2016,Valladolid,Girona,0,0,D,0,0,D
      SP2,201516,25/05/2016,Gimnastic,Osasuna,1,0,H,0,0,D
      SP2,201516,25/05/2016,Llagostera,Almeria,0,0,D,0,0,D
      SP2,201516,25/05/2016,Mirandes,Cordoba,0,3,A,0,0,D
      SP2,201516,25/05/2016,Numancia,Lugo,1,0,H,1,0,H
      SP2,201516,25/05/2016,Ponferradina,Albacete,2,1,H,0,0,D
      SP2,201516,26/05/2016,Ath Bilbao B,Alaves,2,3,A,0,2,A
      SP2,201516,26/05/2016,Huesca,Zaragoza,1,1,D,0,1,A
      SP2,201516,26/05/2016,Oviedo,Leganes,0,1,A,0,0,D
      SP2,201516,29/05/2016,Alaves,Numancia,2,0,H,2,0,H
      SP2,201516,29/05/2016,Albacete,Ath Bilbao B,2,1,H,0,0,D
      SP2,201516,29/05/2016,Almeria,Mirandes,2,1,H,1,0,H
      SP2,201516,29/05/2016,Elche,Valladolid,2,2,D,1,1,D
      SP2,201516,29/05/2016,Girona,Alcorcon,2,0,H,1,0,H
      SP2,201516,29/05/2016,Leganes,Llagostera,2,0,H,1,0,H
      SP2,201516,29/05/2016,Lugo,Gimnastic,0,3,A,0,2,A
      SP2,201516,29/05/2016,Mallorca,Cordoba,0,1,A,0,1,A
      SP2,201516,29/05/2016,Osasuna,Huesca,2,3,A,1,2,A
      SP2,201516,29/05/2016,Tenerife,Ponferradina,1,1,D,0,0,D
      SP2,201516,29/05/2016,Zaragoza,Oviedo,1,0,H,1,0,H
      SP2,201516,04/06/2016,Alcorcon ,Elche,4,1,H,2,0,H
      SP2,201516,04/06/2016,Ath Bilbao B ,Tenerife,2,0,H,1,0,H
      SP2,201516,04/06/2016,Cordoba ,Almeria,1,1,D,0,1,A
      SP2,201516,04/06/2016,Gimnastic ,Alaves,1,1,D,0,0,D
      SP2,201516,04/06/2016,Huesca ,Lugo,1,0,H,0,0,D
      SP2,201516,04/06/2016,Llagostera ,Zaragoza,6,2,H,2,0,H
      SP2,201516,04/06/2016,Mirandes ,Leganes,0,1,A,0,0,D
      SP2,201516,04/06/2016,Numancia ,Albacete,2,0,H,0,0,D
      SP2,201516,04/06/2016,Oviedo ,Osasuna,0,5,A,0,1,A
      SP2,201516,04/06/2016,Ponferradina ,Girona,0,1,A,0,0,D
      SP2,201516,04/06/2016,Valladolid ,Mallorca,1,3,A,1,2,A
      E0,201617,13/08/2016,Burnley,Swansea,0,1,A,0,0,D
      E0,201617,13/08/2016,Crystal Palace,West Brom,0,1,A,0,0,D
      E0,201617,13/08/2016,Everton,Tottenham,1,1,D,1,0,H
      E0,201617,13/08/2016,Hull,Leicester,2,1,H,1,0,H
      E0,201617,13/08/2016,Man City,Sunderland,2,1,H,1,0,H
      E0,201617,13/08/2016,Middlesbrough,Stoke,1,1,D,1,0,H
      E0,201617,13/08/2016,Southampton,Watford,1,1,D,0,1,A
      E0,201617,14/08/2016,Arsenal,Liverpool,3,4,A,1,1,D
      E0,201617,14/08/2016,Bournemouth,Man United,1,3,A,0,1,A
      E0,201617,15/08/2016,Chelsea,West Ham,2,1,H,0,0,D
      E0,201617,19/08/2016,Man United,Southampton,2,0,H,1,0,H
      E0,201617,20/08/2016,Burnley,Liverpool,2,0,H,2,0,H
      E0,201617,20/08/2016,Leicester,Arsenal,0,0,D,0,0,D
      E0,201617,20/08/2016,Stoke,Man City,1,4,A,0,2,A
      E0,201617,20/08/2016,Swansea,Hull,0,2,A,0,0,D
      E0,201617,20/08/2016,Tottenham,Crystal Palace,1,0,H,0,0,D
      E0,201617,20/08/2016,Watford,Chelsea,1,2,A,0,0,D
      E0,201617,20/08/2016,West Brom,Everton,1,2,A,1,1,D
      E0,201617,21/08/2016,Sunderland,Middlesbrough,1,2,A,0,2,A
      E0,201617,21/08/2016,West Ham,Bournemouth,1,0,H,0,0,D
      E0,201617,27/08/2016,Chelsea,Burnley,3,0,H,2,0,H
      E0,201617,27/08/2016,Crystal Palace,Bournemouth,1,1,D,0,1,A
      E0,201617,27/08/2016,Everton,Stoke,1,0,H,0,0,D
      E0,201617,27/08/2016,Hull,Man United,0,1,A,0,0,D
      E0,201617,27/08/2016,Leicester,Swansea,2,1,H,1,0,H
      E0,201617,27/08/2016,Southampton,Sunderland,1,1,D,0,0,D
      E0,201617,27/08/2016,Tottenham,Liverpool,1,1,D,0,1,A
      E0,201617,27/08/2016,Watford,Arsenal,1,3,A,0,3,A
      E0,201617,28/08/2016,Man City,West Ham,3,1,H,2,0,H
      E0,201617,28/08/2016,West Brom,Middlesbrough,0,0,D,0,0,D
      E0,201617,10/09/2016,Arsenal,Southampton,2,1,H,1,1,D
      E0,201617,10/09/2016,Bournemouth,West Brom,1,0,H,0,0,D
      E0,201617,10/09/2016,Burnley,Hull,1,1,D,0,0,D
      E0,201617,10/09/2016,Liverpool,Leicester,4,1,H,2,1,H
      E0,201617,10/09/2016,Man United,Man City,1,2,A,1,2,A
      E0,201617,10/09/2016,Middlesbrough,Crystal Palace,1,2,A,1,1,D
      E0,201617,10/09/2016,Stoke,Tottenham,0,4,A,0,1,A
      E0,201617,10/09/2016,West Ham,Watford,2,4,A,2,2,D
      E0,201617,11/09/2016,Swansea,Chelsea,2,2,D,0,1,A
      E0,201617,12/09/2016,Sunderland,Everton,0,3,A,0,0,D
      E0,201617,16/09/2016,Chelsea,Liverpool,1,2,A,0,2,A
      E0,201617,17/09/2016,Everton,Middlesbrough,3,1,H,3,1,H
      E0,201617,17/09/2016,Hull,Arsenal,1,4,A,0,1,A
      E0,201617,17/09/2016,Leicester,Burnley,3,0,H,1,0,H
      E0,201617,17/09/2016,Man City,Bournemouth,4,0,H,2,0,H
      E0,201617,17/09/2016,West Brom,West Ham,4,2,H,3,0,H
      E0,201617,18/09/2016,Crystal Palace,Stoke,4,1,H,2,0,H
      E0,201617,18/09/2016,Southampton,Swansea,1,0,H,0,0,D
      E0,201617,18/09/2016,Tottenham,Sunderland,1,0,H,0,0,D
      E0,201617,18/09/2016,Watford,Man United,3,1,H,1,0,H
      E0,201617,24/09/2016,Arsenal,Chelsea,3,0,H,3,0,H
      E0,201617,24/09/2016,Bournemouth,Everton,1,0,H,1,0,H
      E0,201617,24/09/2016,Liverpool,Hull,5,1,H,3,0,H
      E0,201617,24/09/2016,Man United,Leicester,4,1,H,4,0,H
      E0,201617,24/09/2016,Middlesbrough,Tottenham,1,2,A,0,2,A
      E0,201617,24/09/2016,Stoke,West Brom,1,1,D,0,0,D
      E0,201617,24/09/2016,Sunderland,Crystal Palace,2,3,A,1,0,H
      E0,201617,24/09/2016,Swansea,Man City,1,3,A,1,1,D
      E0,201617,25/09/2016,West Ham,Southampton,0,3,A,0,1,A
      E0,201617,26/09/2016,Burnley,Watford,2,0,H,1,0,H
      E0,201617,30/09/2016,Everton,Crystal Palace,1,1,D,1,0,H
      E0,201617,01/10/2016,Hull,Chelsea,0,2,A,0,0,D
      E0,201617,01/10/2016,Sunderland,West Brom,1,1,D,0,1,A
      E0,201617,01/10/2016,Swansea,Liverpool,1,2,A,1,0,H
      E0,201617,01/10/2016,Watford,Bournemouth,2,2,D,0,1,A
      E0,201617,01/10/2016,West Ham,Middlesbrough,1,1,D,0,0,D
      E0,201617,02/10/2016,Burnley,Arsenal,0,1,A,0,0,D
      E0,201617,02/10/2016,Leicester,Southampton,0,0,D,0,0,D
      E0,201617,02/10/2016,Man United,Stoke,1,1,D,0,0,D
      E0,201617,02/10/2016,Tottenham,Man City,2,0,H,2,0,H
      E0,201617,15/10/2016,Arsenal,Swansea,3,2,H,2,1,H
      E0,201617,15/10/2016,Bournemouth,Hull,6,1,H,3,1,H
      E0,201617,15/10/2016,Chelsea,Leicester,3,0,H,2,0,H
      E0,201617,15/10/2016,Crystal Palace,West Ham,0,1,A,0,1,A
      E0,201617,15/10/2016,Man City,Everton,1,1,D,0,0,D
      E0,201617,15/10/2016,Stoke,Sunderland,2,0,H,2,0,H
      E0,201617,15/10/2016,West Brom,Tottenham,1,1,D,0,0,D
      E0,201617,16/10/2016,Middlesbrough,Watford,0,1,A,0,0,D
      E0,201617,16/10/2016,Southampton,Burnley,3,1,H,0,0,D
      E0,201617,17/10/2016,Liverpool,Man United,0,0,D,0,0,D
      E0,201617,22/10/2016,Arsenal,Middlesbrough,0,0,D,0,0,D
      E0,201617,22/10/2016,Bournemouth,Tottenham,0,0,D,0,0,D
      E0,201617,22/10/2016,Burnley,Everton,2,1,H,1,0,H
      E0,201617,22/10/2016,Hull,Stoke,0,2,A,0,1,A
      E0,201617,22/10/2016,Leicester,Crystal Palace,3,1,H,1,0,H
      E0,201617,22/10/2016,Liverpool,West Brom,2,1,H,2,0,H
      E0,201617,22/10/2016,Swansea,Watford,0,0,D,0,0,D
      E0,201617,22/10/2016,West Ham,Sunderland,1,0,H,0,0,D
      E0,201617,23/10/2016,Chelsea,Man United,4,0,H,2,0,H
      E0,201617,23/10/2016,Man City,Southampton,1,1,D,0,1,A
      E0,201617,29/10/2016,Crystal Palace,Liverpool,2,4,A,2,3,A
      E0,201617,29/10/2016,Man United,Burnley,0,0,D,0,0,D
      E0,201617,29/10/2016,Middlesbrough,Bournemouth,2,0,H,1,0,H
      E0,201617,29/10/2016,Sunderland,Arsenal,1,4,A,0,1,A
      E0,201617,29/10/2016,Tottenham,Leicester,1,1,D,1,0,H
      E0,201617,29/10/2016,Watford,Hull,1,0,H,0,0,D
      E0,201617,29/10/2016,West Brom,Man City,0,4,A,0,2,A
      E0,201617,30/10/2016,Everton,West Ham,2,0,H,0,0,D
      E0,201617,30/10/2016,Southampton,Chelsea,0,2,A,0,1,A
      E0,201617,31/10/2016,Stoke,Swansea,3,1,H,1,1,D
      E0,201617,05/11/2016,Bournemouth,Sunderland,1,2,A,1,1,D
      E0,201617,05/11/2016,Burnley,Crystal Palace,3,2,H,2,0,H
      E0,201617,05/11/2016,Chelsea,Everton,5,0,H,3,0,H
      E0,201617,05/11/2016,Man City,Middlesbrough,1,1,D,1,0,H
      E0,201617,05/11/2016,West Ham,Stoke,1,1,D,0,0,D
      E0,201617,06/11/2016,Arsenal,Tottenham,1,1,D,1,0,H
      E0,201617,06/11/2016,Hull,Southampton,2,1,H,0,1,A
      E0,201617,06/11/2016,Leicester,West Brom,1,2,A,0,0,D
      E0,201617,06/11/2016,Liverpool,Watford,6,1,H,3,0,H
      E0,201617,06/11/2016,Swansea,Man United,1,3,A,0,3,A
      E0,201617,19/11/2016,Crystal Palace,Man City,1,2,A,0,1,A
      E0,201617,19/11/2016,Everton,Swansea,1,1,D,0,1,A
      E0,201617,19/11/2016,Man United,Arsenal,1,1,D,0,0,D
      E0,201617,19/11/2016,Southampton,Liverpool,0,0,D,0,0,D
      E0,201617,19/11/2016,Stoke,Bournemouth,0,1,A,0,1,A
      E0,201617,19/11/2016,Sunderland,Hull,3,0,H,1,0,H
      E0,201617,19/11/2016,Tottenham,West Ham,3,2,H,0,1,A
      E0,201617,19/11/2016,Watford,Leicester,2,1,H,2,1,H
      E0,201617,20/11/2016,Middlesbrough,Chelsea,0,1,A,0,1,A
      E0,201617,21/11/2016,West Brom,Burnley,4,0,H,3,0,H
      E0,201617,26/11/2016,Burnley,Man City,1,2,A,1,1,D
      E0,201617,26/11/2016,Chelsea,Tottenham,2,1,H,1,1,D
      E0,201617,26/11/2016,Hull,West Brom,1,1,D,0,1,A
      E0,201617,26/11/2016,Leicester,Middlesbrough,2,2,D,1,1,D
      E0,201617,26/11/2016,Liverpool,Sunderland,2,0,H,0,0,D
      E0,201617,26/11/2016,Swansea,Crystal Palace,5,4,H,1,1,D
      E0,201617,27/11/2016,Arsenal,Bournemouth,3,1,H,1,1,D
      E0,201617,27/11/2016,Man United,West Ham,1,1,D,1,1,D
      E0,201617,27/11/2016,Southampton,Everton,1,0,H,1,0,H
      E0,201617,27/11/2016,Watford,Stoke,0,1,A,0,1,A
      E0,201617,03/12/2016,Crystal Palace,Southampton,3,0,H,2,0,H
      E0,201617,03/12/2016,Man City,Chelsea,1,3,A,1,0,H
      E0,201617,03/12/2016,Stoke,Burnley,2,0,H,2,0,H
      E0,201617,03/12/2016,Sunderland,Leicester,2,1,H,0,0,D
      E0,201617,03/12/2016,Tottenham,Swansea,5,0,H,2,0,H
      E0,201617,03/12/2016,West Brom,Watford,3,1,H,2,0,H
      E0,201617,03/12/2016,West Ham,Arsenal,1,5,A,0,1,A
      E0,201617,04/12/2016,Bournemouth,Liverpool,4,3,H,0,2,A
      E0,201617,04/12/2016,Everton,Man United,1,1,D,0,1,A
      E0,201617,05/12/2016,Middlesbrough,Hull,1,0,H,0,0,D
      E0,201617,10/12/2016,Arsenal,Stoke,3,1,H,1,1,D
      E0,201617,10/12/2016,Burnley,Bournemouth,3,2,H,2,1,H
      E0,201617,10/12/2016,Hull,Crystal Palace,3,3,D,1,0,H
      E0,201617,10/12/2016,Leicester,Man City,4,2,H,3,0,H
      E0,201617,10/12/2016,Swansea,Sunderland,3,0,H,0,0,D
      E0,201617,10/12/2016,Watford,Everton,3,2,H,1,1,D
      E0,201617,11/12/2016,Chelsea,West Brom,1,0,H,0,0,D
      E0,201617,11/12/2016,Liverpool,West Ham,2,2,D,1,2,A
      E0,201617,11/12/2016,Man United,Tottenham,1,0,H,1,0,H
      E0,201617,11/12/2016,Southampton,Middlesbrough,1,0,H,0,0,D
      E0,201617,13/12/2016,Bournemouth,Leicester,1,0,H,1,0,H
      E0,201617,13/12/2016,Everton,Arsenal,2,1,H,1,1,D
      E0,201617,14/12/2016,Crystal Palace,Man United,1,2,A,0,1,A
      E0,201617,14/12/2016,Man City,Watford,2,0,H,1,0,H
      E0,201617,14/12/2016,Middlesbrough,Liverpool,0,3,A,0,1,A
      E0,201617,14/12/2016,Stoke,Southampton,0,0,D,0,0,D
      E0,201617,14/12/2016,Sunderland,Chelsea,0,1,A,0,1,A
      E0,201617,14/12/2016,Tottenham,Hull,3,0,H,1,0,H
      E0,201617,14/12/2016,West Brom,Swansea,3,1,H,0,0,D
      E0,201617,14/12/2016,West Ham,Burnley,1,0,H,1,0,H
      E0,201617,17/12/2016,Crystal Palace,Chelsea,0,1,A,0,1,A
      E0,201617,17/12/2016,Middlesbrough,Swansea,3,0,H,2,0,H
      E0,201617,17/12/2016,Stoke,Leicester,2,2,D,2,0,H
      E0,201617,17/12/2016,Sunderland,Watford,1,0,H,0,0,D
      E0,201617,17/12/2016,West Brom,Man United,0,2,A,0,1,A
      E0,201617,17/12/2016,West Ham,Hull,1,0,H,0,0,D
      E0,201617,18/12/2016,Bournemouth,Southampton,1,3,A,1,1,D
      E0,201617,18/12/2016,Man City,Arsenal,2,1,H,0,1,A
      E0,201617,18/12/2016,Tottenham,Burnley,2,1,H,1,1,D
      E0,201617,19/12/2016,Everton,Liverpool,0,1,A,0,0,D
      E0,201617,26/12/2016,Arsenal,West Brom,1,0,H,0,0,D
      E0,201617,26/12/2016,Burnley,Middlesbrough,1,0,H,0,0,D
      E0,201617,26/12/2016,Chelsea,Bournemouth,3,0,H,1,0,H
      E0,201617,26/12/2016,Hull,Man City,0,3,A,0,0,D
      E0,201617,26/12/2016,Leicester,Everton,0,2,A,0,0,D
      E0,201617,26/12/2016,Man United,Sunderland,3,1,H,1,0,H
      E0,201617,26/12/2016,Swansea,West Ham,1,4,A,0,1,A
      E0,201617,26/12/2016,Watford,Crystal Palace,1,1,D,0,1,A
      E0,201617,27/12/2016,Liverpool,Stoke,4,1,H,2,1,H
      E0,201617,28/12/2016,Southampton,Tottenham,1,4,A,1,1,D
      E0,201617,30/12/2016,Hull,Everton,2,2,D,1,1,D
      E0,201617,31/12/2016,Burnley,Sunderland,4,1,H,1,0,H
      E0,201617,31/12/2016,Chelsea,Stoke,4,2,H,1,0,H
      E0,201617,31/12/2016,Leicester,West Ham,1,0,H,1,0,H
      E0,201617,31/12/2016,Liverpool,Man City,1,0,H,1,0,H
      E0,201617,31/12/2016,Man United,Middlesbrough,2,1,H,0,0,D
      E0,201617,31/12/2016,Southampton,West Brom,1,2,A,1,1,D
      E0,201617,31/12/2016,Swansea,Bournemouth,0,3,A,0,2,A
      E0,201617,01/01/2017,Arsenal,Crystal Palace,2,0,H,1,0,H
      E0,201617,01/01/2017,Watford,Tottenham,1,4,A,0,3,A
      E0,201617,02/01/2017,Everton,Southampton,3,0,H,0,0,D
      E0,201617,02/01/2017,Man City,Burnley,2,1,H,0,0,D
      E0,201617,02/01/2017,Middlesbrough,Leicester,0,0,D,0,0,D
      E0,201617,02/01/2017,Sunderland,Liverpool,2,2,D,1,1,D
      E0,201617,02/01/2017,West Brom,Hull,3,1,H,0,1,A
      E0,201617,02/01/2017,West Ham,Man United,0,2,A,0,0,D
      E0,201617,03/01/2017,Bournemouth,Arsenal,3,3,D,2,0,H
      E0,201617,03/01/2017,Crystal Palace,Swansea,1,2,A,0,1,A
      E0,201617,03/01/2017,Stoke,Watford,2,0,H,1,0,H
      E0,201617,04/01/2017,Tottenham,Chelsea,2,0,H,1,0,H
      E0,201617,14/01/2017,Burnley,Southampton,1,0,H,0,0,D
      E0,201617,14/01/2017,Hull,Bournemouth,3,1,H,1,1,D
      E0,201617,14/01/2017,Leicester,Chelsea,0,3,A,0,1,A
      E0,201617,14/01/2017,Sunderland,Stoke,1,3,A,1,3,A
      E0,201617,14/01/2017,Swansea,Arsenal,0,4,A,0,1,A
      E0,201617,14/01/2017,Tottenham,West Brom,4,0,H,2,0,H
      E0,201617,14/01/2017,Watford,Middlesbrough,0,0,D,0,0,D
      E0,201617,14/01/2017,West Ham,Crystal Palace,3,0,H,0,0,D
      E0,201617,15/01/2017,Everton,Man City,4,0,H,1,0,H
      E0,201617,15/01/2017,Man United,Liverpool,1,1,D,0,1,A
      E0,201617,21/01/2017,Bournemouth,Watford,2,2,D,0,1,A
      E0,201617,21/01/2017,Crystal Palace,Everton,0,1,A,0,0,D
      E0,201617,21/01/2017,Liverpool,Swansea,2,3,A,0,0,D
      E0,201617,21/01/2017,Man City,Tottenham,2,2,D,0,0,D
      E0,201617,21/01/2017,Middlesbrough,West Ham,1,3,A,1,2,A
      E0,201617,21/01/2017,Stoke,Man United,1,1,D,1,0,H
      E0,201617,21/01/2017,West Brom,Sunderland,2,0,H,2,0,H
      E0,201617,22/01/2017,Arsenal,Burnley,2,1,H,0,0,D
      E0,201617,22/01/2017,Chelsea,Hull,2,0,H,1,0,H
      E0,201617,22/01/2017,Southampton,Leicester,3,0,H,2,0,H
      E0,201617,31/01/2017,Arsenal,Watford,1,2,A,0,2,A
      E0,201617,31/01/2017,Bournemouth,Crystal Palace,0,2,A,0,0,D
      E0,201617,31/01/2017,Burnley,Leicester,1,0,H,0,0,D
      E0,201617,31/01/2017,Liverpool,Chelsea,1,1,D,0,1,A
      E0,201617,31/01/2017,Middlesbrough,West Brom,1,1,D,1,1,D
      E0,201617,31/01/2017,Sunderland,Tottenham,0,0,D,0,0,D
      E0,201617,31/01/2017,Swansea,Southampton,2,1,H,1,0,H
      E0,201617,01/02/2017,Man United,Hull,0,0,D,0,0,D
      E0,201617,01/02/2017,Stoke,Everton,1,1,D,1,1,D
      E0,201617,01/02/2017,West Ham,Man City,0,4,A,0,3,A
      E0,201617,04/02/2017,Chelsea,Arsenal,3,1,H,1,0,H
      E0,201617,04/02/2017,Crystal Palace,Sunderland,0,4,A,0,4,A
      E0,201617,04/02/2017,Everton,Bournemouth,6,3,H,3,0,H
      E0,201617,04/02/2017,Hull,Liverpool,2,0,H,1,0,H
      E0,201617,04/02/2017,Southampton,West Ham,1,3,A,1,2,A
      E0,201617,04/02/2017,Tottenham,Middlesbrough,1,0,H,0,0,D
      E0,201617,04/02/2017,Watford,Burnley,2,1,H,2,0,H
      E0,201617,04/02/2017,West Brom,Stoke,1,0,H,1,0,H
      E0,201617,05/02/2017,Leicester,Man United,0,3,A,0,2,A
      E0,201617,05/02/2017,Man City,Swansea,2,1,H,1,0,H
      E0,201617,11/02/2017,Arsenal,Hull,2,0,H,1,0,H
      E0,201617,11/02/2017,Liverpool,Tottenham,2,0,H,2,0,H
      E0,201617,11/02/2017,Man United,Watford,2,0,H,1,0,H
      E0,201617,11/02/2017,Middlesbrough,Everton,0,0,D,0,0,D
      E0,201617,11/02/2017,Stoke,Crystal Palace,1,0,H,0,0,D
      E0,201617,11/02/2017,Sunderland,Southampton,0,4,A,0,2,A
      E0,201617,11/02/2017,West Ham,West Brom,2,2,D,0,1,A
      E0,201617,12/02/2017,Burnley,Chelsea,1,1,D,1,1,D
      E0,201617,12/02/2017,Swansea,Leicester,2,0,H,2,0,H
      E0,201617,13/02/2017,Bournemouth,Man City,0,2,A,0,1,A
      E0,201617,25/02/2017,Chelsea,Swansea,3,1,H,1,1,D
      E0,201617,25/02/2017,Crystal Palace,Middlesbrough,1,0,H,1,0,H
      E0,201617,25/02/2017,Everton,Sunderland,2,0,H,1,0,H
      E0,201617,25/02/2017,Hull,Burnley,1,1,D,0,0,D
      E0,201617,25/02/2017,Watford,West Ham,1,1,D,1,0,H
      E0,201617,25/02/2017,West Brom,Bournemouth,2,1,H,2,1,H
      E0,201617,26/02/2017,Tottenham,Stoke,4,0,H,4,0,H
      E0,201617,27/02/2017,Leicester,Liverpool,3,1,H,2,0,H
      E0,201617,04/03/2017,Leicester,Hull,3,1,H,1,1,D
      E0,201617,04/03/2017,Liverpool,Arsenal,3,1,H,2,0,H
      E0,201617,04/03/2017,Man United,Bournemouth,1,1,D,1,1,D
      E0,201617,04/03/2017,Stoke,Middlesbrough,2,0,H,2,0,H
      E0,201617,04/03/2017,Swansea,Burnley,3,2,H,1,1,D
      E0,201617,04/03/2017,Watford,Southampton,3,4,A,1,2,A
      E0,201617,04/03/2017,West Brom,Crystal Palace,0,2,A,0,0,D
      E0,201617,05/03/2017,Sunderland,Man City,0,2,A,0,1,A
      E0,201617,05/03/2017,Tottenham,Everton,3,2,H,1,0,H
      E0,201617,06/03/2017,West Ham,Chelsea,1,2,A,0,1,A
      E0,201617,08/03/2017,Man City,Stoke,0,0,D,0,0,D
      E0,201617,11/03/2017,Bournemouth,West Ham,3,2,H,1,1,D
      E0,201617,11/03/2017,Everton,West Brom,3,0,H,2,0,H
      E0,201617,11/03/2017,Hull,Swansea,2,1,H,0,0,D
      E0,201617,12/03/2017,Liverpool,Burnley,2,1,H,1,1,D
      E0,201617,18/03/2017,Bournemouth,Swansea,2,0,H,1,0,H
      E0,201617,18/03/2017,Crystal Palace,Watford,1,0,H,0,0,D
      E0,201617,18/03/2017,Everton,Hull,4,0,H,1,0,H
      E0,201617,18/03/2017,Stoke,Chelsea,1,2,A,1,1,D
      E0,201617,18/03/2017,Sunderland,Burnley,0,0,D,0,0,D
      E0,201617,18/03/2017,West Brom,Arsenal,3,1,H,1,1,D
      E0,201617,18/03/2017,West Ham,Leicester,2,3,A,1,3,A
      E0,201617,19/03/2017,Man City,Liverpool,1,1,D,0,0,D
      E0,201617,19/03/2017,Middlesbrough,Man United,1,3,A,0,1,A
      E0,201617,19/03/2017,Tottenham,Southampton,2,1,H,2,0,H
      E0,201617,01/04/2017,Burnley,Tottenham,0,2,A,0,0,D
      E0,201617,01/04/2017,Chelsea,Crystal Palace,1,2,A,1,2,A
      E0,201617,01/04/2017,Hull,West Ham,2,1,H,0,1,A
      E0,201617,01/04/2017,Leicester,Stoke,2,0,H,1,0,H
      E0,201617,01/04/2017,Liverpool,Everton,3,1,H,2,1,H
      E0,201617,01/04/2017,Man United,West Brom,0,0,D,0,0,D
      E0,201617,01/04/2017,Southampton,Bournemouth,0,0,D,0,0,D
      E0,201617,01/04/2017,Watford,Sunderland,1,0,H,0,0,D
      E0,201617,02/04/2017,Arsenal,Man City,2,2,D,1,2,A
      E0,201617,02/04/2017,Swansea,Middlesbrough,0,0,D,0,0,D
      E0,201617,04/04/2017,Burnley,Stoke,1,0,H,0,0,D
      E0,201617,04/04/2017,Leicester,Sunderland,2,0,H,0,0,D
      E0,201617,04/04/2017,Man United,Everton,1,1,D,0,1,A
      E0,201617,04/04/2017,Watford,West Brom,2,0,H,1,0,H
      E0,201617,05/04/2017,Arsenal,West Ham,3,0,H,0,0,D
      E0,201617,05/04/2017,Chelsea,Man City,2,1,H,2,1,H
      E0,201617,05/04/2017,Hull,Middlesbrough,4,2,H,3,2,H
      E0,201617,05/04/2017,Liverpool,Bournemouth,2,2,D,1,1,D
      E0,201617,05/04/2017,Southampton,Crystal Palace,3,1,H,1,1,D
      E0,201617,05/04/2017,Swansea,Tottenham,1,3,A,1,0,H
      E0,201617,08/04/2017,Bournemouth,Chelsea,1,3,A,1,2,A
      E0,201617,08/04/2017,Man City,Hull,3,1,H,1,0,H
      E0,201617,08/04/2017,Middlesbrough,Burnley,0,0,D,0,0,D
      E0,201617,08/04/2017,Stoke,Liverpool,1,2,A,1,0,H
      E0,201617,08/04/2017,Tottenham,Watford,4,0,H,3,0,H
      E0,201617,08/04/2017,West Brom,Southampton,0,1,A,0,1,A
      E0,201617,08/04/2017,West Ham,Swansea,1,0,H,1,0,H
      E0,201617,09/04/2017,Everton,Leicester,4,2,H,3,2,H
      E0,201617,09/04/2017,Sunderland,Man United,0,3,A,0,1,A
      E0,201617,10/04/2017,Crystal Palace,Arsenal,3,0,H,1,0,H
      E0,201617,15/04/2017,Crystal Palace,Leicester,2,2,D,0,1,A
      E0,201617,15/04/2017,Everton,Burnley,3,1,H,0,0,D
      E0,201617,15/04/2017,Southampton,Man City,0,3,A,0,0,D
      E0,201617,15/04/2017,Stoke,Hull,3,1,H,1,0,H
      E0,201617,15/04/2017,Sunderland,West Ham,2,2,D,1,1,D
      E0,201617,15/04/2017,Tottenham,Bournemouth,4,0,H,2,0,H
      E0,201617,15/04/2017,Watford,Swansea,1,0,H,1,0,H
      E0,201617,16/04/2017,Man United,Chelsea,2,0,H,1,0,H
      E0,201617,16/04/2017,West Brom,Liverpool,0,1,A,0,1,A
      E0,201617,17/04/2017,Middlesbrough,Arsenal,1,2,A,0,1,A
      E0,201617,22/04/2017,Bournemouth,Middlesbrough,4,0,H,2,0,H
      E0,201617,22/04/2017,Hull,Watford,2,0,H,0,0,D
      E0,201617,22/04/2017,Swansea,Stoke,2,0,H,1,0,H
      E0,201617,22/04/2017,West Ham,Everton,0,0,D,0,0,D
      E0,201617,23/04/2017,Burnley,Man United,0,2,A,0,2,A
      E0,201617,23/04/2017,Liverpool,Crystal Palace,1,2,A,1,1,D
      E0,201617,25/04/2017,Chelsea,Southampton,4,2,H,2,1,H
      E0,201617,26/04/2017,Arsenal,Leicester,1,0,H,0,0,D
      E0,201617,26/04/2017,Crystal Palace,Tottenham,0,1,A,0,0,D
      E0,201617,26/04/2017,Middlesbrough,Sunderland,1,0,H,1,0,H
      E0,201617,27/04/2017,Man City,Man United,0,0,D,0,0,D
      E0,201617,29/04/2017,Crystal Palace,Burnley,0,2,A,0,1,A
      E0,201617,29/04/2017,Southampton,Hull,0,0,D,0,0,D
      E0,201617,29/04/2017,Stoke,West Ham,0,0,D,0,0,D
      E0,201617,29/04/2017,Sunderland,Bournemouth,0,1,A,0,0,D
      E0,201617,29/04/2017,West Brom,Leicester,0,1,A,0,1,A
      E0,201617,30/04/2017,Everton,Chelsea,0,3,A,0,0,D
      E0,201617,30/04/2017,Man United,Swansea,1,1,D,1,0,H
      E0,201617,30/04/2017,Middlesbrough,Man City,2,2,D,1,0,H
      E0,201617,30/04/2017,Tottenham,Arsenal,2,0,H,0,0,D
      E0,201617,01/05/2017,Watford,Liverpool,0,1,A,0,1,A
      E0,201617,05/05/2017,West Ham,Tottenham,1,0,H,0,0,D
      E0,201617,06/05/2017,Bournemouth,Stoke,2,2,D,0,1,A
      E0,201617,06/05/2017,Burnley,West Brom,2,2,D,0,0,D
      E0,201617,06/05/2017,Hull,Sunderland,0,2,A,0,0,D
      E0,201617,06/05/2017,Leicester,Watford,3,0,H,1,0,H
      E0,201617,06/05/2017,Man City,Crystal Palace,5,0,H,1,0,H
      E0,201617,06/05/2017,Swansea,Everton,1,0,H,1,0,H
      E0,201617,07/05/2017,Arsenal,Man United,2,0,H,0,0,D
      E0,201617,07/05/2017,Liverpool,Southampton,0,0,D,0,0,D
      E0,201617,08/05/2017,Chelsea,Middlesbrough,3,0,H,2,0,H
      E0,201617,10/05/2017,Southampton,Arsenal,0,2,A,0,0,D
      E0,201617,12/05/2017,Everton,Watford,1,0,H,0,0,D
      E0,201617,12/05/2017,West Brom,Chelsea,0,1,A,0,0,D
      E0,201617,13/05/2017,Bournemouth,Burnley,2,1,H,1,0,H
      E0,201617,13/05/2017,Man City,Leicester,2,1,H,2,1,H
      E0,201617,13/05/2017,Middlesbrough,Southampton,1,2,A,0,1,A
      E0,201617,13/05/2017,Stoke,Arsenal,1,4,A,0,1,A
      E0,201617,13/05/2017,Sunderland,Swansea,0,2,A,0,2,A
      E0,201617,14/05/2017,Crystal Palace,Hull,4,0,H,2,0,H
      E0,201617,14/05/2017,Tottenham,Man United,2,1,H,1,0,H
      E0,201617,14/05/2017,West Ham,Liverpool,0,4,A,0,1,A
      E0,201617,15/05/2017,Chelsea,Watford,4,3,H,2,1,H
      E0,201617,16/05/2017,Arsenal,Sunderland,2,0,H,0,0,D
      E0,201617,16/05/2017,Man City,West Brom,3,1,H,2,0,H
      E0,201617,17/05/2017,Southampton,Man United,0,0,D,0,0,D
      E0,201617,18/05/2017,Leicester,Tottenham,1,6,A,0,2,A
      E0,201617,21/05/2017,Arsenal,Everton,3,1,H,2,0,H
      E0,201617,21/05/2017,Burnley,West Ham,1,2,A,1,1,D
      E0,201617,21/05/2017,Chelsea,Sunderland,5,1,H,1,1,D
      E0,201617,21/05/2017,Hull,Tottenham,1,7,A,0,3,A
      E0,201617,21/05/2017,Leicester,Bournemouth,1,1,D,0,1,A
      E0,201617,21/05/2017,Liverpool,Middlesbrough,3,0,H,1,0,H
      E0,201617,21/05/2017,Man United,Crystal Palace,2,0,H,2,0,H
      E0,201617,21/05/2017,Southampton,Stoke,0,1,A,0,0,D
      E0,201617,21/05/2017,Swansea,West Brom,2,1,H,0,1,A
      E0,201617,21/05/2017,Watford,Man City,0,5,A,0,4,A
      D1,201617,26/08/2016,Bayern Munich,Werder Bremen,6,0,H,2,0,H
      D1,201617,27/08/2016,Augsburg,Wolfsburg,0,2,A,0,1,A
      D1,201617,27/08/2016,Dortmund,Mainz,2,1,H,1,0,H
      D1,201617,27/08/2016,Ein Frankfurt,Schalke 04,1,0,H,1,0,H
      D1,201617,27/08/2016,FC Koln,Darmstadt,2,0,H,1,0,H
      D1,201617,27/08/2016,Hamburg,Ingolstadt,1,1,D,1,0,H
      D1,201617,27/08/2016,M'gladbach,Leverkusen,2,1,H,1,0,H
      D1,201617,28/08/2016,Hertha,Freiburg,2,1,H,0,0,D
      D1,201617,28/08/2016,Hoffenheim,RB Leipzig,2,2,D,0,0,D
      D1,201617,09/09/2016,Schalke 04,Bayern Munich,0,2,A,0,0,D
      D1,201617,10/09/2016,Darmstadt,Ein Frankfurt,1,0,H,0,0,D
      D1,201617,10/09/2016,Freiburg,M'gladbach,3,1,H,0,1,A
      D1,201617,10/09/2016,Ingolstadt,Hertha,0,2,A,0,1,A
      D1,201617,10/09/2016,Leverkusen,Hamburg,3,1,H,0,0,D
      D1,201617,10/09/2016,RB Leipzig,Dortmund,1,0,H,0,0,D
      D1,201617,10/09/2016,Wolfsburg,FC Koln,0,0,D,0,0,D
      D1,201617,11/09/2016,Mainz,Hoffenheim,4,4,D,4,1,H
      D1,201617,11/09/2016,Werder Bremen,Augsburg,1,2,A,1,0,H
      D1,201617,16/09/2016,FC Koln,Freiburg,3,0,H,3,0,H
      D1,201617,17/09/2016,Bayern Munich,Ingolstadt,3,1,H,1,1,D
      D1,201617,17/09/2016,Dortmund,Darmstadt,6,0,H,1,0,H
      D1,201617,17/09/2016,Ein Frankfurt,Leverkusen,2,1,H,0,0,D
      D1,201617,17/09/2016,Hamburg,RB Leipzig,0,4,A,0,0,D
      D1,201617,17/09/2016,Hoffenheim,Wolfsburg,0,0,D,0,0,D
      D1,201617,17/09/2016,M'gladbach,Werder Bremen,4,1,H,4,0,H
      D1,201617,18/09/2016,Augsburg,Mainz,1,3,A,0,1,A
      D1,201617,18/09/2016,Hertha,Schalke 04,2,0,H,0,0,D
      D1,201617,20/09/2016,Darmstadt,Hoffenheim,1,1,D,0,0,D
      D1,201617,20/09/2016,Freiburg,Hamburg,1,0,H,0,0,D
      D1,201617,20/09/2016,Ingolstadt,Ein Frankfurt,0,2,A,0,1,A
      D1,201617,20/09/2016,Wolfsburg,Dortmund,1,5,A,0,2,A
      D1,201617,21/09/2016,Bayern Munich,Hertha,3,0,H,1,0,H
      D1,201617,21/09/2016,Leverkusen,Augsburg,0,0,D,0,0,D
      D1,201617,21/09/2016,RB Leipzig,M'gladbach,1,1,D,1,0,H
      D1,201617,21/09/2016,Schalke 04,FC Koln,1,3,A,1,1,D
      D1,201617,21/09/2016,Werder Bremen,Mainz,1,2,A,1,0,H
      D1,201617,23/09/2016,Dortmund,Freiburg,3,1,H,1,0,H
      D1,201617,24/09/2016,Augsburg,Darmstadt,1,0,H,0,0,D
      D1,201617,24/09/2016,Ein Frankfurt,Hertha,3,3,D,2,1,H
      D1,201617,24/09/2016,Hamburg,Bayern Munich,0,1,A,0,0,D
      D1,201617,24/09/2016,Mainz,Leverkusen,2,3,A,2,1,H
      D1,201617,24/09/2016,M'gladbach,Ingolstadt,2,0,H,1,0,H
      D1,201617,24/09/2016,Werder Bremen,Wolfsburg,2,1,H,0,0,D
      D1,201617,25/09/2016,FC Koln,RB Leipzig,1,1,D,1,1,D
      D1,201617,25/09/2016,Hoffenheim,Schalke 04,2,1,H,2,1,H
      D1,201617,30/09/2016,RB Leipzig,Augsburg,2,1,H,1,1,D
      D1,201617,01/10/2016,Bayern Munich,FC Koln,1,1,D,1,0,H
      D1,201617,01/10/2016,Darmstadt,Werder Bremen,2,2,D,1,0,H
      D1,201617,01/10/2016,Freiburg,Ein Frankfurt,1,0,H,1,0,H
      D1,201617,01/10/2016,Hertha,Hamburg,2,0,H,1,0,H
      D1,201617,01/10/2016,Ingolstadt,Hoffenheim,1,2,A,0,2,A
      D1,201617,01/10/2016,Leverkusen,Dortmund,2,0,H,1,0,H
      D1,201617,02/10/2016,Schalke 04,M'gladbach,4,0,H,0,0,D
      D1,201617,02/10/2016,Wolfsburg,Mainz,0,0,D,0,0,D
      D1,201617,14/10/2016,Dortmund,Hertha,1,1,D,0,0,D
      D1,201617,15/10/2016,Augsburg,Schalke 04,1,1,D,0,0,D
      D1,201617,15/10/2016,Ein Frankfurt,Bayern Munich,2,2,D,1,1,D
      D1,201617,15/10/2016,FC Koln,Ingolstadt,2,1,H,2,0,H
      D1,201617,15/10/2016,Hoffenheim,Freiburg,2,1,H,1,0,H
      D1,201617,15/10/2016,M'gladbach,Hamburg,0,0,D,0,0,D
      D1,201617,15/10/2016,Werder Bremen,Leverkusen,2,1,H,1,1,D
      D1,201617,16/10/2016,Mainz,Darmstadt,2,1,H,1,0,H
      D1,201617,16/10/2016,Wolfsburg,RB Leipzig,0,1,A,0,0,D
      D1,201617,21/10/2016,Hamburg,Ein Frankfurt,0,3,A,0,1,A
      D1,201617,22/10/2016,Bayern Munich,M'gladbach,2,0,H,2,0,H
      D1,201617,22/10/2016,Darmstadt,Wolfsburg,3,1,H,1,0,H
      D1,201617,22/10/2016,Freiburg,Augsburg,2,1,H,0,0,D
      D1,201617,22/10/2016,Hertha,FC Koln,2,1,H,1,0,H
      D1,201617,22/10/2016,Ingolstadt,Dortmund,3,3,D,2,0,H
      D1,201617,22/10/2016,Leverkusen,Hoffenheim,0,3,A,0,1,A
      D1,201617,23/10/2016,RB Leipzig,Werder Bremen,3,1,H,1,0,H
      D1,201617,23/10/2016,Schalke 04,Mainz,3,0,H,1,0,H
      D1,201617,28/10/2016,M'gladbach,Ein Frankfurt,0,0,D,0,0,D
      D1,201617,29/10/2016,Augsburg,Bayern Munich,1,3,A,0,2,A
      D1,201617,29/10/2016,Darmstadt,RB Leipzig,0,2,A,0,0,D
      D1,201617,29/10/2016,Dortmund,Schalke 04,0,0,D,0,0,D
      D1,201617,29/10/2016,Mainz,Ingolstadt,2,0,H,0,0,D
      D1,201617,29/10/2016,Werder Bremen,Freiburg,1,3,A,0,2,A
      D1,201617,29/10/2016,Wolfsburg,Leverkusen,1,2,A,1,0,H
      D1,201617,30/10/2016,FC Koln,Hamburg,3,0,H,0,0,D
      D1,201617,30/10/2016,Hoffenheim,Hertha,1,0,H,1,0,H
      D1,201617,04/11/2016,Hertha,M'gladbach,3,0,H,2,0,H
      D1,201617,05/11/2016,Bayern Munich,Hoffenheim,1,1,D,1,1,D
      D1,201617,05/11/2016,Ein Frankfurt,FC Koln,1,0,H,1,0,H
      D1,201617,05/11/2016,Freiburg,Wolfsburg,0,3,A,0,1,A
      D1,201617,05/11/2016,Hamburg,Dortmund,2,5,A,0,3,A
      D1,201617,05/11/2016,Ingolstadt,Augsburg,0,2,A,0,0,D
      D1,201617,05/11/2016,Leverkusen,Darmstadt,3,2,H,1,0,H
      D1,201617,06/11/2016,RB Leipzig,Mainz,3,1,H,3,0,H
      D1,201617,06/11/2016,Schalke 04,Werder Bremen,3,1,H,2,1,H
      D1,201617,18/11/2016,Leverkusen,RB Leipzig,2,3,A,2,1,H
      D1,201617,19/11/2016,Augsburg,Hertha,0,0,D,0,0,D
      D1,201617,19/11/2016,Darmstadt,Ingolstadt,0,1,A,0,0,D
      D1,201617,19/11/2016,Dortmund,Bayern Munich,1,0,H,1,0,H
      D1,201617,19/11/2016,Mainz,Freiburg,4,2,H,2,0,H
      D1,201617,19/11/2016,M'gladbach,FC Koln,1,2,A,1,0,H
      D1,201617,19/11/2016,Wolfsburg,Schalke 04,0,1,A,0,0,D
      D1,201617,20/11/2016,Hoffenheim,Hamburg,2,2,D,1,1,D
      D1,201617,20/11/2016,Werder Bremen,Ein Frankfurt,1,2,A,1,0,H
      D1,201617,25/11/2016,Freiburg,RB Leipzig,1,4,A,1,3,A
      D1,201617,26/11/2016,Bayern Munich,Leverkusen,2,1,H,1,1,D
      D1,201617,26/11/2016,Ein Frankfurt,Dortmund,2,1,H,0,0,D
      D1,201617,26/11/2016,FC Koln,Augsburg,0,0,D,0,0,D
      D1,201617,26/11/2016,Hamburg,Werder Bremen,2,2,D,2,2,D
      D1,201617,26/11/2016,Ingolstadt,Wolfsburg,1,1,D,1,0,H
      D1,201617,26/11/2016,M'gladbach,Hoffenheim,1,1,D,1,0,H
      D1,201617,27/11/2016,Hertha,Mainz,2,1,H,1,1,D
      D1,201617,27/11/2016,Schalke 04,Darmstadt,3,1,H,1,1,D
      D1,201617,02/12/2016,Mainz,Bayern Munich,1,3,A,1,2,A
      D1,201617,03/12/2016,Dortmund,M'gladbach,4,1,H,2,1,H
      D1,201617,03/12/2016,Hoffenheim,FC Koln,4,0,H,2,0,H
      D1,201617,03/12/2016,Leverkusen,Freiburg,1,1,D,0,1,A
      D1,201617,03/12/2016,RB Leipzig,Schalke 04,2,1,H,1,1,D
      D1,201617,03/12/2016,Werder Bremen,Ingolstadt,2,1,H,1,0,H
      D1,201617,03/12/2016,Wolfsburg,Hertha,2,3,A,2,1,H
      D1,201617,04/12/2016,Augsburg,Ein Frankfurt,1,1,D,1,1,D
      D1,201617,04/12/2016,Darmstadt,Hamburg,0,2,A,0,1,A
      D1,201617,09/12/2016,Ein Frankfurt,Hoffenheim,0,0,D,0,0,D
      D1,201617,10/12/2016,Bayern Munich,Wolfsburg,5,0,H,2,0,H
      D1,201617,10/12/2016,FC Koln,Dortmund,1,1,D,1,0,H
      D1,201617,10/12/2016,Freiburg,Darmstadt,1,0,H,0,0,D
      D1,201617,10/12/2016,Hamburg,Augsburg,1,0,H,0,0,D
      D1,201617,10/12/2016,Hertha,Werder Bremen,0,1,A,0,1,A
      D1,201617,10/12/2016,Ingolstadt,RB Leipzig,1,0,H,1,0,H
      D1,201617,11/12/2016,M'gladbach,Mainz,1,0,H,0,0,D
      D1,201617,11/12/2016,Schalke 04,Leverkusen,0,1,A,0,0,D
      D1,201617,16/12/2016,Hoffenheim,Dortmund,2,2,D,2,1,H
      D1,201617,17/12/2016,Augsburg,M'gladbach,1,0,H,0,0,D
      D1,201617,17/12/2016,Mainz,Hamburg,3,1,H,1,1,D
      D1,201617,17/12/2016,RB Leipzig,Hertha,2,0,H,1,0,H
      D1,201617,17/12/2016,Schalke 04,Freiburg,1,1,D,0,0,D
      D1,201617,17/12/2016,Werder Bremen,FC Koln,1,1,D,1,1,D
      D1,201617,17/12/2016,Wolfsburg,Ein Frankfurt,1,0,H,1,0,H
      D1,201617,18/12/2016,Darmstadt,Bayern Munich,0,1,A,0,0,D
      D1,201617,18/12/2016,Leverkusen,Ingolstadt,1,2,A,0,1,A
      D1,201617,20/12/2016,Dortmund,Augsburg,1,1,D,0,1,A
      D1,201617,20/12/2016,Ein Frankfurt,Mainz,3,0,H,1,0,H
      D1,201617,20/12/2016,Hamburg,Schalke 04,2,1,H,0,0,D
      D1,201617,20/12/2016,M'gladbach,Wolfsburg,1,2,A,0,1,A
      D1,201617,21/12/2016,Bayern Munich,RB Leipzig,3,0,H,3,0,H
      D1,201617,21/12/2016,FC Koln,Leverkusen,1,1,D,1,1,D
      D1,201617,21/12/2016,Hertha,Darmstadt,2,0,H,0,0,D
      D1,201617,21/12/2016,Hoffenheim,Werder Bremen,1,1,D,1,0,H
      D1,201617,21/12/2016,Ingolstadt,Freiburg,1,2,A,0,2,A
      D1,201617,20/01/2017,Freiburg,Bayern Munich,1,2,A,1,1,D
      D1,201617,21/01/2017,Augsburg,Hoffenheim,0,2,A,0,0,D
      D1,201617,21/01/2017,Darmstadt,M'gladbach,0,0,D,0,0,D
      D1,201617,21/01/2017,RB Leipzig,Ein Frankfurt,3,0,H,2,0,H
      D1,201617,21/01/2017,Schalke 04,Ingolstadt,1,0,H,0,0,D
      D1,201617,21/01/2017,Werder Bremen,Dortmund,1,2,A,0,1,A
      D1,201617,21/01/2017,Wolfsburg,Hamburg,1,0,H,0,0,D
      D1,201617,22/01/2017,Leverkusen,Hertha,3,1,H,2,1,H
      D1,201617,22/01/2017,Mainz,FC Koln,0,0,D,0,0,D
      D1,201617,27/01/2017,Schalke 04,Ein Frankfurt,0,1,A,0,1,A
      D1,201617,28/01/2017,Darmstadt,FC Koln,1,6,A,0,3,A
      D1,201617,28/01/2017,Ingolstadt,Hamburg,3,1,H,2,0,H
      D1,201617,28/01/2017,Leverkusen,M'gladbach,2,3,A,2,0,H
      D1,201617,28/01/2017,RB Leipzig,Hoffenheim,2,1,H,1,1,D
      D1,201617,28/01/2017,Werder Bremen,Bayern Munich,1,2,A,0,2,A
      D1,201617,28/01/2017,Wolfsburg,Augsburg,1,2,A,1,1,D
      D1,201617,29/01/2017,Freiburg,Hertha,2,1,H,1,0,H
      D1,201617,29/01/2017,Mainz,Dortmund,1,1,D,0,1,A
      D1,201617,03/02/2017,Hamburg,Leverkusen,1,0,H,0,0,D
      D1,201617,04/02/2017,Bayern Munich,Schalke 04,1,1,D,1,1,D
      D1,201617,04/02/2017,Dortmund,RB Leipzig,1,0,H,1,0,H
      D1,201617,04/02/2017,FC Koln,Wolfsburg,1,0,H,0,0,D
      D1,201617,04/02/2017,Hertha,Ingolstadt,1,0,H,1,0,H
      D1,201617,04/02/2017,Hoffenheim,Mainz,4,0,H,1,0,H
      D1,201617,04/02/2017,M'gladbach,Freiburg,3,0,H,0,0,D
      D1,201617,05/02/2017,Augsburg,Werder Bremen,3,2,H,1,1,D
      D1,201617,05/02/2017,Ein Frankfurt,Darmstadt,2,0,H,0,0,D
      D1,201617,10/02/2017,Mainz,Augsburg,2,0,H,1,0,H
      D1,201617,11/02/2017,Darmstadt,Dortmund,2,1,H,1,1,D
      D1,201617,11/02/2017,Ingolstadt,Bayern Munich,0,2,A,0,0,D
      D1,201617,11/02/2017,Leverkusen,Ein Frankfurt,3,0,H,1,0,H
      D1,201617,11/02/2017,RB Leipzig,Hamburg,0,3,A,0,2,A
      D1,201617,11/02/2017,Schalke 04,Hertha,2,0,H,1,0,H
      D1,201617,11/02/2017,Werder Bremen,M'gladbach,0,1,A,0,1,A
      D1,201617,12/02/2017,Freiburg,FC Koln,2,1,H,1,1,D
      D1,201617,12/02/2017,Wolfsburg,Hoffenheim,2,1,H,0,1,A
      D1,201617,17/02/2017,Augsburg,Leverkusen,1,3,A,0,2,A
      D1,201617,18/02/2017,Dortmund,Wolfsburg,3,0,H,1,0,H
      D1,201617,18/02/2017,Ein Frankfurt,Ingolstadt,0,2,A,0,1,A
      D1,201617,18/02/2017,Hamburg,Freiburg,2,2,D,1,1,D
      D1,201617,18/02/2017,Hertha,Bayern Munich,1,1,D,1,0,H
      D1,201617,18/02/2017,Hoffenheim,Darmstadt,2,0,H,0,0,D
      D1,201617,18/02/2017,Mainz,Werder Bremen,0,2,A,0,2,A
      D1,201617,19/02/2017,FC Koln,Schalke 04,1,1,D,1,1,D
      D1,201617,19/02/2017,M'gladbach,RB Leipzig,1,2,A,0,1,A
      D1,201617,24/02/2017,Wolfsburg,Werder Bremen,1,2,A,1,2,A
      D1,201617,25/02/2017,Bayern Munich,Hamburg,8,0,H,3,0,H
      D1,201617,25/02/2017,Darmstadt,Augsburg,1,2,A,0,0,D
      D1,201617,25/02/2017,Freiburg,Dortmund,0,3,A,0,1,A
      D1,201617,25/02/2017,Hertha,Ein Frankfurt,2,0,H,0,0,D
      D1,201617,25/02/2017,Leverkusen,Mainz,0,2,A,0,2,A
      D1,201617,25/02/2017,RB Leipzig,FC Koln,3,1,H,2,0,H
      D1,201617,26/02/2017,Ingolstadt,M'gladbach,0,2,A,0,0,D
      D1,201617,26/02/2017,Schalke 04,Hoffenheim,1,1,D,1,0,H
      D1,201617,03/03/2017,Augsburg,RB Leipzig,2,2,D,1,1,D
      D1,201617,04/03/2017,Dortmund,Leverkusen,6,2,H,2,0,H
      D1,201617,04/03/2017,FC Koln,Bayern Munich,0,3,A,0,1,A
      D1,201617,04/03/2017,Hoffenheim,Ingolstadt,5,2,H,1,1,D
      D1,201617,04/03/2017,Mainz,Wolfsburg,1,1,D,1,1,D
      D1,201617,04/03/2017,M'gladbach,Schalke 04,4,2,H,1,1,D
      D1,201617,04/03/2017,Werder Bremen,Darmstadt,2,0,H,0,0,D
      D1,201617,05/03/2017,Ein Frankfurt,Freiburg,1,2,A,1,1,D
      D1,201617,05/03/2017,Hamburg,Hertha,1,0,H,0,0,D
      D1,201617,10/03/2017,Leverkusen,Werder Bremen,1,1,D,1,0,H
      D1,201617,11/03/2017,Bayern Munich,Ein Frankfurt,3,0,H,2,0,H
      D1,201617,11/03/2017,Darmstadt,Mainz,2,1,H,2,1,H
      D1,201617,11/03/2017,Freiburg,Hoffenheim,1,1,D,0,0,D
      D1,201617,11/03/2017,Hertha,Dortmund,2,1,H,1,0,H
      D1,201617,11/03/2017,Ingolstadt,FC Koln,2,2,D,1,1,D
      D1,201617,11/03/2017,RB Leipzig,Wolfsburg,0,1,A,0,1,A
      D1,201617,12/03/2017,Hamburg,M'gladbach,2,1,H,1,1,D
      D1,201617,12/03/2017,Schalke 04,Augsburg,3,0,H,3,0,H
      D1,201617,17/03/2017,Dortmund,Ingolstadt,1,0,H,1,0,H
      D1,201617,18/03/2017,Augsburg,Freiburg,1,1,D,1,1,D
      D1,201617,18/03/2017,Ein Frankfurt,Hamburg,0,0,D,0,0,D
      D1,201617,18/03/2017,FC Koln,Hertha,4,2,H,3,0,H
      D1,201617,18/03/2017,Hoffenheim,Leverkusen,1,0,H,0,0,D
      D1,201617,18/03/2017,Werder Bremen,RB Leipzig,3,0,H,1,0,H
      D1,201617,18/03/2017,Wolfsburg,Darmstadt,1,0,H,1,0,H
      D1,201617,19/03/2017,Mainz,Schalke 04,0,1,A,0,0,D
      D1,201617,19/03/2017,M'gladbach,Bayern Munich,0,1,A,0,0,D
      D1,201617,31/03/2017,Hertha,Hoffenheim,1,3,A,1,1,D
      D1,201617,01/04/2017,Bayern Munich,Augsburg,6,0,H,2,0,H
      D1,201617,01/04/2017,Ein Frankfurt,M'gladbach,0,0,D,0,0,D
      D1,201617,01/04/2017,Freiburg,Werder Bremen,2,5,A,0,2,A
      D1,201617,01/04/2017,Hamburg,FC Koln,2,1,H,1,1,D
      D1,201617,01/04/2017,RB Leipzig,Darmstadt,4,0,H,1,0,H
      D1,201617,01/04/2017,Schalke 04,Dortmund,1,1,D,0,0,D
      D1,201617,02/04/2017,Ingolstadt,Mainz,2,1,H,1,0,H
      D1,201617,02/04/2017,Leverkusen,Wolfsburg,3,3,D,1,0,H
      D1,201617,04/04/2017,Dortmund,Hamburg,3,0,H,1,0,H
      D1,201617,04/04/2017,FC Koln,Ein Frankfurt,1,0,H,0,0,D
      D1,201617,04/04/2017,Hoffenheim,Bayern Munich,1,0,H,1,0,H
      D1,201617,04/04/2017,Werder Bremen,Schalke 04,3,0,H,1,0,H
      D1,201617,05/04/2017,Augsburg,Ingolstadt,2,3,A,0,2,A
      D1,201617,05/04/2017,Darmstadt,Leverkusen,0,2,A,0,1,A
      D1,201617,05/04/2017,Mainz,RB Leipzig,2,3,A,0,0,D
      D1,201617,05/04/2017,M'gladbach,Hertha,1,0,H,1,0,H
      D1,201617,05/04/2017,Wolfsburg,Freiburg,0,1,A,0,0,D
      D1,201617,07/04/2017,Ein Frankfurt,Werder Bremen,2,2,D,0,2,A
      D1,201617,08/04/2017,Bayern Munich,Dortmund,4,1,H,2,1,H
      D1,201617,08/04/2017,FC Koln,M'gladbach,2,3,A,1,1,D
      D1,201617,08/04/2017,Freiburg,Mainz,1,0,H,0,0,D
      D1,201617,08/04/2017,Hamburg,Hoffenheim,2,1,H,1,1,D
      D1,201617,08/04/2017,RB Leipzig,Leverkusen,1,0,H,0,0,D
      D1,201617,08/04/2017,Schalke 04,Wolfsburg,4,1,H,2,0,H
      D1,201617,09/04/2017,Hertha,Augsburg,2,0,H,2,0,H
      D1,201617,09/04/2017,Ingolstadt,Darmstadt,3,2,H,1,2,A
      D1,201617,15/04/2017,Augsburg,FC Koln,2,1,H,2,0,H
      D1,201617,15/04/2017,Dortmund,Ein Frankfurt,3,1,H,2,1,H
      D1,201617,15/04/2017,Hoffenheim,M'gladbach,5,3,H,2,2,D
      D1,201617,15/04/2017,Leverkusen,Bayern Munich,0,0,D,0,0,D
      D1,201617,15/04/2017,Mainz,Hertha,1,0,H,1,0,H
      D1,201617,15/04/2017,RB Leipzig,Freiburg,4,0,H,2,0,H
      D1,201617,15/04/2017,Wolfsburg,Ingolstadt,3,0,H,1,0,H
      D1,201617,16/04/2017,Darmstadt,Schalke 04,2,1,H,1,0,H
      D1,201617,16/04/2017,Werder Bremen,Hamburg,2,1,H,1,1,D
      D1,201617,21/04/2017,FC Koln,Hoffenheim,1,1,D,0,0,D
      D1,201617,22/04/2017,Bayern Munich,Mainz,2,2,D,1,2,A
      D1,201617,22/04/2017,Ein Frankfurt,Augsburg,3,1,H,0,1,A
      D1,201617,22/04/2017,Hamburg,Darmstadt,1,2,A,0,0,D
      D1,201617,22/04/2017,Hertha,Wolfsburg,1,0,H,0,0,D
      D1,201617,22/04/2017,Ingolstadt,Werder Bremen,2,4,A,1,1,D
      D1,201617,22/04/2017,M'gladbach,Dortmund,2,3,A,1,1,D
      D1,201617,23/04/2017,Freiburg,Leverkusen,2,1,H,1,0,H
      D1,201617,23/04/2017,Schalke 04,RB Leipzig,1,1,D,0,1,A
      D1,201617,28/04/2017,Leverkusen,Schalke 04,1,4,A,0,3,A
      D1,201617,29/04/2017,Darmstadt,Freiburg,3,0,H,2,0,H
      D1,201617,29/04/2017,Dortmund,FC Koln,0,0,D,0,0,D
      D1,201617,29/04/2017,Mainz,M'gladbach,1,2,A,0,1,A
      D1,201617,29/04/2017,RB Leipzig,Ingolstadt,0,0,D,0,0,D
      D1,201617,29/04/2017,Werder Bremen,Hertha,2,0,H,2,0,H
      D1,201617,29/04/2017,Wolfsburg,Bayern Munich,0,6,A,0,3,A
      D1,201617,30/04/2017,Augsburg,Hamburg,4,0,H,2,0,H
      D1,201617,30/04/2017,Hoffenheim,Ein Frankfurt,1,0,H,0,0,D
      D1,201617,05/05/2017,FC Koln,Werder Bremen,4,3,H,3,2,H
      D1,201617,06/05/2017,Bayern Munich,Darmstadt,1,0,H,1,0,H
      D1,201617,06/05/2017,Dortmund,Hoffenheim,2,1,H,1,0,H
      D1,201617,06/05/2017,Ein Frankfurt,Wolfsburg,0,2,A,0,0,D
      D1,201617,06/05/2017,Hertha,RB Leipzig,1,4,A,0,1,A
      D1,201617,06/05/2017,Ingolstadt,Leverkusen,1,1,D,0,0,D
      D1,201617,06/05/2017,M'gladbach,Augsburg,1,1,D,0,0,D
      D1,201617,07/05/2017,Freiburg,Schalke 04,2,0,H,2,0,H
      D1,201617,07/05/2017,Hamburg,Mainz,0,0,D,0,0,D
      D1,201617,13/05/2017,Augsburg,Dortmund,1,1,D,1,1,D
      D1,201617,13/05/2017,Darmstadt,Hertha,0,2,A,0,2,A
      D1,201617,13/05/2017,Freiburg,Ingolstadt,1,1,D,1,1,D
      D1,201617,13/05/2017,Leverkusen,FC Koln,2,2,D,0,1,A
      D1,201617,13/05/2017,Mainz,Ein Frankfurt,4,2,H,0,1,A
      D1,201617,13/05/2017,RB Leipzig,Bayern Munich,4,5,A,2,1,H
      D1,201617,13/05/2017,Schalke 04,Hamburg,1,1,D,1,0,H
      D1,201617,13/05/2017,Werder Bremen,Hoffenheim,3,5,A,0,3,A
      D1,201617,13/05/2017,Wolfsburg,M'gladbach,1,1,D,0,1,A
      D1,201617,20/05/2017,Bayern Munich,Freiburg,4,1,H,1,0,H
      D1,201617,20/05/2017,Dortmund,Werder Bremen,4,3,H,2,1,H
      D1,201617,20/05/2017,Ein Frankfurt,RB Leipzig,2,2,D,0,1,A
      D1,201617,20/05/2017,FC Koln,Mainz,2,0,H,1,0,H
      D1,201617,20/05/2017,Hamburg,Wolfsburg,2,1,H,1,1,D
      D1,201617,20/05/2017,Hertha,Leverkusen,2,6,A,0,3,A
      D1,201617,20/05/2017,Hoffenheim,Augsburg,0,0,D,0,0,D
      D1,201617,20/05/2017,Ingolstadt,Schalke 04,1,1,D,1,1,D
      D1,201617,20/05/2017,M'gladbach,Darmstadt,2,2,D,0,0,D
      """
    end
  end
end
