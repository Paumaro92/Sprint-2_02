SELECT 
    b.localitat,
    SUM(cp.quantitat) AS total_begudes_venudes
FROM Comanda c
JOIN Botiga b ON c.id_botiga = b.id_botiga
JOIN Comanda_Producte cp ON c.id_comanda = cp.id_comanda
JOIN Producte p ON cp.id_producte = p.id_producte
WHERE p.tipus = 'beguda'
  AND b.localitat = 'Barcelona'
GROUP BY b.localitat;

SELECT 
    e.nom,
    e.cognoms,
    COUNT(c.id_comanda) AS total_comandes
FROM Empleat e
LEFT JOIN Comanda c ON e.id_empleat = c.id_repartidor
WHERE e.id_empleat = 2
GROUP BY e.id_empleat;
