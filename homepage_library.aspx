<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="homepage_library.aspx.cs" Inherits="Sem_Proj.homepage_library" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="library" class="container-fluid">
        <div class="container mt-4">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <h3>Library</h3>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <img src="resources/imgs/library.png" width="150"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <asp:GridView ID="book_list" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1" ShowHeader="False">
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="col-1">
                                                                <%# Container.DataItemIndex+1 %>
                                                            </div>
                                                            <div class="col-11 col-md-9 col-lg-9 col-xl-9">
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <asp:Label ID="book_name" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        ISBN-13 -
                                                                        <asp:Label ID="book_id" runat="server" Text='<%# Eval("book_id") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Author -
                                                                        <asp:Label ID="author" runat="server" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                        &nbsp;| Genre -
                                                                        <asp:Label ID="genre" runat="server" Text='<%# Eval("genre") %>'></asp:Label>
                                                                        &nbsp;| Language -
                                                                        <asp:Label ID="language" runat="server" Text='<%# Eval("language") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Publisher -
                                                                        <asp:Label ID="publisher" runat="server" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                        &nbsp;| Publish Date -
                                                                        <asp:Label ID="publish_date" runat="server" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                        &nbsp;| Pages -
                                                                        <asp:Label ID="pages" runat="server" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                        &nbsp;| Edition -
                                                                        <asp:Label ID="edition" runat="server" Text='<%# Eval("edition") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Cost -
                                                                        <asp:Label ID="cost" runat="server" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                        &nbsp;| Actual Stock -
                                                                        <asp:Label ID="actual_stock" runat="server" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                        &nbsp;| Issued -
                                                                        <asp:Label ID="issued_books" runat="server" Text='<%# Eval("issued_books") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Description -
                                                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("book_description") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-12 col-md-2 col-lg-2 col-xl-2">
                                                                <asp:Image class="img-fluid p-1" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img") %>' />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
