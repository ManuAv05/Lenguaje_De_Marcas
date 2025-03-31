                                                               'Ejercicio a',
(:Ejercicio a:)
for $x in doc("ejercicio_3_libros.xml")//libro
return $x/titulo/text(),

'Ejercicio b',
(:Ejercicio b:)
for $x in doc("ejercicio_3_libros.xml")/bib/libro
where $x/@year=2000
return $x/titulo,

'Ejercicio c',
(:Ejercicio c:)
for $x in doc("ejercicio_3_libros.xml")/bib/libro
where $x/@year>=1995 and $x/@year<=2000
return $x/titulo,

'Ejercicio d',
(:Ejercicio d:)
for $x in doc("ejercicio_3_libros.xml")/bib/libro
where $x/autor/apellido="Stevens"
return $x/titulo,

'Ejercicio e',
(:Ejercicio e:)
for $x in doc("ejercicio_3_libros.xml")/bib/libro[editorial="Addison-Wesley"]
let $titulo := $x/titulo
return $titulo,

'Ejercicio f',
(:Ejercicio f:)
for $x in doc("ejercicio_3_libros.xml")/bib/libro[count(autor)=1]
order by $x/precio
return $x/titulo,

'Ejercicio g',
(:Ejercicio g:)
for $x in doc("ejercicio_3_libros.xml")/bib/libro[count(autor)>2]
order by $x/titulo
return $x/titulo,

'Ejercicio h',
(:Ejercicio h: Se puede hacer directamente por la funcion 'concat' para concatenar:)
for $x in doc("ejercicio_3_libros.xml")/bib/libro
return concat("Titulo:" , $x/titulo, " Año: ", $x/@year , "  autores: ", $x/count(autor) ),

'Ejercicio i',
(:Ejercicio i:)
for $x in doc("ejercicio_3_libros.xml")/bib/libro
return
<resumen_bib>
<libro>
<titulo>{$x/titulo}</titulo>
<anio>{$x/@year}</anio>
<num_autores>{$x/count(autor)}</num_autores>
</libro>
</resumen_bib>, 

'Ejercicio j',
(:Ejercicio j:)
for $x in doc("ejercicio_3_libros.xml")/bib/libro
return
<resumen_bib>
<libro>
<titulo>{$x/titulo}</titulo>
<autores>
<apellido>{$x/apellido}</apellido>
</autores>
</libro>
<libro>
  <titulo>{$x/titulo}</titulo>
  <autores>
    <apellido>{$x/apellido}</apellido>
    <apellido>{$x/apellido}</apellido>
    <apellido>et al</apellido>
</autores>
</libro>
<libro>
  <titulo>{$x/titulo}</titulo>
  <autores>
    <apellido>{$x/apellido}</apellido>
  </autores>
</libro>
</resumen_bib>,

'Ejercicio l',
(:Ejercicio l:)
for $x in doc("ejercicio_3_libros.xml")/bib/libro
where some $autor in $x/autor satisfies $autor/apellido="Stevens"
return
$x/titulo,

'Ejercicio m',
(:ejercicio m :)
for $x in doc("ejercicio_3_libros.xml")/bib/libro
where every $autor in $x/autor satisfies $autor/apellido="Stevens"
return
$x/titulo,

'Ejercicio n',
(:ejercicio n :)
  for $x in distinct-values(/bib/libro/autor/apellido)
  return <apellido>{ $x }</apellido>,
  
'Ejercicio o',
(:ejercicio o:)
'funcion empty',
for $libro in /bib/libro
  where empty($libro/autor)
  return  $libro/titulo ,
'funcion exists',
for $libro in /bib/libro
  where exists($libro/precio[. > 100])
  return $libro/titulo 







