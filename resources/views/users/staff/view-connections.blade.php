@extends('layouts/contentLayoutMaster')

@section('title', 'User View - Connections')

@section('vendor-style')
  {{-- Page Css files --}}
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/forms/select/select2.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/animate/animate.min.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('vendors/css/extensions/sweetalert2.min.css')) }}">
@endsection

@section('page-style')
  {{-- Page Css files --}}
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/forms/form-validation.css')) }}">
  <link rel="stylesheet" href="{{ asset(mix('css/base/plugins/extensions/ext-component-sweet-alerts.css')) }}">
@endsection

@section('content')
<section class="app-user-view-connections">
  <div class="row">
    <!-- User Sidebar -->
      <div class="col-xl-4 col-lg-5 col-md-5 order-1 order-md-0">
          <!-- User Card -->
          <div class="card border-primary">
              <div class="card-body">
                  <div class="user-avatar-section">
                      <div class="d-flex align-items-center flex-column">
                          <img
                              class="img-fluid rounded mt-3 mb-2"
                              src="{{asset('images/portrait/small/avatar-s-2.jpg')}}"
                              height="140"
                              width="140"
                              alt="User avatar"
                          />
                          <div class="user-info text-center">
                              <h4>{{$user[0]->firstname.' '.$user[0]->lastname }}</h4>

                              @php

                              $date = new DateTime($user[0]->created_at);
                                $createdDate = $date->format('d-m-Y');

                                 $isActive = null;

                                 if (isset($staff[0]->updated_at) && $staff[0]->updated_at !== null){
                                    $activeDate = new DateTime($staff[0]->updated_at);
                                    $subscriptionDate = $activeDate->format('d-m-Y');
                                    $isActive = $staff[0]->is_contact;
                                 }

                                if ($isActive == 1){
                                    $joinDate = $subscriptionDate;
                                }else {
                                    $joinDate = $createdDate;
                                }

                              @endphp
                              <p>{{ $joinDate }}</p>
                              <span class="badge bg-light-secondary">{{ isset($teams[0]->name)  ?  $teams[0]->name : '' }}</span>

                              <p class="mt-1 <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>" >
                                  <a href="mailto:{{ $email = $user[0]->email }}" target="_blank" class="btn btn-primary btn-sm edit-address">Send a email</a>
                              </p>

                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- /User Card -->
          <!-- Plan Card -->
          <div class="card">
              <div class="card-body">
                  <div class="d-flex justify-content-between align-items-start">
                      <span class="badge bg-light-primary">{{ isset($staff[0]->contract_type)  ?  $staff[0]->contract_type : '' }}</span>
                      <div class="d-flex justify-content-center">
                          <sup class="h5 pricing-currency text-primary mt-1 mb-0">$</sup>
                          <span class="fw-bolder display-5 mb-0 text-primary">99</span>
                          <sub class="pricing-duration font-small-4 ms-25 mt-auto mb-2">/month</sub>
                      </div>
                  </div>
                  <ul class="ps-1 mb-2">
                      <li class="mb-50">Weekly working time: <b>{{ isset($staff[0]->weekly_working_time)  ?  $staff[0]->weekly_working_time : '' }}</b></li>
                      <li class="mb-50">Daily Breaks time: <b>{{ isset($staff[0]->daily_breaks_time)  ?  $staff[0]->daily_breaks_time : '' }}</b></li>
                  </ul>
                  <div class="d-flex justify-content-between align-items-center fw-bolder mb-50">
                      <span>Holidays per year</span>
                      <span>{{ isset($staff[0]->holidays_per_year)  ?  $staff[0]->holidays_per_year : '' }}</span>
                  </div>
                  <div class="progress mb-50" style="height: 8px">
                      <div
                          class="progress-bar"
                          role="progressbar"
                          style="width: 80%"
                          aria-valuenow="65"
                          aria-valuemax="100"
                          aria-valuemin="80"
                      ></div>
                  </div>
                  <span>4 days remaining</span>
                  <div class="d-grid w-100 mt-2 <?php echo Auth::user()->role_id == 2 ? 'd-none' : ''; ?>" >
                      @if(isset($staff[0]->is_contact) && $staff[0]->is_contact == 1)
                          <a href="javascript:;" class="btn btn-outline-danger suspend-user">Suspended</a>
                      @else
                          <a href="javascript:;" class="btn btn-outline-success cancel-subscription">Re-start</a>
                      @endif
                      <form method="post" class="swa-confirm" action="{{ route('staff-suspent-account') }}">
                          @csrf
                          <input type="hidden" id="id" name="id" value="{{$user[0]->id}}"/>
                      </form>
                  </div>
              </div>
          </div>
          <!-- /Plan Card -->
      </div>
    <!--/ User Sidebar -->

    <!-- User Content -->
    <div class="col-xl-8 col-lg-7 col-md-7 order-0 order-md-1">
      <!-- User Pills -->
      <ul class="nav nav-pills mb-2">
        <li class="nav-item">
          <a class="nav-link" href="{{asset('staff/'.$user[0]->id.'/view/account')}}">
            <i data-feather="user" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Account</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{asset('staff/'.$user[0]->id.'/view/salary')}}">
            <i data-feather="dollar-sign" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Salary</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{asset('staff/'.$user[0]->id.'/view/documents')}}">
            <i data-feather="file-text" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Documents</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="{{asset('staff/'.$user[0]->id.'/view/notifications')}}">
            <i data-feather="bell" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Notifications</span>
          </a>
          </li>
        <li class="nav-item">
        <a class="btn btn-flat-warning" href="https://www.due.urssaf.fr/declarant/index.jsf" role="button" target="_blank">
            <i data-feather="external-link" class="font-medium-3 me-50"></i>
            <span class="fw-bold">Faire la DPAE</span>
          </a>
        </li>
      </ul>
      <!--/ User Pills -->

      <!-- connection -->
      <div class="card">
        <div class="card-body">
          <h4 class="card-title mb-75">Connected accounts</h4>
          <p>Display content from your connected accounts on your site</p>

          <!-- Connections -->
          <div class="d-flex mt-2">
            <div class="flex-shrink-0">
              <img
                src="{{asset('images/icons/social/google.png')}}"
                alt="google"
                class="me-1"
                height="38"
                width="38"
              />
            </div>
            <div class="d-flex align-item-center justify-content-between flex-grow-1">
              <div class="me-1">
                <p class="fw-bolder mb-0">Google</p>
                <span>Calendar and contacts</span>
              </div>
              <div class="mt-50 mt-sm-0">
                <div class="form-check form-switch form-check-primary">
                  <input type="checkbox" class="form-check-input" id="checkboxGoogle" checked />
                  <label class="form-check-label" for="checkboxGoogle">
                    <span class="switch-icon-left"><i data-feather="check"></i></span>
                    <span class="switch-icon-right"><i data-feather="x"></i></span>
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="d-flex mt-2">
            <div class="flex-shrink-0">
              <img
                src="{{asset('images/icons/social/slack.png')}}"
                alt="slack"
                class="me-1"
                height="38"
                width="38"
              />
            </div>
            <div class="d-flex align-item-center justify-content-between flex-grow-1">
              <div class="me-1">
                <p class="fw-bolder mb-0">Slack</p>
                <span>Communication</span>
              </div>
              <div class="mt-50 mt-sm-0">
                <div class="form-check form-switch form-check-primary">
                  <input type="checkbox" class="form-check-input" id="checkboxSlack" />
                  <label class="form-check-label" for="checkboxSlack">
                    <span class="switch-icon-left"><i data-feather="check"></i></span>
                    <span class="switch-icon-right"><i data-feather="x"></i></span>
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="d-flex mt-2">
            <div class="flex-shrink-0">
              <img
                src="{{asset('images/icons/social/github.png')}}"
                alt="github"
                class="me-1"
                height="38"
                width="38"
              />
            </div>
            <div class="d-flex align-item-center justify-content-between flex-grow-1">
              <div class="me-1">
                <p class="fw-bolder mb-0">Github</p>
                <span>Manage your Git repositories</span>
              </div>
              <div class="mt-50 mt-sm-0">
                <div class="form-check form-switch form-check-primary">
                  <input type="checkbox" class="form-check-input" id="checkboxGithub" checked />
                  <label class="form-check-label" for="checkboxGithub">
                    <span class="switch-icon-left"><i data-feather="check"></i></span>
                    <span class="switch-icon-right"><i data-feather="x"></i></span>
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="d-flex mt-2">
            <div class="flex-shrink-0">
              <img
                src="{{asset('images/icons/social/mailchimp.png')}}"
                alt="mailchimp"
                class="me-1"
                height="38"
                width="38"
              />
            </div>
            <div class="d-flex align-item-center justify-content-between flex-grow-1">
              <div class="me-1">
                <p class="fw-bolder mb-0">Mailchimp</p>
                <span>Email marketing service</span>
              </div>
              <div class="mt-50 mt-sm-0">
                <div class="form-check form-switch form-check-primary">
                  <input type="checkbox" class="form-check-input" id="checkboxMailchimp" />
                  <label class="form-check-label" for="checkboxMailchimp">
                    <span class="switch-icon-left"><i data-feather="check"></i></span>
                    <span class="switch-icon-right"><i data-feather="x"></i></span>
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="d-flex mt-2">
            <div class="flex-shrink-0">
              <img
                src="{{asset('images/icons/social/asana.png')}}"
                alt="asana"
                class="me-1"
                height="38"
                width="38"
              />
            </div>
            <div class="d-flex align-item-center justify-content-between flex-grow-1">
              <div class="me-1">
                <p class="fw-bolder mb-0">Asana</p>
                <span>Communication</span>
              </div>
              <div class="mt-50 mt-sm-0">
                <div class="form-check form-switch form-check-primary">
                  <input type="checkbox" class="form-check-input" id="checkboxAsana" />
                  <label class="form-check-label" for="checkboxAsana">
                    <span class="switch-icon-left"><i data-feather="check"></i></span>
                    <span class="switch-icon-right"><i data-feather="x"></i></span>
                  </label>
                </div>
              </div>
            </div>
          </div>
          <!-- /Connections -->
        </div>
      </div>

      <div class="card">
        <div class="card-body">
          <h4 class="card-title mb-75">Social accounts</h4>
          <p>Display content from social accounts on your site</p>
          <!-- Social Accounts -->
          <div class="d-flex mt-2">
            <div class="flex-shrink-0">
              <img
                src="{{asset('images/icons/social/facebook.png')}}"
                alt="facebook"
                class="me-1"
                height="38"
                width="38"
              />
            </div>
            <div class="d-flex justify-content-between flex-grow-1">
              <div class="me-1">
                <p class="fw-bolder mb-0">Facebook</p>
                <span>Not Connected</span>
              </div>
              <div class="mt-50 mt-sm-0">
                <button type="button" class="btn btn-icon btn-outline-secondary">
                  <i data-feather="link" class="font-medium-3"></i>
                </button>
              </div>
            </div>
          </div>
          <div class="d-flex align-items-start mt-2">
            <div class="flex-shrink-0">
              <img
                src="{{asset('images/icons/social/twitter.png')}}"
                alt="twitter"
                class="me-1"
                height="38"
                width="38"
              />
            </div>
            <div class="d-flex justify-content-between flex-grow-1">
              <div class="me-1">
                <p class="fw-bolder mb-0">Twitter</p>
                <a href="https://twitter.com/pixinvent" target="_blank">@pixinvent</a>
              </div>
              <div class="mt-50 mt-sm-0">
                <button type="button" class="btn btn-icon btn-outline-secondary">
                  <i data-feather="x" class="font-medium-3"></i>
                </button>
              </div>
            </div>
          </div>
          <div class="d-flex mt-2">
            <div class="flex-shrink-0">
              <img
                src="{{asset('images/icons/social/linkedin.png')}}"
                alt="instagram"
                class="me-1"
                height="38"
                width="38"
              />
            </div>
            <div class="d-flex justify-content-between flex-grow-1">
              <div class="me-1">
                <p class="fw-bolder mb-0">Linkedin</p>
                <a href="https://www.linkedin.com/company/pixinvent" target="_blank"> @pixinvent </a>
              </div>
              <div class="mt-50 mt-sm-0">
                <button type="button" class="btn btn-icon btn-outline-secondary">
                  <i data-feather="x" class="font-medium-3"></i>
                </button>
              </div>
            </div>
          </div>
          <div class="d-flex mt-2">
            <div class="flex-shrink-0">
              <img
                src="{{asset('images/icons/social/dribbble.png')}}"
                alt="dribbble"
                class="me-1"
                height="38"
                width="38"
              />
            </div>
            <div class="d-flex justify-content-between flex-grow-1">
              <div class="me-1">
                <p class="fw-bolder mb-0">Dribbble</p>
                <span>Not Connected</span>
              </div>
              <div class="mt-50 mt-sm-0">
                <button type="button" class="btn btn-icon btn-outline-secondary">
                  <i data-feather="link" class="font-medium-3"></i>
                </button>
              </div>
            </div>
          </div>
          <div class="d-flex mt-2">
            <div class="flex-shrink-0">
              <img
                src="{{asset('images/icons/social/behance.png')}}"
                alt="behance"
                class="me-1"
                height="38"
                width="38"
              />
            </div>
            <div class="d-flex justify-content-between flex-grow-1">
              <div class="me-1">
                <p class="fw-bolder mb-0">Behance</p>
                <span>Not Connected</span>
              </div>
              <div class="mt-50 mt-sm-0">
                <button type="button" class="btn btn-icon btn-outline-secondary">
                  <i data-feather="link" class="font-medium-3"></i>
                </button>
              </div>
            </div>
          </div>
          <!-- /Social Accounts -->
        </div>
      </div>
      <!--/ connection -->
    </div>
    <!--/ User Content -->
  </div>
</section>


@include('content/_partials/_modals/modal-edit-user')
@include('content/_partials/_modals/modal-upgrade-plan')
@endsection

@section('vendor-script')
  {{-- Vendor js files --}}
  <script src="{{ asset(mix('vendors/js/forms/select/select2.full.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/cleave.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/cleave/addons/cleave-phone.us.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/forms/validation/jquery.validate.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/sweetalert2.all.min.js')) }}"></script>
  <script src="{{ asset(mix('vendors/js/extensions/polyfill.min.js')) }}"></script>
@endsection

@section('page-script')
  {{-- Page js files --}}
  <script src="{{ asset(mix('js/scripts/users/modal-edit-staff.js')) }}"></script>
  <script src="{{ asset(mix('js/scripts/users/staff-view.js')) }}"></script>
@endsection
