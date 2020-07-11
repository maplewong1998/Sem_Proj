<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="homepage_userregistration.aspx.cs" Inherits="Sem_Proj.userregistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="userregistration" class="container">
        <section id="loginform" class="row mt-4">
            <div class="col-md-12 mx-auto">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col-12 d-flex justify-content-center">
                                <img src="resources/imgs/sign-up.png" width="150" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12  d-flex justify-content-center mt-2">
                                <h3>Sign Up</h3>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                Full Name
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="name_input" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-6">
                                Date of Birth
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="birthdate_input" type="date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                Contact Number
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="phone_input" type="tel" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-6">
                                Email Address
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="email_input" type="email" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                State
                                <div class="group">
                                    <asp:TextBox CssClass="form-control" ID="state_input" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-4">
                                City
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="city_input" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-4">
                                Postcode
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="postnumber_input" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                Address
                                <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="address_input" TextMode="MultiLine" type="text" Rows="3" runat="server"></asp:TextBox>
                            </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 d-flex justify-content-center">
                                <h5>Login Credentials</h5>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                Username
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="username_input" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-6">
                                Password
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="password_input" type="password" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6 form-group mx-auto">
                                <asp:Button CssClass="btn btn-block btn-primary" ID="sign_up_btn" runat="server" Text="Sign Up" OnClick="sign_up_btn_Click" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
