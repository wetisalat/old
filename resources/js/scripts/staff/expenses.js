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
      invoicePreview = 'app-invoice-preview.html',
      statusObj = {
          1: { title: 'Pending', class: 'badge-light-warning' },
          'active': { title: 'Active', class: 'badge-light-success' },
          3: { title: 'Inactive', class: 'badge-light-secondary' }
      },
    assetPath = '../../../app-assets/';

  if ($('body').attr('data-framework') === 'laravel') {
      assetPath = $('body').attr('data-asset-path');
      invoicePreview = assetPath + 'app/invoice/preview';
  }

  // DataTable with buttons
  // --------------------------------------------------------------------

  if (dt_basic_table.length) {
    var dt_basic = dt_basic_table.DataTable({
      'bInfo': false,
      'bAutoWidth': true,

      ajax: assetPath + 'query/expenses',

      columns: [
        { data: 'id' },
        { data: 'date' },
        { data: 'type' },
        { data: 'salary' },
        { data: 'attachment' },
        { data: 'comment' },
        { data: 'id' },
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

          {
              // Avatar image/badge, Name and post
              targets: 3,
              responsivePriority: 4,
              render: function (data, type, full, meta) {
                  var $salary = full['salary'];

                  if ($salary) {

                      var $amount = $salary + '€';
                  }

                  return $amount;
              }
          },

          {
              // Avatar image/badge, Name and post
              targets: 4,
              responsivePriority: 4,
              render: function (data, type, full, meta) {
                  var $user_img = full['attachment'];
                  // onClick=downloadExpenses(' + full['id'] + ');
                  return (
                      '<a href="'+assetPath +'images/expenses/'+$user_img+'" class="item-edit" target="_blank" style="margin-right: 10px !important;">' +
                      feather.icons['eye'].toSvg({ class: 'font-small-4' }) +
                      '</a>' +
                      '<a href="'+assetPath +'expenses/download/'+$user_img+'" class="item-edit">' +
                      feather.icons['download'].toSvg({ class: 'font-small-4' }) +
                      '</a>'
                  );

                  // return $user_img;
              }
          },
          {
              // User Status
              targets: 5,
              render: function (data, type, full, meta) {
                  var $comment = full['comment']
                  return $comment;
              }
          },

          {
              // Label
              targets: 6,
              render: function (data, type, full, meta) {
                  var $status_number = full['status_name'];
                  var $status = {
                      accept: { title: 'Accepted', class: ' badge-light-success' },
                      pending: { title: 'Pending', class: ' badge-light-warning' },
                      refuse: { title: 'Rejected', class: ' badge-light-danger' }
                  };
                  if (typeof $status[$status_number] === 'undefined') {
                      return data;
                  }
                  return (
                      '<span class="badge rounded-pill ' +
                      $status[$status_number].class +
                      '">' +
                      $status[$status_number].title +
                      '</span>'
                  );
              }
          },

        {
          // Actions
          targets: -1,
          title: 'Actions',
          orderable: false,
          render: function (data, type, full, meta) {
            return (
              '<a href="javascript:;" onClick=editExpenses(' + full['id'] + '); class="item-edit" style="margin-right: 10px !important;">' +
              feather.icons['edit'].toSvg({ class: 'font-small-4' }) +
              '</a>'+
              '<a href="javascript:;" onClick=removeExpenses(' + full['id'] + '); class="delete-record">' +
              feather.icons['trash-2'].toSvg({ class: 'font-small-4 me-50' })+'</a>'
            );
          }
        }
      ],
      order: [[2, 'desc']],
      dom:
      '<"row d-flex justify-content-between align-items-center mx-1 py-0"' +
      '<"col-lg-6 d-flex align-items-center"B<"dt-toolbar"><"dt-action-buttons text-xl-end text-lg-start text-lg-end text-start ">>' +
      '<"col-lg-6 d-flex align-items-center justify-content-lg-end flex-lg-nowrap flex-wrap pe-lg-1"f>' +
      '>t' +
      '<"d-flex justify-content-between mx-2 row dt-footer"' +
      '<"col-sm-12 col-md-6"il>' +
      '<"col-sm-12 col-md-6"p>' +
      '>',
      language: {
        sLengthMenu: 'Show _MENU_',
        search: 'Search',
        searchPlaceholder: 'Search..',
        lengthChange: false,
        paginate: {
          // remove previous & next text from pagination
          previous: '&nbsp;',
          next: '&nbsp;'
        }
      },
      // Buttons with Dropdown
      buttons: [
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
              return 'Details of ' + data['type'];
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
        },
        sLengthMenu: "_MENU_"
    },
    });
  }

  // Flat Date picker
  if (dt_date_table.length) {
    dt_date_table.flatpickr({
      monthSelectorType: 'static',
      dateFormat: 'd-m-Y'
    });
  }

    $.ajaxSetup({
        headers:{
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

  // Add New record
  // ? Remove/Update this code as per your requirements ?

    $('.create-new').click(function (){
        $('#record_date').val('');
        $('#record_type').val('').change();
        $('#record_salary').val('');
        $('#comment').val('');
        $("#imageUrl").val('');
        $("#oldId").val('');
        $("#exampleModalLabel").text('New Record');

    });

    document.getElementById('attachment').addEventListener('change', function(){
        if (this.files[0] ) {
            var picture = new FileReader();
            var ext = this.value.match(/\.([^\.]+)$/)[1];
          switch (ext) {
            case 'jpg':
            case 'bmp':
            case 'png':
            case 'tif':
              alert('Document est conforme');
              break;
            default:
              alert('Document non conforme');
              this.value = '';
          }
            picture.readAsDataURL(this.files[0]);
            picture.addEventListener('load', function(event) {
                $("#imageUrl").val(event.target.result);
            });
        }

    });


  var count = 101;
  $('.data-submit').on('click', function () {
    var $record_date = $('#record_date').val(),
        $record_type = $('#record_type').val(),
        $record_salary = $('#record_salary').val(),
        $comment = $('#comment').val(),
        $attachment = $("#imageUrl").val();

        var oldId = $("#oldId").val();

      $.ajax({
          type: 'POST',
          url: '/add-expenses',
          data: {
              date: $record_date,
              type: $record_type,
              salary: $record_salary,
              attachment: $attachment,
              comment: $comment,
              oldId: oldId,
          },
          success: function (response) {

              Swal.fire({
                  icon: 'success',
                  title: 'Success!',
                  text: 'New record has been saved successfully.',
                  customClass: {
                      confirmButton: 'btn btn-success'
                  }
              }).then((response) => {
                  $('.modal').modal('hide');
                  window.location.reload();
              });

          },
          error: function (error){
              var errors = error.responseJSON.errors;

              if (errors.attachment.length > 0){
                  $("#error_attachment").text(errors.attachment[0]);
              }

              if (errors.date.length > 0){
                  $("#error_record_date").text(errors.date[0]);
              }

              if (errors.salary.length > 0){
                  $("#error_record_salary").text(errors.salary[0]);
              }
              if (errors.type.length > 0 ){
                  $("#error_record_type").text(errors.type[0]);
              }
          }
      });
  });

  // Delete Record
  $('.datatables-basic tbody').on('click', '.delete-record', function () {
    dt_basic.row($(this).parents('tr')).remove().draw();
  });
});

function editExpenses(id){
    $.ajax({
        type: 'GET',
        url: 'expenses/edit/' + id,
        success: function (response) {

            var editExpenses = response.expenses;

            if (editExpenses){
                $("#oldId").val(editExpenses.id);

                $('#record_date').val(editExpenses.date);
                $('#record_type').val(editExpenses.type).change();
                $('#record_salary').val(editExpenses.salary);
                 $('#comment').val(editExpenses.comment);
                 $("#imageUrl").val(editExpenses.attachment);

                $("#exampleModalLabel").text('Update Record');
            }
            $('.modal').modal('show');

        }
    });
}

function removeExpenses(id) {
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
                type: 'POST',
                url: 'expenses/delete',
                data: {id},
                success: function (response) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Deleted!',
                        text: 'Your file has been deleted.',
                        customClass: {
                            confirmButton: 'btn btn-success'
                        }
                    }).then((response) => {
                        window.location.reload();
                    });
                }
            });


        } else if (result.dismiss === Swal.DismissReason.cancel) {
            Swal.fire({
                title: 'Cancelled',
                text: 'Your imaginary file is safe :)',
                icon: 'error',
                customClass: {
                    confirmButton: 'btn btn-success'
                }
            });
        }
    });
}
