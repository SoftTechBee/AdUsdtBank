$(function () {
    MTree.S1Slot();
    MTree.S2Slot();
   // MTree.bindtreeM6();
});
var MTree = {
    S1Slot: function () {
      //  alert('hi1');
        $.ajax({
            type: "POST",
            url: "Home.aspx/S1Slot",
            data: '',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var data = eval(response.d);
                if (data.length != "0") {
                    var slotbuy = parseInt(data[0].LastSlot);
                    var listid = document.getElementById("s1list");
                  /*  alert(slotbuy);*/

                    var blackslot = 15 - slotbuy;
                  /*  alert(blackslot);*/
                    for (var i = 0; i < slotbuy; i++) {
                        listid.innerHTML += "  <li  class='round rounded  m-1 d-flex align-items-center justify-content-center' style='background-color: #fff !important;width: 63px !important;height: 63px !important;'><a href='#?PoolNo=" + (i + 1) + "'><img src='../Member/PackImg/" + (i + 1) +"g.png' style='width: 50px;'></a> </li>";
                    }
                    for (var i = 0; i < blackslot; i++) {
                        listid.innerHTML += "  <li class='round rounded bg-dark m-1 d-flex align-items-center justify-content-center' style='background-color: #fff !important;width: 63px !important;height: 63px !important;'><a href='BuyNow.aspx?PoolNo=" + (i + 1 + slotbuy) + "'><img src='../Member/PackImg/" + (i + 1 + slotbuy) +"r.png' style='width: 40px;'></a> </li>";
                    }
                }
            },
        });
    },
    
    S2Slot: function () {
       // alert('hi1');
        $.ajax({
            type: "POST",
            url: "Home.aspx/S2Slot",
            data: '',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var data = eval(response.d);
                if (data.length != "0") {
                    var slotbuy = parseInt(data[0].LastSlot);
                    var listid = document.getElementById("s2list");
                    var blackslot = 4 - slotbuy;
                    for (var i = 1; i <= slotbuy; i++) {
                        listid.innerHTML += " <a href='rptNonworkingPool.aspx?PoolNo="+i+"'> <li class='round rounded  m-1 d-flex align-items-center justify-content-center' style='background-color: rgb(145 199 62) !important;'> </li> </a>";
                    }
                    for (var i = 1; i <= blackslot; i++) {
                        listid.innerHTML += "<a href='#'>  <li class='round rounded bg-dark m-1 d-flex align-items-center justify-content-center'> </li> </a>";
                    }
                }
            },
        });
    },
  
}