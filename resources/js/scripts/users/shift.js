$(function () {
    'use strict';

    var newUserForm = $('.add-new-user'),
        submitShiftData = $('#submitShiftData'),
        updateShiftData = $('#updateShiftData'),
        shiftName = $('#shiftName'),
        startTime = $('#startTime'),
        endingTime = $('#endingTime'),
        breakTime = $('#breakTime'),
        workingTime = $('#workingTime');


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

    $(".add-new").on('click', function (){
        $("#exampleModalLabel").text('Create new role');

        $("#submitShiftData").removeClass('d-none');
        $("#updateShiftData").addClass('d-none');

        $(".add-new-user")[0].reset();

    })



    $(document).ready(function(){
        // Calculation Working Time

        var myForm = document.forms.addShift,
            start_time = myForm.start_time,
            endTime = myForm.ending_time,
            breakTime = myForm.break_time,
            workintTime = myForm.working_time;

        window.calculate = function (){

            var getStartTime = start_time.value;
            var getendTime = endTime.value;

            // Break Time
            var breakDuration = breakTime.value;
            var bTime = 0;
            if(breakDuration !== ''){
                var numb = breakDuration.match(/\d/g);
                numb = numb.join("");
                bTime += +numb;
            }

            var rsult = bTime * 60000;

            var toDayDate = moment(new Date()).format("MM DD YYYY");
            var startDate = new Date(`${toDayDate} ${getStartTime}`);
            var endDate = new Date(`${toDayDate} ${getendTime}`);
            var timeDiff1 = Math.abs(startDate.getTime() - endDate.getTime());
            var timeDiff = timeDiff1 - rsult;
            var hh = Math.floor(timeDiff / 1000 / 60 / 60);
            hh = ('0' + hh).slice(-2)
            timeDiff -= hh * 1000 * 60 * 60;
            var mm = Math.floor(timeDiff / 1000 / 60);
            mm = ('0' + mm).slice(-2)
            if (getendTime !== ''){
                workintTime.value = hh + ":" + mm;
            }
        }



        $.ajaxSetup({
            headers:{
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    });


// Submit Shift Data
    if (submitShiftData.length){
        submitShiftData.click(function (){

            var name = shiftName.val();
            var start_time = startTime.val();
            var end_time = endingTime.val();
            var break_time = breakTime.val();

            var working_time = workingTime.val();

            $.ajax({
                type:'POST',
                url:'/settings/add-shift',
                data:{name:name, start_time:start_time, end_time:end_time, working_time:working_time, break_time: break_time },
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
                            window.location.href = "/settings/shift";
                        })
                    }
                }
            });
        })
    }


    // update mathod

    if (updateShiftData.length){
        updateShiftData.click(function (){

            var id = $('#shiftId').val();
            var name = shiftName.val();
            var start_time = startTime.val();
            var end_time = endingTime.val();
            var working_time = workingTime.val();
            var break_time = breakTime.val();

            $.ajax({
                type:'POST',
                url:'/settings/update-shift',
                data:{id:id, name:name, start_time:start_time, end_time:end_time, working_time:working_time, break_time: break_time },
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
                            window.location.href = "/settings/shift";
                        })
                    }
                }
            });
        })
    }
});

function editShiftDetails(shiftId){

    $.ajax({
        type: 'GET',
        url: '/settings/shift/edit/'+shiftId,
        data: {shiftId},
        success: function (response) {

            if (response.shift){
                $("#modals-slide-in").modal('show');
                $("#submitShiftData").addClass('d-none');
                $("#updateShiftData").removeClass('d-none');
                $('#shiftId').val(response.shift.id);
                $('#shiftName').val(response.shift.name);
                $('#startTime').val(response.shift.start_time);
                $('#endingTime').val(response.shift.end_time)
                $('#workingTime').val(response.shift.working_time);
                $('#breakTime').val(response.shift.break_time);
                $("#exampleModalLabel").text("Update Shift");
            }
        }
    });
}



function removeshift(shiftId) {

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
                url: '/settings/shift/delete_staff/' + shiftId,
                success: function (response) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Deleted!',
                        text: 'Your file has been deleted.',
                        customClass: {
                            confirmButton: 'btn btn-success'
                        }
                    }).then((result) => {
                        window.location.href = "/settings/shift";
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
