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
	  <!-- <li><a href="">For Women</a></li> -->
        </ul>
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
      <div style ="margin:100px auto,text-align:center,font-size:30px">
      <legend>ご登録ありがとうございます<br>少しお待ちください<br>{{cnt}}/{{max_student}}</legend>
    </div>
      <div class="form-group">
	<div class="col-lg-10 col-lg-offset-2">
        <a href="/waiting"></a><button type="submit" class="btn btn-primary">更新</button></a>
	</div>
      </div>
    </div>

    <div id="footer" class="container"></div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/static/js/bootstrap.min.js"></script>
  </body>
</html>
