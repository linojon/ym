// this is for client-side sorting of dates
// http://datatables.net/forums/discussion/1933/dd-mon-yyyy-date-format/p1
// tell column def {"sName":"birth_date", "sSortDataType": "dom-text"},
// else 

// jQuery.fn.dataTableExt.oSort['shortdate-asc'] = function(x, y) {
//     var months = {};
//     months["JAN"] = "01";
//     months["FEB"] = "02";
//     months["MAR"] = "03";
//     months["APR"] = "04";
//     months["MAY"] = "05";
//     months["JUN"] = "06";
//     months["JUL"] = "07";
//     months["AUG"] = "08";
//     months["SEP"] = "09";
//     months["OCT"] = "10";
//     months["NOV"] = "11";
//     months["DEC"] = "12";
// 
//     x = (x == "") ? 0: x.split('-');
//     y = (y == "") ? 0: y.split('-');
// 
//     if (x.length) {
//         x = x[2] + months[x[1].toUpperCase()] + x[0];
//     }
// 
//     if (y.length) {
//         y = y[2] + months[y[1].toUpperCase()] + y[0];
//     }
// 
//     return ((x < y) ? -1: ((x > y) ? 1: 0));
// };
// 
// 
// jQuery.fn.dataTableExt.oSort['shortdate-desc'] = function(x, y) {
//     var months = {};
//     months["JAN"] = "01";
//     months["FEB"] = "02";
//     months["MAR"] = "03";
//     months["APR"] = "04";
//     months["MAY"] = "05";
//     months["JUN"] = "06";
//     months["JUL"] = "07";
//     months["AUG"] = "08";
//     months["SEP"] = "09";
//     months["OCT"] = "10";
//     months["NOV"] = "11";
//     months["DEC"] = "12";
// 
//     x = (x == "") ? 0: x.split('-');
//     y = (y == "") ? 0: y.split('-');
// 
//     if (x.length) {
//         x = x[2] + months[x[1].toUpperCase()] + x[0];
//     }
// 
//     if (y.length) {
//         y = y[2] + months[y[1].toUpperCase()] + y[0];
//     }
// 
//     return ((x < y) ? 1: ((x > y) ? -1: 0));
// };