 CREATE TABLE months
  (
     id CHAR(7),
     y  NUMBER(4) NOT NULL,
     PRIMARY KEY (id)
  );

CREATE TABLE temporaldimension
  (
     id      DATE,
     monthid CHAR(7) NOT NULL,
     PRIMARY KEY (id),
     FOREIGN KEY (monthid) REFERENCES months (id)
  );

CREATE TABLE aircraftdimension
  (
     id           CHAR(6),
     model        VARCHAR2(100) NOT NULL,
     manufacturer VARCHAR2(100) NOT NULL,
     PRIMARY KEY (id)
  );

CREATE TABLE aircraftutilization
  (
     aircraftid              CHAR(6),
     timeid                  DATE,
     scheduledoutofservice   NUMBER(2),
     unscheduledoutofservice NUMBER(2),
     flighthours             NUMBER(2),
     flightcycles            NUMBER(2),
     delays                  NUMBER(2),
     delayedminutes          NUMBER(3),
     cancellations           NUMBER(2),
     PRIMARY KEY (aircraftid, timeid),
     FOREIGN KEY (aircraftid) REFERENCES aircraftdimension(id),
     FOREIGN KEY (timeid) REFERENCES temporaldimension(id)
  );

CREATE TABLE peopledimension
  (
     id      CHAR(6),
     airport CHAR(3),
     role    CHAR(1) CHECK (role IN ('P', 'M')) NOT NULL,
     PRIMARY KEY (id)
  );

CREATE TABLE logbookreporting
  (
     aircraftid CHAR(6),
     monthid    CHAR(7),
     personid   CHAR(6),
     counter    NUMBER(2) NOT NULL,
     PRIMARY KEY (aircraftid, monthid, personid),
     FOREIGN KEY (aircraftid) REFERENCES aircraftdimension(id),
     FOREIGN KEY (monthid) REFERENCES months(id),
     FOREIGN KEY (personid) REFERENCES peopledimension(id)
  );

CREATE VIEW facts_drillaccross ("AIRCRAFTID", "MONTHID", "PERSONID", "COUNTER",
"FLIGHTCYCLES", "FLIGHTHOURS", "DELAYEDMINUTES", "DELAYS", "CANCELLATIONS",
"SCHEDULEDOUTOFSERVICE", "UNSCHEDULEDOUTOFSERVICE", "DAYSTOTAL", "PIREP",
"MAREP")
AS
  SELECT A1.aircraftid,
         L1.monthid,
         L1.personid,
         L1.counter,
         A1.flightcycles,
         A1.flighthours,
         A1.delayedminutes,
         A1.delays,
         A1.cancellations,
         A1.scheduledoutofservice,
         A1.unscheduledoutofservice,
         A1.daystotal,
         CASE
           WHEN P.role = 'P' THEN L1.counter
           ELSE 0
         END AS PIREP,
         CASE
           WHEN P.role = 'M' THEN L1.counter
           ELSE 0
         END AS MAREP
  FROM   (SELECT A.aircraftid                   AS AIRCRAFTID,
                 T.monthid                      AS MONTHID,
                 Sum(A.flighthours)             AS FLIGHTHOURS,
                 Sum(A.flightcycles)            AS FLIGHTCYCLES,
                 Sum(A.delays)                  AS DELAYS,
                 Sum(A.delayedminutes)          AS DELAYEDMINUTES,
                 Sum(A.cancellations)           AS CANCELLATIONS,
                 Sum(A.scheduledoutofservice)   AS SCHEDULEDOUTOFSERVICE,
                 Sum(A.unscheduledoutofservice) AS UNSCHEDULEDOUTOFSERVICE,
                 Count(DISTINCT T.id)           AS DAYSTOTAL
          FROM   aircraftutilization A,
                 temporaldimension T
          WHERE  A.timeid = T.id
          GROUP  BY A.aircraftid,
                    T.monthid) A1,
         logbookreporting L1,
         peopledimension P
  WHERE  A1.aircraftid = L1.aircraftid
         AND L1.monthid = A1.monthid
         AND L1.personid = P.id;  