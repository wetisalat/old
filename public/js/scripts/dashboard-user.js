$(window).on('load', function () {
  'use strict';

  var flatPicker = $('.flat-picker'),
    chartColors = {
      column: {
        series1: '#826af9',
        series2: '#d2b0ff',
        bg: '#f8d3ff'
      },
      donut: {
        series1: '#ffe700',
        series2: '#00d4bd',
        series3: '#826bf8',
        series4: '#2b9bf4',
        series5: '#FFA1A1'
      }
    },
    assetPath = '../../../app-assets/';

  if ($('body').attr('data-framework') === 'laravel') {
    assetPath = $('body').attr('data-asset-path');
  };

    var $textHeadingColor = '#5e5873';
    var $white = '#fff';
    var $supportTrackerChart = document.querySelector('#support-trackers-chart');
    var supportTrackerChartOptions;
    var supportTrackerChart;    

  // On load Toast
  // setTimeout(function () {
  //   toastr['success'](
  //     'You have successfully logged in to Vuexy. Now you can start to explore!',
  //     '👋 Welcome ' + User_Dashboard_Data.user_fullname + '!',
  //     {
  //       closeButton: true,
  //       tapToDismiss: false
  //     }
  //   );
  // }, 2000);

  // Support Tracker Chart
  // -----------------------------
  supportTrackerChartOptions = {
    chart: {
      height: 270,
      type: 'radialBar'
    },
    plotOptions: {
      radialBar: {
        size: 150,
        offsetY: 20,
        startAngle: -150,
        endAngle: 150,
        hollow: {
          size: '65%'
        },
        track: {
          background: $white,
          strokeWidth: '100%'
        },
        dataLabels: {
          name: {
            offsetY: -5,
            color: $textHeadingColor,
            fontSize: '1rem'
          },
          value: {
            offsetY: 15,
            color: $textHeadingColor,
            fontSize: '1.714rem'
          }
        }
      }
    },
    colors: [window.colors.solid.danger],
    fill: {
      type: 'gradient',
      gradient: {
        shade: 'dark',
        type: 'horizontal',
        shadeIntensity: 0.5,
        gradientToColors: [window.colors.solid.primary],
        inverseColors: true,
        opacityFrom: 1,
        opacityTo: 1,
        stops: [0, 100]
      }
    },
    stroke: {
      dashArray: 8
    },
    series: [83],
    labels: ['Completed Tickets']
  };
  supportTrackerChart = new ApexCharts($supportTrackerChart, supportTrackerChartOptions);
  supportTrackerChart.render();  

  // Donut Chart
  // --------------------------------------------------------------------
  var donutChartLabels = ['Worked', 'Leaved', 'Latetime', 'Overtime'];
  var donutChartSeries = [User_Dashboard_Data.total_staff_worked, User_Dashboard_Data.total_leaves, User_Dashboard_Data.total_staff_late, User_Dashboard_Data.total_staff_overtime];
  var donutChartSeriesSorted = Array.from(donutChartSeries).sort(function(a, b) { return b - a; });
  var donutChartTopValueIndex = donutChartSeries.findIndex(function(val) { return val === donutChartSeriesSorted[0] });

  var donutChartEl = document.querySelector('#donut-chart'),
    donutChartConfig = {
      chart: {
        height: 350,
        type: 'donut'
      },
      legend: {
        show: true,
        position: 'bottom'
      },
      labels: donutChartLabels,
      series: [], // donutChartSeries,
      colors: [
        chartColors.donut.series1,
        chartColors.donut.series5,
        chartColors.donut.series3,
        chartColors.donut.series2
      ],
      dataLabels: {
        enabled: true,
        formatter: function (val, { seriesIndex, dataPointIndex, w }) {
          return parseInt(val) + '%';
        }
      },
      plotOptions: {
        pie: {
          donut: {
            labels: {
              show: true,
              name: {
                fontSize: '2rem',
                fontFamily: 'Montserrat'
              },
              value: {
                fontSize: '1rem',
                fontFamily: 'Montserrat',
                formatter: function (val) {
                  var totalSum = donutChartSeries.reduce(function(a, b) { return a + b; }, 0);
                  return parseInt( (val/totalSum) * 100 ) + '%'
                }
              },
              // total: {
              //   show: true,
              //   fontSize: '1.5rem',
              //   label: donutChartLabels[donutChartTopValueIndex],
              //   formatter: function (w) {
              //     var totalSum = donutChartSeries.reduce(function(a, b) { return a + b; }, 0);
              //     return parseInt( (donutChartSeries[donutChartTopValueIndex]/totalSum) * 100 ) + '%';
              //   }
              // }
            }
          }
        }
      },
      responsive: [
        {
          breakpoint: 992,
          options: {
            chart: {
              height: 380
            }
          }
        },
        {
          breakpoint: 576,
          options: {
            chart: {
              height: 320
            },
            plotOptions: {
              pie: {
                donut: {
                  labels: {
                    show: true,
                    name: {
                      fontSize: '1.5rem'
                    },
                    value: {
                      fontSize: '1rem'
                    },
                    total: {
                      fontSize: '1.5rem'
                    }
                  }
                }
              }
            }
          }
        }
      ],
      tooltip: {
        y: {
          formatter: function(val) {
            return ''
          },
          title: {
            formatter: function (seriesName) {
              return seriesName
            }
          }
        }
      }
    };
  if (typeof donutChartEl !== undefined && donutChartEl !== null) {
    var donutChart = new ApexCharts(donutChartEl, donutChartConfig);
    donutChart.render();

    getStaffOverview(startDate, endDate, donutChart);
  }  

  // Init flatpicker
  var startDate = new Date();
  var endDate = new Date( new Date().setDate(new Date().getDate() + 7) );

  if (flatPicker.length) {
    var date = new Date();
    flatPicker.each(function () {
      $(this).flatpickr({
        mode: 'range',
        dateFormat: 'd-m-Y',
        defaultDate: [startDate, endDate],
        onChange: function(selectedDates, dateStr, instance) {
          getStaffOverview(selectedDates[0], selectedDates[1], donutChart);
        }
      });
    });
  }

  // Populate daily data every 1 min
  setInterval(getDailyData, 60000);

  function getDailyData() {
    $.ajax({
      url: assetPath + 'staff/daily-data',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      type: 'GET',
      success: function(response) {
        var rows = '';

        $.each(response, function(idx, userData) {

        var $name = userData['firstname'] + [' '] + userData['lastname'],
          $contract_type_name = userData['contract_type_name'];

        // For Avatar badge
        var stateNum = Math.floor(Math.random() * 6) + 1
        var states = ['success', 'danger', 'warning', 'info', 'dark', 'primary', 'secondary']
        var $state = states[stateNum],
            $name = userData['firstname'] + [' '] + userData['lastname'],
            $initials = $name.match(/\b\w/g) || [];

        $initials = (($initials.shift() || '') + ($initials.pop() || '')).toUpperCase()
        var $output = '<span class="avatar-content">' + $initials + '</span>'
        
        var colorClass =  'bg-light-' + $state;

        // Creates full output for row
        var $name_html =
            '<div class="d-flex justify-content-left align-items-center">' +
            '<div class="avatar-wrapper">' +
            '<div class="avatar ' +
           // colorClass +
            ' me-1">' +
            $output +
            '</div>' +
            '</div>' +
            '<div class="d-flex flex-column">' +
            '<a href="'+assetPath +'staff/'+userData['id']+'/view/account" class="user_name text-truncate text-body"><span class="fw-bolder">' +
            $name +
            '</span></a>' +
            '<small class="emp_post text-muted">' +
            $contract_type_name +
            '</small>' +
            '</div>' +
            '</div>'

          var shift_html = '<div class="d-flex flex-column">' +
              '<div class="user_name text-truncate text-body">'+
                '<span class="fw-bolder">' + userData['shift_name'] + '</span>'+
              '</div>'+
              '<small class="emp_post text-muted">' + userData['start_time'] + ' ' + userData['end_time'] + '</small></div>';

          if(userData['shift_name'] === '') {
            shift_html = 'N/A';
          }

          rows += '<tr>';
          rows += '<td>' + $name_html + '</td>';
          rows += '<td>' + userData.phone + '</td>';
          rows += '<td>' + shift_html + '</td>';
          rows += '<td>' + userData.arrival_date + '</td>';
          rows += '<td><span class="badge rounded-pill badge-light-primary me-1">' + userData.status + '</span></td>';
          rows += '<td>'+ userData.leave_reason + '</td>';
          rows += '</tr>';
        });

        $('#daily-data-table tbody').html(rows);
      }
    });
  }

  function getStaffOverview(startDate, endDate, donutChart) {
    $.ajax({
      url: assetPath + 'staff/overview',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      type: 'POST',
      data: { 
        start: moment(startDate).format('YYYY-MM-DD'), 
        end: moment(endDate).format('YYYY-MM-DD') 
      },
      success: function(response) {
        var data = response;

        var donutChartSeriesSorted = Array.from(data).sort(function(a, b) { return b - a; });
        var donutChartTopValueIndex = data.findIndex(function(val) { return val === donutChartSeriesSorted[0] });
        var totalSum = data.reduce(function(a, b) { return a + b; }, 0);

        if(totalSum > 0) {
          donutChart.updateOptions({
            series: data,
            plotOptions: {
              pie: {
                donut: {
                  labels: {
                    total: {
                      show: true,
                      fontSize: '1.5rem',
                      label: donutChartLabels[donutChartTopValueIndex],
                      formatter: function (w) {
                        return parseInt( (data[donutChartTopValueIndex]/totalSum) * 100 ) + '%';
                      }
                    }
                  }
                }
              }
            }
          });
        } else {
          donutChart.updateOptions({
            series: data,
            plotOptions: {
              pie: {
                donut: {
                  labels: {
                    total: {
                      show: true,
                      fontSize: '1.5rem',
                      label: 'Vacant',
                      formatter: function (w) {
                        return 0;
                      }
                    }
                  }
                }
              }
            }
          });
        }
      }
    });
  }
});
