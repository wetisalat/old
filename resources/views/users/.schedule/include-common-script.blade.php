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
	                // calendar.setEvents(data.events);
	            }
	        });
		}
	}
</script>