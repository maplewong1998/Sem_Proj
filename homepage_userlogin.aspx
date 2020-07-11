<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="homepage_userlogin.aspx.cs" Inherits="Sem_Proj.userlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="loginpage" class="container">
        <section id="loginform" class="row mt-4">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col-12 d-flex justify-content-center">
                                <img src="resources/imgs/generaluser.png" width="150" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 d-flex justify-content-center">
                                <h3>Login</h3>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="username_input" type="text" placeholder="Username" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="password_input" type="password" placeholder="Password" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button CssClass="btn btn-primary btn-block" ID="login_btn" runat="server" Text="Login" OnClick="login_btn_Click" />
                                </div>
                                <div class="form-group">
                                    <a class="btn btn-link btn-block" id="forgot_account_btn" type="button" href="#">Forgot your account?</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
