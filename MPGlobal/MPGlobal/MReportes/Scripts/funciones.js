var func = {


    cancelEvent: function () {
        event.cancelBubble = true;
        event.returnValue = false;
        return false;
    },


    CreaGraficaSinIncisos: function (div, categoria, porcentaje, inciso, sininciso) {
        $(div).highcharts({

            chart: {
                zoomType: 'xy'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            xAxis: [{
                categories: $.parseJSON($(categoria).val()),
                crosshair: true
            }],
            yAxis: [{ // Primary yAxis
                labels: {
                    format: '{value}',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
                title: {
                    text: 'PORCENTAJE',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                }
            }, { // Secondary yAxis
                title: {
                    text: 'CANTIDAD SININIESTROS',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                labels: {
                    format: ' {value} ',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                opposite: true
            }],
            tooltip: {
                shared: true
            },
            legend: {
                layout: 'vertical',
                align: 'left',
                x: 120,
                verticalAlign: 'top',
                y: 100,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
            },
            series: [
             {
                 name: 'PORCENTAJE',
                 type: 'spline',
                 data: $.parseJSON($(porcentaje).val()),
                 tooltip: {
                     valueSuffix: ' %'
                 }
             },

            {
                //name: 'SINIESTRALIDAD',
                name: 'INCISO',
                type: 'column',
                yAxis: 1,
                data: $.parseJSON($(inciso).val()),
                tooltip: {
                    valueSuffix: ' '
                }




            },
            {
                name: 'INCISO CON SININIESTRO.',
                //name: 'PRIM DEV',
                type: 'column',
                yAxis: 1,
                data: $.parseJSON($(sininciso).val()),
                tooltip: {
                    valueSuffix: ' '
                }

            }

           ]
        });
    },


    CreaGraficaReserva: function (div, meses, empleados, oficiales, contado, poremp, porofi, porcont) {
        $(div).highcharts({


            title: {
                text: ''
            },
            xAxis: {
                categories: $.parseJSON($(meses).val())
                //                ['2015-ENE', '2015-FEB', '2015-MAR', '2015-ABR', '2015-MAY']
            },
            labels: {
                items: [{
                    html: 'CATEGORIAS',
                    style: {
                        left: '500px',
                        top: '2px',
                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                    }
                }]
            },
            series: [{
                type: 'column',
                name: 'EMPLEADOS',
                data: $.parseJSON($(empleados).val())
            },
            {
                type: 'column',
                name: 'OFICIALES',
                data: $.parseJSON($(oficiales).val())

            },
             {
                 type: 'column',
                 name: 'CONTADO',
                 data: $.parseJSON($(contado).val())

             },
             {
                 type: 'pie',
                 name: 'Total Sin',
                 data: [{
                     name: 'EMPLEADOS',
                     y: $.parseJSON($(poremp).val()),
                     color: Highcharts.getOptions().colors[0] // Jane's color
                 }, {
                     name: 'OFICIALES',
                     y: $.parseJSON($(porofi).val()),
                     color: Highcharts.getOptions().colors[1] // John's color
                 }, {
                     name: 'CONTADO',
                     y: $.parseJSON($(porcont).val()),
                     color: Highcharts.getOptions().colors[2] // Joe's color
                 }],
                 center: [600, 50],
                 size: 120,
                 showInLegend: false,
                 dataLabels: {
                     enabled: false
                 }
             }]
        });

    },

    CreaGraficaRepPeriodo: function (div, meses, cantidad, siniestralidad) {
        $(div).highcharts({

            chart: {
                zoomType: 'xy'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            xAxis: [{
                categories: $.parseJSON($(meses).val()),
                //                ['2015/ENERO', '2015/FEBRERO', '2014/MARZO', '2015/ABRIL', '2015/MAYO'],
                crosshair: true
            }],
            yAxis: [{ // Primary yAxis
                labels: {
                    format: '{value}',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
                title: {
                    text: 'CANTIDAD',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                }
            }, { // Secondary yAxis
                title: {
                    text: 'SINIESTRALIDAD',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                labels: {
                    format: '$ {value} ',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                opposite: true
            }],
            tooltip: {
                shared: true
            },
            legend: {
                layout: 'vertical',
                align: 'left',
                x: 120,
                verticalAlign: 'top',
                y: 100,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
            },
            series: [{
                name: 'SINIESTRALIDAD',
                type: 'column',
                yAxis: 1,
                data: $.parseJSON($(siniestralidad).val()),
                //                [79136.85, 1773108.29, 2227956.71, 88927.50, 352842.75],
                tooltip: {
                    valueSuffix: ' $'
                }

            }, {
                name: 'CANTIDAD',
                type: 'spline',
                data: $.parseJSON($(cantidad).val()),
                //                [3, 204, 217, 8, 47],
                tooltip: {
                    valueSuffix: ''
                }
            }]
        });
    },
















    GraficaLinealGRAL: function (div) {
        $(div).highcharts({

            chart: {
                zoomType: 'xy'
            },
            title: {
                text: 'REPORTE GENERAL'
            },
            subtitle: {
                text: 'INFORMACION DEL 31 ENERO 2015 AL 30 ABRIL 2015'
            },
            xAxis: [{
                categories: ['CONTADO', 'OFICIALES', 'EMPLEADOS'],
                crosshair: true
            }],
            yAxis: [{ // Primary yAxis
                labels: {
                    format: '{value}',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
                title: {
                    text: 'PORCENTAJE',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                }
            }, { // Secondary yAxis
                title: {
                    text: 'MONTO SIN.',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                labels: {
                    format: '$ {value} ',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                opposite: true
            }],
            tooltip: {
                shared: true
            },
            legend: {
                layout: 'vertical',
                align: 'left',
                x: 120,
                verticalAlign: 'top',
                y: 100,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
            },
            series: [
             {
                 name: 'PORCENTAJE',
                 type: 'spline',
                 data: [13, 197, 147],
                 tooltip: {
                     valueSuffix: ' %'
                 }
             },

            {
                //name: 'SINIESTRALIDAD',
                name: 'PRIM DEV',
                type: 'column',
                yAxis: 1,
                data: [21066.44, 1403497.31, 3048750.03],
                //data: [2719.19, 4496445.22, 2765168.91],
                tooltip: {
                    valueSuffix: ' $'
                }




            },
            {
                name: 'SINIESTRALIDAD',
                //name: 'PRIM DEV',
                type: 'column',
                yAxis: 1,
                data: [2719.19, 2765168.91, 4496445.22],
                //data: [21066.44, 3048750.03, 1403497.31],
                tooltip: {
                    valueSuffix: ' $'
                }




            }

           ]
        });
    },


    CreaGraficaLineaX: function (div, titulo, siniestralidad, devengada, porcentaje) {
        $(div).highcharts({

            chart: {
                zoomType: 'xy'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            xAxis: [{
                categories: $.parseJSON($(titulo).val()),
                crosshair: true
            }],
            yAxis: [{ // Primary yAxis
                labels: {
                    format: '{value}',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
                title: {
                    text: 'PORCENTAJE',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                }
            }, { // Secondary yAxis
                title: {
                    text: 'MONTO SIN.',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                labels: {
                    format: '$ {value} ',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                opposite: true
            }],
            tooltip: {
                shared: true
            },
            legend: {
                layout: 'vertical',
                align: 'left',
                x: 120,
                verticalAlign: 'top',
                y: 100,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
            },
            series: [
             {
                 name: 'PORCENTAJE',
                 type: 'spline',
                 data: $.parseJSON($(porcentaje).val()),
                 tooltip: {
                     valueSuffix: ' %'
                 }
             },

            {
                //name: 'SINIESTRALIDAD',
                name: 'PRIM DEV',
                type: 'column',
                yAxis: 1,
                data: $.parseJSON($(devengada).val()),
                //data: [2719.19, 4496445.22, 2765168.91],
                tooltip: {
                    valueSuffix: ' $'
                }




            },
            {
                name: 'SINIESTRALIDAD',
                //name: 'PRIM DEV',
                type: 'column',
                yAxis: 1,
                data: $.parseJSON($(siniestralidad).val()),
                //data: [21066.44, 3048750.03, 1403497.31],
                tooltip: {
                    valueSuffix: ' $'
                }




            }

           ]
        });
    },

    CreaGraficaMultiGral: function (div) {
        $(div).highcharts({


            title: {
                text: 'REPORTE GENERAL POR CATEGORIA'
            },
            xAxis: {
                categories: ['Empleados', 'Oficiales', 'Contado']
            },
            labels: {
                items: [{
                    html: 'CATEGORIAS',
                    style: {
                        left: '500px',
                        top: '2px',
                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                    }
                }]
            },

            series: [{
                type: 'column',
                name: 'Siniestralidad',
                data: [4496445.22, 2765168.1, 2719.19]
            },
            {
                type: 'column',
                name: 'Prima Neta Dev',
                data: [3048750.03, 1403497.31, 21066.44]
            },

               {
                   type: 'pie',
                   name: 'Total Sin',
                   data: [{
                       name: 'EMPLEADOS',
                       y: 68.15,
                       color: Highcharts.getOptions().colors[0] // Jane's color
                   }, {
                       name: 'OFICIALES',
                       y: 31.37,
                       color: Highcharts.getOptions().colors[1] // John's color
                   }, {
                       name: 'CONTADO',
                       y: 0.47,
                       color: Highcharts.getOptions().colors[2] // Joe's color
                   }],
                   center: [600, 50],
                   size: 120,
                   showInLegend: false,
                   dataLabels: {
                       enabled: false
                   }
               }]
        });

    },


    CreaGraficaXX: function (div) {
        $(div).highcharts({


            title: {
                text: 'TENDENCIA POR CATEGORIA'
            },
            xAxis: {
                categories: ['EMPLEADOS', 'OFICIALES', 'CONTADO']
            },
            labels: {
                items: [{
                    html: 'CATEGORIAS',
                    style: {
                        left: '500px',
                        top: '2px',
                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                    }
                }]
            },
            series: [{
                type: 'column',
                name: 'INCISO',
                data: [6646, 2842, 969]
            }, {
                type: 'column',
                name: 'INCISO CON SIN',
                data: [2699, 1236, 303]

            }, {
                //                type: 'spline',
                //                id: 'google-trends',
                //                dashStyle: 'dash',
                //                type: 'area',
                //                spacingBottom: 30,
                type: 'line',
                dashStyle: 'dash',
                name: 'Promedio',
                data: [4672.5, 2039, 636]
            }, {
                type: 'pie',
                name: 'Total Sin',
                data: [{
                    name: 'EMPLEADOS',
                    y: 63.55,
                    color: Highcharts.getOptions().colors[0] // Jane's color
                }, {
                    name: 'OFICIALES',
                    y: 27.18,
                    color: Highcharts.getOptions().colors[1] // John's color
                }, {
                    name: 'CONTADO',
                    y: 9.27,
                    color: Highcharts.getOptions().colors[2] // Joe's color
                }],
                center: [600, 50],
                size: 120,
                showInLegend: false,
                dataLabels: {
                    enabled: false
                }
            }]
        });

    }, 


    CreaGauge: function (div, titulo1, hdndatos, leyenda, colores, labelvisible) {
        $(div).highcharts({

            chart: {
                type: 'gauge',
                plotBackgroundColor: null,
                plotBackgroundImage: null,
                plotBorderWidth: 0,
                plotShadow: false
            },

            title: {
                text: 'Speedometer'
            },

            pane: {
                startAngle: -150,
                endAngle: 150,
                background: [{
                    backgroundColor: {
                        linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                        stops: [
	                    [0, '#FFF'],
	                    [1, '#333']
	                ]
                    },
                    borderWidth: 0,
                    outerRadius: '109%'
                }, {
                    backgroundColor: {
                        linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                        stops: [
	                    [0, '#333'],
	                    [1, '#FFF']
	                ]
                    },
                    borderWidth: 1,
                    outerRadius: '107%'
                }, {
                // default background
            }, {
                backgroundColor: '#DDD',
                borderWidth: 0,
                outerRadius: '105%',
                innerRadius: '103%'
            }]
        },

        // the value axis
        yAxis: {
            min: 0,
            max: 200,

            minorTickInterval: 'auto',
            minorTickWidth: 1,
            minorTickLength: 10,
            minorTickPosition: 'inside',
            minorTickColor: '#666',

            tickPixelInterval: 30,
            tickWidth: 2,
            tickPosition: 'inside',
            tickLength: 10,
            tickColor: '#666',
            labels: {
                step: 2,
                rotation: 'auto'
            },
            title: {
                text: 'km/h'
            },
            plotBands: [{
                from: 0,
                to: 120,
                color: '#55BF3B' // green
            }, {
                from: 120,
                to: 160,
                color: '#DDDF0D' // yellow
            }, {
                from: 160,
                to: 200,
                color: '#DF5353' // red
            }]
        },

        series: [{
            name: 'Speed',
            data: [80],
            tooltip: {
                valueSuffix: ' km/h'
            }
        }]

    })
},
CreaPie: function (div, titulo1, hdndatos, leyenda, colores, labelvisible) {
    if (colores != "") {
        Highcharts.setOptions({
            colors: colores
        });
    }
    $(div).highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: titulo1
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: labelvisible,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>'
                }
            }
        },
        series: [{
            type: 'pie',
            name: leyenda,
            data: $.parseJSON($(hdndatos).val())
        }]
    });
},
CreaBarrasMulti: function (barra, leyendas, datos1, datos2, titulo, titserie1, titserie2, titcolumna, formato, colores) {
    if (colores != "") {
        Highcharts.setOptions({
            colors: colores
        });
    }
    $(barra).highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: titulo
        },

        xAxis: {
            categories: $.parseJSON($(leyendas).val())
        },
        yAxis: {
            min: 0,
            title: {
                text: titcolumna
            }
        },
        //            tooltip: {
        //                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        //                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
        //                    '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
        //                footerFormat: '</table>',
        //                shared: true,
        //                useHTML: true
        //            },
        tooltip: {
            //                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            //                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            //                    '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
            //                footerFormat: '</table>',
            //shared: true,
            //useHTML: true

            //                formatter: function () {
            //                    return '<span style="font-size:10px">' + this.x + '</span><br><table>'
            //                    + '<tr><td style="color:' + this.color + ';padding:0">' + this.series.name + '<b>' + func.formatNumber(this.point.y, formato) + '</b></td></tr></table> ';
            //                }
            formatter: function () {
                var s = '<span style="font-size:10px">' + this.x + '</span><br/><table>';

                $.each(this.points, function (i, point) {
                    s += '<tr><td style="color:' + point.series.color + ';padding:0">' + point.series.name + ':</td>' +
                        '<td><b>' + func.formatNumber(point.y, formato) + '</b></td></tr>';
                });
                s += '</table>';
                return s;
            },
            shared: true,
            useHTML: true

        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: titserie1,
            data: $.parseJSON($(datos1).val())

        }, {
            name: titserie2,
            data: $.parseJSON($(datos2).val())

        }]
    });
},
CreaBarrasMulti6: function (barra, leyendas, datos1, datos2, datos3, datos4, datos5, datos6, datos7, titulo, titserie1, titserie2, titserie3, titserie4, titserie5, titserie6, titserie7, titcolumna, formato, colores) {
    if (colores != "") {
        Highcharts.setOptions({
            colors: colores
        });
    }
    $(barra).highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: titulo
        },

        xAxis: {
            categories: $.parseJSON($(leyendas).val())
        },
        yAxis: {
            min: 0,
            title: {
                text: titcolumna
            }
        },
        //            tooltip: {
        //                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        //                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
        //                    '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
        //                footerFormat: '</table>',
        //                shared: true,
        //                useHTML: true
        //            },
        tooltip: {
            //                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            //                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            //                    '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
            //                footerFormat: '</table>',
            //shared: true,
            //useHTML: true

            //                formatter: function () {
            //                    return '<span style="font-size:10px">' + this.x + '</span><br><table>'
            //                    + '<tr><td style="color:' + this.color + ';padding:0">' + this.series.name + '<b>' + func.formatNumber(this.point.y, formato) + '</b></td></tr></table> ';
            //                }
            formatter: function () {
                var s = '<span style="font-size:10px">' + this.x + '</span><br/><table>';

                $.each(this.points, function (i, point) {
                    s += '<tr><td style="color:' + point.series.color + ';padding:0">' + point.series.name + ':</td>' +
                        '<td><b>' + func.formatNumber(point.y, formato) + '</b></td></tr>';
                });
                s += '</table>';
                return s;
            },
            shared: true,
            useHTML: true

        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: titserie1,
            data: $.parseJSON($(datos1).val())

        }, {
            name: titserie2,
            data: $.parseJSON($(datos2).val())

        }
            , {
                name: titserie3,
                data: $.parseJSON($(datos3).val())

            }
            , {
                name: titserie4,
                data: $.parseJSON($(datos4).val())

            }
            , {
                name: titserie5,
                data: $.parseJSON($(datos5).val())

            }
            , {
                name: titserie6,
                data: $.parseJSON($(datos6).val())

            }


            ]
    });
},
CreaBarraSimple: function (div, titulo1, hdncategorias, hdndatos, leyendaY, leyendaX, colores, labelvisible, formato, dataLabelsvisible) {
    if (colores != "") {
        Highcharts.setOptions({
            colors: colores
        });
    }
    $(div).highcharts({
        chart: {
            type: 'column',
            margin: [50, 50, 100, 80]
        },
        title: {
            text: titulo1
        },
        xAxis: {
            categories: $.parseJSON($(hdncategorias).val()),
            labels: {
                rotation: -45,
                align: 'right',
                style: {
                    fontSize: '10px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: leyendaY
            }
        },
        legend: {
            enabled: labelvisible
        },
        tooltip: {
            //pointFormat: '<b>{point.y:.1f}</b>',
            formatter: function () {
                return this.x + '<br> <b>' + func.formatNumber(this.point.y, formato) + '</b> ';
            }
        },
        series: [{
            showInLegend: false,
            name: leyendaX,
            data: $.parseJSON($(hdndatos).val()),
            dataLabels: {
                enabled: dataLabelsvisible,
                rotation: -90,
                color: '#000000',
                align: 'right',
                x: 4,
                y: 10,
                style: {
                    fontSize: '9px',
                    fontFamily: 'Verdana, sans-serif',
                    textShadow: '0 0 3px black'
                }
            }
        }]
    });

},
CreaBarraSimple2: function (div, titulo1, hdncategorias, hdndatos, leyendaY, leyendaX, colores, labelvisible, formato, dataLabelsvisible, rotation) {
    if (colores != "") {
        Highcharts.setOptions({
            colors: colores
        });
    }
    $(div).highcharts({
        chart: {
            type: 'column',
            margin: [50, 50, 100, 80]
        },
        title: {
            text: titulo1
        },
        xAxis: {
            categories: $.parseJSON($(hdncategorias).val()),
            labels: {
                rotation: rotation,
                align: 'right',
                style: {
                    fontSize: '10px',
                    fontFamily: 'Verdana'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: leyendaY
            }
        },
        legend: {
            enabled: labelvisible
        },
        tooltip: {
            //pointFormat: '<b>{point.y:.1f}</b>',
            formatter: function () {
                return this.x + '<br> <b>' + func.formatNumber(this.point.y, formato) + '</b> ';
            }
        },
        series: [{
            showInLegend: false,
            name: leyendaX,
            data: $.parseJSON($(hdndatos).val()),
            dataLabels: {
                enabled: dataLabelsvisible,
                rotation: -90,
                color: '#000000',
                align: 'right',
                x: 4,
                y: 10,
                style: {
                    fontSize: '9px',
                    fontFamily: 'Verdana, sans-serif',
                    textShadow: '0 0 3px black'
                }
            }
        }]
    });

},
TabStyle: function (tab, height, width, fontsize) {

    if (width == "") { width = "auto" } else { width = width + "px" }

    $("#" + tab).tabs().css({ "Height": height + "px", "width": width, "font-size": fontsize + "px" });
},
TabControl: function (tab, hdnseltab) {
    $("#" + tab + " li").click(function (event) {
        $("#" + hdnseltab).val(event.target.hash);

    });
},
TabSelect: function (tab, hdnseltab) {
    var anchor = $("#" + hdnseltab).val();

    anchor = anchor.replace("#" + tab + "-", "");
    if (anchor != "") { anchor = anchor - 1 } else { anchor = 0 }

    $('#' + tab).tabs({ active: anchor });
},
cerrarventana: function () {
    window.open("../Common/Blanca.aspx", "mainpage", "", true);
    return false;
},

Dameid: function (hdn) {
    return document.getElementById(hdn).value.replace("|", "").replace("_", "");
},

PopUppx: function (width, height, top, left, src, qs, fnsalir, titulo) {
    $.blockUI({ message: $('#PopUp'), css: { width: width + 'px', top: top + 'px', left: left + 'px' }, fadeIn: 0, fadeOut: 0, overlayCSS: {
        backgroundColor: '#FFFFFF',
        opacity: 0.7,
        cursor: 'default'
    }
    });
    $("#PopUpTitulo").text(titulo);
    var idusr = $("#hdnidusr").val();
    if (qs != "") { src = src + qs + "&uid=" + idusr } else { src = src + "?uid=" + idusr; }

    $("#IFPopUp").attr('src', 'about:blank');
    $("#IFPopUp").attr('src', src).css({ width: (width - 5), height: height });
    $("#PopUpSalir").bind("click", function () { func.PopUpClose(); });
    $("#hdnFnSalirPopup").val(fnsalir);
},

PopUp: function (width, height, top, left, src, qs, fnsalir, titulo) {
    $.blockUI({ message: $('#PopUp'), css: { width: width + 'px', top: top + '%', left: left + '%' }, fadeIn: 0, fadeOut: 0, overlayCSS: {
        backgroundColor: '#FFFFFF',
        opacity: 0.7,
        cursor: 'default'
    }
    });
    $("#PopUpTitulo").text(titulo);
    var idusr = $("#hdnidusr").val();
    if (qs != "") { src = src + qs + "&uid=" + idusr } else { src = src + "?uid=" + idusr; }

    $("#IFPopUp").attr('src', 'about:blank');
    $("#IFPopUp").attr('src', src).css({ width: (width - 5), height: height });
    $("#PopUpSalir").bind("click", function () { func.PopUpClose(); });
    $("#hdnFnSalirPopup").val(fnsalir);
},

PopUpClose: function () {
    if ($("#hdnFnSalirPopup").val() != "") {
        eval($("#hdnFnSalirPopup").val());
    }
    $("#PopUpTitulo").text("");
    $.unblockUI();
    $("#IFPopUp").attr('src', 'about:blank');
    //return false;
},
PopUpCloseRegresaValor: function (valor) {
    parent.$("#hdnPopupRespuesta").val(valor);
    parent.func.PopUpClose();
},
PopUpRegresaValor: function (valor) {
    parent.$("#hdnPopupRespuesta").val(valor);

},
PopUpCambiaTitulo: function (texto) {
    parent.$("#PopUpTitulo").text(texto);
},

CambiaCombo: function (id) {
    var opc = document.getElementById(id);
    var iduc = id.split("_");
    document.getElementById(iduc[0] + "_hdnidcombo").value = opc[opc.selectedIndex].value;
    document.getElementById(iduc[0] + "_hdntxtcombo").value = opc[opc.selectedIndex].text;
    document.getElementById(iduc[0] + "_hdnidxcombo").value = opc.selectedIndex;

    if (document.getElementById(iduc[0] + "_hdnesfiltro").value == "1")
    { this.ocultagrid(); }

    if (document.getElementById(iduc[0] + "_hdnaccion").value != "") { //document.getElementById(iduc[0] + "_hdnaccion")(); 
        if (document.getElementById(iduc[0] + "_hdnaccion").value == "2")
        { accioncombo2(); }
        else
        { accioncombo(); }

    }

},


salirsistema: function () {
    window.open("http://www.capitalplus.com.mx", "_self", "", true);
    return false;
},

dialogo: function (titulo, pagina, qs, w, h, ctrlreg) {
    var sTitulo;
    sTitulo = encodeURI(titulo);
    var ctrcambio = "hdnctrlcambio";
    if (qs != "") { qs = "&" + qs; }
    window.showModalDialog("../webDialog.aspx?src=" + pagina + "&titulo=" + sTitulo + "&ctrlregreso=" + ctrlreg + "&ctrlcambio=" + ctrcambio + qs, window, "dialogWidth:" + w + "px;dialogHeight:" + h + "px;status:no;");
    return true;

},

dialogoHijo: function (pagina, titulo, titpadre, qs) {
    var sTitulo;
    sTitulo = encodeURI(titulo);
    var ctrcambio = "hdnctrlcambio";
    if (qs != "") { qs = "&" + qs; }
    parent.Url2(pagina, titulo, titpadre, qs);
    return true;

},

dialogoTab: function (pagina, titulo, qs) {
    var sTitulo;
    sTitulo = encodeURI(titulo);
    var ctrcambio = "hdnctrlcambio";
    qs = qs.replace("?", "$").replace("=", "|").replace("&", "%");
    if (qs != "") { pagina = pagina + "$" + qs + "%_T|" + titulo; } else { pagina = pagina + "$_T|" + titulo; }
    parent.URLOTAB(titulo, pagina);
    return true;
},


ifcambiomsg: function (msg) {
    if (document.getElementById("hdnctrlcambio").value == 1) {
        document.getElementById("hdnmensaje").value = msg;
    }
},

ifcambio: function (cmd) {
    if (document.getElementById("hdnctrlcambio").value == 1) {
        document.getElementById("hdnctrlcambio").value = "0";
        window.document.all[cmd].click();
    }
},

advertencia: function (str) {
    document.getElementById("hdnmensaje").value = str;
    this.mandamensaje();
},

ocultagrid: function () {
    document.getElementById("grid").style.visibility = "hidden";
    document.getElementById("grid").style.display = "none";
},

ocultatabsdiv: function () {

    var divs = document.getElementsByName("divs");

    for (var i = 0; i <= divs.length - 1; i++) {
        divs[i].style.visibility = "hidden";
        divs[i].style.display = "none";
    }
},

atCambiaEstatus: function (id) {
    var partes = id.split("_");
    var idtab = partes[0] + "_";
    var estatus = document.getElementById(idtab + "hdnestatus").value;

    var divnum = partes[0].substr(partes[0].length - 1);

    var tabsi = document.getElementsByName("atdi");
    var tabsd = document.getElementsByName("atdd");
    var tabsc = document.getElementsByName("atdc");
    var divs = document.getElementsByName("divs");

    for (var i = 0; i <= tabsi.length - 1; i++) {

        tabsi[i].className = "tabunseli";
        tabsd[i].className = "tabunseli";
        tabsc[i].className = "tabunsel";
        divs[i].style.visibility = "hidden";
        divs[i].style.display = "none";
    }


    document.getElementById(idtab + "tdi").className = "tabseli";
    document.getElementById(idtab + "tdc").className = "tabselc";
    document.getElementById(idtab + "tdd").className = "tabseld";
    document.getElementById(idtab + "div").style.visibility = "visible";
    document.getElementById(idtab + "div").style.display = "block";

    document.getElementById("hdntabsel").value = divnum;





},
mandamensaje: function () {
    if (window.document.all["hdnmensaje"].value != "") {
        var mensaje = window.document.all["hdnmensaje"].value;
        var msg;
        var tipomensaje;
        var titulo;
        switch (mensaje.toString().substring(0, 3)) {
            case "ex_": tipomensaje = "success"; titulo = "Confirmación"; msg = mensaje.toString().substring(3, mensaje.toString().length); break;
            case "er_": tipomensaje = "error"; titulo = "Error"; msg = mensaje.toString().substring(3, mensaje.toString().length); break;
            case "pr_": tipomensaje = "prompt"; titulo = "Advertencia"; msg = mensaje.toString().substring(3, mensaje.toString().length); break;

            default: tipomensaje = "warning"; titulo = "Advertencia"; msg = mensaje;
        }

        showDialog(titulo, msg, tipomensaje, '', 1, 2);
        window.document.all["hdnmensaje"].value = ""
    }

},

cuentachecks: function (hdnid) {
    hdn = document.getElementById(hdnid).value;
    if (hdn == "" || hdn == null) { return 0; }
    var arr = hdn.split("|");
    if (arr.length == 2) { return 1; }
    if (arr.length > 2) { return arr.length - 1; }
},

checkall: function (check, chkname, hdnid, subs, muestraregs) {
    document.getElementById(hdnid).value = "";
    var checks = document.getElementsByName(chkname);
    var checa = true;
    for (var i = 0; i <= checks.length - 1; i++) {
        checks[i].checked = check;
        if (check == true) {
            var str = "_" + checks[i].id.toString().replace(subs, "") + "|";
            document.getElementById(hdnid).value = document.getElementById(hdnid).value + str;
        }
        else {
            document.getElementById(hdnid).value = "";
            checa = false;
        }
    }
    if (muestraregs == 1) {
        if (checa == true) {
            document.getElementById("labsel").innerText = checks.length;
        } else
        { document.getElementById("labsel").innerText = 0 }
    }
},

checks: function (id, override, hdnSeleccionados, chkParentid, subs, muestraregs) {
    var checkElegido = document.getElementById(id);
    id = id.toString().replace(subs, "");
    //almacena el id en un campo escondido 
    //var hdn = document.getElementById("hdnSeleccionados");
    var hdn = document.getElementById(hdnSeleccionados);
    var chkParent = document.getElementById(chkParentid);
    if (checkElegido.checked == true || override == true) {
        if ((hdn.value.search("_" + id + "|")) >= 0) {
            //Si ya esta entonces lo borra
            hdn.value = hdn.value.replace("_" + id + "|", "");
        }
        //Lo agrega con el nuevo valor
        hdn.value = hdn.value + "_" + id + "|";
    }
    else {
        //Verifica si ya hay un registro
        if ((hdn.value.search("_" + id + "|")) >= 0) {
            //Si ya esta entonces lo borra
            hdn.value = hdn.value.replace("_" + id + "|", "");
            if (chkParent != null) {
                chkParent.checked = false;
            }
            if (document.getElementById("hdnChkAll") != null) {
                document.getElementById("hdnChkAll").value = "";
            }
        }
    }
    if (muestraregs == 1) {
        if (document.getElementById("labsel") != null) {
            document.getElementById("labsel").innerText = this.cuentachecks(hdnSeleccionados);
        }
    }
},

checkradio: function (id, hdnSeleccionados, subs) {
    var checkElegido = document.getElementById(id);
    id = id.toString().replace(subs, "");
    //almacena el id en un campo escondido 
    //var hdn = document.getElementById("hdnSeleccionados");
    var hdn = document.getElementById(hdnSeleccionados);
    if (checkElegido.checked == true) {
        //Lo agrega con el nuevo valor
        hdn.value = "_" + id + "|";
    }
},

fmo: function (txt) {
    return escape(txt);
},

funHelp_onclick: function () {
    window.document.all[ctrid() + "hdnhelp"].value == "0" ? window.document.all[ctrid() + "hdnhelp"].value = "1" : window.document.all[ctrid() + "hdnhelp"].value = "0";
    return help_onclick();
},

ftooltip: function (txt) {
    document.getElementById("divdsc").style.visibility = "visible";
    document.getElementById("divdsc").style.position = "absolute";
    document.getElementById("divdsc").style.display = "inline";
    document.getElementById("divdsc").style.top = event.clientY - 20;
    document.getElementById("divdsc").style.left = event.clientX + 30;
    document.getElementById("lbldsc").innerText = txt
},

focultatool: function () {
    document.getElementById("divdsc").style.visibility = "hidden"
    document.getElementById("divdsc").style.display = "none"
},


ValidaRaro: function () {
    var Valor = String.fromCharCode(event.keyCode);
    var RegExPattern = /^[\.\,\w\sáÁéÉíÍóÓúÚñÑ-]$/;
    if (!Valor.match(RegExPattern) || event.keyCode == 13) {
        event.cancelBubble = true
        event.returnValue = false
        return false
    }
},

LimpiaCampo: function (campo, valor, hdn, hdnvalor, oculta) {
    document.getElementById(campo).value = valor;
    if (hdn != '') {
        document.getElementById(hdn).value = hdnvalor;
    }
    if (oculta == '1') {
        OcultaGrid();
    }
},


SimpleFdate: function (dt1) {
    var dt = new Date(dt1);

    var curr_date = dt.getDate();
    var curr_month = dt.getMonth();
    curr_month++;
    var curr_year = dt.getFullYear();
    var resp = curr_month + "/" + curr_date + "/" + curr_year;
    return resp;
},


AddComas: function (nStr) {
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
},












// inicia proceso de conversion cantidad en letra para cheques


// Función modulo, regresa el residuo de una división 
mod: function mod(dividendo, divisor) {
    resDiv = dividendo / divisor;
    parteEnt = Math.floor(resDiv);            // Obtiene la parte Entera de resDiv 
    parteFrac = resDiv - parteEnt;      // Obtiene la parte Fraccionaria de la división
    modulo = Math.round(parteFrac * divisor);  // Regresa la parte fraccionaria * la división (modulo) 
    return modulo;
}, // Fin de función mod

// Función ObtenerParteEntDiv, regresa la parte entera de una división
ObtenerParteEntDiv: function (dividendo, divisor) {
    resDiv = dividendo / divisor;
    parteEntDiv = Math.floor(resDiv);
    return parteEntDiv;
}, // Fin de función ObtenerParteEntDiv

// function fraction_part, regresa la parte Fraccionaria de una cantidad
fraction_part: function (dividendo, divisor) {
    resDiv = dividendo / divisor;
    f_part = Math.floor(resDiv);
    return f_part;
}, // Fin de función fraction_part


// function string_literal conversion is the core of this program 
// converts numbers to spanish strings, handling the general special 
// cases in spanish language. 
string_literal_conversion: function (number) {
    // first, divide your number in hundreds, tens and units, cascadig 
    // trough subsequent divisions, using the modulus of each division 
    // for the next. 

    centenas = func.ObtenerParteEntDiv(number, 100);

    number = func.mod(number, 100);

    decenas = func.ObtenerParteEntDiv(number, 10);
    number = func.mod(number, 10);

    unidades = func.ObtenerParteEntDiv(number, 1);
    number = func.mod(number, 1);
    string_hundreds = "";
    string_tens = "";
    string_units = "";
    // cascade trough hundreds. This will convert the hundreds part to 
    // their corresponding string in spanish.
    if (centenas == 1) {
        string_hundreds = "ciento ";
    }


    if (centenas == 2) {
        string_hundreds = "doscientos ";
    }

    if (centenas == 3) {
        string_hundreds = "trescientos ";
    }

    if (centenas == 4) {
        string_hundreds = "cuatrocientos ";
    }

    if (centenas == 5) {
        string_hundreds = "quinientos ";
    }

    if (centenas == 6) {
        string_hundreds = "seiscientos ";
    }

    if (centenas == 7) {
        string_hundreds = "setecientos ";
    }

    if (centenas == 8) {
        string_hundreds = "ochocientos ";
    }

    if (centenas == 9) {
        string_hundreds = "novecientos ";
    }

    // end switch hundreds 

    // casgade trough tens. This will convert the tens part to corresponding 
    // strings in spanish. Note, however that the strings between 11 and 19 
    // are all special cases. Also 21-29 is a special case in spanish. 
    if (decenas == 1) {
        //Special case, depends on units for each conversion
        if (unidades == 1) {
            string_tens = "once";
        }

        if (unidades == 2) {
            string_tens = "doce";
        }

        if (unidades == 3) {
            string_tens = "trece";
        }

        if (unidades == 4) {
            string_tens = "catorce";
        }

        if (unidades == 5) {
            string_tens = "quince";
        }

        if (unidades == 6) {
            string_tens = "dieciseis";
        }

        if (unidades == 7) {
            string_tens = "diecisiete";
        }

        if (unidades == 8) {
            string_tens = "dieciocho";
        }

        if (unidades == 9) {
            string_tens = "diecinueve";
        }
    }
    //alert("STRING_TENS ="+string_tens);

    if (decenas == 2) {
        string_tens = "veinti";
    }
    if (decenas == 3) {
        string_tens = "treinta";
    }
    if (decenas == 4) {
        string_tens = "cuarenta";
    }
    if (decenas == 5) {
        string_tens = "cincuenta";
    }
    if (decenas == 6) {
        string_tens = "sesenta";
    }
    if (decenas == 7) {
        string_tens = "setenta";
    }
    if (decenas == 8) {
        string_tens = "ochenta";
    }
    if (decenas == 9) {
        string_tens = "noventa";
    }

    // Fin de swicth decenas


    // cascades trough units, This will convert the units part to corresponding 
    // strings in spanish. Note however that a check is being made to see wether 
    // the special cases 11-19 were used. In that case, the whole conversion of 
    // individual units is ignored since it was already made in the tens cascade. 

    if (decenas == 1) {
        string_units = "";  // empties the units check, since it has alredy been handled on the tens switch 
    }
    else {
        if (unidades == 1) {
            string_units = "un";
        }
        if (unidades == 2) {
            string_units = "dos";
        }
        if (unidades == 3) {
            string_units = "tres";
        }
        if (unidades == 4) {
            string_units = "cuatro";
        }
        if (unidades == 5) {
            string_units = "cinco";
        }
        if (unidades == 6) {
            string_units = "seis";
        }
        if (unidades == 7) {
            string_units = "siete";
        }
        if (unidades == 8) {
            string_units = "ocho";
        }
        if (unidades == 9) {
            string_units = "nueve";
        }
        // end switch units 
    } // end if-then-else 


    //final special cases. This conditions will handle the special cases which 
    //are not as general as the ones in the cascades. Basically four: 

    // when you've got 100, you dont' say 'ciento' you say 'cien' 
    // 'ciento' is used only for [101 >= number > 199] 
    if (centenas == 1 && decenas == 0 && unidades == 0) {
        string_hundreds = "cien ";
    }

    // when you've got 10, you don't say any of the 11-19 special 
    // cases.. just say 'diez' 
    if (decenas == 1 && unidades == 0) {
        string_tens = "diez ";
    }

    // when you've got 20, you don't say 'veinti', which is used 
    // only for [21 >= number > 29] 
    if (decenas == 2 && unidades == 0) {
        string_tens = "veinte ";
    }

    // for numbers >= 30, you don't use a single word such as veintiuno 
    // (twenty one), you must add 'y' (and), and use two words. v.gr 31 
    // 'treinta y uno' (thirty and one) 
    if (decenas >= 3 && unidades >= 1) {
        string_tens = string_tens + " y ";
    }

    // this line gathers all the hundreds, tens and units into the final string 
    // and returns it as the function value.
    final_string = string_hundreds + string_tens + string_units;


    return final_string;

}, //end of function string_literal_conversion()================================ 

// handle some external special cases. Specially the millions, thousands 
// and hundreds descriptors. Since the same rules apply to all number triads 
// descriptions are handled outside the string conversion function, so it can 
// be re used for each triad. 
formatNumber: function (num, prefix) {
    prefix = prefix || "";
    num += "";
    var splitStr = num.split('.');
    var splitLeft = splitStr[0];
    var splitRight = splitStr.length > 1 ? '.' + splitStr[1] : "";
    var regx = /(\d+)(\d{3})/;
    while (regx.test(splitLeft)) {
        splitLeft = splitLeft.replace(regx, '$1' + ',' + '$2');
    }
    switch (prefix) {
        case "$": return prefix + splitLeft + splitRight;
        case "%": return splitLeft + splitRight + prefix;
        default: return prefix + splitLeft + splitRight;
    }

},

covertirNumLetras: function (number) {
    number = number.replace(",", "");
    number = number.replace(",", "");
    number = number.replace(",", "");
    number = number.replace(",", "");
    //number = number_format (number, 2);
    var number1 = number;
    //settype (number, "integer");
    var cent = number1.split(".");
    var centavos = cent[1];



    if (centavos == 0 || centavos == undefined) {
        centavos = "00";
    }

    if (number == 0 || number == "") { // if amount = 0, then forget all about conversions, 
        centenas_final_string = " cero "; // amount is zero (cero). handle it externally, to 
        // function breakdown 
    }
    else {

        var millions = func.ObtenerParteEntDiv(number, 1000000); // first, send the millions to the string 
        number = mod(number, 1000000);           // conversion function 

        if (millions != 0) {
            // This condition handles the plural case 
            if (millions == 1) {              // if only 1, use 'millon' (million). if 
                descriptor = " millon ";  // > than 1, use 'millones' (millions) as 
            }
            else {                           // a descriptor for this triad. 
                descriptor = " millones ";
            }
        }
        else {
            descriptor = " ";                 // if 0 million then use no descriptor. 
        }
        millions_final_string = func.string_literal_conversion(millions) + descriptor;


        thousands = func.ObtenerParteEntDiv(number, 1000);  // now, send the thousands to the string 
        number = func.mod(number, 1000);            // conversion function. 
        //print "Th:".thousands;
        if (thousands != 1) {                   // This condition eliminates the descriptor 
            thousands_final_string = func.string_literal_conversion(thousands) + " mil ";
            //  descriptor = " mil ";          // if there are no thousands on the amount 
        }
        if (thousands == 1) {
            thousands_final_string = " mil ";
        }
        if (thousands < 1) {
            thousands_final_string = " ";
        }

        // this will handle numbers between 1 and 999 which 
        // need no descriptor whatsoever. 

        centenas = number;
        centenas_final_string = func.string_literal_conversion(centenas);

    } //end if (number ==0) 

    /*if (ereg("un",centenas_final_string))
    {
    centenas_final_string = ereg_replace("","o",centenas_final_string); 
    }*/
    //finally, print the output. 

    /* Concatena los millones, miles y cientos*/
    cad = millions_final_string + thousands_final_string + centenas_final_string;

    /* Convierte la cadena a Mayúsculas*/
    cad = cad.toUpperCase();

    if (centavos.length > 2) {
        if (centavos.substring(2, 3) >= 5) {
            centavos = centavos.substring(0, 1) + (parseInt(centavos.substring(1, 2)) + 1).toString();
        } else {
            centavos = centavos.substring(0, 2);
        }
    }

    /* Concatena a los centavos la cadena "/100" */
    if (centavos.length == 1) {
        centavos = centavos + "0";
    }
    centavos = centavos + "/100";


    /* Asigna el tipo de moneda, para 1 = PESO, para distinto de 1 = PESOS*/
    if (number == 1) {
        moneda = " PESO ";
    }
    else {
        moneda = " PESOS ";
    }
    /* Regresa el número en cadena entre paréntesis y con tipo de moneda y la fase M.N.*/
    var resp = "(" + cad + moneda + centavos + " MN)";
    return resp;
}






};                                                                                  //Fin clase