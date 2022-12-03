
$(document).ready(function () {
    $(".select2").select2();
});

$(function () {
    'use strict';

    var rowCount = 1;

    $('.addnew').on('click', function () {
        rowCount++;

        var html = '';
        html += '<div class="row" id="rowId'+ rowCount +'">' +
            '<div class="col-md-4 col-12 pr-4">' +
            '<div class="mb-1 mySelect">' +
            '<label class="form-label" for="lunch">Select a type</label>' +
            '<select class="select2 form-select" multiple name="select_type[]" id="selectType'+ rowCount +'">' +
            '<optgroup label="Lunch">' +
            '<option value="lun_1" selected>Lunch</option>' +
            '<option value="lun_2">Lunch 2</option>' +
            '<option value="lun_3">Lunch 3</option>' +
            '<option value="lun_4">Lunch 4</option>' +
            '</optgroup>' +
            '<optgroup label="Vacation">' +
            '<option value="vac_1">Vacation</option>' +
            '<option value="vac_2">Vacation 2</option>' +
            '<option value="vac_3">Vacation 3</option>' +
            '<option value="vac_4">Vacation 4</option>' +
            '</optgroup>' +
            '<optgroup label="Extra">' +
            '<option value="ext_1">Extra</option>' +
            '<option value="ext_2">Extra 2</option>' +
            '<option value="ext_3">Extra 3</option>' +
            '<option value="ext_4">Extra 4</option>' +
            '</optgroup>' +
            '</select>' +
            '</div>' +
            '</div>' +

            '<input type="hidden" class="form-control indexNumber" name="row_id[]" id="getRowId" value="'+ rowCount +'" />'+

            '<div class="col-md-2 col-12">' +
            '<div class="mb-1">' +
            '<label class="form-label" for="itemcost'+ rowCount +'">Cost</label>' +
            '<input type="number" class="form-control" id="itemcost'+ rowCount +'" name="cost[]" ' +
            'aria-describedby="itemcost'+ rowCount +'" placeholder="32" onkeyup="calc('+ rowCount +')" />' +
            '</div>' +
            '</div>' +

            '<div class="col-md-2 col-12">' +
            '<div class="mb-1">' +
            '<label class="form-label" for="itemquantity'+ rowCount +'">Quantity</label>' +
            '<input type="number" class="form-control" id="itemquantity'+ rowCount +'" name="quantity[]" ' +
            'aria-describedby="itemquantity'+ rowCount +'" placeholder="1" onkeyup="calc('+ rowCount +')" />' +
            '</div>'+
            '</div>' +


            '<div class="col-md-2 col-12">' +
            '<div class="mb-1">' +
            '<label class="form-label" for="staticprice'+ rowCount +'">Amount</label>' +
            '<input type="text" readonly class="form-control-plaintext" name="amount[]" id="staticprice'+ rowCount +'" placeholder="32€" />' +
            '</div>' +
            '</div>' +


            '<div class="col-md-2 col-12 mb-50">' +
            '<div class="mt-2">' +
            '<button class="btn btn-outline-danger text-nowrap px-1 deleteitem" onclick="deleteItem('+ rowCount +')">' +
            '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"' +
            'class="feather feather-x me-25"> <line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line>' +
            '</svg>' +
            '<span>Delete</span>' +
            '</button>' +
            '</div>' +
            '</div>' +
            '</div>';


        $('select2').select2('destroy');
        $('.append-item').append(html);
        $('.select2').select2();
    })


    // remove item

    $('.append-item').on('click','.deleteitem',function(e){
        e.preventDefault();
        var check = $(this).parent().parent().parent().remove();
    })





    // Add Vacation

    var vrowCount = 1;
    $('.addVacation').on('click', function () {

        vrowCount++;

        var html = '';
        html += '<div class="row" id="rowId'+ vrowCount +'">' +
            '<div class="col-md-4 col-12 pr-4">' +
            '<div class="mb-1 mySelect">' +
            '<label class="form-label" for="vacation">Type</label>' +
            '<select class="select2 form-select" multiple name="vacation[]" id="vacation'+ vrowCount +'">' +
            '<optgroup label="Vacation">' +
            '<option value="1" selected>Vacation</option>' +
            '<option value="2">Vacation 2</option>' +
            '<option value="3">Vacation 3</option>' +
            '<option value="4">Vacation 4</option>' +
            '</optgroup>' +
            '</select>' +
            '</div>' +
            '</div>' +

            '<input type="hidden" class="form-control indexNumber" name="row_id[]" id="getRowId" value="'+ vrowCount +'" />'+

            '<div class="col-md-2 col-12">' +
            '<div class="mt-2">' +
            '<div class="form-check form-switch">' +
            '<input type="checkbox" class="form-check-input" name="paid[]" id="customSwitch'+ vrowCount +'" />' +
            '<label class="form-check-label" for="customSwitch'+ vrowCount +'">Toggle </label>' +
            '</div>' +
            '</div>' +
            '</div>'+


            '<div class="col-md-2 col-12 mb-50">' +
            '<div class="mt-2">' +
            '<button class="btn btn-outline-danger text-nowrap px-1 deleteVacation">' +
            '<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"' +
            'class="feather feather-x me-25"> <line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line>' +
            '</svg>' +
            '<span>Delete</span>' +
            '</button>' +
            '</div>' +
            '</div>' +
            '</div>';


        $('select2').select2('destroy');
        $('.append-vacation').append(html);
        $('.select2').select2();
    })


    // remove item

    $('.append-vacation').on('click','.deleteVacation',function(e){
        e.preventDefault();
        var check = $(this).parent().parent().parent().remove();
    })



    $.ajaxSetup({
        headers:{
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

})


function calc(idx) {
    var amount = parseFloat(document.getElementById("itemcost"+idx).value)*
        parseFloat(document.getElementById("itemquantity"+idx).value);
    document.getElementById("staticprice"+idx).value= isNaN(amount)?"0.00":amount.toFixed(2);
}

window.onload=function() {
    document.getElementsByName("quantity[]")[0].onkeyup=function() {calc(1)};
    document.getElementsByName("cost[]")[0].onkeyup=function() {calc(1)};
}

function submitAllowance(event) {
    var getRowId = document.getElementsByClassName('indexNumber');
    var arr = [...getRowId].map(input => input.value);

    var dataList = [];

    arr.forEach(function (index) {
        var selectType = $('#selectType'+index).val();
        var getAmount = $('#staticprice'+index).val();
        dataList.push({
            select_type : selectType,
            amount: getAmount
        });
    })



    // Submit Data

    $.ajax({
        type:'POST',
        url:'/settings/store-allowance',
        data: {data: dataList},
        success:function(response){

            var error = response.error;
            if(error.length > 0){

                alert(error);

            }else {
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
                    window.location.href = "/settings/allowance";
                })
            }
        }
    })
}





function submitVacation(event) {
    var getRowId = document.getElementsByClassName('indexNumber');
    var arr = [...getRowId].map(input => input.value);

    var dataList = [];

    arr.forEach(function (index) {
        var vacation = $('#vacation'+index).val();

        var isChecked = document.getElementById('customSwitch'+index).checked;

        if(vacation.length > 0){
            dataList.push({
                vacation_id : vacation,
                paid: isChecked
            });
        }else {
            alert('Type field is required')
        }

    })



    // Submit Data

    $.ajax({
        type:'POST',
        url:'/settings/store-vacation',
        data: {data: dataList},
        success:function(response){

            var error = response.error;
            if(error.length > 0){

                alert(error);

            }else {
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
                    window.location.href = "/settings/allowance";
                })
            }
        }
    })
}
