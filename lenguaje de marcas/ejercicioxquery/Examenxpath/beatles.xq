"OBTENER TODOS LOS NOMBRES DE LOS BEATLES",
for $b in doc("beatles.xml")/beatles/beatle
return concat($b/name/firstname, ' ',$b/name/lastname ),

"OBTENER ENLACES DE TODOS LOS BEATLES",
for $b in doc("beatles.xml")/beatles/beatle
return $b/@link,

"CONTAR EL NUMERO DE BEATLES",
count(beatles/beatle),

"OBTENER NOMBRE Y ENLACE DEL BEATLE CON EL PRIMER NOMBRE PAUL",
for $b in doc("beatles.xml")/beatles/beatle/nam[firstname="Paul"]
return concat($b/name/fistname, ' ',$b/name/lastname, ':' ,$b/@link ),

"LISTAR TODOS LOS BEATLES CUYO ENLACE CONTIENE WEB",
for $beatle in beatles/beatle[contains(@link,'web')]
return concat ($beatle/name/firstname, ' ', $beatle/name/lastname, ':', $beatle/@link),

"OBTENER TODOS LOS APELLIDOS DE LOS BEATLES",
for $b in /beatles/beatle/name
return $b/lastname,

"OBTENER EL BEATLE CON EL APELLIDO STARR ",
for $b in /beatles/beatle[name/lastname="Starr"]
return $b/name/firstname,

"LISTAR TODOS LOS BEATLES QUE TIENEN ATRIBUTO REAL",
for $b in /beatles/beatle[@real]
return $b
