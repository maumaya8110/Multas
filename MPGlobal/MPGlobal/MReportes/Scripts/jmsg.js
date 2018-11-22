var fmsg = {
    hmsg: function(txt) {
        var msg = '';
        switch (txt) {
            case 'add': { msg = 'Añade un registro al catalogo'; } break;
            case 'edit': { msg = 'Edita un registro al catalogo'; } break;
            case 'del1': { msg = 'Elimina registro al catalogo'; } break;
            case 'export': { msg = 'Exporta a excel la información del grid'; } break;
            case 'filter': { msg = 'Añade filtros de busqueda al grid'; } break;
            case 'leftrama': { msg = 'Añade paginas a la rama del menu seleccionada'; } break;
            case 'rightrama': { msg = 'Quita paginas a la rama del menu seleccionada'; } break;
            case 'rightallrama': { msg = 'Quita todas las paginas a la rama del menu seleccionada'; } break;
            
        }
        if (msg == '') { msg = 'Ayuda no disponible para este componente'; }
        return msg;
    },

    dialogo: function(titulo, pagina, qs, w, h) {
        var sTitulo;
        sTitulo = encodeURI(titulo);
        if (qs != "") { qs = "&" + qs; }
        window.showModalDialog("/webDialog.aspx?src=" + pagina + "&Titulo=" + sTitulo + qs, window, "dialogWidth:" + w + "px;dialogHeight:" + h + "px;");
        return false

    }


};                         //Fin clase