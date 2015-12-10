// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Process the Awards Table with DataTables
$(document).ready( function () {
    $('#awards-table').DataTable( {
    	scrollY: 400,
    	paging: false
    } );
} );

$(document).ready( function () {
    $('#artist-awards-table').DataTable( {
    	scrollY: 400,
    	paging: false
    } );
} );