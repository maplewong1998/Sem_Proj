<%@ Page Title="" Language="C#" MasterPageFile="~/adminpage.Master" AutoEventWireup="true" CodeBehind="adminpage_bookinventory.aspx.cs" Inherits="Sem_Proj.adminpage_bookinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="bookinventory" class="container-fluid">
        <div class="container-fluid mt-4">
            <div class="row">
                    <div class="col-lg-5">
                        <div class="card">
                            <div class="card-body">

                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <h3>Book Details</h3>
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
                                    <div class="col form-group">
                                        <asp:FileUpload CssClass="form-control" ID="FileUpload1" runat="server" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4">
                                        <label>ISBN</label>
                                        <div class="form-group input-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                                            <div class="input-group-append">                                                
                                                <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server"><i class="fas fa-search"></i></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-8">
                                        <label>Book Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-7">
                                        <label>Language</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                                <asp:ListItem Text="English" Value="English" />
                                                <asp:ListItem Text="Malay" Value="Malay" />
                                                <asp:ListItem Text="Chinese" Value="Chinese" />
                                                <asp:ListItem Text="Hindi" Value="Hindi" />
                                            </asp:DropDownList>
                                        </div>
                                        <label>Author Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server"></asp:TextBox>
                                        </div>                                        
                                    </div>
                                    
                                    <div class="col-5">
                                        <label>Genre</label>
                                        <div class="form-group">
                                            <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                                <asp:ListItem Text="Action" Value="Action" />
                                                <asp:ListItem Text="Adventure" Value="Adventure" />
                                                <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                                <asp:ListItem Text="Self Help" Value="Self Help" />
                                                <asp:ListItem Text="Motivation" Value="Motivation" />
                                                <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                                <asp:ListItem Text="Wellness" Value="Wellness" />
                                                <asp:ListItem Text="Crime" Value="Crime" />
                                                <asp:ListItem Text="Drama" Value="Drama" />
                                                <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                                <asp:ListItem Text="Horror" Value="Horror" />
                                                <asp:ListItem Text="Poetry" Value="Poetry" />
                                                <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                                <asp:ListItem Text="Romance" Value="Romance" />
                                                <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                                <asp:ListItem Text="Suspense" Value="Suspense" />
                                                <asp:ListItem Text="Thriller" Value="Thriller" />
                                                <asp:ListItem Text="Art" Value="Art" />
                                                <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                                <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                                <asp:ListItem Text="Health" Value="Health" />
                                                <asp:ListItem Text="History" Value="History" />
                                                <asp:ListItem Text="Math" Value="Math" />
                                                <asp:ListItem Text="Textbook" Value="Textbook" />
                                                <asp:ListItem Text="Science" Value="Science" />
                                                <asp:ListItem Text="Travel" Value="Travel" />
                                            </asp:ListBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-6">
                                        <label>Publisher Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="publisher_name" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <label>Publish Date</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="publish_date" runat="server" type="date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4">
                                        <label>Edition</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="edition" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label>Cost (per unit)</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="cost" runat="server" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label>Pages</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="pages" runat="server" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <label>Actual Stock</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="actual_stock" runat="server" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label>Current Stock</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="current_stock" runat="server" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label>Issued Books</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="issued" runat="server" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <label>Book Description</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="description" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <asp:Button ID="Button1" class="btn btn-block btn-success" runat="server" Text="Add" />
                                    </div>
                                    <div class="col-4">
                                        <asp:Button ID="Button3" class="btn btn-block btn-warning" runat="server" Text="Update" />
                                    </div>
                                    <div class="col-4">
                                        <asp:Button ID="Button2" class="btn btn-block btn-danger" runat="server" Text="Delete" />
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
                                        <h3>Book Inventory List</h3>
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
