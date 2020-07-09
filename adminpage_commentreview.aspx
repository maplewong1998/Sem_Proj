<%@ Page Title="" Language="C#" MasterPageFile="~/adminpage.Master" AutoEventWireup="true" CodeBehind="adminpage_commentreview.aspx.cs" Inherits="Sem_Proj.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="commentreview" class="container-fluid">
        <div class="container mt-4">
            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <h3>Comment Review</h3>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 d-flex justify-content-center">
                                    <img src="resources/imgs/search-online.png" width="150"/>
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
