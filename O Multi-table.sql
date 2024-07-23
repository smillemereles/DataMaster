
--Eliminar un dragón y sus registros relacionados:

DELETE d, jd, b, rb
FROM Dragones d
LEFT JOIN Jinete_Dragon jd ON d.id = jd.dragon_id
LEFT JOIN Batallas b ON d.id = b.dragon_id
LEFT JOIN ResultadosBatallas rb ON jd.jinete_id IN (rb.jinete_1_id, rb.jinete_2_id)
WHERE d.id = @dragonId;




---Mostrar información sobre batallas, incluyendo nombres de jinetes y dragones:

SELECT b.fecha, b.resultado,
       j.nombre AS NombreJinete, j.apellido AS ApellidoJinete,
       d.nombre AS NombreDragon, d.color AS ColorDragon
FROM Batallas b
JOIN Jinetes j ON b.jinete_id = j.id
JOIN Dragones d ON b.dragon_id = d.id
ORDER BY b.fecha DESC;



--Mostrar resultados de batallas con nombres de jinetes:

SELECT 
    j1.nombre AS Jinete1Nombre, j1.apellido AS Jinete1Apellido,
    j2.nombre AS Jinete2Nombre, j2.apellido AS Jinete2Apellido,
    jg.nombre AS GanadorNombre, jg.apellido AS GanadorApellido,
    rb.jinete_1_Cambio_ELO, rb.jinete_2_Cambio_ELO
FROM ResultadosBatallas rb
JOIN Jinetes j1 ON rb.jinete_1_id = j1.id
JOIN Jinetes j2 ON rb.jinete_2_id = j2.id
JOIN Jinetes jg ON rb.ganador_id = jg.id
ORDER BY rb.id;



--Mostrar información detallada sobre dragones y sus jinetes:
SELECT d.nombre AS NombreDragon, d.color, d.tamanio, d.elemento,
       j.nombre AS NombreJinete, j.apellido, j.casa, j.titulo
FROM Dragones d
LEFT JOIN Jinete_Dragon jd ON d.id = jd.dragon_id
LEFT JOIN Jinetes j ON jd.jinete_id = j.id
ORDER BY d.nombre;