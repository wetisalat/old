/**
 * DataTables Basic
 */

$(function () {
  'use strict';

  var dt_basic_table = $('.datatables-basic'),
    dt_date_table = $('.dt-date'),
    assetPath = '../../../app-assets/';

  if ($('body').attr('data-framework') === 'laravel') {
    assetPath = $('body').attr('data-asset-path');
  }

  // DataTable with buttons
  // --------------------------------------------------------------------

  if (dt_basic_table.length) {
    var dt_basic = dt_basic_table.DataTable({
      ajax: assetPath + 'admin/leave',
      columns: [
        { data: 'responsive_id' },
        { data: 'id' }, // used for sorting so will hide this column
        { data: 'name' },
        { data: 'paid' },
        { data: 'time_limit' },
        { data: 'created_at' },
        { data: 'updated_at' },
        { data: '' }
      ],
      columnDefs: [
        {
          // For Responsive
          className: 'control',
          orderable: false,
          responsivePriority: 2,
          targets: 0
        },
        // {
        //   // For Checkboxes
        //   targets: 1,
        //   orderable: false,
        //   responsivePriority: 3,
        //   render: function (data, type, full, meta) {
        //     return (
        //       '<div class="form-check"> <input class="form-check-input dt-checkboxes" type="checkbox" value="" id="checkbox' +
        //       data +
        //       '" /><label class="form-check-label" for="checkbox' +
        //       data +
        //       '"></label></div>'
        //     );
        //   },
        //   checkboxes: {
        //     selectAllRender:
        //       '<div class="form-check"> <input class="form-check-input" type="checkbox" value="" id="checkboxSelectAll" /><label class="form-check-label" for="checkboxSelectAll"></label></div>'
        //   }
        // },
        {
          targets: 1,
          visible: false
        },
        {
          // Avatar image/badge, Name and post
          targets: 2,
          responsivePriority: 4,
          render: function (data, type, full, meta) {
            var $user_img = full['avatar'],
              $name = full['name'],
              $post = ''; // full['post'];
            if ($user_img) {
              // For Avatar image
              var $output =
                '<img src="' + assetPath + 'images/avatars/' + $user_img + '" alt="Avatar" width="32" height="32">';
            } else {
              // For Avatar badge
              var stateNum = full['status'];
              var states = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary'];
              var $state = states[stateNum],
                $name = full['name'],
                $initials = $name.match(/\b\w/g) || [];
              $initials = (($initials.shift() || '') + ($initials.pop() || '')).toUpperCase();
              $output = '<span class="avatar-content">' + $initials + '</span>';
            }

            var colorClass = $user_img === '' ? ' bg-light-' + $state + ' ' : '';
            // Creates full output for row
            var $row_output =
              '<div class="d-flex justify-content-left align-items-center">' +
              '<div class="d-flex flex-column">' +
              '<span class="emp_name text-truncate fw-bold">' +
              $name +
              '</span>' +
              '<small class="emp_post text-truncate text-muted">' +
              $post +
              '</small>' +
              '</div>' +
              '</div>';
            return $row_output;
          }
        },
        {
          responsivePriority: 1,
          targets: 3,
          render: function (data, type, full, meta) {
            return full['paid'] === 1 ? 'yes' : 'no';
          }
        },
        {
          responsivePriority: 1,
          targets: 4
        },
        {
          // Actions
          targets: -1,
          title: 'Actions',
          orderable: false,
          render: function (data, type, full, meta) {
            return (
              '<a href="javascript:;" class="edit-record" data-id="'+ full['id'] +'">' +
              feather.icons['edit'].toSvg({ class: 'font-small-4' }) +
              '</a>' +
              '<a href="javascript:;" class="delete-record ms-1" data-id="'+ full['id'] +'">' +
              feather.icons['trash-2'].toSvg({ class: 'font-small-4' }) +
              '</a>'
            );
          }
        }
      ],
      order: [[2, 'desc']],
      dom: '<"card-header border-bottom p-1"<"head-label"><"dt-action-buttons text-end">><"d-flex justify-content-between align-items-center mx-0 row"<"col-sm-12 col-md-6"B><"col-sm-12 col-md-6"f>>t<"d-flex justify-content-between mx-0 row"<"col-sm-12 col-md-6"l><"col-sm-12 col-md-6"p>>',
      displayLength: 7,
      lengthMenu: [7, 10, 25, 50, 75, 100],
      buttons: [
        // {
        //   extend: 'collection',
        //   className: 'btn btn-outline-secondary dropdown-toggle me-2',
        //   text: feather.icons['share'].toSvg({ class: 'font-small-4 me-50' }) + 'Export',
        //   buttons: [
        //     {
        //       extend: 'print',
        //       text: feather.icons['printer'].toSvg({ class: 'font-small-4 me-50' }) + 'Print',
        //       className: 'dropdown-item',
        //       exportOptions: { columns: [3, 4, 5, 6, 7] }
        //     },
        //     {
        //       extend: 'csv',
        //       text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
        //       className: 'dropdown-item',
        //       exportOptions: { columns: [3, 4, 5, 6, 7] }
        //     },
        //     {
        //       extend: 'excel',
        //       text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
        //       className: 'dropdown-item',
        //       exportOptions: { columns: [3, 4, 5, 6, 7] }
        //     },
        //     {
        //       extend: 'pdf',
        //       text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
        //       className: 'dropdown-item',
        //       exportOptions: { columns: [3, 4, 5, 6, 7] }
        //     },
        //     {
        //       extend: 'copy',
        //       text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
        //       className: 'dropdown-item',
        //       exportOptions: { columns: [3, 4, 5, 6, 7] }
        //     }
        //   ],
        //   init: function (api, node, config) {
        //     $(node).removeClass('btn-secondary');
        //     $(node).parent().removeClass('btn-group');
        //     setTimeout(function () {
        //       $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex');
        //     }, 50);
        //   }
        // },
        {
          text: feather.icons['plus'].toSvg({ class: 'me-50 font-small-4' }) + 'Add New Record',
          className: 'create-new btn btn-primary',
          attr: {
            'data-bs-toggle': 'modal',
            'data-bs-target': '#modals-slide-in'
          },
          init: function (api, node, config) {
            $(node).removeClass('btn-secondary');
          }
        }
      ],
      responsive: {
        details: {
          display: $.fn.dataTable.Responsive.display.modal({
            header: function (row) {
              var data = row.data();
              return 'Details of ' + data['full_name'];
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
      },
      language: {
        paginate: {
          // remove previous & next text from pagination
          previous: '&nbsp;',
          next: '&nbsp;'
        }
      }
    });
    // $('div.head-label').html('<h6 class="mb-0">DataTable with Buttons</h6>');
    $('div.dataTables_wrapper .card-header').hide();
  }

  // Flat Date picker
  if (dt_date_table.length) {
    dt_date_table.flatpickr({
      monthSelectorType: 'static',
      dateFormat: 'm/d/Y'
    });
  }

  var form = $('.add-new-record');

  // Add New record
  // ? Remove/Update this code as per your requirements ?
  var count = 101;
  $('.data-submit').on('click', function () {
    var reason_id = form.find('[name="reason_id"]');
    var formData = form.serializeArray();

    $.ajax({
        type:'POST',
        url:'/admin/leave',
        data: formData,
        headers:{
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success:function(response) {
            dt_basic.ajax.reload();
            $('.modal').modal('hide');
        }
    });
  });

  // Create record
  $('.dt-buttons').on('click', '.create-new', function () {
    form.find('[name="_method"]').val('POST');
    form.find('[name="reason_id"]').val('');
    form.find('[name="name"]').val('');
    form.find('[name="paid"]').val('');
    form.find('[name="limit"]').val('');
  });

  // Edit Record
  $('.datatables-basic tbody').on('click', '.edit-record', function () {
    var id = $(this).data('id');

    // form.find('[name="_method"]').val('PUT');
    form.find('[name="reason_id"]').val(id);

    $.ajax({
        type:'GET',
        url:'/admin/leave/' + id,
        headers:{
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success:function(res) {

            form.find('[name="name"]').val(res.data.name);
            form.find('[name="paid"]').val(res.data.paid);
            form.find('[name="limit"]').val(res.data.time_limit);

            $('.modal').modal('show');
        }
    });
  });

  // Delete Record
  $('.datatables-basic tbody').on('click', '.delete-record', function () {
    var id = $(this).data('id');  
    var dt_row = dt_basic.row($(this).parents('tr'));  

    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!',
        customClass: {
            confirmButton: 'btn btn-primary',
            cancelButton: 'btn btn-outline-danger ml-1'
        },
        buttonsStyling: false
    }).then(function (result) {
        if (result.value) {
            $.ajax({
                type:'POST',
                url:'/admin/leave/' + id,
                data: { _method: 'DELETE' },
                headers:{
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                success:function(res) {
                  dt_row.remove().draw();
                }
            });

        } 
    });
  });
});
