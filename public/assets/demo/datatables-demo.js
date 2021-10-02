// Call the dataTables jQuery plugin
$(document).ready(function() {
  $('#dataTable').DataTable();
});

// $(function() {
//   $('#datetimepicker1').datetimepicker();
// });

// custom js demo 
$(document).ready(function() {
  $('#dataTableKurangPak').DataTable( {
      "scrollY":        "200px",
      "scrollCollapse": true,
      "paging":         false,
      "searching": false
  } );
} );

$(document).ready(function() {
  $('#dataTableKurangPcs').DataTable( {
      "scrollY":        "200px",
      "scrollCollapse": true,
      "paging":         false,
      "searching": false
  } );
} );

// 
$(document).ready(function() {
  $('#dataTableLebihPak').DataTable( {
      "scrollY":        "200px",
      "scrollCollapse": true,
      "paging":         true,
      "searching": false
  } );
} );

$(document).ready(function() {
  $('#dataTableLebihPcs').DataTable( {
      "scrollY":        "200px",
      "scrollCollapse": true,
      "paging":         true,
      "searching": false
  } );
} );