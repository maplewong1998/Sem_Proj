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
                                <label>Full Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="name_input" type="text" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" id="name_validator" controltovalidate="name_input" errormessage="*Field required" />
                                </div>
                            </div>
                            <div class="col-6">
                                <label>Date of Birth</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="birthdate_input" type="date" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" id="dob_validator" controltovalidate="birthdate_input" errormessage="*Field required" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <label>Contact Number</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="phone_input" type="tel" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" id="phone_validator" controltovalidate="phone_input" errormessage="*Field required" />
                                </div>
                            </div>
                            <div class="col-6">
                                <label>E-mail Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="email_input" type="email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" id="email_validator" controltovalidate="email_input" errormessage="*Field required" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="state_input" type="text" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" id="state_validator" controltovalidate="state_input" errormessage="*Field required" />
                                </div>
                            </div>
                            <div class="col-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="city_input" type="text" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" id="city_validator" controltovalidate="city_input" errormessage="*Field required" />
                                </div>
                            </div>
                            <div class="col-4">
                                <label>Postcode</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="postnumber_input" type="text" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" id="postnumber_validator" controltovalidate="postnumber_input" errormessage="*Field required" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <label>Address</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="address_input" TextMode="MultiLine" type="text" Rows="3" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" id="address_validator" controltovalidate="address_input" errormessage="*Field required" />
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
                                <label>Username</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="username_input" type="text" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" id="username_validator" controltovalidate="username_input" errormessage="*Field required" />
                                </div>
                            </div>
                            <div class="col-6">
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="password_input" type="password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" id="password_validator" controltovalidate="password_input" errormessage="*Field required" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <label>Confirm Password</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="confirm_password_input" type="password" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="text-danger" runat="server" id="confirm_password_validator" controltovalidate="confirm_password_input" errormessage="*Please confirm your password" />
                                    <asp:CompareValidator ID="confirm_password_validator2" runat="server" ControlToValidate="confirm_password_input" CssClass="text-danger" ControlToCompare="password_input" ErrorMessage="*Password does not match" />
                                </div>
                            </div>
                            <div class="col-6">

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
