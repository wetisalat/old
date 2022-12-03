$(function () {
  ('use strict');
  var modernVerticalWizard = document.querySelector('.location-wizard'),
    createAppModal = document.getElementById('locationModal'),
    assetsPath = '../../../app-assets/'


  if ($('body').attr('data-framework') === 'laravel') {
    assetsPath = $('body').attr('data-asset-path');
  }

  // --- location  ----- //
  if (typeof modernVerticalWizard !== undefined && modernVerticalWizard !== null) {
    var modernVerticalStepper = new Stepper(modernVerticalWizard, {
      linear: false
    });

    $(modernVerticalWizard)
      .find('.btn-next')
      .on('click', function () {
        modernVerticalStepper.next();
      });
    $(modernVerticalWizard)
      .find('.btn-prev')
      .on('click', function () {
        modernVerticalStepper.previous();
      });

    $(modernVerticalWizard)
      .find('.btn-submit')
      .on('click', function () {
        alert('Submitted..!!');
      });

    // reset wizard on modal hide
    createAppModal.addEventListener('hide.bs.modal', function (event) {
      modernVerticalStepper.to(1);
    });
  }

  // --- / location ----- //
});
