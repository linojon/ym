$(document).ready(function() {
  $("table#people").dataTable({
    "sAjaxSource"     : "/people/search.datatables",
    "aaSorting"       : [[0, 'asc']],
    "aoColumns"       : [
      {"sName":"Last"},
      {"sName":"First"},
      {"sName":"Middle"},
      {"sName":"Gender"},
      {"sName":"Birth"},
      {"sName":"Death"},
      {"sName":"Hebrew"},
      {"sName":"Yahrzeit"},
    ],
    "bJQueryUI"       : true,
    "bServerSide"     : true,
    "fnServerData"    : simpleDatatables
  });
});
