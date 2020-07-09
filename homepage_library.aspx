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
                                    <asp:GridView CssClass="" ID="library_list" runat="server"></asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
