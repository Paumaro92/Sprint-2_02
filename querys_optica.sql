SELECT c.nom,
  COUNT(v.id_venda) AS total_compres,
  SUM(u.preu) AS import_total
FROM
  Client c
  INNER JOIN Venda v ON c.id_client = v.id_client
  INNER JOIN Ullera u ON v.id_ullera = u.id_ullera
GROUP BY
  c.id_client, c.nom;
  
  SELECT DISTINCT u.id_ullera, u.marca,
    u.graduacio_dret,
    u.graduacio_esq,
    u.tipus_muntura,
    u.color_muntura,
    u.color_vidre_dret,
    u.color_vidre_esq,
    u.preu
FROM Venda v
JOIN Ullera u ON v.id_ullera = u.id_ullera
WHERE v.id_empleat = 1
  AND YEAR(v.data_venda) = 2024;
  
  SELECT DISTINCT 
    p.id_proveidor,
    p.nom,
    p.ciutat,
    p.pais
FROM Venda v
JOIN Ullera u ON v.id_ullera = u.id_ullera
JOIN Proveidor p ON u.id_proveidor = p.id_proveidor;

