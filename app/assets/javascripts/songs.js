// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Process the Songs Table with DataTables
$(document).ready( function () {
    $('#songs-table').DataTable( {
    	scrollY: 400,
    	paging: false,
    } );
} );