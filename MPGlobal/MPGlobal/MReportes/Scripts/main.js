/*Al cargar la pagina*/
$(document).ready(function () {
    $(".cajaGris").corner();
    $(".HLGris").corner().addClass("titulocajaBlanca");   
});

/*Al cargar regresar de postback*/
$(function () {
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function EndRequestHandler(sender, args) {
        $(document).ready(function () {
            $(".cajaGris").corner();
            $(".HLGris").corner().addClass("titulocajaBlanca");   
        });
    }
});