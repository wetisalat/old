$(function () {
    'use strict';

    var dtLocationTable = $('.locations-list-table'),
        assetPath = '../../../app-assets/';

    if ($('body').attr('data-framework') === 'laravel') {
        assetPath = $('body').attr('data-asset-path');
    }
    // datatable
    if (dtLocationTable.length) {
        console.log('loc table')
        var dtInvoice = dtLocationTable.DataTable({
            //ajax: assetPath + 'data/location-list.json', // JSON file to add data
            ajax:
                {
                    url: '/settings/location/listajax',
                    type: 'GET',
                },
            autoWidth: false,
            columns: [
                // columns according to JSON
                { data: 'responsive_id' },
                { data: 'location_name' },
                { data: 'address' },
                { data: 'staff' },
                { data: 'status' },
                { data: '' }
            ],
            columnDefs: [
                {
                    // For Responsive
                    className: 'control',
                    responsivePriority: 2,
                    targets: 0
                },

                {
                    // Location name
                    targets: 1,
                    width: '175px',
                    render: function (data, type, full, meta) {
                        var $name = full['name'];
                        return '<span class="d-none">' + $name + '</span>' + $name;
                    }
                },
                {
                    // Address
                    targets: 2,
                    responsivePriority: 4,
                    width: '275px',
                    render: function (data, type, full, meta) {
                        var $address = full['address'],
                            $code = full['postcode'],
                            $city = full['city'];
                        return $address + ', ' + $code + ' ' + $city;
                    }
                },

                {
                    // Staff
                    targets: 3,
                    width: '250px',
                    render: function (data, type, full, meta) {
                        var $dueDate = full['staff_id'];
                        var moreStaff = full['moreStaff'];

                        //console.log(full.staffArr.length);
                        var staffHtml = '<div class="avatar-group">';
                        if(moreStaff > 0){
                            var loopLength = 3;
                        }else{
                            var loopLength = full.staffArr.length;
                        }
                        if(full.staffArr.length > 0){
                            for (var i = 0; i < loopLength; i++) {
                                if(full.staffArr[i] !== null) {
                                    var staffFirstName = full.staffArr[i]['firstname'];
                                    var staffLastName = full.staffArr[i]['lastname'];
                                    var staffName = full.staffArr[i]['name'];
                                    var stfName = full.staffArr[i]['stfName'];
                                    var stfAvatar = full.staffArr[i]['profile_photo_url'];

                                    staffHtml += '<div data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" ' +
                                        'title="'+staffFirstName + ' ' +staffLastName +' " data-bs-original-title="'+staffFirstName + ' ' +staffLastName +'" class="avatar pull-up my-o" >' +
                                        '<span class="avatar-content"><img src="'+ stfAvatar +'" alt="'+staffName+'" width="30px"></span>' +
                                        '</div>';
                                }
                            }
                            if(moreStaff > 0){
                                staffHtml += '<h6 class="align-self-center cursor-pointer ml-50 mb-0">+'+moreStaff+'</h6></div>';
                            }
                        }else{
                            staffHtml += '---</div>';
                        }


                        return staffHtml;
                    }
                },
                {
                    // User Status
                    targets: 4,
                    render: function (data, type, full, meta) {
                        var $status = full['status']

                        if($status == 1){
                            return (
                                '<span class="badge rounded-pill badge-light-success"> Active </span>'
                            )
                        }

                        if($status == 0){
                            return (
                                '<span class="badge rounded-pill badge-light-danger"> Inactive </span>'
                            )
                        }
                    }
                },
                {
                    // Actions
                    targets: -1,
                    title: 'Actions',
                    width: '50px',
                    orderable: false,
                    render: function (data, type, full, meta) {
                        return (
                            '<div class="btn-group mt-0">' +
                            '<a class="btn btn-sm dropdown-toggle hide-arrow" data-bs-toggle="dropdown">' +
                            feather.icons['more-vertical'].toSvg({ class: 'font-small-4' }) +
                            '</a>' +
                            '<div class="dropdown-menu dropdown-menu-end">' +
                            '<a onclick="changeLocationStatus(' + full['id'] + ');" href="javascript:void(0);" class="dropdown-item edit-location">' +
                            feather.icons['edit'].toSvg({class: 'font-small-4 me-50'}) +
                            'Change Status</a>' +
                            '<a onclick="editStaffDetails(' + full['id'] + ');" href="javascript:void(0);" class="dropdown-item edit-location">' +
                            feather.icons['archive'].toSvg({class: 'font-small-4 me-50'}) +
                            'Edit</a>' +
                            '<a href="javascript:;" onclick="removelocation(' + full['id'] + ');" class="dropdown-item delete-record">' +
                            feather.icons['trash-2'].toSvg({class: 'font-small-4 me-50'}) +
                            'Delete</a>' +
                            '</div>' +
                            '</div>'
                        );
                    }
                }
            ],
            searching: false,
            paging: false,
            info:false,
            order: [[1, 'desc']],
            dom:
                '<"row d-flex justify-content-between align-items-center m-1"' +
                '<"col-lg-6 d-flex align-items-center"l<"dt-action-buttons text-xl-right text-lg-left text-lg-right text-left "B>>' +
                '<"col-lg-6 d-flex align-items-center justify-content-lg-end flex-lg-nowrap flex-wrap pr-lg-1 p-0"f<"invoice_status ml-sm-2">>' +
                '>t' +
                '<"d-flex justify-content-between mx-2 row"' +
                '<"col-sm-12 col-md-6"i>' +
                '<"col-sm-12 col-md-6"p>' +
                '>',
            language: {
                sLengthMenu: 'Show _MENU_',
                search: 'Search',
                searchPlaceholder: 'Search',
                paginate: {
                    // remove previous & next text from pagination
                    previous: '&nbsp;',
                    next: '&nbsp;'
                }
            },

            // For responsive popup
            responsive: {
                details: {
                    display: $.fn.dataTable.Responsive.display.modal({
                        header: function (row) {
                            var data = row.data();
                            return 'Details of ' + data['client_name'];
                        }
                    }),
                    type: 'column',
                    renderer: $.fn.dataTable.Responsive.renderer.tableAll({
                        tableClass: 'table',
                        columnDefs: [
                            {
                                targets: 2,
                                visible: false
                            },
                            {
                                targets: 3,
                                visible: false
                            }
                        ]
                    })
                }
            },
            drawCallback: function () {
                $(document).find('[data-toggle="tooltip"]').tooltip();
            }
        });
    }

    // $('input[name="bonus"]').tagsinput({
    //     trimValue: true,
    //     confirmKeys: [13, 44, 32],
    //     focusClass: 'my-focus-class'
    // });

    // $('.bootstrap-tagsinput input').on('focus', function() {
    //     $(this).closest('.bootstrap-tagsinput').addClass('has-focus');
    // }).on('blur', function() {
    //     $(this).closest('.bootstrap-tagsinput').removeClass('has-focus');
    // });

    $('table').on('mouseenter', '.avatar', function() {
        $(this).tooltip('show');
    })
});


