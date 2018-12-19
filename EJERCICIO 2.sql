/*1 Quantitat de registres de la taula de vols*/
SELECT COUNT(flightID) from usairlineflights2.flights;
/*2 Retard promig de sortida i arribada segons l'aeroport origen*/
USE usairlineflights2;
SELECT Origin, AVG(ArrDelay), AVG(DepDelay) 
FROM flights
GROUP BY Origin
ORDER BY Origin ASC;
/*3 Retard promig d'arribada dels vols, per mesos i segons l'aeroport origen*/
SELECT Origin, colYear, colMonth, AVG(ArrDelay) 
FROM flights
GROUP BY Origin, colYear, colMonth;
/*4 Retard promig d'arribada dels vols, per mesos i segons l'aeroport origen pero la ciutat del aeroport*/
SELECT city, colYear, colMonth, AVG(ArrDelay) FROM flights
INNER JOIN usairports ON IATA = origin
GROUP BY city, colYear, colMonth;
/*5 Companyies amb més vols cancel·lats ordenades descendentment*/
SELECT UniqueCarrier AS 'Plane ID', SUM(Cancelled) AS 'Total cancelled flights' 
FROM flights WHERE CancellationCode<>'' 
GROUP BY 1 
ORDER BY 2 DESC;
/*6 Identificador dels 10 avions que més distància han recorregut fent vols*/
SELECT TailNum AS 'Plane ID:', SUM(Distance) AS 'Total KM:' 
FROM flights 
GROUP BY 1 
ORDER BY 2 DESC LIMIT 10;
/*7: Companyies amb un retard promig d'arribada a destí que sigui superior a 10 minuts*/
SELECT Description AS 'Company:', AVG(ArrDelay) AS 'Arrival AVG delay:' 
FROM carriers JOIN flights ON carriers.CarrierCode=flights.UniqueCarrier 
GROUP BY 1 HAVING AVG(ArrDelay)>10 
ORDER BY 2 DESC;
