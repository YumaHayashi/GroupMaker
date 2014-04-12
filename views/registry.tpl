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

% management = [{'skl_direction':'マネジメント'}, {'skl_presentation':'プレゼンテーション'},{ 'skl_research':'リサーチ'},{ 'skl_contentsmaking':'コンテンツメイキング'}]
%engineer=[{'skl_ios': 'iOS'},{'skl_android': 'Android'},{'skl_windows8': 'Windows8アプリ'},{'skl_html': 'HTML'},{'skl_css': 'CSS'},{ 'skl_javascript': 'Javascript'},{'skl_python': 'Python'}, {'skl_ruby': 'Ruby'},{'skl_php': 'PHP'},{'skl_java': 'Java'},{'skl_perl': 'Perl'},{'skl_c': 'C言語'},{'skl_cpp': 'C++'},{'skl_wordpress': 'Wordpress'}]


<div class="container" style="margin-top:60px">
  <form class="form-horizontal" action='/registry' method ="post">
    <fieldset>
      <legend>基本情報</legend>
      <div class="form-group">
	  <label for="name" class="control-label col-lg-2">ユーザ名</label>
	<div class="col-lg-10">
	  <input class="form-control" id="name" name ="name" placeholder="UserName" type="text">
	</div>
      </div>

      <div class="form-group">
	<label class="col-lg-2 control-label">性別</label>
	<div class="col-lg-10">
          <div class="radio">
            <label>
              <input name="sex" id="optionsRadios1" value="male" checked="" type="radio">
              男
            </label>
          </div>
          <div class="radio">
            <label>
              <input name="sex" id="optionsRadios2" value="female" type="radio">
	      女
            </label>
          </div>
	</div>
      </div>

      <legend>マネジメントスキル</legend>
      <div class="form-group">
        % for d in management:
	<label for="select" class="col-lg-2 control-label">{{d.values()[0]}}</label>
	<div class="col-lg-10">
          <select class="form-control" name="{{d.keys()[0]}}" id="select">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
	  <br />
	</div>
  % end
      </div>

      <legend>エンジニアスキル</legend>
      <div class="form-group">
	% for d in engineer:

	<label for="select" class="col-lg-2 control-label">{{d.values()[0]}}</label>
	<div class="col-lg-10">
          <select class="form-control" name="{{d.keys()[0]}}" id="select">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
	  <br />
	</div>

	% end

	<legend>性格</legend>
	<label for="select" class="col-lg-2 control-label">モチベーション</label>
	<div class="col-lg-10">
          <select class="form-control" name="skl_motivation" id="select">
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
	  <br />
	</div>
      </div>

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
