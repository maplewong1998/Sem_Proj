<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="adminpage_bookinventory.aspx.cs" Inherits="Sem_Proj.adminpage_bookinventory" %>
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
                                        <img id="imgview" src="resources/imgs/books.png" height="225" width="150" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <hr>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col form-group">
                                        <asp:FileUpload onChange="readURL(this);" CssClass="form-control" ID="image_uploader" runat="server" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4">
                                        <label>ISBN</label>
                                        <div class="form-group input-group">
                                            <asp:TextBox CssClass="form-control" ID="isbn_input" runat="server"></asp:TextBox>
                                            <div class="input-group-append">                                                
                                                <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server"><i class="fas fa-search"></i></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-8">
                                        <label>Book Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="bookname_input" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-7">
                                        <label>Language</label>
                                        <div class="form-group">
                                            <asp:DropDownList class="form-control" ID="language_dropdown" runat="server">
                                                <asp:ListItem Text="English" Value="English" />
                                                <asp:ListItem Text="Malay" Value="Malay" />
                                                <asp:ListItem Text="Chinese" Value="Chinese" />
                                                <asp:ListItem Text="Hindi" Value="Hindi" />
                                            </asp:DropDownList>
                                        </div>
                                        <label>Author Name</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="authorname_input" runat="server"></asp:TextBox>
                                        </div>                                        
                                    </div>
                                    
                                    <div class="col-5">
                                        <label>Genre</label>
                                        <div class="form-group">
                                            <asp:ListBox CssClass="form-control" ID="genre_dropdown" runat="server" SelectionMode="Multiple" Rows="5">
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
                                            <asp:TextBox CssClass="form-control" ID="publishername_input" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <label>Publish Date</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="publishdate_input" runat="server" type="date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-4">
                                        <label>Edition</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="edition_input" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label>Cost (per unit)</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="cost_input" runat="server" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label>Pages</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="pages_input" runat="server" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <label>Actual Stock</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="actualstock_input" runat="server" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label>Current Stock</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="currentstock_input" runat="server" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <label>Issued Books</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="issuedbook_show" runat="server" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <label>Book Description</label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="description_input" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <asp:Button ID="addbtn" class="btn btn-block btn-success" runat="server" Text="Add" OnClick="addbtn_Click"/>
                                    </div>
                                    <div class="col-4">
                                        <asp:Button ID="updatebtn" class="btn btn-block btn-warning" runat="server" Text="Update" />
                                    </div>
                                    <div class="col-4">
                                        <asp:Button ID="deletebtn" class="btn btn-block btn-danger" runat="server" Text="Delete" />
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
                                        <asp:GridView ID="book_list" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id" />
                                                <asp:BoundField DataField="book_name" HeaderText="book_name" SortExpression="book_name" />
                                                <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
                                                <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                                                <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                                                <asp:BoundField DataField="publish_date" HeaderText="publish_date" SortExpression="publish_date" />
                                                <asp:BoundField DataField="language" HeaderText="language" SortExpression="language" />
                                                <asp:BoundField DataField="edition" HeaderText="edition" SortExpression="edition" />
                                                <asp:BoundField DataField="book_cost" HeaderText="book_cost" SortExpression="book_cost" />
                                                <asp:BoundField DataField="no_of_pages" HeaderText="no_of_pages" SortExpression="no_of_pages" />
                                                <asp:BoundField DataField="book_description" HeaderText="book_description" SortExpression="book_description" />
                                                <asp:BoundField DataField="actual_stock" HeaderText="actual_stock" SortExpression="actual_stock" />
                                                <asp:BoundField DataField="current_stock" HeaderText="current_stock" SortExpression="current_stock" />
                                                <asp:BoundField DataField="book_img" HeaderText="book_img" SortExpression="book_img" />
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
    <script type="text/javascript">

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>
</asp:Content>
