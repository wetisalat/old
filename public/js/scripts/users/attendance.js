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
    assetPath = '../../../app-assets/';

  if ($('body').attr('data-framework') === 'laravel') {
    assetPath = $('body').attr('data-asset-path');
  }

  // DataTable with buttons
  // --------------------------------------------------------------------

  if (dt_basic_table.length) {
    var minDate, maxDate;

    $.fn.dataTable.ext.search.push(
        function( settings, data, dataIndex ) {
            var min = minDate;
            var max = maxDate;
            var startDate = moment( data[7], 'DD-MM-YYYY HH:mm' ).toDate();
            var endDate =moment( data[8], 'DD-MM-YYYY HH:mm' ).toDate();

            if (
                ( min === undefined && max === undefined ) ||
                ( min === undefined && endDate <= max ) ||
                ( min <= startDate   && max === undefined ) ||
                ( min <= startDate   && endDate <= max )
            ) {
                return true;
            }
            return false;
        }
    );

    var dt_basic = dt_basic_table.DataTable({
      "bInfo" : false,

      "bAutoWidth": true,

      ajax: assetPath + 'request',
      columns: [
        { data: 'responsive_id' },
        { data: 'id' },
        { data: 'id' }, // used for sorting so will hide this column
        { data: 'full_name' },
        { data: 'reason' },
        { data: 'description' },
        { data: 'allDay' },
        { data: 'start' },
        { data: 'end' },
        { data: 'approved_by' },
        { data: 'status' },
        { data: '' },
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
          // For Checkboxes
          targets: 1,
          orderable: false,
          responsivePriority: 3,
          render: function (data, type, full, meta) {
            return (
              '<div class="form-check"> <input class="form-check-input dt-checkboxes" type="checkbox" value="" id="checkbox' +
              data +
              '" /><label class="form-check-label" for="checkbox' +
              data +
              '"></label></div>'
            );
          },
          checkboxes: {
            selectAllRender:
              '<div class="form-check"> <input class="form-check-input" type="checkbox" value="" id="checkboxSelectAll" /><label class="form-check-label" for="checkboxSelectAll"></label></div>'
          }
        },
        {
          targets: 2,
          visible: false
        },
        {
          // User full name and username
          targets: 3,
          responsivePriority: 4,
          render: function (data, type, full, meta) {
              var $name = full['firstname'] + [' '] + full['lastname'],
                  $email = full['email'],
                  $contract_type_name = full['contract_type_name'],
                  $image = full['profile_photo_path']
              if ($image) {
                  // For Avatar image
                  var $output =
                      '<img src="'+$image+'" alt="Avatar" height="32" width="32">';
              } else {
                  // For Avatar badge
                  var stateNum = Math.floor(Math.random() * 6) + 1
                  var states = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary']
                  var $state = states[stateNum],
                      $name = full['firstname'] + [' '] + full['lastname'],
                      $initials = $name.match(/\b\w/g) || []
                  $initials = (($initials.shift() || '') + ($initials.pop() || '')).toUpperCase()
                  $output = '<span class="avatar-content">' + $initials + '</span>'
              }
              var colorClass = $image === '' ? ' bg-light-' + $state + ' ' : ''
              // Creates full output for row
              var $row_output =
                  '<div class="d-flex justify-content-left align-items-center">' +
                  '<div class="avatar-wrapper">' +
                  '<div class="avatar ' +
                  colorClass +
                  ' me-1">' +
                  $output +
                  '</div>' +
                  '</div>' +
                  '<div class="d-flex flex-column">' +
                  '<a href="'+assetPath +'staff/'+full['id']+'/view/account" class="user_name text-truncate text-body"><span class="fw-bolder">' +
                  $name +
                  '</span></a>' +
                  '<small class="emp_post text-muted">' +
                  $contract_type_name +
                  '</small>' +
                  '</div>' +
                  '</div>'
              return $row_output
          }
        },
        {
          responsivePriority: 1,
          targets: 4
        },
        {
          responsivePriority: 1,
          targets: 5,
          render: function (data, type, full, meta) {
            var $descriptionContent = full['description'];

            return (
              "<span data-bs-toggle='tooltip' data-bs-html='true' title='<span>" +
              $descriptionContent  + "</span>'>" +
              '<div class="avatar avatar-status bg-light-secondary">' +
              '<span class="avatar-content">' +
              feather.icons['info'].toSvg({ class: 'avatar-icon' }) +
              '</span>' +
              '</div>' +
              '</span>'
            );
          }
        },

        {
          responsivePriority: 1,
          targets: 6,
          render: function (data, type, full, meta) { 
            var $allDay = full['allDay'];

            var $descriptionOutput = '';
            var $tooltipContent = '';

            if($allDay === 1) {
              $descriptionOutput = '<button class="btn btn-icon btn-icon rounded-circle btn-info me-1" data-bs-placement="top" title="'+$tooltipContent+'"></button>';
            } else {
              $descriptionOutput = '<button class="btn btn-icon btn-icon rounded-circle btn-danger me-1" data-bs-placement="top" title="'+$tooltipContent+'"></button>'
            }

            return '<div class="text-center">'+$descriptionOutput+'</div>';
          }
        },
        {
          responsivePriority: 1,
          targets: 7,
          render: function (data, type, full, meta) { 
            return moment(full['start']).format('DD-MM-YYYY HH:mm')
          }
        },
        {
          responsivePriority: 1,
          targets: 8,
          render: function (data, type, full, meta) { 
            return moment(full['end']).format('DD-MM-YYYY HH:mm')
          }
        },
        {
          // Label
          targets: -2,
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
          width: '80px', 
          orderable: false,
          render: function (data, type, full, meta) {
            return (
              '<div class="d-flex align-items-center col-actions">' +
              '<button class="btn btn-icon btn-icon rounded-circle btn-success me-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Accept" data-status="accept" data-leave-id="'+full['id']+'"></button>' +
              '<button type="button" class="btn btn-icon btn-icon rounded-circle btn-warning me-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Pending" data-status="pending" data-leave-id="'+full['id']+'"></button>' +
              '<button type="button" class="btn btn-icon btn-icon rounded-circle btn-danger me-1" data-bs-toggle="tooltip" data-bs-placement="top" title="Refuse" data-status="refuse" data-leave-id="'+full['id']+'"></button>' +
              '</div>'
            );
          }
        }
      ],
      order: [[1, 'desc']],
      dom:
        '<"row d-flex justify-content-between align-items-center m-1"' +
        '<"col-lg-6 d-flex align-items-center"B<"dt-toolbar"><"dt-action-buttons text-xl-end text-lg-start text-lg-end text-start ">>' +
        '<"col-lg-6 d-flex align-items-center justify-content-lg-end flex-lg-nowrap flex-wrap pe-lg-1 p-0"f>' +
        '>t' +
        '<"d-flex justify-content-between mx-2 row"' +
        '<"col-sm-12 col-md-6"il>' +
        '<"col-sm-12 col-md-6"p>' +
        '>',
      language: {
          sLengthMenu: 'Show _MENU_',
          search: 'Search',
          searchPlaceholder: 'Search..',
          paginate: {
            // remove previous & next text from pagination
            previous: '&nbsp;',
            next: '&nbsp;'
          }
      },
      // Buttons with Dropdown
      buttons: [
        {
          extend: 'collection',
          className: 'btn btn-outline-secondary dropdown-toggle me-2',
          text: feather.icons['share'].toSvg({ class: 'font-small-4 me-50' }) + 'Export',
          buttons: [
            {
              extend: 'print',
              text: feather.icons['printer'].toSvg({ class: 'font-small-4 me-50' }) + 'Print',
              className: 'dropdown-item',
              exportOptions: { columns: [3, 4, 5, 6, 7] }
            },
            {
              extend: 'csv',
              text: feather.icons['file-text'].toSvg({ class: 'font-small-4 me-50' }) + 'Csv',
              className: 'dropdown-item',
              exportOptions: { columns: [3, 4, 5, 6, 7] }
            },
            {
              extend: 'excel',
              text: feather.icons['file'].toSvg({ class: 'font-small-4 me-50' }) + 'Excel',
              className: 'dropdown-item',
              exportOptions: { columns: [3, 4, 5, 6, 7] }
            },
            {
              extend: 'pdf',
              text: feather.icons['clipboard'].toSvg({ class: 'font-small-4 me-50' }) + 'Pdf',
              className: 'dropdown-item',
              exportOptions: { columns: [3, 4, 5, 6, 7] }
            },
            {
              extend: 'copy',
              text: feather.icons['copy'].toSvg({ class: 'font-small-4 me-50' }) + 'Copy',
              className: 'dropdown-item',
              exportOptions: { columns: [3, 4, 5, 6, 7] }
            }
          ],
          init: function (api, node, config) {
            $(node).removeClass('btn-secondary');
            $(node).parent().removeClass('btn-group');
            setTimeout(function () {
              $(node).closest('.dt-buttons').removeClass('btn-group').addClass('d-inline-flex');
            }, 50);
          }
        },
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
        drawCallback: function () {
          $(document).find('[data-bs-toggle="tooltip"]').tooltip();
        }
      });
  }

  // $("div.dt-toolbar").html(
  //   '<input type="text" id="fp-range" class="form-control dt-range-datepicker" placeholder="Datepicker Range" />'
  // );
  
  $("div.dt-toolbar").html(
    $('.date-filtering-input').html()
  );
  

  $('.dt-range-datepicker').daterangepicker({
      "drops": "auto",
      "showWeekNumbers": true,
      "showISOWeekNumbers": true,
      autoUpdateInput: false,
      locale: {
          cancelLabel: 'Clear',
          format: 'DD/MM/YYYY'
      },
      ranges: {
          'Today': [moment(), moment()],
          'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days': [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month': [moment().startOf('month'), moment().endOf('month')],
          'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
      },
      "linkedCalendars": false,
      "autoUpdateInput": false,
      "alwaysShowCalendars": true,
      "startDate": moment().subtract(1, 'month').startOf('month'),
      "endDate": moment().subtract(1, 'month').endOf('month')
    }, 
    function(start, end, label) {
        minDate = start.toDate();
        maxDate = end.toDate();

        dt_basic.draw();
  });

  $('.dt-range-datepicker').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('DD/MM/YYYY') + ' - ' + picker.endDate.format('DD/MM/YYYY'));
  });

  $('.dt-range-datepicker').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
      minDate = undefined;
      maxDate = undefined;
      dt_basic.draw();
  });

  $('table').on('click', '.col-actions .btn', function(e) {
    var status = $(this).data('status');
    var leaveId = $(this).data('leave-id');
    
    // $(this).tooltip('hide')

    $.ajax({
        url: assetPath + 'staff/leave/status/' + leaveId,
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        type: 'POST',
        data: {_method: 'PATCH', 'status': status },
        success: function(response) {
            getLeaveStatistics();
            dt_basic.ajax.reload();

            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: response.message,
                showConfirmButton: false,
                timer: 1500,
                customClass: {
                  confirmButton: 'btn btn-primary'
                },
                buttonsStyling: false
            });
        }
    });

  });

  // Flat Date picker
  if (dt_date_table.length) {
    dt_date_table.flatpickr({
      monthSelectorType: 'static',
      dateFormat: 'm/d/Y'
    });
  }

  getLeaveStatistics();

  function getLeaveStatistics() {
    $.ajax({
        url: assetPath + 'request/statistics',
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        type: 'POST',
        data: {_method: 'PATCH', 'status': status },
        success: function(res) {
            $.each(res.data, function(k,v) {
              $('#'+v.status+'-count').html(v.total);
            });
        }
    });
  }

  mobiscroll.setOptions({
    locale: mobiscroll.localeEn,              // Specify language like: locale: mobiscroll.localePl or omit setting to use default
    theme: 'ios',                             // Specify theme like: theme: 'ios' or omit setting to use default
    themeVariant: 'light'                 // More info about themeVariant: https://docs.mobiscroll.com/5-16-0/range#opt-themeVariant
  });

  var formatDate = mobiscroll.util.datetime.formatDate;
  var startDate = '2022-04-17T00:00';
  var endDate = '2022-04-23T00:00';
  var $dateInput = $('#date-filtering');
  var $startInput = $('#date-filtering-start');
  var $endInput = $('#date-filtering-end');

  var now = new Date();
  var day = now.getDay();
  var monday = now.getDate() - day + (day === 0 ? -6 : 1);

  var select = $('#date-filtering-select').mobiscroll().select({
      inputElement: document.getElementById('date-select-input'),
      responsive: {                         // More info about responsive: https://docs.mobiscroll.com/5-16-0/range#opt-responsive
          xsmall: {
              touchUi: true                 // More info about touchUi: https://docs.mobiscroll.com/5-16-0/range#opt-touchUi
          },
          small: {
              touchUi: false                // More info about touchUi: https://docs.mobiscroll.com/5-16-0/range#opt-touchUi
          }
      },
      onChange: function (event) {          // More info about onChange: https://docs.mobiscroll.com/5-16-0/range#event-onChange
          var selected = event.value;

          if (selected === 'custom') {
              disableInputs(false);
          } else {
              disableInputs(true);

              switch (selected) {
                  case 'today':
                      calendar.setVal(['2022-04-17T00:00', '2022-04-17T00:00']);
                      break;
                  case 'yesterday':
                      calendar.setVal(['2022-04-16T00:00', '2022-04-16T00:00']);
                      break;
                  case 'last-week':
                      calendar.setVal([new Date(now.getFullYear(), now.getMonth(), monday - 7), new Date(now.getFullYear(), now.getMonth(), monday - 1)]);
                      break;
                  case 'last-month':
                      calendar.setVal(['2022-03-01T00:00', '2022-03-31T00:00']);
                      break;
                  case 'last-7-days':
                      calendar.setVal(['2022-04-11T00:00', '2022-04-17T00:00']);
                      break;
                  case 'last-30-days':
                      calendar.setVal(['2022-03-19T00:00', '2022-04-17T00:00']);
                      break;
              }
          }
      }
  }).mobiscroll('getInst');

  function disableInputs(disable) {    
    if($startInput.length && $endInput.length) {
      var startInst = mobiscroll.getInst($startInput[0]);
      var endInst = mobiscroll.getInst($endInput[0]);

      startInst.setOptions({ disabled: disable });
      endInst.setOptions({ disabled: disable });
    }
  }

  var calendar = $('#date-filtering-calendar').mobiscroll().datepicker({
      controls: ['calendar'],               // More info about controls: https://docs.mobiscroll.com/5-16-0/range#opt-controls
      select: 'range',                      // More info about select: https://docs.mobiscroll.com/5-16-0/range#methods-select
      display: 'inline',                    // Specify display mode like: display: 'bottom' or omit setting to use default
      showRangeLabels: false,
      pages: 'auto',
      startInput: '#date-filtering-start',  // More info about startInput: https://docs.mobiscroll.com/5-16-0/range#opt-startInput
      endInput: '#date-filtering-end',      // More info about endInput: https://docs.mobiscroll.com/5-16-0/range#opt-endInput
      returnFormat: 'iso8601',              // More info about returnFormat: https://docs.mobiscroll.com/5-16-0/range#opt-returnFormat
      showOnClick: false,                   // More info about showOnClick: https://docs.mobiscroll.com/5-16-0/range#opt-showOnClick
      showOnFocus: false,                   // More info about showOnFocus: https://docs.mobiscroll.com/5-16-0/range#opt-showOnFocus
      onInit: function (event, inst) {      // More info about onInit: https://docs.mobiscroll.com/5-16-0/range#event-onInit
          inst.setVal([startDate, endDate]);
          setInputValue(startDate, endDate, inst.s.dateFormat)
      },
      onChange: function () {               // More info about onChange: https://docs.mobiscroll.com/5-16-0/range#event-onChange
          disableInputs(false);
          select.setVal('custom');
      }
  }).mobiscroll('getInst');

  var popup = $('#date-filtering-popup').mobiscroll().popup({
      responsive: {                         // More info about responsive: https://docs.mobiscroll.com/5-16-0/range#opt-responsive
          xsmall: {
              display: 'bottom',            // Specify display mode like: display: 'bottom' or omit setting to use default
              touchUi: true,                // More info about touchUi: https://docs.mobiscroll.com/5-16-0/range#opt-touchUi
              buttons: [{                   // More info about buttons: https://docs.mobiscroll.com/5-16-0/range#opt-buttons
                      text: 'Apply',
                      handler: function (event) {
                          var date = calendar.getVal();

                          setInputValue(date[0], date[1] || date[0], calendar.s.dateFormat);
                          popup.close();
                      }
                  },
                  'cancel'
              ]
          },
          custom: {
              breakpoint: 559,
              buttons: [],                  // More info about buttons: https://docs.mobiscroll.com/5-16-0/range#opt-buttons
              display: 'anchored',          // Specify display mode like: display: 'bottom' or omit setting to use default
              anchor: $dateInput[0],        // More info about anchor: https://docs.mobiscroll.com/5-16-0/range#opt-anchor
              anchorAlign: 'start',
              touchUi: false,               // More info about touchUi: https://docs.mobiscroll.com/5-16-0/range#opt-touchUi
              scrollLock: false,            // More info about scrollLock: https://docs.mobiscroll.com/5-16-0/range#opt-scrollLock
              showArrow: false,             // More info about showArrow: https://docs.mobiscroll.com/5-16-0/range#opt-showArrow
              maxWidth: 920                 // More info about maxWidth: https://docs.mobiscroll.com/5-16-0/range#opt-maxWidth
          }
      }
  }).mobiscroll('getInst');

  function setInputValue(start, end, dateFormat) {
      $dateInput.val(formatDate(dateFormat, new Date(start)) + ' - ' + formatDate(dateFormat, new Date(end)));

      minDate = new Date(start);
      maxDate = new Date(end);
      dt_basic.draw();
  }

  $dateInput.on('click', function (ev) {
      popup.open();
  });

  $('.apply-button').on('click', function (ev) {
      var date = calendar.getVal();

      setInputValue(date[0], date[1] || date[0], calendar.s.dateFormat);
      popup.close();
  });

  $('.cancel-button').on('click', function (ev) {
      popup.close();
  });

});
