<%@ Page Title="" Language="C#" MasterPageFile="~/adminpage.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="Sem_Proj.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="container-fluid">
        <div class="container-fluid mt-4">
            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <img src="resources/imgs/generaluser.png" width="150" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <h3>User Profile</h3>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <span>Account Status -</span>&nbsp<asp:Label CssClass="badge badge-pill badge-info" ID="account_status" runat="server" Text="account status"></asp:Label>
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
                                </div>
                                <div class="col-6">
                                    Date of Birth
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6 form-group">
                                    <asp:TextBox CssClass="form-control" ID="name_input" type="text" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-6 form-group">
                                    <asp:TextBox CssClass="form-control" ID="birthdate_input" type="date" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    Contact Number
                                </div>
                                <div class="col-6">
                                    Email Address
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6 form-group">
                                    <asp:TextBox CssClass="form-control" ID="phone_input" type="tel" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-6 form-group">
                                    <asp:TextBox CssClass="form-control" ID="email_input" type="email" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    State
                                </div>
                                <div class="col-4">
                                    City
                                </div>
                                <div class="col-4">
                                    Post Number
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4 form-group">
                                    <asp:TextBox CssClass="form-control" ID="state_input" type="text" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <asp:TextBox CssClass="form-control" ID="city_input" type="text" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <asp:TextBox CssClass="form-control" ID="postnumber_input" type="text" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    Address
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 form-group">
                                    <asp:TextBox CssClass="form-control" ID="address_input" TextMode="MultiLine" type="text" Rows="3" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <h5>Login Credentials</h5>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    Username
                                </div>
                                <div class="col-4">
                                    Password
                                </div>
                                <div class="col-4">
                                    Change Password
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4 form-group">
                                    <asp:TextBox CssClass="form-control" ID="username_input" type="text" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <asp:TextBox CssClass="form-control" ID="password_input" type="password" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <asp:TextBox CssClass="form-control" ID="change_password_input" type="password" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6 form-group mx-auto">
                                    <asp:Button CssClass="btn btn-block btn-primary" ID="update_profile_btn" runat="server" Text="Update" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mt-3 mt-lg-0 mt-xl-0">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <img src="resources/imgs/digital-data.png" width="100px" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <asp:Label CssClass="badge badge-pill badge-info mt-3" ID="Label1" runat="server" Text="borrow status"></asp:Label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <h3>Borrow History</h3><br />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <asp:GridView CssClass="" ID="borrow_history" runat="server"></asp:GridView>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
