$(function () {
    ;('use strict')

    // On edit address click, update text of add address modal
    var addressEdit = $('.edit-address'),
        addressTitle = $('.address-title'),
        addressSubTitle = $('.address-subtitle'),
        newStaffForm = $('.add-new-staff'),
        newStaffinfoForm = $('.add-staff-info')

    addressEdit.on('click', function () {
        addressTitle.text('Edit Address') // reset text
        addressSubTitle.text('Edit your current address')
    })

    // Form Validation
    if (newStaffForm.length) {
        newStaffForm.validate({
            errorClass: 'error',
            rules: {
                'staff-gender': {
                    required: true
                },
                'staff-usernamen': {
                    required: true
                },
                'staff-firstname': {
                    required: true
                },
                'staff-lastname': {
                    required: true
                },
                'staff-email': {
                    required: true
                },
                'staff-phone': {
                    required: true
                },
            }
        })

        newStaffForm.on('submit', function (e) {
            var isValid = newStaffForm.valid()
            e.preventDefault()
            if (isValid) {
                e.currentTarget.submit();
                //newUserSidebar.modal('hide')
            }
        })
    }

    // Form Validation info
    if (newStaffinfoForm.length) {
        newStaffinfoForm.validate({
            errorClass: 'error',
            rules: {
                'info-birthday': {
                    required: true
                },
                'info-placebirth': {
                    required: true
                },
                'info-nationality': {
                    required: true
                },
                'info-nin': {
                    required: true
                },
                'info-address': {
                    required: true
                },
                'info-postcode': {
                    required: true
                },
                'info-city': {
                    required: true
                },
            }
        })

        newStaffinfoForm.on('submit', function (e) {
            var isValid = newStaffinfoForm.valid()
            e.preventDefault()
            if (isValid) {
                e.currentTarget.submit();
                //newUserSidebar.modal('hide')
            }
        })
    }
})
