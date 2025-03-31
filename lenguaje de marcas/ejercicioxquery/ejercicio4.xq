'Ejercicio a',
(:Ejercicio a:)
let $doc := doc("ejercicio_4_clase.xml")
let $alumnos := $doc//alumno
let $contador := for $alumno in $alumnos return 1
return count ($contador),

'Ejercicio b',
(:Ejercicio b, supondremos que modulos son asignaturas:)
let $doc := doc("ejercicio_4_clase.xml")
let $asignaturas := $doc//asignatura
let $contador := for $x in $asignaturas return 1
return count($contador),

'Ejercicio c',
(:ejercicio c:)
let $alumnosConNotas :=
    for $nota in doc("ejercicio_4_clase.xml") //nota
    let $alumno := $nota/@alum
    return 
        //alumno[@cod = $alumno]/apenom

return distinct-values($alumnosConNotas),

'Ejercicio d',
(:Ejercicio d:)
let $alumnoCod := "n43483437"
let $notas := //nota[@alum = $alumnoCod]

return
<alumno cod="{$alumnoCod}">
    {
        for $nota in $notas
        let $modulo := //asignatura[@cod = $nota/@asig]
        return
            <modulo>
                <nombre_modulo>{data($modulo/@nombre)}</nombre_modulo>
                <nota>{data($nota/@calificacion)}</nota>
            </modulo>
    }
</alumno>,
'Ejercicio e',
(:Ejercicio e:)
let $notas := //nota[@asig ="a4"]
let $alumnosConNotas :=
    for $nota in $notas
    let $alumno := //alumno[@cod = $nota/@alum]
    return
        <alumno>
            <nombre>{data($alumno/apenom)}</nombre>
            <nota>{data($nota/@calificacion)}</nota>
        </alumno>

return
<lmsgi>
    {
        for $alumno in 
            (for $alumno in $alumnosConNotas
             order by number($alumno/nota) descending
             return $alumno)
        return $alumno
    }
</lmsgi>,

'ejercicio f',
(:ejercicio f:)
let $asignaturaCod := "a4" (: Suponiendo que "LMSGI" tiene el código "a4" :)
let $notas := //nota[@asig = $asignaturaCod and number(@calificacion) >= 5]
let $alumnosAprobados :=
    for $nota in $notas
    let $alumno := //alumno[@cod = $nota/@alum]
    return
        <alumno>
            <nombre>{data($alumno/apenom)}</nombre>
            <nota>{data($nota/@calificacion)}</nota>
        </alumno>

return
<lmsgi>
    {
        for $alumno in 
            (for $alumno in $alumnosAprobados
             order by number($alumno/nota) descending
             return $alumno)
        return $alumno
    }
</lmsgi>