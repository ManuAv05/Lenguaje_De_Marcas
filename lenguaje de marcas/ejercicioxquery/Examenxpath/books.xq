"OBTENER TODOS LOS TITULOS DE LOS LIBROS",
for $b in /catalog/book
return $b/title/text(),

"OBTENER AUTORES Y RESPECTIVOS TITULOS",
for $t in /catalog/book
return concat($t/author,': ',$t/title),

"LISTAR TODOS LOS LIBROS DE UN GENERO (FANTASY)",
for $b in /catalog/book[genre="Fantasy"]
return $b/title,

"OBTENER EL NUMERO TOTAL DE LIBROS",
count(/catalog/book),

"OBTENER SUMA DE PRECIO DE TODOS LOS LIBROS",
sum(/catalog/book/price),

"OBTENER PRECIO MEDIO DE LOS LIBROS",
let $numero := count(/catalog/book)
let $suma := sum(/catalog/book/price)
return $suma div $numero,

"LISTAR LIBROS PUBLICADOS DESPUES DE UNA FECHA",
for $b in /catalog/book[publish_date>"2000-01-10"]
return $b/title,

"OBTENER TODOS LOS LIBROS CON UN PRECIO MENOR A 15",
for $b in /catalog/book[price<15]
return $b/title,

"OBTENER EL LIBRO CON EL ID=BK105",
for $t in /catalog/book[@id="bk105"]
return $t/title