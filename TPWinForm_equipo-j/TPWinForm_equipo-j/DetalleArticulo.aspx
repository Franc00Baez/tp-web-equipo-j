<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="TPWinForm_equipo_j.DetalleArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="mb-3">
    <label for="txtbNombre" class="form-label">Nombre del artículo</label>
      <asp:TextBox ID="txtbNombre" class="form-control" runat="server"></asp:TextBox>
  </div>
  <div class="mb-3">
    <label for="txtbCodigo" class="form-label">Código del artículo</label>
      <asp:TextBox ID="txtbCodigo" class="form-control" runat="server"></asp:TextBox>
  </div>
    <div class="mb-3">
    <label for="txtbDescripcion" class="form-label">Descripción del artículo</label>
        <asp:TextBox ID="txtbDescripcion" class="form-control" TextMode="multiline" runat="server"></asp:TextBox>
  </div>
    <div class="mb-3">
    <label for="txtbPrecio" class="form-label">Precio del artículo</label>
        <asp:TextBox ID="txtbPrecio" class="form-control" runat="server"></asp:TextBox>
  </div>
    <button type="button" id="btnEditar" class="btn btn-secondary btn-sm">Editar</button>
    <a href="Default.aspx" class="btn btn-secondary btn-sm" >Volver</a>
</asp:Content>
