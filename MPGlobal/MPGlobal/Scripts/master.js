
function validaCampos(obj, e) {

    var lnk = $(obj);

    var parent;
    if (lnk.data('target-log') !== undefined)
        parent = $(lnk.data('target-log'));
    else
        parent = $(lnk.data('target'));

    var correcto = true;
    parent.find('.campo_obligatorio.error').removeClass('error');

    if (lnk.attr('class').indexOf('sub') > -1) {
        parent.find('.campo_obligatorio.sub').each(function () {
            var obj = $(this);
            if (obj.is('input')) {
                if (obj.val() === '' || obj.val() === '0') {
                    correcto = false;
                    obj.addClass('error');
                }
            }
            else if (obj.is('select')) {
                if (obj.find('option:selected').val() <= 0) {
                    correcto = false;
                    obj.addClass('error');
                }
            }
            else if (obj.is('textarea')) {
                if (obj.val() === '') {
                    correcto = false;
                    obj.addClass('error');
                }
            }

        });

    }
    else {
        parent.find('.campo_obligatorio:not(.sub)').each(function () {

            var obj = $(this);
            if (obj.is('input')) {
                if (obj.val() === '' || obj.val() <= 0) {
                    correcto = false;
                    obj.addClass('error');
                }
            }
            else if (obj.is('select')) {
                if (obj.find('option:selected').val() <= 0 || obj.find('option:selected').val() === undefined) {
                    correcto = false;
                    obj.addClass('error');
                }
            }
            else if (obj.is('textarea')) {
                if (obj.val() === '') {
                    correcto = false;
                    obj.addClass('error');
                }
            }
            else if (obj.is('table')) {
                var txt = obj.find('input:first');
                if (txt.val() === '') {
                    correcto = false;
                    txt.addClass('error');
                }
            }
        });
    }

    if (!correcto) {
        //$(window).scrollTop($('.campo_obligatorio.error').first().offset().top);
        //$('.apfm-container.apfm-open').scrollTop($('.campo_obligatorio.error').first().offset().top);

        e.stopPropagation();
        e.preventDefault();
        return false;
    }
}


function validaNumeros(obj, e) {
    var key = e.keyCode ? e.keyCode : e.which;
    if ((key > 47 && key < 58) || key === 190 || key === 8 || key === 9 || (key > 36 && key < 41))
        return true;

    e.preventDefault();
    return false;
}

function validateEmail(obj, email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    alert(re.test(String(email).toLowerCase()));
}