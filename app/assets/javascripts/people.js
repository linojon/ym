$(document).ready(function() {
  $("table#people").dataTable({
    "sAjaxSource"     : "/people/search.datatables",
    "aaSorting"       : [[0, 'asc']],
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
    "bJQueryUI"       : true,
    "bServerSide"     : true,
    "fnServerData"    : simpleDatatables
  });
});