function getCode(id){
    if(id > 0){
        jQuery.ajax({
            url: '/settings/collectivecode',
            type: 'POST',
            data: {id: id},
            success: function(response) {
                //console.log(response.conventioncollective.rule1);
                jQuery('#rules1 .avatar-content').html(response.conventioncollective.rule1+'h');
                jQuery('#rules2 .avatar-content').html(response.conventioncollective.rule2+'h');
                jQuery('#rules3 .avatar-content').html(response.conventioncollective.rule3+'h');
                jQuery('#rules4 .avatar-content').html(response.conventioncollective.rule4);
                jQuery('#rules5 .avatar-content').html(response.conventioncollective.rule5+'h');

                if(response.codedata.length > 0){
                    jQuery('#code_ape').html('');
                    jQuery('#code_ape').append(new Option('XXXXX',0));
                    for (var i = 0; i < response.codedata.length; i++) {
                        jQuery('#code_ape').append(new Option(response.codedata[i].code_ape_id+' - '+response.codedata[i].code_ape_text, response.codedata[i].code_ape_id));
                    }
                }

            }
        });

    }else{
        jQuery('#code_ape').html('');
        jQuery('#code_ape').append(new Option('XXXXX',0));
    }
}

function editStaffDetails(locationId){
    $.ajax({
        type:'POST',
        url:'/settings/location/getlocationdetails',
        data:{locationId},
        success:function(response){
            $(".modal-title").text("Edit Location");
            $("#location_id").val(response.id);
            $("#companies_id").val(response.name);
            $("#immatriculation").val(response.immatriculation);
            $("#medicine").val(response.medicine_id);
            $("#select2-medicine-container").text(response.medicine);
            $("#select2-medicine-result-wud2-"+response.medicine).attr("aria-selected","true");
            $("#address").val(response.address);
            $("#postcode").val(response.postcode);
            $("#city").val(response.city);
            $("#country").val(response.country);
            $("#productivity").val(response.productivity);

            var bonusAtt = response.bonus;
            // $('#bonus').tagsinput('add', bonusAtt);


            var activeTab = response.rules;

            $('#nav-tabs a[href="' + activeTab + '"]').tab('show');
            $('#tabId').html(activeTab);


            $("#conventionId").val(response.conventioncollective_id);

            getCode(response.conventioncollective_id);

            $("#code_ape").val(response.code_ape_id);
            setTimeout(function(){
                $("#code_ape").val(response.code_ape_id);
                var codeCap = $("#code_ape option:selected").text();
                $("#select2-code_ape-container").text(codeCap);

            }, 1000);
            //for (var j = 0; j < response.shift_id.length; j++) {

            $("#locationshift").val(response.shift_id);
            $('select#locationshift').val(response.shift_id)
            $('#locationshift').val(response.shift_id).trigger('change');
            //}

            var convensionName = $("#conventionId option:selected").text();
            $("#select2-conventionId-container").text(convensionName);

            var coutryName = $("#country option:selected").text();
            $("#select2-country-container").text(coutryName);

            $("#shiftdetailsbox").html("");
            for (var i = 0; i < response.shiftData.length; i++) {
                var shiftDiv = '<div class="row d-flex align-items-end"><div class="col-md-4 col-12"><div class="form-group"><label for="shiftname">Shift Name</label><input type="text" class="form-control" id="shiftname" name="shiftname" value="'+response.shiftData[i]['name']+'" aria-describedby="shiftname" placeholder="Shift name" /></div></div><input type="hidden" name="shift_id" id="shift_id" value="'+response.shiftData[i]['id']+'"><div class="col"><div class="form-group"><label for="fp-time-start">Time start</label><input type="text" id="time_start" name="time_start" value="'+response.shiftData[i]['start_time']+'" class="form-control flatpickr-time text-left" placeholder="HH:MM" /></div></div><div class="col"><div class="form-group"><label for="fp-time-end">Time end</label><input type="text" id="time_end" value="'+response.shiftData[i]['end_time']+'" name="time_end" class="form-control flatpickr-time text-left" placeholder="HH:MM" /></div></div><div class="col"><div class="form-group"><button class="btn btn-outline-danger text-nowrap px-1" data-repeater-delete type="button"><i data-feather="trash-2"></i></button></div></div></div><hr />';
                $("#shiftdetailsbox").append(shiftDiv);
            }


            $('#location_modal').modal('show');
            $( "#addnewshiftbtn" ).trigger( "click" );
        }
    });
}

