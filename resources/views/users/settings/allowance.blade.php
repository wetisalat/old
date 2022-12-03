@extends('layouts/contentLayoutMaster')

@section('title', 'Allowance')

@section('vendor-style')
  <!-- vendor css files -->
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
@endsection

@section('content')
  <div class="row">
    <div class="col-12">
      <ul class="nav nav-pills mb-2">
        <!-- Account -->
        <li class="nav-item">
          <a class="nav-link" href="{{asset('settings')}}">
            <i data-feather="user" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Account</span>
          </a>
        </li>
        <!-- security -->
        <li class="nav-item">
          <a class="nav-link" href="{{asset('settings/security')}}">
            <i data-feather="lock" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Security</span>
          </a>
        </li>
        <!-- billing and plans -->
        <li class="nav-item">
          <a class="nav-link" href="{{asset('settings/billing')}}">
            <i data-feather="bookmark" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Billings &amp; Plans</span>
          </a>
        </li>
        <!-- notification -->
        <li class="nav-item">
          <a class="nav-link" href="{{asset('settings/notifications')}}">
            <i data-feather="bell" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Notifications</span>
          </a>
        </li>
        <!-- shift -->
        <li class="nav-item">
          <a class="nav-link" href="{{asset('settings/shift')}}">
            <i data-feather="clock" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Shift</span>
          </a>
        </li>
        <!-- locations -->
        <li class="nav-item">
          <a class="nav-link" href="{{asset('settings/location')}}">
            <i data-feather="map-pin" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Locations</span>
          </a>
        </li>
        <!-- allowance -->
        <li class="nav-item">
          <a class="nav-link active" href="{{asset('settings/allowance')}}">
            <i data-feather="award" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Allowance</span>
          </a>
        </li>
      <!-- extra -->
      <li class="nav-item">
  <a class="nav-link" href="{{asset('settings/extra')}}">
    <i data-feather="sliders" class="font-medium-3 me-50"></i>
    <span class="fw-bold">Extra</span>
  </a>
