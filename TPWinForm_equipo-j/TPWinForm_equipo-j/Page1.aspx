<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Page1.aspx.cs" Inherits="TPWinForm_equipo_j.Page1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">

    <h1>HOLA</h1>
    <p>Bienvenido </p>
    <div class="row row-cols-1 row-cols-md-2 g-4">
        <asp:Repeater ID="Rep1" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card">
                        <img src="<%#Eval("Imagen.URL") %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre") %></h5>
                            <p class="card-text"><%#Eval("Descripcion") %></p>
                            <a href="DetalleArticulo.aspx?id=<%#Eval("Id") %>">Ver detalles</a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
    </div>

</asp:Content>
