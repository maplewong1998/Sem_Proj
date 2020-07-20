<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="adminpage_bookissuing.aspx.cs" Inherits="Sem_Proj.adminpage_booklending" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="bookissuing" class="container-fluid">
        <div class="container-fluid mt-4">
            <div class="row">
                    <div class="col-lg-5">
                        <div class="card">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <h3>Book Issuing</h3>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <img src="resources/imgs/books.png" width="150" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <label>Issue ID</label>&nbsp<asp:RequiredFieldValidator class="text-danger" ID="issueid_v" runat="server" ErrorMessage="*Required" ControlToValidate="issueid_input"></asp:RequiredFieldValidator>
                                        <div class="form-group input-group">
                                            <asp:TextBox CssClass="form-control" ID="issueid_input" runat="server"></asp:TextBox>
                                            <div class="input-group-append">                                                
                                                <asp:LinkButton class="btn btn-primary" ID="issueid_btn" runat="server" OnClick="issueid_btn_Click"><i class="fas fa-search"></i></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <label>Status</label>&nbsp<asp:RequiredFieldValidator class="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="issueid_input"></asp:RequiredFieldValidator>
                                        <div class="form-group input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                                            <div class="input-group-append">                                                
                                                <asp:LinkButton CssClass="btn btn-success" ID="returned_btn" runat="server" Text="r" OnClick="returned_btn_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                                <asp:LinkButton CssClass="btn btn-warning" ID="returneddue_btn" runat="server" Text="i" OnClick="returneddue_btn_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                                <asp:LinkButton CssClass="btn btn-danger" ID="due_btn" runat="server" Text="d" OnClick="due_btn_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <label>Member ID</label>&nbsp<asp:RequiredFieldValidator class="text-danger" ID="memberid_v" runat="server" ErrorMessage="*Required" ControlToValidate="member_id"></asp:RequiredFieldValidator>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="member_id" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <label>Book ID</label>&nbsp<asp:RequiredFieldValidator class="text-danger" ID="bookid_v" runat="server" ErrorMessage="*Required" ControlToValidate="book_id"></asp:RequiredFieldValidator>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="book_id" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <label>Member Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="member_name" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <label>Book Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="book_name" runat="server" ReadOnly="True"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <label>Start Date</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="start_date" runat="server" type="date"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <label>End Date</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="end_date" runat="server" type="date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <asp:Button CssClass="btn btn-block btn-success" ID="Issue" runat="server" Text="Issue" OnClick="Issue_Click" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-lg-7 mt-3 mt-lg-0 mt-xl-0">
                        <div class="card">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <h3>Issued Book List</h3>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <asp:GridView class="table table-bordered" ID="issued_book_list" runat="server" AutoGenerateColumns="False" DataKeyNames="issue_id" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="issue_id" HeaderText="Issue ID" ReadOnly="True" SortExpression="issue_id" />
                                                <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                                <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                                <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                                <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                                                <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue]"></asp:SqlDataSource>
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
