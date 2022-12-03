/**
 * DataTables Basic
 */

 $(function () {
  'use strict';

  var dt_basic_table = $('.datatables-basic'),
    dt_date_table = $('.dt-date'),
    dt_complex_header_table = $('.dt-complex-header'),
    dt_row_grouping_table = $('.dt-row-grouping'),
    dt_multilingual_table = $('.dt-multilingual'),
    statusObj = {
      2: { title: 'Pending', class: 'badge-light-warning' },
      active: { title: 'Active', class: 'badge-light-success' },
      3: { title: 'Inactive', class: 'badge-light-secondary' }
    }

  var  assetPath = '../../../app-assets/';

  if ($('body').attr('data-framework') === 'laravel') {
    assetPath = $('body').attr('data-asset-path');
  }


  var lang = 'English';
  if (dt_multilingual_table.length) {
    var table_language = dt_multilingual_table.DataTable({
      ajax: assetPath + 'admin/query/subscriptions',
      columns: [
        { data: '' },
        { data: 'id' },
        { data: 'name' },
        { data: 'team' },
        { data: 'created_at' },
        { data: 'stripe_status' },
        { data: '' }
      ],
      columnDefs: [
        {
          // For Responsive
          className: 'control',
          orderable: false,
          responsivePriority: 2,
          targets: 0,
          render: function (data, type, full, meta) {
            return ''
          }
        },
        {
          targets: 1,
          render: function (data, type, full, meta) {
            var $billing = full['id']

            return '<span class="text-nowrap">' + $billing + '</span>'
          }
        },
        {
          targets: 2,
          render: function (data, type, full, meta) {
            var $billing = full['name']

            return '<span class="text-nowrap">' + $billing + '</span>'
          }
        },
        {
          targets: 3,
          render: function (data, type, full, meta) {
            var $billing = full['team']
            
            return '<span class="text-nowrap">' + $billing + '</span>'
          }
        },
        {
          targets: 4,
          render: function (data, type, full, meta) {
            var $issuedDate = new Date(full['created_at'])
            var $dd = moment($issuedDate).format('ddd, MMM M, YYYY h:mm A')
            return '<span class="text-nowrap">' + $dd +'</span>'
          }
        },
        {
          // User Status
          targets: 5,
          render: function (data, type, full, meta) {
            var $status = full['stripe_status']
            return (
              '<span class="badge rounded-pill ' +
              statusObj[$status].class +
              '" text-capitalized>' +
              statusObj[$status].title +
              '</span>'
            )
          }
        },
        {
          // Actions
          targets: -1,
          title: 'Actions',
          orderable: false,
          render: function (data, type, full, meta) {
            return (
              '<div class="d-inline-flex">' +
              '<a class="pe-1 dropdown-toggle hide-arrow text-primary" data-bs-toggle="dropdown">' +
              feather.icons['more-vertical'].toSvg({ class: 'font-small-4' }) +
              '</a>' +
              '<div class="dropdown-menu dropdown-menu-end">'  +
              '<a href="' + assetPath +'admin/'+ full["id"]+'/delete/subscriptions" class="dropdown-item delete-record">' +
              feather.icons['trash-2'].toSvg({ class: 'me-50 font-small-4' }) +
              'Delete</a>' +
              '</div>' +
              '</div>' 
            );
          }
        }
      ],
      language: {
        url: '//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/' + lang + '.json',
        paginate: {
          // remove previous & next text from pagination
          previous: '&nbsp;',
          next: '&nbsp;'
        }
      },
      dom: '<"d-flex justify-content-between align-items-center mx-0 row"<"col-sm-12 col-md-6"l><"col-sm-12 col-md-6"f>>t<"d-flex justify-content-between mx-0 row"<"col-sm-12 col-md-6"i><"col-sm-12 col-md-6"p>>',
      displayLength: 7,
      lengthMenu: [7, 10, 25, 50, 75, 100],
      responsive: {
        details: {
          display: $.fn.dataTable.Responsive.display.modal({
            header: function (row) {
              var data = row.data();
              return 'Details of ' + data['id'];
            }
          }),
          type: 'column',
          renderer: function (api, rowIdx, columns) {
            var data = $.map(columns, function (col, i) {
              return col.title !== '' // ? Do not show row in modal popup if title is blank (for check box)
                ? '<tr data-dt-row="' +
                    col.rowIdx +
                    '" data-dt-column="' +
                    col.columnIndex +
                    '">' +
                    '<td>' +
                    col.title +
                    ':' +
                    '</td> ' +
                    '<td>' +
                    col.data +
                    '</td>' +
                    '</tr>'
                : '';
            }).join('');

            return data ? $('<table class="table"/>').append('<tbody>' + data + '</tbody>') : false;
          }
        }
      }
    });
  }
});
