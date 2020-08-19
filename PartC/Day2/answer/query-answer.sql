-- Given the tables and data from the attached file (where you will also find the sentences to look at the queries' cost), 
-- do the physical design of the database so that the execution of the queries for answering the following KPI 
-- (and loading the correspondning charts) is optimal (the frequency of execution of each query is indicated between parenthesis):

-- (30%) Give me FH and FC per month, filtered by the aircraft model (e.g., "777").
-- (30%) Give me ADOSS, ADOSU per year, filtered by the aircraft from the fleet (e.g., "XY-WTR").
-- (20%) Give me the RRh, RRc, PRRh, PRRc, MRRh and MRRc per month, filtered by the aircraft model (e.g., "777").
-- (20%) Give me the MRRh and MRRc per aircraft model, filtered by the airport of the reporting person (e.g., "KRS"). 





-- (30%) 1-Give me FH and FC per month, filtered by the aircraft model (e.g., "777"). 

-- Query1
SELECT f.FLIGHTHOURS AS "FH", f.FLIGHTCYCLES AS "FC", f.MONTHID AS "MONTHID"
FROM FACTS_DRILLACCROSS f, AircraftDimension a
WHERE f.AIRCRAFTID = a.ID AND a.MODEL = '777'
GROUP BY f.FLIGHTHOURS, f.FLIGHTCYCLES, f.MONTHID;




----------------------------------------------------------------------------------------------

-- (30%) 2-Give me ADOSS, ADOSU per year, filtered by the aircraft from the fleet (e.g., "XY-WTR"). 

-- Query2
SELECT f.SCHEDULEDOUTOFSERVICE AS "ADOSS", f.UNSCHEDULEDOUTOFSERVICE AS "ADOSU", m.y as "Year"
FROM FACTS_DRILLACCROSS f, Months m, AircraftDimension a
WHERE f.MONTHID = m.ID AND a.ID = f.AIRCRAFTID AND a.ID = 'XY-WTR'
GROUP BY f.SCHEDULEDOUTOFSERVICE, f.UNSCHEDULEDOUTOFSERVICE, m.y;






----------------------------------------------------------------------------------------------


-- (20%) 3-Give me the RRh, RRc, PRRh, PRRc, MRRh and MRRc per month, filtered by the aircraft model (e.g., "777"). 

-- Query3
SELECT   F1.RRh,
         F1.RRc,
         F1.PRRh,
         F1.PRRc,
         F1.MRRh,
         F1.MRRc,
         F1.MONTHID
FROM   (SELECT (f.PIREP + f.MAREP) / f.FLIGHTHOURS AS RRh,
               (f.PIREP + f.MAREP) / f.FLIGHTCYCLES AS RRc,
               f.PIREP / f.FLIGHTHOURS AS PRRh,
               f.PIREP / f.FLIGHTCYCLES AS PRRc,
               f.MAREP / f.FLIGHTHOURS AS MRRh,
               f.MAREP / f.FLIGHTCYCLES AS MRRc,
               f.MONTHID  AS "MONTHID",
               f.AIRCRAFTID AS "AIRCRAFTID"
        FROM   FACTS_DRILLACCROSS f
        GROUP BY  (f.PIREP + f.MAREP) / f.FLIGHTHOURS, 
                  (f.PIREP + f.MAREP) / f.FLIGHTCYCLES, 
                  f.PIREP / f.FLIGHTHOURS, 
                  f.PIREP / f.FLIGHTCYCLES, 
                  f.MAREP / f.FLIGHTHOURS, 
                  f.MAREP / f.FLIGHTCYCLES,
                  f.MONTHID,
                  f.AIRCRAFTID) F1,
                  AircraftDimension a
WHERE  F1.AIRCRAFTID = a.ID
       AND a.MODEL = '777'
GROUP BY F1.RRh,
         F1.RRc,
         F1.PRRh,
         F1.PRRc,
         F1.MRRh,
         F1.MRRc,
         F1.MONTHID;


----------------------------------------------------------------------------------------------

-- (20%) 4-Give me the MRRh and MRRc per aircraft model, filtered by the airport of the reporting person (e.g., "KRS").

-- Query4
SELECT   F1.MRRh,
         F1.MRRc,
         a.MODEL
FROM   (SELECT f.MAREP / f.FLIGHTHOURS AS MRRh,
               f.MAREP / f.FLIGHTCYCLES AS MRRc,
               f.MONTHID  AS "MONTHID",
               f.PERSONID AS "PERSONID",
               f.AIRCRAFTID AS "AIRCRAFTID"
        FROM   FACTS_DRILLACCROSS f
        GROUP BY  f.MAREP / f.FLIGHTHOURS, 
                  f.MAREP / f.FLIGHTCYCLES,
                  f.MONTHID,
                  f.PERSONID,
                  f.AIRCRAFTID) F1,
                  AircraftDimension a,
                  peopledimension p
WHERE  F1.AIRCRAFTID = a.ID
	   AND F1.PERSONID = p.id
       AND p.AIRPORT = 'KRS'
GROUP BY F1.MRRh,
         F1.MRRc,
         a.MODEL;





