<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_movie.aspx.cs" Inherits="Add_movie" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>

  <title>Add Movie</title>

  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet"/>
  <link href="css/sb-admin.css" rel="stylesheet"/>


     <script type="text/javascript">
        function imagepreview(input) {
            if (input.files && input.files[0]) {

                var fildr = new FileReader();
                fildr.onload = function (e) {
                    $('#imgprw').attr('src', e.target.result);

                }
                fildr.readAsDataURL(input.files[0]);
            }
        }
     </script>

</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
    <form class="form-inline my-2 my-lg-0 mr-lg-2"  id="form1" runat="server">
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
        <div class="content-wrapper" style="width:1000px;">
    <div class="container-fluid">
        <asp:FileUpload ID="FileUpload1" runat="server" onchange="imagepreview(this);" Width="10%" style="margin-top:10px; color:white; resize:none;" Height="24px"  />
              <img id="imgprw" style="color: white;" alt="Lütfen resim yükleyiniz." />
            
        <br />
        <ul class="align-content-center" style="list-style-type:none">
            <li>Photo:</li>
           
              
            <li>Name:</li>
            <li><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></li>
            <li>Director:</li>
            <li><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></li>
            <li>Date:</li>
            <li><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></li>
            <li>Category:</li>
            <li><asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Action</asp:ListItem>
                <asp:ListItem>Drama</asp:ListItem>
                <asp:ListItem>Crime</asp:ListItem>
                <asp:ListItem>Horror</asp:ListItem>
                <asp:ListItem>sci-fi</asp:ListItem>
                <asp:ListItem>Thriller</asp:ListItem>
                <asp:ListItem>Comedy</asp:ListItem>
                </asp:DropDownList></li>
            <li>Actor/Actress:</li>
            <li> <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox> </li>
            <li>Content:</li>
            <li> <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></li>
        </ul>
            <asp:Button ID="Button1" runat="server" Text="Add Movie" onclick="Button1_Click1"/>

            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
         
    </div>
            </div>
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
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
    <script src="js/sb-admin.min.js"></script>
    <script src="js/sb-admin-datatables.min.js"></script>
 
   </form>
</body>
</html>
