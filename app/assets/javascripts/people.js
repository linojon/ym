$(document).ready(function() {
  $("table#people").dataTable({
    "sAjaxSource"     : "/people/search.datatables",
    "bServerSide"     : true,
    "fnServerData"    : simpleDatatables,
    
    "bJQueryUI"       : true,
    
    "aoColumns"       : [
      {"sName":"last_name", "bSearchable": true},
      {"sName":"first_name", "bSortable": false},
      {"sName":"middle_name", "bSortable": false},
      {"sName":"gender", "bSortable": false, "bSearchable": false},
      {"sName":"birth_date", "sType": "shortdate", "bSearchable": false},
      {"sName":"death_date", "sType": "shortdate", "bSearchable": false},
      {"sName":"death_hebrew_date", "bSearchable": false},
      {"sName":"next_yahrzeit_date", "sType": "shortdate", "bSearchable": false},
    ],
    
    "aaSorting"       : [[0, 'asc']],
        
    //"bScrollInfinite" : true,
    //"bScrollCollapse" : true,
    //"sScrollY"        : "200px",
    
    //"iDisplayLength"  : 300
  });
});
