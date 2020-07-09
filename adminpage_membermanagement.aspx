<%@ Page Title="" Language="C#" MasterPageFile="~/adminpage.Master" AutoEventWireup="true" CodeBehind="adminpage_membermanagement.aspx.cs" Inherits="Sem_Proj.adminpage_membermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="membermanagement" class="container-fluid">
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
                                    <h3>Member Details</h3>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    Member ID
                                </div>                                
                                <div class="col-6">
                                    Account Status
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6 form-group input-group">
                                    <asp:TextBox CssClass="form-control" ID="memberid_input" runat="server"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:Button CssClass="btn input-group-text" ID="search_btn" runat="server" Text="Go" />
                                    </div>
                                </div>                                
                                <div class="col-6 form-group input-group">
                                    <asp:TextBox CssClass="form-control" ID="accounstatus_input" runat="server" ReadOnly="True"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:LinkButton CssClass="btn btn-success" ID="Button1" runat="server" Text="S"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton CssClass="btn btn-warning" ID="LinkButton1" runat="server" Text="P"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton CssClass="btn btn-danger" ID="LinkButton2" runat="server" Text="D"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    Full Name
                                </div>
                                <div class="col-6">
                                    Username
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6 form-group">
                                    <asp:TextBox CssClass="form-control" ID="name_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-6 form-group">
                                    <asp:TextBox CssClass="form-control" ID="username_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    Date of Birth
                                </div>
                                <div class="col-4">
                                    Contact Number
                                </div>
                                <div class="col-4">
                                    Email Address
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4 form-group">
                                    <asp:TextBox CssClass="form-control" ID="birthdate_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <asp:TextBox CssClass="form-control" ID="phone_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <asp:TextBox CssClass="form-control" ID="email_input" runat="server" ReadOnly="True"></asp:TextBox>
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
                                    <asp:TextBox CssClass="form-control" ID="state_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <asp:TextBox CssClass="form-control" ID="city_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <asp:TextBox CssClass="form-control" ID="postnumber_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    Address
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 form-group">
                                    <asp:TextBox CssClass="form-control" ID="address_input" TextMode="MultiLine" Rows="3" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-7 form-group mx-auto">
                                    <asp:Button CssClass="btn btn-block btn-danger" ID="delete_user_btn" runat="server" Text="Delete User Permanently" />
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
                                    <h3>Member List</h3><br />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <asp:GridView CssClass="" ID="member_list" runat="server"></asp:GridView>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
