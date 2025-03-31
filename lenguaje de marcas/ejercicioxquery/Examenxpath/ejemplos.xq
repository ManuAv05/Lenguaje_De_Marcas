for $x in doc("books.xml")/catalog/book
return $x/title/text(),

'----------------------------------------------',

for $x in doc("books.xml")/catalog/book
where $x/@id="bk103"
return $x/author,

'-----------------------------------------------',

for $x in doc("books.xml")/catalog/book[price=5.95]
order by $x/title
return $x/title,

'--------------------------------------------------',
for $x in doc("books.xml")/catalog/book[count(author)=1]
return $x (:Esto sirve para que te diga los libros que tiene un autor, si quisieses que te busque los que tienen mas de uno poner >1:),
 '---------------------------------------------------',
 
for $x in doc("books.xml")/catalog/book
return $x/description 

