<script type="text/javascript">
	function createOrUpdateEvent(event, create = 0) {
		// body...
		if (event)
		{
			event.create = create;
			$.ajax({
	            url: $('meta[name="save-event-url"]').attr('content'),
	            headers: {
	                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	            },
	            type: 'POST',
	            data: event,
	            success: function(data) {
	                getUserEventsAjax();
	            }
	        });
		}
	}

	function createOrUpdateLeave(leave, create = 0, cb = null) {
		// body...
		if (leave)
		{
			leave.create = create;
			$.ajax({
	            url: $('meta[name="save-leave-url"]').attr('content'),
	            headers: {
	                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	            },
	            type: 'POST',
	            data: leave,
	            success: function(data) {

	            	var userRole = {!! auth()->user()->role !!}

	            	if(userRole.name === 'staff') {
	                	getStaffEventsAjax();
	                } else {
	                	getUserEventsAjax();
	                }

	                if(cb !== null) {
	                	cb();
	                }
	            }
	        });
		}
	}

    // Get user events through ajax. This is necessary to update the calendar in real time.
    function getUserEventsAjax() {
        $.ajax({
            url: '{{ route("user-events")}}',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: 'GET',
            success: function(res) {
            	var scheduleData = res.data.schedule;

                var leaveData = JSON.parse(JSON.stringify(res.data.leave));

            	leaveData.map(function(row) {
            		row.title = '';

            		return row;
            	});

            	console.log(leaveData);

            	calendar.setEvents(scheduleData.concat(res.data.leave));

            	calendar.setOptions({ colors: leaveData });
            }
        });
    }

    // Get staff events
    function getStaffEventsAjax() {
        $.ajax({
            url: '{{ route("staff-events")}}',
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: 'GET',
            success: function(res) {
                calendar.setEvents(res.data.schedule.concat(res.data.leave));

                var colors = JSON.parse(JSON.stringify(res.data.leave));

                var colorsData = colors.map(function(row) {
                    row.title = '';
                    return row;
                }) ;

                calendar.setOptions({ colors: colorsData });
            }
        });
    }
</script>