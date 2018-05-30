<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Movie_statistics.aspx.cs" Inherits="Movie_statistics" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>2
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>

  <title>Statistics</title>

  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link href="css/sb-admin.css" rel="stylesheet"/>
</head>
    
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="Default.aspx">MOVIES</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title=" My Profile">
          <a class="nav-link" href="ProfilePage.aspx">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">My Profile</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="All movies">
          <a class="nav-link" href="Default.aspx">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">All Movies</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Add Movie">
          <a class="nav-link" href="Add_movie.aspx">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Add Movie</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Movie Statistics">
          <a class="nav-link" href="Movie_statistics.aspx">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text">Movie Statistics</span>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">  
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="content-wrapper">   

    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="Login.aspx">Logout</a>
          </div>
        </div>
      </div>
    </div>
   <div class="container-fluid">
       <div class="card mb-3">
          <div class="card-body">

            <div class="row">
                <div class="col-lg-3 col-md-6">
                   <div class="card text-white bg-warning o-hidden h-100">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                  <asp:Label ID="Label1" runat="server" Text=""></asp:Label></div>
                                    <div>Movies</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                     <div class="card text-white bg-success o-hidden h-100">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                          <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                    </div>
                
                                    <div>Categories</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                     <div class="card text-white bg-danger o-hidden h-100">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">
                                          <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                    </div>
                   
                                    <div>Actor/Actress</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>       
          </div>
        </div>
  </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="js/sb-admin.min.js"></script>
    <script src="js/sb-admin-charts.min.js"></script>

</body>
</html>
