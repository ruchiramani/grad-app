$(function(){
  $('#getEntry').on('click', function(event){
    event.preventDefault();
    $.ajax({
      url: '/entries/show',
      method: 'GET'
    }).success(function(data){
      $('#welcome').hide();
      $('#name').text(data.name + " says...")
      // debugger;
      $('#content').text("My favorite Ian content is " + data.content).show()
         })
  })
});
