<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="adminpage_membermanagement.aspx.cs" Inherits="Sem_Proj.adminpage_membermanagement" %>
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

                            <div class="row mb-1">
                                <div class="col-6">
                                    Member&nbsp<asp:RequiredFieldValidator ID="memberid_input_v" runat="server" ErrorMessage="*Required" ControlToValidate="memberid_input"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-6">
                                    Account Status
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6 form-group input-group">
                                    <asp:TextBox CssClass="form-control" ID="memberid_input" runat="server"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:LinkButton CssClass="btn btn-primary" ID="search_btn" runat="server" Text="g" OnClick="search_btn_Click"><i class="fas fa-search"></i></asp:LinkButton>
                                    </div>
                                </div>                                
                                <div class="col-6 form-group input-group">
                                    <asp:TextBox CssClass="form-control" ID="accounstatus_input" runat="server" ReadOnly="True"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:LinkButton CssClass="btn btn-success" ID="active_btn" runat="server" Text="a" OnClick="active_btn_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton CssClass="btn btn-warning" ID="pending_btn" runat="server" Text="P" OnClick="pending_btn_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton CssClass="btn btn-danger" ID="suspend_btn" runat="server" Text="s" OnClick="suspend_btn_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6 form-group">
                                    <label>Full Name</label>
                                    <asp:TextBox CssClass="form-control" ID="name_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-6 form-group">
                                    <label>Account Privilege</label>
                                    <asp:TextBox CssClass="form-control" ID="privilege" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4 form-group">
                                    <label>Date of Birth</label>
                                    <asp:TextBox CssClass="form-control" ID="birthdate_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <label>Contact Number</label>
                                    <asp:TextBox CssClass="form-control" ID="phone_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <label>Email Address</label>
                                    <asp:TextBox CssClass="form-control" ID="email_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4 form-group">
                                    <label>State</label>
                                    <asp:TextBox CssClass="form-control" ID="state_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <label>City</label>
                                    <asp:TextBox CssClass="form-control" ID="city_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <div class="col-4 form-group">
                                    <label>Post Number</label>
                                    <asp:TextBox CssClass="form-control" ID="postnumber_input" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 form-group">
                                    <label>Address</label>
                                    <asp:TextBox CssClass="form-control" ID="address_input" TextMode="MultiLine" Rows="3" runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-7 form-group mx-auto">
                                    <asp:Button CssClass="btn btn-block btn-danger" ID="delete_user_btn" runat="server" Text="Delete User Permanently" OnClick="delete_user_btn_Click"/>
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
                                    <asp:GridView class="table table-striped table-bordered" ID="member_list" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="member_id" HeaderText="ID" SortExpression="member_id" ReadOnly="True" />
                                            <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                            <asp:BoundField DataField="contact_no" HeaderText="Contact" SortExpression="contact_no" />
                                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                            <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
                                            <asp:BoundField DataField="account_privilege" HeaderText="Privilege" SortExpression="account_privilege" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT [full_name], [dob], [contact_no], [email], [state], [city], [postcode], [full_address], [member_id], [account_status], [account_privilege] FROM [member]"></asp:SqlDataSource>
                                </div>
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
