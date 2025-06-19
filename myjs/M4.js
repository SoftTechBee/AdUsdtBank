$(function () {

    MTree.bindtree();

});
var MTree = {

    bindtree: function () {

        $.ajax({
            type: "POST",
            url: "M4Page.aspx/bindtree",
            data: '',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                var data = eval(response.d);
                MTree.lodaTree(data);
            },
        });
    },
    lodaTree: function (data) {
        for (var i = 0; i < data.length; i++) {
            $("#x3" + i).text(data[i].Recycle);
            $("#x13" + i).attr("href", "rptPoolMemberStatus.aspx?PoolNo=" + i);
            // $("#x13" + i).href ='BuyNow.aspx?Pack=X3';

            if (data[i].Parent == "0") {
                var containerr = '#nodetree' + parseInt(i) + 1;
                var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } }, pseudo0 = { 'innerHTML': ' <div class="iconbox iconbox--danger text-white" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="BuyNow.aspx?PoolNo='+(1+i)+'"><p>Buy Now</p></a></div></div>', }
                chart_config = [config, pseudo0];
                new Treant(chart_config);
            }
            else {
                if (data[i].Left == "0" && data[i].Middle == "0" && data[i].Right == "0" && data[i].Fourth == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        //pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        //pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2];
                    new Treant(chart_config);
                }
                if (data[i].Left != "0" && data[i].Middle == "0" && data[i].Right == "0" && data[i].Fourth == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--success" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].Left + '</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                      //  pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                       // pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2];
                    new Treant(chart_config);
                }

                if (data[i].Left != "0" && data[i].Middle != "0" && data[i].Right == "0" && data[i].Fourth == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--success" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p> ' + data[i].Left + '</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--success" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].Middle + '</p></a></div></div>', },
                      //  pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                       // pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2];
                    new Treant(chart_config);
                }
                if (data[i].Left != '0' && data[i].Middle != "0" && data[i].Right != "0" && data[i].Fourth == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--success" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].Left + '</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--success" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].Middle + '</p></a></div></div>', },
                       // pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--success" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].Right + '</p></a></div></div>', },
                       // pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2];
                    new Treant(chart_config);
                }
                if (data[i].Left != '0' && data[i].Middle != "0" && data[i].Right != "0" && data[i].Fourth != "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--success" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].Left + '</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--success" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].Middle + '</p></a></div></div>', },
                       // pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--success" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].Right + '</p></a></div></div>', },
                       // pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--success" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].Fourth + '</p></a></div></div>', },
                        chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2];
                    new Treant(chart_config);
                }
            }
        }
    },



}