$(function () {
    'use strict';

    var newUserForm = $('.add-new-user'),
        submitExtraData = $('#submitExtraData'),
        updateExtraData = $('#updateExtraData'),
        extraType = $('#extraType'),
        extraName = $('#extraName'),
        extraNameDropdown = $('#extraNameDropdown'),
        extraAmount = $('#extraAmount');


    // Form Validation
    if (newUserForm.length) {
        newUserForm.validate({
            errorClass: 'error',
            rules: {
                'firstname': {
                    required: true
                },
                'lastname': {
                    required: true
                },
                'qualification': {
                    required: true
                }
            }
        });

        newUserForm.on('submit', function (e) {
            var isValid = newUserForm.valid();
            //e.preventDefault();
            if (isValid) {
                //newUserSidebar.modal('hide');
                return true;
            }
        });
    }

    // To initialize tooltip with body container
    $('body').tooltip({
        selector: '[data-toggle="tooltip"]',
        container: 'body'
    });

    $(".delete-record").on('click',function () {
        alert("sdfs");
    });

    $(".add_new_extra").on('click', function (){
        // $("#exampleModalLabel").text('Create new role');

        $("#submitExtraData").removeClass('d-none');
        $("#updateExtraData").addClass('d-none');

        $("#extraDataForm")[0].reset();

        $('#addNewCardTitle').text('Add New Extra');

    });

    $(document).ready(function() {
        // Calculation Working Time

        var myForm = document.forms.addShift;

        window.calculate = function (){

            var getStartTime = start_time.value;
            var getendTime = endTime.value;

            var toDayDate = moment(new Date()).format("MM-DD-YYYY");
            var startDate = new Date(`${toDayDate} ${getStartTime}`);
            var endDate = new Date(`${toDayDate} ${getendTime}`);

            var timeDiff = Math.abs(startDate.getTime() - endDate.getTime());

            var hh = Math.floor(timeDiff / 1000 / 60 / 60);
            hh = ('0' + hh).slice(-2)

            timeDiff -= hh * 1000 * 60 * 60;
            var mm = Math.floor(timeDiff / 1000 / 60);
            mm = ('0' + mm).slice(-2)

            if (getendTime !== ''){
                workintTime.value = hh + ":" + mm;
            }
        }


        extraNameDropdown.hide();

        extraType.change(function(e) {
            var type = this.value;

            if(type === 'lunch') {                
                extraName.hide();
                extraNameDropdown.show();
            } else {
                extraNameDropdown.hide();
                extraName.show();
            }
        });

        $.ajaxSetup({
            headers:{
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        // Submit Extra Data
        if (submitExtraData.length) {
            submitExtraData.click(function (e) {

                e.preventDefault();

                var formData = $(this).closest('form').serializeArray();

                $.ajax({
                    type:'POST',
                    url:'/settings/add-extra',
                    data: formData,
                    success:function(response){
                        if (response.success) {
                            Swal.fire({
                                position: 'top-end',
                                icon: 'success',
                                title: response.success,
                                showConfirmButton: false,
                                timer: 1500,
                                customClass: {
                                    confirmButton: 'btn btn-primary'
                                },
                                buttonsStyling: false
                            }).then((response) => {
                                window.location.href = "/settings/extra";
                            })
                        }
                    }
                });
            })
        }

    });




    // update mathod

    if (updateExtraData.length){
        updateExtraData.click(function (){

            var formData = $(this).closest('form').serialize();

            $.ajax({
                type:'POST',
                url:'/settings/update-extra',
                data: formData,
                success:function(response){
                    if (response.success){
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: response.success,
                            showConfirmButton: false,
                            timer: 1500,
                            customClass: {
                                confirmButton: 'btn btn-primary'
                            },
                            buttonsStyling: false
                        }).then((response) => {
                            window.location.href = "/settings/extra";
                        })
                    }
                }
            });
        })
    }
});

function editExtraDetails(extraId, type) {

    if(type === 'lunch') {                
        $('#extraName').hide();
        $('#extraNameDropdown').show();
    } else {
        $('#extraNameDropdown').hide();
        $('#extraName').show();
    }

    $('#addNewCardTitle').text('Update Extra');

    $.ajax({
        type: 'GET',
        url: '/settings/extra/edit/'+extraId,
        data: { type },
        success: function (response) {

            if (response.extra) {
                $('#extraType').val(type);
                $("#modals-slide-in").modal('show');

                $("#submitExtraData").addClass('d-none');
                $("#updateExtraData").removeClass('d-none');

                $('#extraId').val(response.extra.id);
                $('#extraName').val(response.extra.name);
                $('#extraAmount').val(response.extra.amount);
                $('#extraNameDropdown').val(response.extra.lunch_id);
            }
        }
    });
}



function removeExtra(extraId, type) {

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
                type: 'GET',
                url: '/settings/extra/delete/' + extraId,
                data: { type },
                success: function (response) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Deleted!',
                        text: 'Extra deleted successfully.',
                        customClass: {
                            confirmButton: 'btn btn-success'
                        }
                    }).then((result) => {
                        window.location.href = "/settings/extra";
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