</li>
    </ul>

      <!-- Allowance repeater -->
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h4 class="card-title">Allowance</h4>
          </div>
          <div class="card-body">

            <form action="#" class="invoice-repeater" onsubmit="return false" name="allowance">

              <div class="row d-flex align-items-end append-item">

                @if(isset($allowances) && count($allowances) > 0)

                @foreach($allowances as $key => $allowance)

                <div class="row" id="rowId1">
                  <div class="col-md-4 col-12">
                    <div class="mb-1 mySelect">

                      @php
                        $lunchId = [];
                          if (isset($allowance->lunch_id)){
                            $lunchId = explode(",", $allowance->lunch_id);
                          }

                        $vacationId = [];
                          if (isset($allowance->vacation_id)){
                            $vacationId = explode(",", $allowance->vacation_id);
                          }
                          
                        $extraId = [];
                          if (isset($allowance->extra_id)){
                            $extraId = explode(",", $allowance->extra_id);
                          }


                      @endphp

                      <label class="form-label" for="lunch">Select a type</label>
                      <select class="select2 form-select" name="select_type[]" multiple id="selectType<?php echo $key; ?>">

                        <optgroup label="Lunch">
                          @foreach($lunches as $lunch)
                          <option value="lun_{{ $lunch->id }}" <?php echo in_array( $lunch->id, $lunchId) ? 'selected' : ''; ?>  >{{ $lunch->name }}</option>
                          @endforeach
                        </optgroup>

                        <optgroup label="vacation">
                          @foreach($vacations as $vac)
                            <option value="vac_{{ $vac->id }}" <?php echo in_array( $vac->id, $vacationId) ? 'selected' : ''; ?>  >{{ $vac->name }}</option>
                          @endforeach
                        </optgroup>

                        <optgroup label="Extra">
                          @foreach($extras as $extra)
                          <option value="ext_{{ $extra->id }}" <?php echo in_array( $extra->id, $extraId) ? 'selected' : ''; ?> >{{ $extra->name }}</option>
                          @endforeach
                        </optgroup>
                      </select>
                    </div>
                  </div>

                  <div class="col-md-2 col-12">
                    <div class="mb-1">
                      <label class="form-label" for="itemcost<?php echo $key; ?>">Cost</label>
                      <input
                              type="number"
                              class="form-control"
                              id="itemcost<?php echo $key; ?>"
                              name="cost[]"
                              value="{{ $allowance->cost }}"
                              aria-describedby="itemcost1"
                              placeholder="32"
                      />
                    </div>
                  </div>

                  <div class="col-md-2 col-12">
                    <div class="mb-1">
                      <label class="form-label" for="itemquantity<?php echo $key; ?>">Quantity</label>
                      <input
                              type="number"
                              class="form-control"
                              id="itemquantity<?php echo $key; ?>"
                              name="quantity[]"
                              value="{{ $allowance->quantity }}"
                              aria-describedby="itemquantity1"
                              placeholder="1"
                      />
                    </div>
                  </div>

                  <div class="col-md-2 col-12">
                    <div class="mb-1">
                      <label class="form-label" for="staticprice<?php echo $key; ?>">Amount</label>
                      <input type="text" readonly class="form-control-plaintext" name="amount[]" value="{{ $allowance->amount }}" id="staticprice<?php echo $key; ?>" placeholder="32€" />
                      <input type="hidden" class="form-control indexNumber" name="row_id[]" id="getRowId" value="<?php echo $key; ?>" />
                      <input type="hidden" class="form-control" name="allowance_id[]" id="allowanceId<?php echo $key; ?>" value="{{ $allowance->id }}" />
                    </div>
                  </div>

                  <div class="col-md-2 col-12 mb-50">
                    <div class="mt-2">
                      <button class="btn btn-outline-danger text-nowrap px-1" onclick="deleteItem(<?php echo $allowance->id; ?>)">
                        <i data-feather="x" class="me-25"></i>
                        <span>Delete</span>
                      </button>
                    </div>
                  </div>
                </div>
                @endforeach
                @else

                  <div class="row" id="rowId1">
                    <div class="col-md-4 col-12">
                      <div class="mb-1 mySelect">


                        <label class="form-label" for="lunch">Select a type</label>
                        <select class="select2 form-select" name="select_type[]" multiple id="selectType1">
                          <optgroup label="Lunch">
                            @foreach($lunches as $lunch)
                              <option value="lun_{{ $lunch->id }}">{{ $lunch->name }}</option>
                            @endforeach
                          </optgroup>

                          <optgroup label="vacation">
                            @foreach($vacations as $vac)
                              <option value="vac_{{ $vac->id }}">{{ $vac->name }}</option>
                            @endforeach
                          </optgroup>

                          <optgroup label="Extra">
                            @foreach($extras as $extra)
                              <option value="ext_{{ $extra->id }}">{{ $extra->name }}</option>
                            @endforeach
                          </optgroup>
                        </select>
                      </div>
                    </div>

                    <div class="col-md-2 col-12">
                      <div class="mb-1">
                        <label class="form-label" for="itemcost1">Cost</label>
                        <input
                                type="number"
                                class="form-control"
                                id="itemcost1"
                                name="cost[]"
                                aria-describedby="itemcost1"
                                placeholder="32"
                        />
                      </div>
                    </div>

                    <div class="col-md-2 col-12">
                      <div class="mb-1">
                        <label class="form-label" for="itemquantity1">Quantity</label>
                        <input
                                type="number"
                                class="form-control"
                                id="itemquantity1"
                                name="quantity[]"
                                aria-describedby="itemquantity1"
                                placeholder="1"
                        />
                      </div>
                    </div>

                    <div class="col-md-2 col-12">
                      <div class="mb-1">
                        <label class="form-label" for="staticprice1">Amount</label>
                        <input type="text" readonly class="form-control-plaintext" name="amount[]" id="staticprice1" placeholder="32€" />
                        <input type="hidden" class="form-control indexNumber" name="row_id[]" id="getRowId" value="1" />
                      </div>
                    </div>

                    <div class="col-md-2 col-12 mb-50">
                      <div class="mt-2">
                        <button class="btn btn-outline-danger text-nowrap px-1 deleteitem">
                          <i data-feather="x" class="me-25"></i>
                          <span>Delete</span>
                        </button>
                      </div>
                    </div>
                  </div>

                @endif

              </div>
              <hr />

              <div class="row mb-2">
                <div class="col-12">
                  <button class="btn btn-icon btn-primary addnew" type="button"><i data-feather="plus" class="me-25"></i>
                    <span>Add New</span>
                  </button>
                </div>
              </div>


