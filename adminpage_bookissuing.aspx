<%@ Page Title="" Language="C#" MasterPageFile="~/adminpage.Master" AutoEventWireup="true" CodeBehind="adminpage_bookissuing.aspx.cs" Inherits="Sem_Proj.adminpage_booklending" %>
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
                                        <label>Member ID</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="member_id" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <label>Book ID</label>
                                        <div class="form-group input-group">
                                            <asp:TextBox CssClass="form-control" ID="book_id" runat="server"></asp:TextBox>
                                            <div class="input-group-append">
                                                <asp:Button CssClass="btn input-group-text" ID="search_btn" runat="server" Text="Go" />
                                            </div>
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
                                        <asp:Button CssClass="btn btn-block btn-success" ID="Issue" runat="server" Text="Issue" />
                                    </div>
                                    <div class="col-6">
                                        <asp:Button CssClass="btn btn-block btn-danger" ID="Return" runat="server" Text="Return" />
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
                                        <asp:GridView CssClass="" ID="issued_book_list" runat="server"></asp:GridView>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
