$(document).ready(main);

var numCorrectas=0;
var numIncorrectas=0;
function main(){

    var res =$(".respuesta");
    res.draggable();
    $(".preg").droppable({drop:dropPregunta});

}

function dropPregunta(event,ui){
    var contPregunta =$(this);
    var respuesta = ui.draggable;

    var correcta = contPregunta.text().toLowerCase();
    correcta = correcta.trim();
    var pos = contPregunta.position();

    if(correcta==respuesta.attr("alt")){
        contPregunta.append("<img src='"+respuesta.attr("src")+"' class='rDrop' />" );
         numCorrectas++;

    }else{
        contPregunta.append("<img src='"+respuesta.attr("src")+"' class='rDrop' />");
         numIncorrectas++;
    }

    respuesta.draggable("destroy");
    contPregunta.droppable("destroy");
    comprobarFinal();
    respuesta.remove();
}
function comprobarResultados(){
    $(".ok,.inco").fadeIn("slow");
    $("#resultados").html("Correct answers:     "+numCorrectas+"<br />"+"Incorrect answers:    "+numIncorrectas);

}

function comprobarFinal(){
    resul = numCorrectas+numIncorrectas;
    if(resul ==6){

        comprobarResultados();
    }
}