{{--              <div class="row">--}}
{{--                <div class="col-12">--}}
{{--                  <button class="btn btn-icon btn-success" type="button" onclick="submitAllowance(1)">--}}
{{--                      <span>Submit Allowance</span>--}}
{{--                  </button>--}}
{{--                </div>--}}
{{--              </div>--}}


            </form>
          </div>
        </div>
      </div>
      <!-- /Allowance repeater -->




      <!-- Vacation repeater -->
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h4 class="card-title">Vacation</h4>
          </div>
          <div class="card-body">
            <form action="#" class="invoice-repeater2">

                  <div class="row d-flex align-items-end append-vacation">

                    @if(isset($vacationsList) && count($vacationsList) > 0)

                      @foreach($vacationsList as $key => $list)

                    <div class="row" id="rowId1">
                    <div class="col-md-4 col-12">
                      <div class="mb-1">
                        @php

                          $vacationId = [];
                            if (isset($list->vacation_id)){
                              $vacationId = explode(",", $list->vacation_id);
                            }


                        @endphp
                        <label class="form-label" for="vacation">Type</label>
                          <select class="select2 form-select" name="vacation[]" multiple id="vacation<?php echo $key; ?>">
                            <optgroup label="vacation">
                              @foreach($vacations as $vacation)
                                <option value="{{ $vacation->id }}" <?php echo in_array( $vacation->id, $vacationId) ? 'selected' : ''; ?>  >{{ $vacation->name }}</option>
                              @endforeach
                            </optgroup>
                          </select>

                      </div>
                    </div>

                      <input type="hidden" class="form-control vacationIndexNumber" name="row_id[]" id="getRowId<?php echo $key; ?>" value="<?php echo $key; ?>" />
                      <input type="hidden" class="form-control" name="vacation_id[]" id="vacationId<?php echo $key; ?>" value="{{ $list->id }}" />

                    <div class="col-md-2 col-12">
                      <div class="mt-2">
                        <div class="form-check form-switch">
                          <input type="checkbox" class="form-check-input" name="paid[]" id="customSwitch<?php echo $key; ?>" @if ($list->paid == 1) {{ 'checked' }} @endif />
                          <label class="form-check-label" for="customSwitch<?php echo $key; ?>">Toggle </label>
                        </div>
                      </div>
                    </div>



                    <div class="col-md-2 col-12 mb-50">
                      <div class="mt-2">
                        <button class="btn btn-outline-danger text-nowrap px-1" type="button" onclick="deleteItem(<?php echo $list->id; ?>)">
                          <i data-feather="x" class="me-25"></i>
                          <span>Delete</span>
                        </button>
                      </div>
                    </div>
                    </div>

                      @endforeach

                    @else


                    <div class="row" id="rowId1">
                    <div class="col-md-4 col-12">
                      <div class="mb-1">
                        <label class="form-label" for="vacation">Type</label>
                          <select class="select2 form-select" name="vacation[]" multiple id="vacation1">
                            <optgroup label="vacation">
                              @foreach($vacations as $vacation)
                                <option value="{{ $vacation->id }}">{{ $vacation->name }}</option>
                              @endforeach
                            </optgroup>
                          </select>

                      </div>
                    </div>

                    <div class="col-md-2 col-12">
                      <div class="mt-2">
                        <div class="form-check form-switch">
                          <input type="checkbox" class="form-check-input" name="paid[]" id="customSwitch1" />
                          <label class="form-check-label" for="customSwitch1">Toggle </label>
                        </div>
                      </div>
                    </div>


                      <input type="hidden" class="form-control vacationIndexNumber" name="row_id[]" id="getRowId" value="1" />

                    <div class="col-md-2 col-12 mb-50">
                      <div class="mt-2">
                        <button class="btn btn-outline-danger text-nowrap px-1 deleteVacation" type="button">
                          <i data-feather="x" class="me-25"></i>
                          <span>Delete</span>
                        </button>
                      </div>
                    </div>
                    </div>

                    @endif

                  </div>
                  <hr />


              <div class="row mb-2">
                <div class="col-12">
                  <button class="btn btn-icon btn-primary addVacation" type="button">
                    <i data-feather="plus" class="me-25"></i>
                    <span>Add New</span>
                  </button>
                </div>
              </div>

            </form>
          </div>
        </div>
      </div>
      <!-- /Vacation repeater -->

    </div>
  </div>


  @php


  if (isset($allowances) && count($allowances) > 0){
    $rowCount = count($allowances);
  }else {
    $rowCount = 1;
  }



  $lunchData = $lunches;

  function fillSelectLunchs($lunchData){
      $output = '';
      foreach ($lunchData as $lunch){
          $output .= '<option value="lun_'. $lunch->id .'">'.$lunch->name.'</option>';
      }
      return $output;
    }

  $vacationData = $vacations;

  function fillSelectVacatrion($vacationData){
      $output = '';
      foreach ($vacationData as $vacation){
          $output .= '<option value="vac_'. $vacation->id .'">'.$vacation->name.'</option>';
      }
      return $output;
    }

    if(isset($vacationsList) && count($vacationsList) > 0){
        $vacationRow = count($vacationsList);
    }else{
        $vacationRow = 1;
    }


  function fillVacatrion($vacationData){
      $output = '';
      foreach ($vacationData as $vacation){
          $output .= '<option value="'. $vacation->id .'">'.$vacation->name.'</option>';
      }
      return $output;
    }


  $extraData = $extras;

  function fillSelectExtra($extraData){
      $output = '';
      foreach ($extraData as $extra){
          $output .= '<option value="ext_'. $extra->id .'">'.$extra->name.'</option>';
      }
      return $output;
    }

  @endphp


