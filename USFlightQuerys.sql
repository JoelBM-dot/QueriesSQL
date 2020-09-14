/*1. Quantitat de vols */
SELECT COUNT(*) AS Total FROM flights;

/*2. Retard promig de sortida i arribada segons l'aeroport d'origen.*/ 
SELECT Origin, AVG(ArrDelay) AS prom_arribades , AVG(DepDelay) as prom_sortides FROM flights GROUP BY Origin;

/*3. Retard promig dels vols, per mesos, anys i segons l'aeroport d'origen. */
SELECT Origin, colYear, colMonth, AVG(ArrDelay) AS prom_arribades FROM flights GROUP BY flightID ORDER BY Origin, colYear, colMonth;

/*4. Mateixa consulta d'abans pero que mostrí el nom de la ciutat. */
SELECT City, colYear, colMonth, AVG(ArrDelay) AS prom_arribades FROM flights, usairports GROUP BY flightID ORDER BY City, colYear, colMonth;

/*5. Les companyes amb mes vols cancelats, per mesos i any. */
SELECT UniqueCarrier, colYear, colMonth, SUM(Cancelled) as Total_cancelats from flights GROUP BY UniqueCarrier ORDER BY Total_cancelats;

/*6. 10 Identificadors dels avions amb més distància que han recorregut. */
SELECT TailNum, SUM(Distance) AS total_distancia FROM flights GROUP BY TailNum ORDER BY total_distancia DESC LIMIT 10;

/*7. Companyies amb el seu retard promig nomes d'aquelles les quals els seus valos arriben al seu destí amb un retard promig major de 10 minutos. */
SELECT UniqueCarrier, AVG(depdelay) AS promig_retras FROM flights GROUP BY UniqueCarrier HAVING promig_retras > 10 ORDER BY promig_retras DESC