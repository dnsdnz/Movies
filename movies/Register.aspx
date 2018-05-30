<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>
  <title>Register</title>
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
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
<body class="bg-dark">
     <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Register an Account</div>
      <div class="card-body">
        <form id="form1" runat="server">
          <div class="form-group">
               <asp:FileUpload ID="FileUpload1" runat="server" onchange="imagepreview(this);" Width="80%" style="margin-top:10px; color:white; resize:none;" Height="24px"  />
              <img id="imgprw" style="color: white;" alt="Lütfen resim yükleyiniz." />
            <label for="exampleInputEmail1">Email address</label>
         <asp:TextBox ID="TextBox1" class="form-control" type="email" aria-describedby="emailHelp" placeholder="Enter your e-mail" runat="server"></asp:TextBox>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <label for="exampleInputPassword1">Password</label>
             <asp:TextBox ID="TextBox2" class="form-control" type="password" placeholder="Password" runat="server"></asp:TextBox>
                   <asp:Button ID="Button1" runat="server" class="login100-form-btn" Text="Register" OnClick="Button1_Click"/>
              </div>
            </div>
          </div>
        </form>  
      </div>
    </div>
  </div>

  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    
</body>
</html>
