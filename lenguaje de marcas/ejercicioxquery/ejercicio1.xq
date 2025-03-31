'Ejercicio a',
(:Ejercicio1.a:)
/ies/modulos/modulo/nombre,

'Ejercicio b',
(:Ejercicio1.b:)
for $x in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo[ciclo="ASIR"]
return $x/ciclo/text(),

'Ejercicio c',
(:Ejercicio1.c:)
for $nombre in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo[curso= 2]
return $nombre/nombre,

'Ejercicio d',
(:Ejercicio1.d:)
for $nombre in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo[curso=1 and ciclo="ASIR"]
order by $nombre/nombre
return $nombre/nombre,

'Ejercicio e',
(:Ejercicio1.e:)
for $x in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo[horasSemanales<5]
return $x/horasSemanales,

'Ejercicio f ',
(:Ejercicio1.f:)
count(//modulo[curso=1 and ciclo="ASIR"]),

'Ejercicio g',
(:Ejercicio1.g:)
for $x in doc("ejercicio_1_modulos_informatica.xml")/ies/modulos/modulo[horasSemanales>3]
return $x/horasSemanales/text()
