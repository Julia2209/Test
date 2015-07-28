jQuery(function($) {
  
  $(".deleteAction").click( function() {
    var current_item_tr = $(this).parents('tr')[0];
    if(confirm("Are you sure?")) {
      $.ajax({
        url: '/item/:id' + $(current_item_tr).attr('data-item_id'),
        type: 'POST',
        data: { _method: 'DELETE' },
        success: function() {
           $(current_item_tr).fadeOut(200);
        }
      })
    };
  });
  
});
