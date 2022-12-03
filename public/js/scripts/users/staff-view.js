/*=========================================================================================
    File Name: app-user-view.js
    Description: User View page
    --------------------------------------------------------------------------------------
    Item Name: Vuexy  - Vuejs, HTML & Laravel Admin Dashboard Template
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/
(function () {
    var userId = $("#id").val();

    $(document).ready(function(){
        $.ajaxSetup({
            headers:{
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    });

    const suspendUser = document.querySelector('.suspend-user');

    // Suspend User javascript
    if (suspendUser) {
        suspendUser.onclick = function () {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this staff!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, Suspend this staff!',
                customClass: {
                    confirmButton: 'btn btn-primary',
                    cancelButton: 'btn btn-outline-danger ms-1'
                },
                buttonsStyling: false
            }).then(function (result) {
                if (result.value) {
                    $.ajax({
                        type:'POST',
                        url:'/staff/suspen/account',
                        data:{
                            id: userId
                        },
                        success:function(response){

                            if(response.message === 'success') {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Suspended!',
                                    text: 'Staff has been suspended.',
                                    customClass: {
                                        confirmButton: 'btn btn-success'
                                    }
                                }).then(function (result) {
                                    window.location.reload();
                                })
                            }
                        }
                    });


                } else if (result.dismiss === Swal.DismissReason.cancel) {
                    Swal.fire({
                        title: 'Cancelled',
                        text: 'Cancelled Suspension :)',
                        icon: 'error',
                        customClass: {
                            confirmButton: 'btn btn-success'
                        }
                    });
                }
            });
        };
    }

    //? Billing page have multiple buttons
    // Cancel Subscription alert
    const cancelSubscription = document.querySelectorAll('.cancel-subscription');

    // Alert With Functional Confirm Button
    if (cancelSubscription) {
        cancelSubscription.forEach(cancelBtn => {
            cancelBtn.onclick = function () {
                Swal.fire({
                    text: 'Are you sure you would like to stop this staff ?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    customClass: {
                        confirmButton: 'btn btn-primary',
                        cancelButton: 'btn btn-outline-danger ms-1'
                    },
                    buttonsStyling: false
                }).then(function (result) {
                    if (result.value) {
                        $.ajax({
                            type:'POST',
                            url:'/staff/suspen/account',
                            data:{
                                id: userId
                            },
                            success:function(response){

                                if(response.message === 'success') {
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Unsubscribed!',
                                        text: 'Staff stopped successfully.',
                                        customClass: {
                                            confirmButton: 'btn btn-success'
                                        }
                                    }).then(function (result) {
                                        window.location.reload();
                                    })
                                }
                            }
                        });


                    } else if (result.dismiss === Swal.DismissReason.cancel) {
                        Swal.fire({
                            title: 'Cancelled',
                            text: 'Staff not working for you anymore!!',
                            icon: 'error',
                            customClass: {
                                confirmButton: 'btn btn-success'
                            }
                        });
                    }
                });
            };
        });
    }
})();
