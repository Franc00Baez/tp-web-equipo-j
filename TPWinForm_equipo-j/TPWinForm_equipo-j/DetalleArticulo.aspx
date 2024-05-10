<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="TPWinForm_equipo_j.DetalleArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container">

        <div id="carouselExample" class="carousel slide">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img id="imgArticulo" runat="server" class="d-block w-100" alt="...">
                </div>                        
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
