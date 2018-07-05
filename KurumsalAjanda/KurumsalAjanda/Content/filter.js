$(document).ready(function () {
        $("#filter").DataTable({
            dom: 'Bfrtip',
            buttons: [
                { extend: 'copy', className: 'btn btn-info', text: 'Tabloyu Kopyala' },
                { extend: 'pdf', className: 'btn btn-dark', text: 'Tabloyu PDF Olarak Görüntüle', orientation: 'landscape', pageSize: 'LEGAL'}
            ]
        });
});