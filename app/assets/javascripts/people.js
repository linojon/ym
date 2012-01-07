$(document).ready(function() {
  $("table#people").dataTable({
    "sAjaxSource"     : "/people/search.datatables",
    "bServerSide"     : true,
    "fnServerData"    : simpleDatatables,
    
    "bJQueryUI"       : true,
    
    "aoColumns"       : [
      {"sName":"last_name"},
      {"sName":"first_name", "bSortable": false},
      {"sName":"middle_name", "bSortable": false},
      {"sName":"gender", "bSortable": false},
      {"sName":"birth_date", "sType": "shortdate"},
      {"sName":"death_date", "sType": "shortdate"},
      {"sName":"death_hebrew_date"},
      {"sName":"next_yahrzeit_date", "sType": "shortdate"},
    ],
    
    "aaSorting"       : [[0, 'asc']],
        
    "bScrollInfinite" : true,
    "bScrollCollapse" : true,
    "sScrollY"        : "200px"
  });
});
