<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Sem_Proj.homepage" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="homepage" class="container">

        <section id="searchbox" class="container p-3 mt-4">
            <h3>Search Library</h3>
            <div class="input-group">
                <asp:TextBox CssClass="form-control" ID="searchbox_input" type="search" runat="server" placeholder="Book Name / Author / ISBN" ></asp:TextBox>
                <div class="input-group-append">
                    <asp:Button CssClass="btn input-group-text" ID="search_btn" runat="server" Text="Search" />
                </div>
            </div>
        </section>

        <section id="product-carousel" class=" container p-3 mt-4">
            <h3>Hot reads</h3>
            <div class="row">
                <div class="owl-carousel owl-theme">

                    <div class="item">
                        <div class="card">
                            <img src="resources/books/b1.jpg" alt="img" class="card-img-top" />
                            <div class="card-body">
                                <h4>The Power of Your Subconsioucs Mind</h4>
                                <h5>$<span class="text-center">45.00</span></h5>
                                <asp:Button CssClass="btn btn-primary btn-sm" ID="c_btn_1" runat="server" Text="Borrow" />
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="resources/books/b1.jpg" alt="img" class="card-img-top" />
                            <div class="card-body">
                                <h4>The Power of Your Subconsioucs Mind</h4>
                                <h5>$<span class="text-center">45.00</span></h5>
                                <asp:Button CssClass="btn btn-primary btn-sm" ID="c_btn_2" runat="server" Text="Borrow" />
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="resources/books/b1.jpg" alt="img" class="card-img-top" />
                            <div class="card-body">
                                <h4>The Power of Your Subconsioucs Mind</h4>
                                <h5>$<span class="text-center">45.00</span></h5>
                                <asp:Button CssClass="btn btn-primary btn-sm" ID="c_btn_3" runat="server" Text="Borrow" />
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="resources/books/b1.jpg" alt="img" class="card-img-top" />
                            <div class="card-body">
                                <h4>The Power of Your Subconsioucs Mind</h4>
                                <h5>$<span class="text-center">45.00</span></h5>
                                <asp:Button CssClass="btn btn-primary btn-sm" ID="c_btn_4" runat="server" Text="Borrow" />
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="resources/books/b1.jpg" alt="img" class="card-img-top" />
                            <div class="card-body">
                                <h4>The Power of Your Subconsioucs Mind</h4>
                                <h5>$<span class="text-center">45.00</span></h5>
                                <asp:Button CssClass="btn btn-primary btn-sm" ID="c_btn_5" runat="server" Text="Borrow" />
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="resources/books/b1.jpg" alt="img" class="card-img-top" />
                            <div class="card-body">
                                <h4>The Power of Your Subconsioucs Mind</h4>
                                <h5>$<span class="text-center">45.00</span></h5>
                                <asp:Button CssClass="btn btn-primary btn-sm" ID="c_btn_6" runat="server" Text="Borrow" />
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="resources/books/b1.jpg" alt="img" class="card-img-top" />
                            <div class="card-body">
                                <h4>The Power of Your Subconsioucs Mind</h4>
                                <h5>$<span class="text-center">45.00</span></h5>
                                <asp:Button CssClass="btn btn-primary btn-sm" ID="c_btn_7" runat="server" Text="Borrow" />
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="resources/books/b1.jpg" alt="img" class="card-img-top" />
                            <div class="card-body">
                                <h4>The Power of Your Subconsioucs Mind</h4>
                                <h5>$<span class="text-center">45.00</span></h5>
                                <asp:Button CssClass="btn btn-primary btn-sm" ID="c_btn_8" runat="server" Text="Borrow" />
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="resources/books/b1.jpg" alt="img" class="card-img-top" />
                            <div class="card-body">
                                <h4>The Power of Your Subconsioucs Mind</h4>
                                <h5>$<span class="text-center">45.00</span></h5>
                                <asp:Button CssClass="btn btn-primary btn-sm" ID="c_btn_9" runat="server" Text="Borrow" />
                            </div>
                        </div>
                    </div>

                    <div class="item">
                        <div class="card">
                            <img src="resources/books/b1.jpg" alt="img" class="card-img-top" />
                            <div class="card-body">
                                <h4>The Power of Your Subconsioucs Mind</h4>
                                <h5>$<span class="text-center">45.00</span></h5>
                                <asp:Button CssClass="btn btn-primary btn-sm" ID="c_btn_10" runat="server" Text="Borrow" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <script>
            $('.owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
                nav: true,
                navText: ["<i class='far fa-arrow-alt-circle-left'></i>", "<i class='far fa-arrow-alt-circle-right'></i>"],
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 3
                    },
                    1000: {
                        items: 5
                    }
                }
            })
        </script>
    </div>
</asp:Content>
