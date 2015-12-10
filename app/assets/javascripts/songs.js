// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Process the Songs Table with DataTables
$(document).ready( function () {
    $('#songs-table').DataTable( {
    	scrollY: 400,
    	paging: true,
    	lengthMenu: [100, 75, 50, 25, 10]
    } );
} );

$(document).ready( function () {
    $('#artist-songs-table').DataTable( {
    	scrollY: 400,
    	paging: false
    } );
} );