/*=========================================================================================
  File Name: auth-register.js
  Description: Auth register js file.
  ----------------------------------------------------------------------------------------
  Item Name: Vuexy  - Vuejs, HTML & Laravel Admin Dashboard Template
  Author: PIXINVENT123
  Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

$(function () {
    ;('use strict')

    var assetsPath = '../../../app-assets/',
        registerMultiStepsWizard = document.querySelector('.register-multi-steps-wizard'),
        pageResetForm = $('.auth-register-form'),
        select = $('.select2'),
        creditCard = $('.credit-card-mask'),
        expiryDateMask = $('.expiry-date-mask'),
        cvvMask = $('.cvv-code-mask'),
        mobileNumberMask = $('.mobile-number-mask'),
        pinCodeMask = $('.pin-code-mask')

    if ($('body').attr('data-framework') === 'laravel') {
        assetsPath = $('body').attr('data-asset-path')
    }

    // jQuery Validation
    // --------------------------------------------------------------------
    if (pageResetForm.length) {
        pageResetForm.validate({
            /*
            * ? To enable validation onkeyup
            onkeyup: function (element) {
              $(element).valid();
            },*/
            /*
            * ? To enable validation on focusout
            onfocusout: function (element) {
              $(element).valid();
            }, */
            rules: {
                'register-username': {
                    required: true
                },
                'register-email': {
                    required: true,
                    email: true
                },
                'register-password': {
                    required: true
                }
            }
        })
    }

    // multi-steps registration
    // --------------------------------------------------------------------

    // Horizontal Wizard
    if (typeof registerMultiStepsWizard !== undefined && registerMultiStepsWizard !== null) {
        var numberedStepper = new Stepper(registerMultiStepsWizard),
            $form = $(registerMultiStepsWizard).find('form')
        $form.each(function () {
            var $this = $(this)
            $this.validate({
                rules: {
                    name: {
                        required: true
                    },
                    email: {
                        required: true
                    },
                    password: {
                        required: true,
                        minlength: 8
                    },
                    'confirm-password': {
                        required: true,
                        minlength: 8,
                        equalTo: '#password'
                    },
                    'firstname': {
                        required: true
                    },
                    'lastname': {
                        required: true
                    },
                    'address': {
                        required: true
                    },
                    'postcode': {
                        required: true
                    },
                    'city': {
                        required: true
                    },
                    addCardNumber: {
                        required: true
                    },
                    addCardName: {
                        required: true
                    },
                    addCardExpiryDate: {
                        required: true
                    },
                    addCardCvv: {
                        required: true
                    },
                    phone: {
                        required: true
                    }
                },
                messages: {
                    password: {
                        required: 'Enter new password',
                        minlength: 'Enter at least 8 characters'
                    },
                    'confirm-password': {
                        required: 'Please confirm new password',
                        minlength: 'Enter at least 8 characters',
                        equalTo: 'The password and its confirm are not the same'
                    }
                }
            })
        })

        $(registerMultiStepsWizard)
            .find('.btn-next')
            .each(function () {
                $(this).on('click', function (e) {
                    var isValid = $(this).parent().siblings('form').valid()
                    if (isValid) {
                        numberedStepper.next()
                    } else {
                        e.preventDefault()
                    }
                })
            })

        $(registerMultiStepsWizard)
            .find('.btn-prev')
            .on('click', function () {
                numberedStepper.previous()
            })


        var free_plan = document.querySelector('.free_plan');
        var premium = document.querySelector('.premium');

        if (free_plan){
            free_plan.onclick = function (){
                $("#paymentInformation").addClass('d-none');
            }
        }
        if (premium){
            premium.onclick = function (){
                $("#paymentInformation").removeClass('d-none');
            }
        }

        $(document).ready(function(){
            $.ajaxSetup({
                headers:{
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
        });

        $(registerMultiStepsWizard)
            .find('.btn-submit')
            .on('click', function () {
                var isValid = $(this).parent().siblings('form').valid()
                if (isValid) {
                    var inputs = new Object();
                    inputs['name'] = $("#name").val();
                    inputs['phone'] = $("#phone").val();
                    inputs['email'] = $("#email").val();
                    inputs['password'] = $("#password").val();
                    inputs['password_confirmation'] = $("#confirm-password").val();
                    inputs['firstname'] = $("#firstname").val();
                    inputs['lastname'] = $("#lastname").val();
                    inputs['address'] = $("#address").val();
                    inputs['postcode'] = $("#postcode").val();
                    inputs['city'] = $("#city").val();
                    inputs['country'] = $("#country").val();

                    // Plan Information
                    inputs['check'] = $(".check_plan").val();
                    inputs['plan_id'] = $('input[name="Check"]:checked').val();
                    inputs['addCardNumber'] = $("#addCardNumber").val();
                    inputs['addCardName'] = $("#addCardName").val();
                    inputs['addCardExpiryDate'] = $("#addCardExpiryDate").val();
                    inputs['addCardCvv'] = $("#addCardCvv").val();
                    inputs['coupon'] = $("#coupon").val();

                    // disable button
                    $(this).prop("disabled", true);
                    // add spinner to button
                    $(this).html(
                        `<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...`
                    );

                    $.ajax({
                        type:'POST',
                        //url:'/admin/register-user',
                        url:"/register_newuser",
                        data:{inputs},
                        success:function(response){
                            if(response.message === 'success') {
                                console.log(response)
                                window.location.href = 'email/verify';
                            } else {
                                // disable button
                                $(this).prop("disabled", false);
                                // add spinner to button
                                $('span.spinner-border').remove();
                                console.log(response)
                                printErrorMsg(response.error);
                            }
                        }
                    });

                    function printErrorMsg (msg) {

                        if (msg.password){
                            $(".email_errormessage").text(msg.password);
                        }
                        if (msg.email){
                            $(".email_errormessage").text(msg.email);
                        }
                        if (msg.plan_id){
                            $(".plan_errormessage").text(msg.plan_id);
                        }

                    }
                }
            })
    }

    // select2
    select.each(function () {
        var $this = $(this)
        $this.wrap('<div class="position-relative"></div>')
        $this.select2({
            // the following code is used to disable x-scrollbar when click in select input and
            // take 100% width in responsive also
            dropdownAutoWidth: true,
            width: '100%',
            dropdownParent: $this.parent()
        })
    })

    // credit card

    // Credit Card
    if (creditCard.length) {
        creditCard.each(function () {
            new Cleave($(this), {
                creditCard: true,
                onCreditCardTypeChanged: function (type) {
                    const elementNodeList = document.querySelectorAll('.card-type')
                    if (type != '' && type != 'unknown') {
                        //! we accept this approach for multiple credit card masking
                        for (let i = 0; i < elementNodeList.length; i++) {
                            elementNodeList[i].innerHTML =
                                '<img src="' + assetsPath + 'images/icons/payments/' + type + '-cc.png" height="24"/>'
                        }
                    } else {
                        for (let i = 0; i < elementNodeList.length; i++) {
                            elementNodeList[i].innerHTML = ''
                        }
                    }
                }
            })
        })
    }

    // Expiry Date Mask
    if (expiryDateMask.length) {
        new Cleave(expiryDateMask, {
            date: true,
            delimiter: '/',
            datePattern: ['m', 'y']
        })
    }

    // CVV
    if (cvvMask.length) {
        new Cleave(cvvMask, {
            numeral: true,
            numeralPositiveOnly: true
        })
    }

    // phone number mask
    if (mobileNumberMask.length) {
        new Cleave(mobileNumberMask, {
            phone: true,
            phoneRegionCode: 'US'
        })
    }

    // Pincode
    if (pinCodeMask.length) {
        new Cleave(pinCodeMask, {
            delimiter: '',
            numeral: true
        })
    }

    // multi-steps registration
    // --------------------------------------------------------------------
})
