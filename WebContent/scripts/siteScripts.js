$(function() {
	$('#unfriendButton').on('click', function() {
		
		bootbox.confirm("Are you sure you want to unfriend this user?", function(result) {
			if(result) {
				var hiddenFriendshipId = $('#hiddenFriendshipId').val();
				var newUrl = window.location.href.substring(0, window.location.href.lastIndexOf('/')) + "/unfriend.action?unfriendId=" + hiddenFriendshipId;
				window.location.href = newUrl;
			}
		});
	});
});