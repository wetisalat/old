@section('content-sidebar')
  <div class="sidebar-content todo-sidebar">
    <div class="todo-app-menu">
      <div class="add-task">
        <button type="button" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#new-task-modal">
          Add Task
        </button>
      </div>
      <?php
      $impcls = '';
      $comcls = '';
      $delcls  = '';
      $myclasscls = '';
      $teamcls = '';
      $lowcls = '';
      $mediumcls  = '';
      $highcls  = '';
      $updatecls = '';
      if(@isset($_REQUEST['status']) ||  @isset($_REQUEST['tag'])){
      if(@$_REQUEST['status'] == 'Important'){
      $impcls = 'active';
      }else if(@$_REQUEST['status'] == 'Completed'){
      $comcls = 'active';
      }else if(@$_REQUEST['status'] == 'Deleted'){
      $delcls = 'active';
      }else{
      if(!$_REQUEST['tag']){
      $myclasscls = 'active';
      }
      }
      if(@$_REQUEST['tag'] == 'Team'){
      $teamcls = 'active';
      }else if(@$_REQUEST['tag'] == 'Low'){
      $lowcls = 'active';
      }else if(@$_REQUEST['tag'] == 'Medium'){
      $mediumcls = 'active';
      }else if(@$_REQUEST['tag'] == 'High'){
      $highcls = 'active';
      }else if(@$_REQUEST['tag'] == 'Update'){
      $updatecls = 'active';
      }
      }else{
      $myclasscls = 'active';
      }
      ?>

      <div class="sidebar-menu-list">
        <div class="list-group list-group-filters">
          <a href="/todo/" class="list-group-item list-group-item-action <?php echo $myclasscls; ?>">
            <i data-feather="mail" class="font-medium-3 mr-50"></i>
            <span class="align-middle"> My Task</span>
          </a>
          <a href="/todo/?status=Important" class="list-group-item list-group-item-action <?php echo $impcls; ?>">
            <i data-feather="star" class="font-medium-3 mr-50"></i> <span class="align-middle">Important</span>
          </a>
          <a href="/todo/?status=Completed" class="list-group-item list-group-item-action <?php echo $comcls; ?>">
            <i data-feather="check" class="font-medium-3 mr-50"></i> <span class="align-middle">Completed</span>
          </a>
          <a href="/todo/?status=Deleted" class="list-group-item list-group-item-action <?php echo $delcls; ?> @php if(Auth::user()->role_id == 2)  {echo "d-none";} @endphp"">
            <i data-feather="trash" class="font-medium-3 mr-50"></i> <span class="align-middle">Deleted</span>
          </a>
        </div>
        <div class="mt-3 px-2 d-flex justify-content-between">
          <h6 class="section-label mb-1">Tags</h6>
          <i data-feather="plus" class="cursor-pointer"></i>
        </div>
        <div class="list-group list-group-labels">
          <a href="/todo/?tag=Team" class="list-group-item list-group-item-action d-flex align-items-center <?php echo $teamcls; ?>">
            <span class="bullet bullet-sm bullet-primary mr-1"></span> Team
          </a>
          <a href="/todo/?tag=Low" class="list-group-item list-group-item-action d-flex align-items-center <?php echo $lowcls; ?>">
            <span class="bullet bullet-sm bullet-success mr-1 "></span> Low
          </a>
          <a href="/todo/?tag=Medium" class="list-group-item list-group-item-action d-flex align-items-center <?php echo $mediumcls; ?>">
            <span class="bullet bullet-sm bullet-warning mr-1 "></span> Medium
          </a>
          <a href="/todo/?tag=High" class="list-group-item list-group-item-action d-flex align-items-center <?php echo $highcls; ?>">
            <span class="bullet bullet-sm bullet-danger mr-1 "></span> High
          </a>
          <a href="/todo/?tag=Update" class="list-group-item list-group-item-action d-flex align-items-center <?php echo $updatecls; ?>">
            <span class="bullet bullet-sm bullet-info mr-1 "></span> Update
          </a>
        </div>
      </div>
    </div>
  </div>

@endsection