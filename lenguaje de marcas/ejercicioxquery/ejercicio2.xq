'Ejercicio a',
(:Ejercicio a:)
for $x in doc("ejercicio_2_bailes.xml")/bailes/baile
return $x/nombre/text(),

'Ejercicio b',
(:Ejercicio b:)
for $x in doc("ejercicio_2_bailes.xml")/bailes/baile[sala=1]
return $x/sala,

'Ejercicio c',
(:Ejercicio c:)
for $x in doc("ejercicio_2_bailes.xml")/bailes/baile[sala=2 and precio<35]
return $x,

'Ejercicio d',
(:Ejercicio d:)
for $x in doc("ejercicio_2_bailes.xml")/bailes/baile
where $x/precio[@cuota="mensual"]
return $x/profesor/text(),



'Ejercicio e',
(:Ejercicio e:)
for $x at $i in doc ("ejercicio_2_bailes.xml")/bailes/baile
where $x/profesor="Jesús Lozano"
return
<bailes_lozano profesor="Jesús Lozano">
<baile num='{$i}'>
<nombre>{$x/nombre}</nombre>
<plazas>{$x/plazas}</plazas>
<duracion>De {$x/comienzo} A {$x/fin}</duracion>
</baile>
</bailes_lozano>






