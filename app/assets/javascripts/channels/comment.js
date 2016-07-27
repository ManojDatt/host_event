App.comment = App.cable.subscriptions.create("CommentChannel", {
  collection: function() {
    return $("[data-channel='comments']");
  },

  connected: function() {
    return setTimeout((function(_this) {
      return function() {
        _this.followCurrentEvent();
        return _this.installPageChangeCallback();
      };
    })(this), 5000);
  },
  received: function(data) {
 
      return this.collection().append("<th style='word-break:break-all;'>"+data.content+"<span class='badge'>"+data['time']+" ago , by "+data['user']+"</span></th>");
      	
    
  },
  
  followCurrentEvent: function() {
    var eventId;
    if (eventId = this.collection().data('event-id')) {
      return this.perform('follow', {
        event_id: eventId
      });
    } else {
      return this.perform('unfollow');
    }
  },
  installPageChangeCallback: function() {
    if (!this.installedPageChangeCallback) {
      this.installedPageChangeCallback = true;
      return $(document).on('page:change', function() {
        return App.comments.followCurrentEvent();
      });
    }
  }
});
