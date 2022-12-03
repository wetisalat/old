$(window).on('load', function () {
  'use strict';

  var flatPicker = $('.flat-picker'),
    chartColors = {
      donut: {
        series1: '#ffe700',
        series2: '#00d4bd',
        series3: '#826bf8',
        series4: '#2b9bf4',
        series5: '#FFA1A1'
      }
    };
  
    var $barColor = '#f3f3f3';
    var $textMutedColor = '#b9b9c3';
    var $statisticsOrderChart = document.querySelector('#statistics-order-chart');
    var $earningsChart = document.querySelector('#earnings-chart');
    var $revenueReportChart = document.querySelector('#revenue-report-chart');
    var $earningsStrokeColor2 = '#28c76f66';
    var $earningsStrokeColor3 = '#28c76f33';
    var statisticsOrderChartOptions;

    var revenueReportChartOptions;
    var $earningsChart = document.querySelector('#earnings-chart');
    var revenueReportChart;
    var earningsChartOptions;
    var statisticsOrderChart;

    var earningsChart;

   // On load Toast
  //  setTimeout(function () {
  //   toastr['success'](
  //     'You have successfully logged in to Vuexy. Now you can start to explore!',
  //     '👋 Welcome John Doe!',
  //     {
  //       closeButton: true,
  //       tapToDismiss: false
  //     }
  //   );
  // }, 2000);   

  // Init flatpicker
  if (flatPicker.length) {
    var date = new Date();
    flatPicker.each(function () {
      $(this).flatpickr({
        mode: 'range',
        defaultDate: ['2019-05-01', '2019-05-10']
      });
    });
  }

  //--------------- Earnings Chart ---------------
  //----------------------------------------------
  earningsChartOptions = {
    chart: {
      type: 'donut',
      height: 120,
      toolbar: {
        show: false
      }
    },
    dataLabels: {
      enabled: false
    },
    series: [Admin_Dashboard_Data.active_perc, Admin_Dashboard_Data.inactive_perc],
    legend: { show: false },
    comparedResult: [2, -3, 8],
    labels: ['Active', 'Not Active'],
    stroke: { width: 0 },
    colors: [$earningsStrokeColor2, $earningsStrokeColor3, window.colors.solid.success],
    grid: {
      padding: {
        right: -20,
        bottom: -8,
        left: -20
      }
    },
    plotOptions: {
      pie: {
        startAngle: -10,
        donut: {
          labels: {
            show: true,
            name: {
              offsetY: 15
            },
            value: {
              offsetY: -15,
              formatter: function (val) {
                return parseInt(val) + '%';
              }
            },
            total: {
              show: true,
              offsetY: 15,
              label: 'Active',
              formatter: function (w) {
                return w.config.series[0] + '%';
              }
            }
          }
        }
      }
    },
    responsive: [
      {
        breakpoint: 1325,
        options: {
          chart: {
            height: 100
          }
        }
      },
      {
        breakpoint: 1200,
        options: {
          chart: {
            height: 120
          }
        }
      },
      {
        breakpoint: 1045,
        options: {
          chart: {
            height: 100
          }
        }
      },
      {
        breakpoint: 992,
        options: {
          chart: {
            height: 120
          }
        }
      }
    ]
  };
  earningsChart = new ApexCharts($earningsChart, earningsChartOptions);
  earningsChart.render(); 
  
  
    //------------ Statistics Bar Chart ------------
  //----------------------------------------------
  statisticsOrderChartOptions = {
    chart: {
      height: 70,
      type: 'bar',
      stacked: true,
      toolbar: {
        show: false
      }
    },
    grid: {
      show: false,
      padding: {
        left: 0,
        right: 0,
        top: -15,
        bottom: -15
      }
    },
    plotOptions: {
      bar: {
        horizontal: false,
        columnWidth: '20%',
        startingShape: 'rounded',
        colors: {
          backgroundBarColors: [$barColor, $barColor, $barColor, $barColor, $barColor],
          backgroundBarRadius: 5
        }
      }
    },
    legend: {
      show: false
    },
    dataLabels: {
      enabled: false
    },
    colors: [window.colors.solid.warning],
    series: [
      {
        name: '2020',
        data: [45, 85, 65, 45, 65]
      }
    ],
    xaxis: {
      labels: {
        show: false
      },
      axisBorder: {
        show: false
      },
      axisTicks: {
        show: false
      }
    },
    yaxis: {
      show: false
    },
    tooltip: {
      x: {
        show: false
      }
    }
  };

  if (typeof $statisticsOrderChart !== undefined && $statisticsOrderChart !== null) {
    statisticsOrderChart = new ApexCharts($statisticsOrderChart, statisticsOrderChartOptions);
    statisticsOrderChart.render();
  }

    //------------ Revenue Report Chart ------------
  //----------------------------------------------
  revenueReportChartOptions = {
    chart: {
      height: 230,
      stacked: true,
      type: 'bar',
      toolbar: { show: false }
    },
    plotOptions: {
      bar: {
        columnWidth: '17%',
        endingShape: 'rounded'
      },
      distributed: true
    },
    colors: [window.colors.solid.primary, window.colors.solid.warning],
    series: [
      {
        name: 'Subscriptions',
        data: Admin_Dashboard_Data.subscriptions_list
      },
      {
        name: 'Cancelled Subscriptions',
        data: Admin_Dashboard_Data.cancelled_subscriptions_list
      }
    ],
    dataLabels: {
      enabled: false
    },
    legend: {
      show: false
    },
    grid: {
      padding: {
        top: -20,
        bottom: -10
      },
      yaxis: {
        lines: { show: false }
      }
    },
    xaxis: {
      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
      labels: {
        style: {
          colors: $textMutedColor,
          fontSize: '0.86rem'
        }
      },
      axisTicks: {
        show: false
      },
      axisBorder: {
        show: false
      }
    },
    yaxis: {
      labels: {
        style: {
          colors: $textMutedColor,
          fontSize: '0.86rem'
        },
        formatter: function(val) {
          return Math.floor(val)
        }
      }
    }
  };
  revenueReportChart = new ApexCharts($revenueReportChart, revenueReportChartOptions);
  revenueReportChart.render();

  // Donut Chart
  // --------------------------------------------------------------------
  var donutChartLabels = ['Subscriptions', 'Cancelled', 'Verified', 'Unverified'];
  var donutChartSeries = [Admin_Dashboard_Data.total_subscriptions, Admin_Dashboard_Data.total_subscriptions_cancelled, Admin_Dashboard_Data.active_perc, Admin_Dashboard_Data.inactive_perc];
  var donutChartSeriesCopy = Array.from(donutChartSeries).sort(function(a, b) { return b - a; } );
  var donutChartTopValueIndex = donutChartSeries.findIndex(function(s) { return s === donutChartSeriesCopy[0] });
  
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
      series: donutChartSeries,
      colors: [
        chartColors.donut.series1,
        chartColors.donut.series5,
        chartColors.donut.series3,
        chartColors.donut.series2
      ],
      dataLabels: {
        enabled: true,
        formatter: function (val, opt) {
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
                  return parseInt(val) + '%';
                }
              },
              total: {
                show: true,
                fontSize: '1.5rem',
                label: donutChartLabels[donutChartTopValueIndex],
                formatter: function (w) {
                  return donutChartSeriesCopy[0] + '%';
                }
              }
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
      ]
    };
  if (typeof donutChartEl !== undefined && donutChartEl !== null) {
    var donutChart = new ApexCharts(donutChartEl, donutChartConfig);
    donutChart.render();
  }
});
