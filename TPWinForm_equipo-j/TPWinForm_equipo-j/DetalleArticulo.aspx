<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="TPWinForm_equipo_j.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .custom-carousel {
            width: 300px; 
            height: 300px; 
            margin: auto; 
        }
        .custom-carousel-img {
            max-width: 300px; 
            max-height: 300px; 
            object-fit: cover; 
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">
           <div id="carouselExample" class="carousel slide custom-carousel">
            <div class="carousel-inner">
                <asp:Repeater ID="rptImages" runat="server">
                    <ItemTemplate>
                        <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                            <img src="<%# Eval("URL") %>" class="d-block custom-carousel-img" alt="Imagen del artículo">
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <div class="mb-3">
            <label for="txtbNombre" class="form-label">Nombre del artículo</label>
            <asp:TextBox ID="txtbNombre" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="txtbCodigo" class="form-label">Código del artículo</label>
            <asp:TextBox ID="txtbCodigo" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="txtbDescripcion" class="form-label">Descripción del artículo</label>
            <asp:TextBox ID="txtbDescripcion" class="form-control" TextMode="multiline" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="txtbMarca" class="form-label">Marca del artículo</label>
            <asp:TextBox ID="txtbMarca" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="txtbCategoria" class="form-label">Categoría del artículo</label>
            <asp:TextBox ID="txtbCategoria" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="txtbPrecio" class="form-label">Precio del artículo</label>
            <asp:TextBox ID="txtbPrecio" class="form-control" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <a href="Default.aspx" class="btn btn-secondary btn-sm">Volver</a>
    </div>
</asp:Content>
