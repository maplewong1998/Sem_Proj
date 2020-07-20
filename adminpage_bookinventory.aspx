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
                                        <label>ISBN-13</label>&nbsp<asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="isbn_input"></asp:RequiredFieldValidator>
                                        <div class="form-group input-group">
                                            <asp:TextBox CssClass="form-control" ID="isbn_input" runat="server"></asp:TextBox>
                                            <div class="input-group-append">                                                
                                                <asp:LinkButton class="btn btn-primary" ID="findbook_btn" runat="server" OnClick="findbook_btn_Click"><i class="fas fa-search"></i></asp:LinkButton>
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
                                            <asp:TextBox CssClass="form-control" ID="cost_input" runat="server" TextMode="Number" step="0.01"></asp:TextBox>
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
                                            <asp:TextBox CssClass="form-control" ID="currentstock_show" runat="server" TextMode="Number" ReadOnly="true"></asp:TextBox>
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
                                        <asp:Button ID="updatebtn" class="btn btn-block btn-warning" runat="server" Text="Update" OnClick="updatebtn_Click" />
                                    </div>
                                    <div class="col-4">
                                        <asp:Button ID="deletebtn" class="btn btn-block btn-danger" runat="server" Text="Delete" OnClick="deletebtn_Click" />
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
                                    <div class="col-12">
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
