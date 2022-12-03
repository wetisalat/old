$(window).on('load', function () {
  'use strict';

  var flatPicker = $('.flat-picker'),
    isRtl = $('html').attr('data-textdirection') === 'rtl',
    chartColors = {
      column: {
        series1: '#826af9',
        series2: '#d2b0ff',
        bg: '#f8d3ff'
      }
    },
    assetPath = '../../../app-assets/';

  if ($('body').attr('data-framework') === 'laravel') {
    assetPath = $('body').attr('data-asset-path');
  };


  var $gainedChart = document.querySelector('#gained-chart');
  var $orderChart = document.querySelector('#order-chart');

  var gainedChartOptions;
  var orderChartOptions;

  var gainedChart;
  var orderChart;



  // On load Toast
  // setTimeout(function () {
  //   toastr['success'](
  //     'You have successfully logged in to Vuexy. Now you can start to explore!',
  //     '👋 Welcome ' + window.User.name + ' !',
  //     {
  //       closeButton: true,
  //       tapToDismiss: false
  //     }
  //   );
  // }, 2000);


   // Subscribed Gained Chart
  // ----------------------------------

  gainedChartOptions = {
    chart: {
      height: 100,
      type: 'area',
      toolbar: {
        show: false
      },
      sparkline: {
        enabled: true
      },
      grid: {
        show: false,
        padding: {
          left: 0,
          right: 0
        }
      }
    },
    colors: [window.colors.solid.primary],
    dataLabels: {
      enabled: false
    },
    stroke: {
      curve: 'smooth',
      width: 2.5
    },
    fill: {
      type: 'gradient',
      gradient: {
        shadeIntensity: 0.9,
        opacityFrom: 0.7,
        opacityTo: 0.5,
        stops: [0, 80, 100]
      }
    },
    series: [
      {
        name: 'Subscribers',
        data: [28, 40, 36, 52, 38, 60, 55]
      }
    ],
    xaxis: {
      labels: {
        show: false
      },
      axisBorder: {
        show: false
      }
    },
    yaxis: [
      {
        y: 0,
        offsetX: 0,
        offsetY: 0,
        padding: { left: 0, right: 0 }
      }
    ],
    tooltip: {
      x: { show: false }
    }
  };
  gainedChart = new ApexCharts($gainedChart, gainedChartOptions);
  gainedChart.render();

  // Order Received Chart
  // ----------------------------------

  orderChartOptions = {
    chart: {
      height: 100,
      type: 'area',
      toolbar: {
        show: false
      },
      sparkline: {
        enabled: true
      },
      grid: {
        show: false,
        padding: {
          left: 0,
          right: 0
        }
      }
    },
    colors: [window.colors.solid.warning],
    dataLabels: {
      enabled: false
    },
    stroke: {
      curve: 'smooth',
      width: 2.5
    },
    fill: {
      type: 'gradient',
      gradient: {
        shadeIntensity: 0.9,
        opacityFrom: 0.7,
        opacityTo: 0.5,
        stops: [0, 80, 100]
      }
    },
    series: [
      {
        name: 'Orders',
        data: [10, 15, 8, 15, 7, 12, 8]
      }
    ],
    xaxis: {
      labels: {
        show: false
      },
      axisBorder: {
        show: false
      }
    },
    yaxis: [
      {
        y: 0,
        offsetX: 0,
        offsetY: 0,
        padding: { left: 0, right: 0 }
      }
    ],
    tooltip: {
      x: { show: false }
    }
  };
  orderChart = new ApexCharts($orderChart, orderChartOptions);
  orderChart.render();   

  // Bar Chart
  // --------------------------------------------------------------------
    var barChartOptions = {
      chart: {
        height: 400,
        type: 'bar',
        parentHeightOffset: 0,
        toolbar: {
          show: false
        },
        stacked: true
      },
      plotOptions: {
        bar: {
          horizontal: true,
          // barHeight: '30%',
          // endingShape: 'rounded'
        }
      },
      grid: {
        xaxis: {
          lines: {
            show: false
          }
        },
        padding: {
          top: -15,
          bottom: -10
        }
      },
      colors: window.colors.solid.info,
      dataLabels: {
        enabled: false
      },
      series: [{
        name: 'Hours worked',
        data: []
      }, {
        name: 'Over Time',
        data: []
      }],
      tooltip: {
        y: {
          formatter: function(value, { series, seriesIndex, dataPointIndex, w }) {
            var time = moment('00:00', 'HH:mm').add(value, 'hours').format("HH[h]mm[min]");

            return time
          }
        }
      },
      xaxis: {
        categories: [],
        labels: {
          formatter: function (value) {
            if(value === 0) {
              return value;
            }
            
            var time = moment('00:00', 'HH:mm').add(value, 'hours').format("HH[h]mm[min]");

            return time;
          }
        }
      },
      // yaxis: {
      //   opposite: isRtl,
        
      // }
    };

    var barChartOptions2 = {
      series: [{
        data: []
      }, {
        data: []
      }],
        chart: {
        type: 'bar',
        height: 430
      },
      plotOptions: {
        bar: {
          horizontal: true,
          dataLabels: {
            position: 'top',
          },
        }
      },
      dataLabels: {
        enabled: false,
        offsetX: -6,
        style: {
          fontSize: '12px',
          colors: ['#fff']
        }
      },
      stroke: {
        show: true,
        width: 1,
        colors: ['#fff']
      },
      tooltip: {
        shared: true,
        intersect: false,
        y: {
          formatter: function(value, { series, seriesIndex, dataPointIndex, w }) {
            var time = moment('00:00', 'HH:mm').add(value, 'hours').format("HH[h]mm[min]");

            return time
          }
        }
      },
      xaxis: {
        categories: [],
        labels: {
          formatter: function (value) {
            if(value === 0) {
              return value;
            }
            
            var time = moment('00:00', 'HH:mm').add(value, 'hours').format("HH[h]mm[min]");

            return time;
          }
        }
      }
    };
  

  var barChartEl = document.querySelector('#bar-chart');
  var barChart = new ApexCharts(barChartEl, barChartOptions2);
  barChart.render();  

  // Init flatpicker
  var startDate = new Date();
  var endDate = new Date( new Date().setDate(new Date().getDate() + 7) );

  if (flatPicker.length) {    
    flatPicker.each(function () {
      $(this).flatpickr({
        mode: 'range',
        defaultDate: [startDate, endDate],
        dateFormat: 'd-m-Y',
        onChange: function(selectedDates, dateStr, instance) {
          getStaffTotalHours(selectedDates[0], selectedDates[1], barChart);
        }
      });
    });
  }

  if (typeof barChartEl !== undefined && barChartEl !== null) {
    getStaffTotalHours(startDate, endDate, barChart);
  }

  function getStaffTotalHours(startDate, endDate, barChart) {
    $.ajax({
      url: assetPath + 'staff/total-hours',
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      },
      type: 'POST',
      data: { 
        start: moment(startDate).format('YYYY-MM-DD'), 
        end: moment(endDate).format('YYYY-MM-DD') 
      },
      success: function(response) {
        var response_data = response.data;

        var staff_hours_worked = response_data.hours_worked;

        console.log(response_data.hours_worked, response_data.over_time)

        barChart.updateOptions({
          xaxis: {
            categories: response_data.dates
          },
          series: [{
            name: 'Hours worked',
            data: response_data.hours_worked
          }, {
            name: 'Over Time',
            data: response_data.over_time
          }]
        });

        var total_hours_worked = staff_hours_worked.length > 0 ? staff_hours_worked.reduce(function(a, b) { return parseFloat(a) + parseFloat(b); }) : 0;
        var total_hours_worked_time = moment('00:00:00', 'HH:mm:ss').add(total_hours_worked, 'hours').format('HH[h]mm[min]')
        
        $('.total-hours-worked').text(total_hours_worked_time);                
      }
    });
  }
});