@endsection

@section('vendor-script')
  <!-- vendor files -->
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
@endsection
@section('page-script')
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <!-- Page js files -->

  <script>

    $(document).ready(function () {
      $(".select2").select2();
    });

    $(function () {
      'use strict';

      $.ajaxSetup({
        headers:{
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
      });


      var rowCount = '<?php echo $rowCount; ?>';

      $('.addnew').on('click', function () {


        // Submit Data
        var getRowId = document.getElementsByClassName('indexNumber');
        var arr = [...getRowId].map(input => input.value);

        var dataList = [];

        arr.forEach(function (index) {
          var selectType = $('#selectType'+index).val();
          var itemCost = $('#itemcost'+index).val();
          var itemQuantity = $('#itemquantity'+index).val();
          var getAmount = $('#staticprice'+index).val();

          var allowance_id = $('#allowanceId'+index).val();


          dataList.push({
            select_type : selectType,
            amount: getAmount,
            cost: itemCost,
            quantity: itemQuantity,
            status: 1,
            id: allowance_id,
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
              })
            }
          }
        })



       // New Row Create

        rowCount++;

        var html = '';
        html += '<div class="row" id="rowId'+ rowCount +'">' +
                '<div class="col-md-4 col-12 pr-4">' +
                '<div class="mb-1 mySelect">' +
                '<label class="form-label" for="lunch">Select a type</label>' +
                '<select class="select2 form-select" multiple name="select_type[]" id="selectType'+ rowCount +'">';

         html += '<optgroup label="Lunch">' +
                '<?php echo fillSelectLunchs($lunchData);  ?>' +
                '</optgroup>';

        html += '<optgroup label="Vacation">' +
                '<?php echo fillSelectVacatrion($vacationData); ?>' +
                '</optgroup>';

        html +='<optgroup label="Extra">' +
                '<?php echo fillSelectExtra($extraData); ?> ' +
                '</optgroup>' +
                '</select>' +
                '</div>' +
                '</div>';

        html +='<input type="hidden" class="form-control indexNumber" name="row_id[]" id="getRowId" value="'+ rowCount +'" />'+

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
                '<button class="btn btn-outline-danger text-nowrap px-1 deleteitem">' +
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
        if (confirm('Are you sure you want to delete this element?')) {
          var check = $(this).parent().parent().parent().remove();
        }
      })



      // Add Vacation

      var vrowCount = '<?php echo $vacationRow; ?>';

      $('.addVacation').on('click', function () {

        var getRowId = document.getElementsByClassName('vacationIndexNumber');
        var arr = [...getRowId].map(input => input.value);

        var dataList = [];

        arr.forEach(function (index) {
          var vacation = $('#vacation'+index).val();
          var isChecked = document.getElementById('customSwitch'+index).checked;
          var allowance_id = $('#vacationId'+index).val();

          if(vacation.length > 0){
            dataList.push({
              vacation_id : vacation,
              paid: isChecked,
              id: allowance_id,
              status: 0,
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
              })
            }
          }
        });


        vrowCount++;

        var html = '';
        html += '<div class="row" id="rowId'+ vrowCount +'">' +
                '<div class="col-md-4 col-12 pr-4">' +
                '<div class="mb-1 mySelect">' +
                '<label class="form-label" for="vacation">Type</label>' +
                '<select class="select2 form-select" multiple name="vacation[]" id="vacation'+ vrowCount +'">' +
                '<optgroup label="Vacation">' +
                '<?php echo fillVacatrion($vacationData); ?>' +
                '</optgroup>' +
                '</select>' +
                '</div>' +
                '</div>';

        html += '<input type="hidden" class="form-control vacationIndexNumber" name="row_id[]" id="getRowId" value="'+ vrowCount +'" />'+
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
        if (confirm('Are you sure you want to delete this element?')) {
          var check = $(this).parent().parent().parent().remove();
        }
      })
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


    function deleteItem(event){

      // Submit Data
        if (confirm('Are you sure you want to delete this element?')) {
          $.ajax({
            type:'POST',
            url:'/settings/delete-allowance',
            data: {data: event},
            success:function(response){

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
          })
        }

    }


  </script>

@endsection
