$(function () {
     MTree.bindtree();
    //MTree.bindMLtree();
    MTree.bindtreeM6();
});
var MTree = {
   
  
    bindtree: function () {

        $.ajax({
            type: "POST",
            url: "Home.aspx/bindtree",
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
            if (data[i].Parent == "0") {
                var containerr = '#nodetree' + parseInt(i) + 1;
                var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } }, pseudo0 = { 'innerHTML': ' <div class="iconbox iconbox--danger" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>Buy Now</p></a></div></div>', }
                chart_config = [config, pseudo0];
                new Treant(chart_config);
            }
            else {
                if (data[i].Left == "0" && data[i].Middle == "0" && data[i].Right == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } }, U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', }, pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', }, pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', }, pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', }
                    chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2, pseudo3];
                    new Treant(chart_config);
                }
                if (data[i].Left != "0" && data[i].Middle != "0" && data[i].Right == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } }, UB640B0A3329549B58EECE7915F72F234 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : ' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=B640B0A3-3295-49B5-8EEC-E7915F72F234"><p>' + data[i].Parent + '</p></a></div></div>', }, U8C83539829CD4FCAAF66AC8E55BEF820 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=8C835398-29CD-4FCA-AF66-AC8E55BEF820"><p>' + data[i].Left + '</p></a></div></div>', }, U212435F3DF14494894A348DED3E56BB5 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=212435F3-DF14-4948-94A3-48DED3E56BB5"><p>' + data[i].Middle + '</p></a></div></div>', }, pseudo3 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="Home.aspx"><p>Empty</p></a></div></div>', }
                    chart_config = [config, UB640B0A3329549B58EECE7915F72F234, U8C83539829CD4FCAAF66AC8E55BEF820, U212435F3DF14494894A348DED3E56BB5, pseudo3];
                    new Treant(chart_config);
                }
                if (data[i].Left != "0" && data[i].Middle == '0' && data[i].Right == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } }, UEFCDCB644ED54666A47098FA709849CA = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=EFCDCB64-4ED5-4666-A470-98FA709849CA"><p>' + data[i].Parent + '</p></a></div></div>', }, U45BC2D697AB147638A8890B014A8420F = { 'parent': UEFCDCB644ED54666A47098FA709849CA, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=45BC2D69-7AB1-4763-8A88-90B014A8420F"><p>' + data[i].Left + '</p></a></div></div>', }, pseudo2 = { 'parent': UEFCDCB644ED54666A47098FA709849CA, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="Home.aspx"><p>Empty</p></a></div></div>', }, pseudo3 = { 'parent': UEFCDCB644ED54666A47098FA709849CA, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="Home.aspx"><p>Empty</p></a></div></div>', }
                    chart_config = [config, UEFCDCB644ED54666A47098FA709849CA, U45BC2D697AB147638A8890B014A8420F, pseudo2, pseudo3];
                    new Treant(chart_config);
                }
                if (data[i].Left == '0' && data[i].Middle == '0' && data[i].Right != "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } }, UEFCDCB644ED54666A47098FA709849CA = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=EFCDCB64-4ED5-4666-A470-98FA709849CA"><p>' + data[i].Parent + '</p></a></div></div>', }, pseudo1 = { 'parent': UEFCDCB644ED54666A47098FA709849CA, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="Home.aspx"><p>Empty</p></a></div></div>', }, pseudo2 = { 'parent': UEFCDCB644ED54666A47098FA709849CA, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="Home.aspx"><p>Empty</p></a></div></div>', }, U45BC2D697AB147638A8890B014A8420F = { 'parent': UEFCDCB644ED54666A47098FA709849CA, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=45BC2D69-7AB1-4763-8A88-90B014A8420F"><p>' + data[i].Right + '</p></a></div></div>', }
                    chart_config = [config, UEFCDCB644ED54666A47098FA709849CA, pseudo1, pseudo2, U45BC2D697AB147638A8890B014A8420F];
                    new Treant(chart_config);
                }
                if (data[i].Left == '0' && data[i].Middle != "0" && data[i].Right == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } }, UEFCDCB644ED54666A47098FA709849CA = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=EFCDCB64-4ED5-4666-A470-98FA709849CA"><p>' + data[i].Parent + '</p></a></div></div>', }, pseudo1 = { 'parent': UEFCDCB644ED54666A47098FA709849CA, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="Home.aspx"><p>Empty</p></a></div></div>', }, U45BC2D697AB147638A8890B014A8420F = { 'parent': UEFCDCB644ED54666A47098FA709849CA, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=45BC2D69-7AB1-4763-8A88-90B014A8420F"><p>' + data[i].Middle + '</p></a></div></div>', }, pseudo3 = { 'parent': UEFCDCB644ED54666A47098FA709849CA, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="Home.aspx"><p>Empty</p></a></div></div>', }
                    chart_config = [config, UEFCDCB644ED54666A47098FA709849CA, pseudo1, U45BC2D697AB147638A8890B014A8420F, pseudo3];
                }
                if (data[i].Left == '0' && data[i].Middle != "0" && data[i].Right != "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } }, UB640B0A3329549B58EECE7915F72F234 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : ' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=B640B0A3-3295-49B5-8EEC-E7915F72F234"><p>' + data[i].Parent + '</p></a></div></div>', }, pseudo1 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="Home.aspx"><p>Empty</p></a></div></div>', }, U8C83539829CD4FCAAF66AC8E55BEF820 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=8C835398-29CD-4FCA-AF66-AC8E55BEF820"><p>' + data[i].Middle + '</p></a></div></div>', }, U212435F3DF14494894A348DED3E56BB5 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=212435F3-DF14-4948-94A3-48DED3E56BB5"><p>' + data[i].Right + '</p></a></div></div>', }
                    chart_config = [config, UB640B0A3329549B58EECE7915F72F234, pseudo1, U8C83539829CD4FCAAF66AC8E55BEF820, U212435F3DF14494894A348DED3E56BB5];
                    new Treant(chart_config);
                }
                if (data[i].Left != "0" && data[i].Middle == '0' && data[i].Right != "0") {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } }, UB640B0A3329549B58EECE7915F72F234 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : ' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=B640B0A3-3295-49B5-8EEC-E7915F72F234"><p>' + data[i].Parent + '</p></a></div></div>', }, U8C83539829CD4FCAAF66AC8E55BEF820 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=8C835398-29CD-4FCA-AF66-AC8E55BEF820"><p>' + data[i].Left + '</p></a></div></div>', }, pseudo2 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="Home.aspx"><p>Empty</p></a></div></div>', }, U212435F3DF14494894A348DED3E56BB5 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=212435F3-DF14-4948-94A3-48DED3E56BB5"><p>' + data[i].Right + '</p></a></div></div>', }
                    chart_config = [config, UB640B0A3329549B58EECE7915F72F234, U8C83539829CD4FCAAF66AC8E55BEF820, pseudo2, U212435F3DF14494894A348DED3E56BB5];
                    new Treant(chart_config);
                }
                if (data[i].Left != "0" && data[i].Middle != "0" && data[i].Right > 0) {
                    var config = { container: '#nodetree' + parseInt(i + 1), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } }, UB640B0A3329549B58EECE7915F72F234 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : ' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=B640B0A3-3295-49B5-8EEC-E7915F72F234"><p>' + data[i].Parent + '</p></a></div></div>', }, U8C83539829CD4FCAAF66AC8E55BEF820 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=8C835398-29CD-4FCA-AF66-AC8E55BEF820"><p>' + data[i].Left + '</p></a></div></div>', }, U212435F3DF14494894A348DED3E56BB5 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=212435F3-DF14-4948-94A3-48DED3E56BB5"><p>' + data[i].Middle + '</p></a></div></div>', }, U8C83539829CD4FCAAF66AC8E55BEF82020 = { 'parent': UB640B0A3329549B58EECE7915F72F234, 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle : 0</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="tree.aspx?r=8C835398-29CD-4FCA-AF66-AC8E55BEF820"><p>' + data[i].Right + '</p></a></div></div>', }
                    chart_config = [config, UB640B0A3329549B58EECE7915F72F234, U8C83539829CD4FCAAF66AC8E55BEF820, U212435F3DF14494894A348DED3E56BB5, U8C83539829CD4FCAAF66AC8E55BEF82020];
                    new Treant(chart_config);
                }
            }
        }
    },


    bindtreeM6: function () {

        $.ajax({
            type: "POST",
            url: "M6Page.aspx/bindMLtree",
            data: '',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var data = eval(response.d);
                //alert(response.d);
                MTree.lodaTreeM6(data);

            },
        });
    },
    lodaTreeM6: function (data) {
        for (var i = 0; i < data.length; i++) {
            $("#x4" + i).text(data[i].Recycle);
            //   alert(data[i].Parent);
            if (data[i].Parent == "0") {
                var containerr = '#nodetree' + parseInt(i) + 17;
                var config = { container: '#nodetree' + parseInt(i + 17), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } }, pseudo0 = { 'innerHTML': ' <div class="iconbox iconbox--danger" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>Buy Now</p></a></div></div>', }
                chart_config = [config, pseudo0];
                new Treant(chart_config);
            }
            else {
                if (data[i].P1 == "0" && data[i].P2 == "0" && data[i].P3 == "0" && data[i].P4 == "0" && data[i].P5 == "0" && data[i].P6 == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 17), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo5 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo6 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', }
                    chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2, pseudo3, pseudo4, pseudo5, pseudo6];
                    new Treant(chart_config);
                }
                if (data[i].P1 != "0" && data[i].P2 == "0" && data[i].P3 == "0" && data[i].P4 == "0" && data[i].P5 == "0" && data[i].P6 == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 17), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P1 + '</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo5 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo6 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', }
                    chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2, pseudo3, pseudo4, pseudo5, pseudo6];
                    new Treant(chart_config);
                }
                if (data[i].P1 != "0" && data[i].P2 != '0' && data[i].P3 == "0" && data[i].P4 == "0" && data[i].P5 == "0" && data[i].P6 == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 17), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p> ' + data[i].P1 + '</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P2 + '</p></a></div></div>', },
                        pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo5 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo6 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', }
                    chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2, pseudo3, pseudo4, pseudo5, pseudo6];
                    new Treant(chart_config);
                }
                if (data[i].P1 != '0' && data[i].P2 != '0' && data[i].P3 != "0" && data[i].P4 == "0" && data[i].P5 == "0" && data[i].P6 == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 17), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P1 + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P2 + '</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P3 + '</p></a></div></div>', },
                        pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo5 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo6 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', }
                    chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2, pseudo3, pseudo4, pseudo5, pseudo6];
                    new Treant(chart_config);
                }
                if (data[i].P1 != '0' && data[i].P2 != '0' && data[i].P3 != "0" && data[i].P4 != "0" && data[i].P5 == "0" && data[i].P6 == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 17), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P1 + '</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P2 + '</p></a></div></div>', },
                        pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P3 + '</p></a></div></div>', },
                        pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P4 + '</p></a></div></div>', },
                        pseudo5 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', },
                        pseudo6 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', }
                    chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2, pseudo3, pseudo4, pseudo5, pseudo6];
                    new Treant(chart_config);
                }
                if (data[i].P1 != '0' && data[i].P2 != '0' && data[i].P3 != "0" && data[i].P4 != "0" && data[i].P5 != "0" && data[i].P6 == "0") {
                    var config = { container: '#nodetree' + parseInt(i + 17), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P1 + '</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P2 + '</p></a></div></div>', },
                        pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P3 + '</p></a></div></div>', },
                        pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P4 + '</p></a></div></div>', },
                        pseudo5 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>' + data[i].P5 + '</p></a></div></div>', },
                        pseudo6 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>Empty</p></a></div></div>', }
                    chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2, pseudo3, pseudo4, pseudo5, pseudo6];
                    new Treant(chart_config);
                }
                if (data[i].P1 != '0' && data[i].P2 != '0' && data[i].P3 != "0" && data[i].P4 != "0" && data[i].P5 != "0" && data[i].P6 != "0") {
                    var config = { container: '#nodetree' + parseInt(i + 17), rootOrientation: 'NORTH', levelSeparation: 60, siblingSeparation: 60, subTeeSeparation: 60, connectors: { type: 'step' }, animateOnInit: true, animation: { nodeAnimation: 'easeOutBounce', nodeSpeed: 700, connectorsAnimation: 'bounce', connectorsSpeed: 700 } },
                        U03AE5B66958843FDA0B8C2EDCA79823350 = { 'innerHTML': '<div class="iconbox iconbox--brand hover" style="margin-bottom:0px;"><div class="tooltip">Recycle :' + data[i].Recycle + '</div><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href="#"><p>' + data[i].Parent + '</p></a></div></div>', },
                        pseudo1 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>data[i].P1</p></a></div></div>', },
                        pseudo2 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>data[i].P1</p></a></div></div>', },
                        pseudo3 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>data[i].P1</p></a></div></div>', },
                        pseudo4 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>data[i].P1</p></a></div></div>', },
                        pseudo5 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>data[i].P1</p></a></div></div>', },
                        pseudo6 = { 'parent': U03AE5B66958843FDA0B8C2EDCA79823350, 'innerHTML': '<div class="iconbox iconbox--default" style="margin-bottom:0px;"><div class="kt-iconbox__body" style="display:grid;text-align:center;"><a href ="Home.aspx"><p>data[i].P1</p></a></div></div>', }
                    chart_config = [config, U03AE5B66958843FDA0B8C2EDCA79823350, pseudo1, pseudo2, pseudo3, pseudo4, pseudo5, pseudo6];
                    new Treant(chart_config);
                }

            }
        }
    }
}