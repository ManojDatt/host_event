App.publish = App.cable.subscriptions.create("PublishChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
     return $('#recent_event').append("<div class='well'><br>Event :"+data['event_title']+" published by <span class='badge'>"+data['user']+"</span><br>Discription:"+data['event_disc']);
  }
});
