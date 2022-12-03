<!-- upgrade your plan Modal -->
<div class="modal fade" id="upgradePlanModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-upgrade-plan">
    <div class="modal-content">
      <div class="modal-header bg-transparent">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body px-5 pb-2">
        <div class="text-center mb-2">
          <h1 class="mb-1">Upgrade Plan</h1>
          <p>Choose the best plan for user.</p>
        </div>

        <form id="upgradePlanForm" class="row pt-50" method="POST" onsubmit="return false">

            <input type="hidden" id="update_plan" name="update_plan" value="update_plan">
            <input type="hidden" id="userId" name="user_id" value="{{ $user[0]->id }}">
          <div class="col-sm-8">
            <label class="form-label" for="choosePlan">Choose Plan</label>
            <select id="choosePlan" name="plan_id" class="form-select" aria-label="Choose Plan">
              <option selected>Choose Plan</option>
                @foreach($plans as $plan)
                  <option value="{{ $plan->id }}" @if ($plan->id == $user[0]->plan_id) {{ 'selected' }} @endif>{{ $plan->title }} - ${{ $plan->price }}/{{ $plan->interval }}</option>
                @endforeach
            </select>
          </div>
          <div class="col-sm-4 text-sm-end">
            <button type="submit" class="btn btn-primary mt-2 user-plan-update">Upgrade</button>
          </div>
        </form>

      </div>

        @if(isset( $user[0]->plans ))
            <hr />
        <div class="modal-body px-5 pb-3">
        <h6>User current plan is standard plan</h6>
        <div class="d-flex justify-content-between align-items-center flex-wrap">
          <div class="d-flex justify-content-center me-1 mb-1">
            <sup class="h5 pricing-currency pt-1 text-primary">$</sup>
            <h1 class="fw-bolder display-6 mb-0 text-primary me-25">
                @if(isset($user[0]->plans))
                    {{ $user[0]->plans->price }}
                @endif
            </h1>
            <sub class="pricing-duration font-small-4 mt-auto mb-2">/
                @if(isset($user[0]->plans))
                    {{ $user[0]->plans->interval }}
                @endif
            </sub>
          </div>
            <input type="hidden" id="userId" name="user_id" value="{{ $user[0]->id }}">
          <button class="btn btn-outline-danger cancel-subscription mb-1">Cancel Subscription</button>
        </div>
      </div>
            @endif

    </div>
  </div>
</div>
<!--/ upgrade your plan Modal -->
