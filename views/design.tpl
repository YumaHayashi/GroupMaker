<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Bootply.com - Landing Page</title>
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" type="text/css" rel="stylesheet">

    <!-- CSS code from Bootply.com editor -->

    <style type="text/css">
     html,body {
       height:100%;
     }

     h1 {
       font-family: Arial,sans-serif
       font-size:80px;

     }

     .lead {

     }


     /* Custom container */
     .container-full {
       margin: 0 auto;
       width: 100%;
       min-height:100%;


       overflow:hidden;
     }

     .container-full a {

       text-decoration:none;
     }

     .v-center {
       margin-top:7%;
     }

    </style>
  </head>

  <!-- HTML code from Bootply.com editor -->
  % design = [{"aaaaaa":"たなか"}]

  <body>

    <div class="container-full">
      <h1>デザインを乗っけるよー、{{name}}</h1>  
    </div>
     <form class="form-horizontal" action='/design' method ="post">
          <div class="form-group">
            % for d in design:
      <label for="select" class="col-lg-2 control-label">{{d.values()[0]}}</label>
      <div class="col-lg-10">
              <select class="form-control" name="{{d.keys()[0]}}" id="select">
    <option value="0">0</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
              </select>
        <br />
      </div>
      % end
    </div>
        <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
              <button type="submit" class="btn btn-primary">登録</button>
              <button type="reset" class="btn btn-default">リセット</button>
      </div>
    </div>
    </form>

  </body>
</html>
