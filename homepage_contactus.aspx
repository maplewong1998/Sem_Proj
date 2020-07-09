<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="homepage_contactus.aspx.cs" Inherits="Sem_Proj.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="contactus" class="container-fluid">
        <div class="container mt-4">
            <div class="card">
                <div class="card-body">

                    <div class="container">

                        <div class="row">
                            <h5>Have questions or suggestions? Leave a comment!</h5>
                        </div>

                        <div class="row">
                            <div class="col-md-4 form-group">
                                <label>Name</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4 form-group">
                                <label>Email</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" type="email"></asp:TextBox>
                            </div>
                            <div class="col-md-4 form-group">
                                <label>Phone Number</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" type="tel"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 form-group">
                                <label>Comment</label>
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="container mt-4">
                        <div class="row">
                            <h5>Contact Us</h5>
                        </div>

                        <div class="row">
                            <div class="col">
                                <h6>Wong Ting Sen</h6>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <label>Contact Number:</label>
                                <a class="btn btn-link" id="footer_btn_4" href="tel: +(60) 183231959"><i class="fas fa-phone"></i> +(60) 183231959</a><br />
                            </div>
                            <div class="col-6">
                                <label>Email Address:</label>
                                <a class="btn btn-link" id="footer_btn_5" href="mailto: maplewong1998@gmail.com"><i class="fas fa-envelope"></i> maplewong1998@gmail.com</a>
                            </div>                                
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="embed-responsive embed-responsive-16by9 p-1">
                                    <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15939.77635002619!2d101.69822023425913!3d2.8324250669885664!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cdc77dffa92899%3A0x25b5e828613a7db9!2sXiamen%20University%20Malaysia!5e0!3m2!1sen!2smy!4v1592747027802!5m2!1sen!2smy"></iframe>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
