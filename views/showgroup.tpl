<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sample For Hackathon </title>

    <link href="/static/css/style.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/style.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>

    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="navbar-header">
        <button class="navbar-toggle" data-toggle="collapse" data-target=".target">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/">GroupMaker</a>
      </div>

      <div class="collapse navbar-collapse target">
        <ul class="nav navbar-nav">
          <li><a href="/registry">Registry</a></li>
	  <li class="active"><a href="/showgroup">ShowGroup</a></li>
        </ul>
	<!-- <form class="navbar-form navbar-right">
        <input class="form-control col-lg-8" placeholder="Search" type="text">
        </form> -->
	<!--         <ul class="nav navbar-nav navbar-right">
        <li><a href="">Link3</a></li>
        <li><a href="">Link4</a></li>
        </ul>  -->
      </div>
    </nav>

    <!--     <div id="header" class="container" style="background:red; margin-top:60px">
    header
    </div> -->

    <!--     <div class="progress progress-striped active">
    <div class="progress-bar progress-bar-info" style="width:60%"></div>
    </div> -->


    <div class="container" style="margin-top:60px">
      <div class="row">
	% import numpy as np
    % for team_count, info in enumerate(team_info):
	<div class="team-number">-----チーム No.{{team_count+1}}----- </div>
    %     for member_count, (member, power) in enumerate(info):
	% a, b, c = np.abs(list(power)[0] - mu[0])/sigma[0], np.abs(list(power)[1] - mu[1])/sigma[1], np.abs(list(power)[2] - mu[2])/sigma[2]

	% best = a

	% type = 'manage'

	% if b > best:
    %    best = b
    %    type = 'prog'
    %    if c > best:
    %        best = c
    %        type = 'design'
    % end
    % else:
    %    if c > best:
    %        best = c
    %        type = 'design'
    % end
    % end
    
        <div class="member-info"> ジョブ ： 
	  % if type == 'manage':
	  ディレクター
	  % elif type == 'prog':
	  プログラマー
	  % elif type == 'design':
	  デザイナー
	  % end
	  　|　 なまえ ：{{member}}  
	  <br />
	  % if type == 'manage':
	  <img src={{str(manage_imgs[member_count % 4])}} alt="directer">
	  % elif type == 'prog':
	  <img src={{str(prog_imgs[member_count % 4])}} alt="programmer">
	  % elif type == 'design':
	  <img src={{str(design_imgs[member_count % 4])}} alt="designer">
	  % end
	  <div class="power">
	  <p>マネジメントパワー： {{int(np.abs(list(power)[0] - mu[0])/sigma[0] * 1000)}}ポイント</p> 
	  <p>プログラミングパワー： {{int(np.abs(list(power)[1] - mu[1])/sigma[1] * 1000)}}ポイント</p>
	  <p>デザインパワー： {{int(np.abs(list(power)[2] - mu[2])/sigma[2] * 1000)}}ポイント</p>
	  </div>
	<hr>
	</div>
	% end

	% end
      </div>
    </div>
<div style = "width:80%;margin:auto;margin-top:32px">
<div style = "font-size:24px">ネットワーク</div>
<div style = "float:right">
<button class="btn btn-primary" id = "toggle-layout">Start Layout</button>
<button class="btn btn-primary" id = "restart-camera">Restart Camera</button>
</div>
</div>

<div id="sigma-container"></div>
<script src="/static/js/sigma/sigma.js/sigma.min.js"></script>
<script src="/static/js/sigma/sigma.js/plugins/sigma.parsers.gexf.min.js"></script>
<script src="/static/js/sigma/sigma.js/plugins/sigma.parsers.gexf.min.js"></script>
<script src="/static/js/sigma/sigma.js/plugins/sigma.layout.forceAtlas2.min.js"></script>
<script src="/static/js/sigma/sigma.js/plugins/sigma.plugins.animate.min.js"></script>
<script src="/static/js/sigma/sigma.js/plugins/sigma.plugins.neighborhoods.min.js"></script>
<script>
    sigma.parsers.gexf(
     '/static/output/output.gexf', {
      container: 'sigma-container',
      settings: {
        defaultLabelColor: '#fff',
        sideMargin: 1
        }
    },
    function(s) {

      s.graph.nodes().forEach(function(n) {
        n.originalColor = n.color;
      });
      s.graph.edges().forEach(function(e) {
        e.originalColor = e.color;
      });
      s.bind('clickNode', function(e) {
      var nodeId = e.data.node.id,
          toKeep = s.graph.neighbors(nodeId);
      toKeep[nodeId] = e.data.node;

      s.graph.nodes().forEach(function(n) {
        if (toKeep[n.id])
          n.color = n.originalColor;
        else
          n.color = '#eee';
      });
      s.graph.edges().forEach(function(e) {
          if (toKeep[e.source] && toKeep[e.target])
            e.color = e.originalColor;
          else
            e.color = '#eee';
        });
          s.refresh();
      });

      s.bind('clickStage', function(e) {
        s.graph.nodes().forEach(function(n) {
          n.color = n.originalColor;
        });

        s.graph.edges().forEach(function(e) {
          e.color = e.originalColor;
        });

        // Same as in the previous event:
        s.refresh();
      });


      document.getElementById('toggle-layout').addEventListener('click', function() {
        if ((s.forceatlas2 || {}).isRunning) {
          s.stopForceAtlas2();
          document.getElementById('toggle-layout').innerHTML = 'Start layout';
        } else {
          s.startForceAtlas2();
          document.getElementById('toggle-layout').innerHTML = 'Stop layout';
        }
      });
      document.getElementById('restart-camera').addEventListener('click', function() {
        s.cameras[0].goTo({
          x: 0,
          y: 0,
          angle: 0,
          ratio: 1
        });
      });
    });
</script>    

    <div id="footer" class="container"></div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/static/js/bootstrap.min.js"></script>
  </body>
</html>
