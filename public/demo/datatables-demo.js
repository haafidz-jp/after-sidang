// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable();
});

// $(function() {
//   $('#datetimepicker1').datetimepicker();
// });

// custom js demo 
$(document).ready(function() {
  $('#dataTableKurang').DataTable( {
      "scrollY":        "200px",
      "scrollCollapse": true,
      "paging":         false,
      "searching": false
  } );
} );

// 
$(document).ready(function() {
  $('#dataTableLebih').DataTable( {
      "scrollY":        "200px",
      "scrollCollapse": true,
      "paging":         true,
      "searching": false
  } );
} );