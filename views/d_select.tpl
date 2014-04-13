<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sample For Hackathon </title>

    <!-- Bootstrap -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">

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
          <li class="active"><a href="">Registry</a></li>
          <li><a href="">For Women</a></li>
        </ul>
        <form class="navbar-form navbar-right">
          <input class="form-control col-lg-8" placeholder="Search" type="text">
        </form>
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
  <form class="form-horizontal" action='/d_select' method ="post">
    <fieldset>
      <input type="hidden" name="user_id" value="{{id}}" />
      <legend>君はどんなデザインが好き？　<br>好きなデザインをすべて選んでね！！</legend>

      <script type="text/javascript">
	<!--
	    function OnOff(lol){
	    if (lol.value == "Like this??") {
	    lol.value = "Yeah!! v(^_^) I LIKE IT!!";
	    } else {
	    lol.value = "Like this??";
	    }
	    }
	    // -->
      </script>

<!-- No.1 -->
      <img align="left" src="../static/image/simple/simple1.jpg" width="60%">
      
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>　好きならクリック→
      <label for="simple">
	<input type="button" class="btn btn-success" value="Like this??" 
	       onClick="OnOff(this);">
      </label>
      
      <br clear="left">
      <hr>
<!-- No.2 -->
      <img align="left" src="../static/image/pop/pop1.jpg" width="60%">
      
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>　好きならクリック→
      <label for="pop">
	<input type="button" class="btn btn-info" value="Like this??" 
	       onClick="OnOff(this);">
      </label>
      
      <br clear="left">
      <hr>
<!-- No.3 -->
      <img align="left" src="../static/image/illust/illust1.jpg" width="60%">
      
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>　好きならクリック→
      <label for="illust">
	<input type="button" class="btn btn-warning" value="Like this??" 
	       onClick="OnOff(this);">
      </label>
      
      <br clear="left">
      <hr>
<!-- No.4 -->
      <img align="left" src="../static/image/cute/cute1.jpg" width="60%">
      
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>　好きならクリック→
      <label for="cute">
	<input type="button" class="btn btn-danger" value="Like this??" 
	       onClick="OnOff(this);">
      </label>
      
      <br clear="left">
      <hr>
<!-- No.5 -->
      <img align="left" src="../static/image/japanese/japanese1.jpg" width="60%">
      
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>　好きならクリック→
      <label for="japanese">
	<input type="button" class="btn btn-success" value="Like this??" 
	       onClick="OnOff(this);">
      </label>
      
      <br clear="left">
      <hr>
<!-- No.6 -->
      <img align="left" src="../static/image/art/art1.jpg" width="60%">
      
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>　好きならクリック→
      <label for="art">
	<input type="button" class="btn btn-info" value="Like this??" 
	       onClick="OnOff(this);">
      </label>
      
      <br clear="left">
      <hr>
<!-- No.7 -->
      <img align="left" src="../static/image/cool/cool1.jpg" width="60%">
      
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>　好きならクリック→
      <label for="cool">
	<input type="button" class="btn btn-warning" value="Like this??" 
	       onClick="OnOff(this);">
      </label>
      
      <br clear="left">
      <hr>
<!-- No.8 -->
      <img align="left" src="../static/image/natural/natural1.jpg" width="60%">
      
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>　好きならクリック→
      <label for="natural">
	<input type="button" class="btn btn-danger" value="Like this??" 
	       onClick="OnOff(this);">
      </label>
      
      <br clear="left">
      <hr>
<!-- No.9 -->
      <img align="left" src="../static/image/ellegant/ellegant1.jpg" width="60%">
      
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>　好きならクリック→
      <label for="ellegant">
	<input type="button" class="btn btn-success" value="Like this??" 
	       onClick="OnOff(this);">
      </label>
      
      <br clear="left">
      <hr>
<!-- No.10 -->
      <img align="left" src="../static/image/retro/retro1.jpg" width="60%">
      
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>　好きならクリック→
      <label for="retro">
	<input type="button" class="btn btn-info" value="Like this??" 
	       onClick="OnOff(this);">
      </label>
      
      <br clear="left">
      <hr>
      <br>
    <div class="form-group">
      <label class="col-lg-2 control-label">デザイン力<br></label>
      
	<div data-role="fieldcontain">
	  <fieldset data-role="controlgroup" data-type="horizontal">
	    <legend>君のデザイン力はどれくらいかな？</legend>
	    <input type="radio" id="no1" name="skl_design" value ="1" checked>
	    <label for="no1">Lv.1</label>
	    <input type="radio" id="no2" name="skl_design" value ="2">
	    <label for="no2">Lv.2</label>
	    <input type="radio" id="no3" name="skl_design" value ="3">
	    <label for="no3">Lv.3</label>
	    <input type="radio" id="no4" name="skl_design" value ="4">
	    <label for="no4">Lv.4</label>
	    <input type="radio" id="no5" name="skl_design" value ="5">
	    <label for="no5">Lv.5</label>
	    <input type="radio" id="no6" name="skl_design" value ="6">
	    <label for="no6">Lv.6</label>
	    <input type="radio" id="no7" name="skl_design" value ="7">
	    <label for="no7">Lv.7</label>
	    <input type="radio" id="no8" name="skl_design" value ="8">
	    <label for="no8">Lv.8</label>
	    <input type="radio" id="no9" name="skl_design" value ="9">
	    <label for="no9">Lv.9</label>
	    <input type="radio" id="no10" name="skl_design" value ="10">
	    <label for="no10">Lv.10</label>
	  </fieldset>
	</div>
      
    </div>
    % design =[{"シンプル":"d_simple"},{"ポップ":"d_pop"},{"イラスト":"d_illust"},{"かわいい":"d_cute"},{"和風":"d_japanese"},{"アート":"d_art"},{"クール":"d_cool"},{"自然":"d_natural"},{"エレガント":"d_ellegant"},{"レトロ":"d_retro"}]
      <hr>
      % for d in design:

      {{d.keys()[0]}}
      <input type="checkbox" id="simple" name="{{d.values()[0]}}" value="1" >
 <!--      ポップ
      <input type="checkbox" id="pop" name="d_pop" value="1" >
      イラスト
      <input type="checkbox" id="illust" name="d_illust" value="1" >
      かわいい
      <input type="checkbox" id="cute" name="d_cute" value="1" >
      和風
      <input type="checkbox" id="japanese" name="d_japanese" value="1" >
      アート
      <input type="checkbox" id="art" name="d_art" value="1" >
      クール
      <input type="checkbox" id="cool" name="d_cool" value="1" >
      自然
      <input type="checkbox" id="natural" name="d_natural" value="1" >
      エレガント
      <input type="checkbox" id="ellegant" name="d_ellegant" value="1" >
      レトロ
      <input type="checkbox" id="retro" name="d_retro" value="1" > -->
      % end
    

      <div class="form-group">
	<div class="col-lg-10 col-lg-offset-2">
          <button type="submit" class="btn btn-primary">登録</button>
          <button type="reset" class="btn btn-default">リセット</button>
	</div>
      </div>
    </fieldset>
  </form>

    </div>

    <div id="footer" class="container">footer</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/static/js/bootstrap.min.js"></script>
  </body>
</html>
