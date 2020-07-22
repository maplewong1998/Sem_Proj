<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="Sem_Proj.userprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="userprofile" class="container-fluid">
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
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="name_input" type="text" runat="server" ReadOnly="true"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-6">
                                    Date of Birth
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="birthdate_input" type="date" runat="server" ReadOnly="true"></asp:TextBox>
                                    
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    Contact Number&nbsp<asp:RequiredFieldValidator CssClass="text-danger" ID="phone_input_v" ControlToValidate="phone_input" runat="server" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="phone_input" type="tel" runat="server"></asp:TextBox>
                                    
                                    </div>
                                </div>
                                <div class="col-6">
                                    Email Address&nbsp<asp:RequiredFieldValidator CssClass="text-danger" ID="email_input_v" ControlToValidate="email_input" runat="server" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="email_input" type="email" runat="server"></asp:TextBox>
                                    
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    State&nbsp<asp:RequiredFieldValidator CssClass="text-danger" ID="state_input_v" ControlToValidate="state_input" runat="server" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="state_input" type="text" runat="server"></asp:TextBox>
                                    
                                    </div>
                                </div>
                                <div class="col-4">
                                    City&nbsp<asp:RequiredFieldValidator CssClass="text-danger" ID="city_input_v" ControlToValidate="city_input" runat="server" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="city_input" type="text" runat="server"></asp:TextBox>
                                    
                                    </div>
                                </div>
                                <div class="col-4">
                                    Postcode&nbsp<asp:RequiredFieldValidator CssClass="text-danger" ID="postnumber_input_v" ControlToValidate="postnumber_input" runat="server" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="postnumber_input" type="text" runat="server"></asp:TextBox>
                                    
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    Address&nbsp<asp:RequiredFieldValidator CssClass="text-danger" ID="address_input_v" ControlToValidate="address_input" runat="server" ErrorMessage="*Required"></asp:RequiredFieldValidator>
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
                                <div class="col-4">
                                    Username
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="username_input" type="text" runat="server" ReadOnly="true"></asp:TextBox>
                                    
                                    </div>
                                </div>
                                <div class="col-4">
                                    Password
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="password_input" type="password" runat="server" ReadOnly="true"></asp:TextBox>
                                    
                                    </div>
                                </div>
                                <div class="col-4">
                                    Change Password&nbsp<asp:RequiredFieldValidator CssClass="text-danger" ID="changepassword_input_v" ControlToValidate="changepassword_input" runat="server" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="changepassword_input" type="password" runat="server"></asp:TextBox>
                                    
                                    </div>
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
                                    <asp:GridView class="table table-bordered" ID="borrow_history" runat="server" AutoGenerateColumns="False" DataKeyNames="issue_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="issue_id" HeaderText="Issue ID" ReadOnly="True" SortExpression="issue_id" />
                                            <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                            <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                            <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                                            <asp:BoundField DataField="issue_status" HeaderText="Status" SortExpression="issue_status" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue] WHERE ([member_id] = @member_id)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="member_id" SessionField="username" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>