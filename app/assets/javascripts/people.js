$(document).ready(function() {
  $("table#people").dataTable({
    // for datatables gem
    "sAjaxSource"     : "/people/search.datatables",
    "bServerSide"     : true,
    "fnServerData"    : simpleDatatables,
    
    // for jquery ui
    "bJQueryUI"       : true,
    
    // for table specific columns behaviior
    "aoColumns"       : [
      {"sName":"last_name"},
      {"sName":"first_name", "bSortable": false},
      {"sName":"middle_name", "bSortable": false},
      {"sName":"gender", "bSortable": false, "bSearchable": false},
      {"sName":"birth_date", "sType": "shortdate", "bSearchable": false},
      {"sName":"death_date", "sType": "shortdate", "bSearchable": false},
      {"sName":"death_hebrew_date", "bSearchable": false},
      {"sName":"next_yahrzeit_date", "sType": "shortdate", "bSearchable": false},
      {"sName":"", "bSearchable": false, "bSortable": false},
    ],
    
    "aaSorting"       : [[0, 'asc']],
        
    // for infinite scroll
    //"bScrollInfinite" : true,
    //"bScrollCollapse" : true,
    //"sScrollY"        : "200px",
    
    //"iDisplayLength"  : 300
  });
});
