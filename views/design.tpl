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

  <body>

<div id="sigma-container"></div>
<script src="/static/js/sigma/sigma.js/sigma.min.js"></script>
<script src="/static/js/sigma/sigma.js/plugins/sigma.parsers.gexf.min.js"></script>
<script>
  sigma.parsers.gexf(
    '/static/output/output.gexf',
    { // Here is the ID of the DOM element that
      // will contain the graph:
      container: 'sigma-container'
    },
    function(s) {
      // This function will be executed when the
      // graph is displayed, with "s" the related
      // sigma instance.
    }
  );
</script>    
  </body>
</html>