$(document).ready(function(){
    $.ajaxSetup({
        headers:{
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $('.dropdown-menu a').click(function(){
        $('.btn-outline-primary.dropdown-toggle').text($(this).text());
    });

    $('a[data-bs-toggle="tab"]').on('shown.bs.tab', function (e) {
        var currId = $(e.target).attr("href");
        $('#tabId').html(currId);
    })


});



function submitStaffData(){
    $(".accounterrormessage,.personalerrormessage,.contracterrormessage,.salaryerrormessage").text("");

    var locationId = $("#location_id").val();
    var companies_id = $("#companies_id").val();
    var immatriculation = $("#immatriculation").val();
    var medicine = $("#medicine").val();
    var address = $("#address").val();
    var postcode = $("#postcode").val();
    var city = $("#city").val();
    var country = $("#country").val();
    var productivity = $("#productivity").val();
    var convention = $("#conventionId").val();

    var code_ape = $("#code_ape").val();
    var shiftNameArr = [];
    var shiftNames = $("input[name*='shiftname']");
    $.each(shiftNames, function(n, name) {  //i=index, item=element in array
        if($.trim($(name).val()) != ""){
            shiftNameArr[n] = $.trim($(name).val());
        }
    });
    var timeStartArr = [];
    var timeStarts = $("input[name*='time_start']");
    $.each(timeStarts, function(s, start) {  //i=index, item=element in array
        if($.trim($(start).val()) != ""){
            timeStartArr[s] = $.trim($(start).val());
        }
    });
    var timeEndArr = [];
    var timeEnds = $("input[name*='time_end']");
    $.each(timeEnds, function(m, end) {  //i=index, item=element in array
        if($.trim($(end).val()) != ""){
            timeEndArr[m] = $.trim($(end).val());
        }
    });

    var shiftIdArr = [];
    var shiftIds = $("input[name*='shift_id']");
    $.each(shiftIds, function(f, shifid) {  //i=index, item=element in array
        if($.trim($(shifid).val()) != ""){
            shiftIdArr[f] = $.trim($(shifid).val());
        }
    });

    var tabId = document.getElementById('tabId').innerHTML;

    var rules = tabId;
    var shiftIds = $("#locationshift").val();
    var getBonus = $("#bonus").val();

    var locationDetailsArr = new Object();
    locationDetailsArr['locationId'] = locationId;
    locationDetailsArr['companies_id'] = companies_id;
    locationDetailsArr['immatriculation'] = immatriculation;
    locationDetailsArr['medicine'] = medicine;
    locationDetailsArr['address'] = address;
    locationDetailsArr['postcode'] = postcode;
    locationDetailsArr['city'] = city;
    locationDetailsArr['country'] = country;
    locationDetailsArr['productivity'] = productivity;
    locationDetailsArr['shiftIdArr'] = shiftIdArr;
    locationDetailsArr['shiftNameArr'] = shiftNameArr;
    locationDetailsArr['startTimeArr'] = timeStartArr;
    locationDetailsArr['endTimeArr'] = timeEndArr;
    locationDetailsArr['convention'] = convention;
    locationDetailsArr['code_ape'] = code_ape;
    locationDetailsArr['shift_ids'] = shiftIds;
    locationDetailsArr['bonus'] = getBonus;
    locationDetailsArr['rules'] = rules;

    $(".accounterrormessage,.personalerrormessage,.contracterrormessage,.salaryerrormessage").text("");

    $.ajax({
        type:'POST',
        url:'/settings/location/add_update_location',
        data:{locationDetailsArr},
        success:function(response){
            if(response.status == 1) {
                if(locationId > 0){
                    //alert('Location details updated successfully.');
                }else{
                    //alert('Location added successfully.');
                }
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Location added successfully.',
                    showConfirmButton: false,
                    timer: 1500,
                    customClass: {
                        confirmButton: 'btn btn-primary'
                    },
                    buttonsStyling: false
                }).then((response) => {
                    window.location.href = "/settings/location";
                })
            } else {
                if(response.error.errormessage) {
                    $(".accounterrormessage,.personalerrormessage,.contracterrormessage,.salaryerrormessage").text(response.error.errormessage);
                }
            }
        }
    });


}

function removelocation(locationId) {
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
                type: 'POST',
                url: '/settings/location/delete_location',
                data: {locationId},
                success: function (response) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Deleted!',
                        text: 'Your file has been deleted.',
                        customClass: {
                            confirmButton: 'btn btn-success'
                        }
                    }).then((response) => {
                        window.location.href = "/settings/location";
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

$(document).ready(function(){
    $("#addlocationid").click(function(){
        $(".modal-title").text("Add New Location");
        $("#location_id,#immatriculation,#medicine,#address,#postcode,#city,#country,#productivity").val("");
        $("#shiftdetailsbox").html("");
    });
    $("#addnewlocation").click(function(){
        $('#large').modal('show');
    });
});

function changeLocationStatus(locationId) {
    $.ajax({
        type: 'POST',
        url: '/settings/active_desactive',
        data: {locationId},
        success: function (response) {
            Swal.fire({
                icon: 'success',
                title: 'Status Updated!',
                text: 'Location status updated',
                customClass: {
                    confirmButton: 'btn btn-success'
                }
            }).then((response) => {
                window.location.href = "/settings/location";
            });

        }
    });
}
