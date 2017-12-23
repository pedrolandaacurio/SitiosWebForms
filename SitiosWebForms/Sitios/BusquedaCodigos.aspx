<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BusquedaCodigos.aspx.cs" Inherits="SitiosWebForms.Sitios.BusquedaCodigos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" ClientIDMode="Static">
    <div class="container">
        <!--Cuadro de búsqueda-->
        <div class="input-group">
            <asp:TextBox runat="server" ID="CodeSearchBox" CssClass="form-control input-lg" placeholder="XXXXXX-XXXX-XXX"></asp:TextBox>
            <span class="input-group-btn">
                <asp:Button runat="server" ID="CodeSearchBtn" CssClass="btn btn-default btn-lg" Text="Buscar" />
            </span>
        </div>
        <hr />
        <!--Formulario-->
        <asp:UpdatePanel runat="server" ID="UpdatePanelSitio">
            <ContentTemplate>
                <asp:FormView runat="server" ID="SitiosForm" DataKeyNames="CodSitio" DataSourceID="SqlDataSource_Sitios" AllowPaging="True" DefaultMode="ReadOnly" CssClass="form-horizontal" Width="100%">
                    <EditItemTemplate>
                        <div class="well">
                            <center>
                        <h1>
                            <asp:Label Text='<%# Eval("CodSitio") %>' runat="server" ID="CodSitioLabel1" />
                        </h1>
                        <div class="table-reponsive">
                            <table class="table table-bordered table-condensed" style="width:50%">
                                <tr>
                                    <td>Caja: <b><asp:Label Text='<%# Bind("Caja") %>' runat="server" ID="CajaTextBox" CssClass="control-label" /></b></td>
                                    <td>Clasificación: <b><asp:Label Text='<%# Bind("CodClasificacion") %>' runat="server" ID="CodClasificacionTextBox" CssClass="control-label" /></b></td>
                                    <td>Carpeta: <b><asp:Label Text='<%# Bind("Carpeta") %>' runat="server" ID="CarpetaTextBox" CssClass="control-label" /></b></td>
                                    <td>Folios: <b><asp:Label Text='<%# Bind("Folios") %>' runat="server" ID="FoliosTextBox" CssClass="control-label" /></b></td>
                                </tr>
                            </table>
                        </div>
                    </center>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Ubicación
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label for="AltitudTextBox" class="control-label col-md-2">Altitud</label>
                                        <div class="col-md-4">
                                            <asp:TextBox Text='<%# Bind("Altitud") %>' runat="server" ID="AltitudTextBox" CssClass="form-control" TextMode="Number" />
                                        </div>
                                        <label for="PropiedadTextBox" class="control-label col-md-2">Propiedad</label>
                                        <div class="col-md-4">
                                            <asp:DropDownList Text='<%# Bind("Propiedad") %>' runat="server" ID="PropiedadTextBox" CssClass="form-control">
                                                <asp:ListItem Value="" Text="Sin especificar..."></asp:ListItem>
                                                <asp:ListItem Value="Privada" Text="Privada"></asp:ListItem>
                                                <asp:ListItem Value="Pública" Text="Pública"></asp:ListItem>
                                                <asp:ListItem Value="Comunal" Text="Comunal"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="well">
                                <div class="form-group">
                                    <label for="FechaEventoTextBox" class="control-label col-md-4">Fecha del evento</label>
                                    <div class="col-md-8">
                                        <asp:TextBox Text='<%# Bind("FechaEvento") %>' runat="server" ID="FechaEventoTextBox" CssClass="form-control" TextMode="Date" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="FechaInhumacionTextBox" class="control-label col-md-4">Fecha de inhumación</label>
                                    <div class="col-md-8">
                                        <asp:TextBox Text='<%# Bind("FechaInhumacion") %>' runat="server" ID="FechaInhumacionTextBox" CssClass="form-control" TextMode="Date" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Condiciones de la inhumación
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="AntecedentesTextBox" class="control-label col-md-2">Antecedentes</label>
                                            <div class="col-md-10">
                                                <asp:TextBox Text='<%# Bind("Antecendentes") %>' runat="server" ID="AntecendentesTextBox" CssClass="form-control" TextMode="MultiLine" Rows="2" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="RelatoAcontecimientosTextBox" class="control-label col-md-2">Relato de los acontecimientos</label>
                                            <div class="col-md-10">
                                                <asp:TextBox Text='<%# Bind("RelatoAcontecimientos") %>' runat="server" ID="RelatoAcontecimientosTextBox" CssClass="form-control" TextMode="MultiLine" Rows="2" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="well">
                                            <div class="form-group">
                                                <label for="NumVictimasTextBox" class="control-label col-md-6">N° de víctimas</label>
                                                <div class="col-md-6">
                                                    <asp:TextBox Text='<%# Bind("NumVictimas") %>' runat="server" ID="NumVictimasTextBox" CssClass="form-control" TextMode="Number" />
                                                </div>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <asp:CheckBox Checked='<%# Bind("ExhumacionAnterior") %>' runat="server" ID="ExhumacionAnteriorCheckBox" />
                                                    Enxhumación Anterior
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <asp:CheckBox Checked='<%# Bind("MaterialesAdicionales") %>' runat="server" ID="MaterialesAdicionalesCheckBox" />
                                                    Materiales adicionales
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="btn-group btn-group-justified">
                            <asp:LinkButton runat="server" Text="Guardar cambios" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn btn-success btn-lg" />
                            <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn btn-danger btn-lg" OnClientClick="if (!confirm('¿Estás seguro de cancelar la actualización?')) return false;" />
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <!--Etiqueta del código-->
                        <div class="well">
                            <center>
                        <h1>
                            <asp:Label Text='<%# Eval("CodSitio") %>' runat="server" ID="CodSitioLabel"/>
                        </h1>
                        <div class="table-reponsive">
                            <table class="table table-bordered table-condensed" style="width:50%">
                                <tr>
                                    <td>Caja: <b><asp:Label Text='<%# Bind("Caja") %>' runat="server" ID="CajaLabel" /></b></td>
                                    <td>Clasificación: <b><asp:Label Text='<%# Bind("CodClasificacion") %>' runat="server" ID="CodClasificacionLabel" /></b></td>
                                    <td>Carpeta: <b><asp:Label Text='<%# Bind("Carpeta") %>' runat="server" ID="CarpetaLabel" /></b></td>
                                    <td>Folios: <b><asp:Label Text='<%# Bind("Folios") %>' runat="server" ID="FoliosLabel" /></b></td>
                                </tr>
                            </table>
                        </div>
                    </center>
                        </div>
                        <!--Item general del sitio-->
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Ubicación
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label for="AltitudLabel" class="control-label col-md-2">Altitud</label>
                                        <div class="col-md-4">
                                            <asp:Label Text='<%# Bind("Altitud") %>' runat="server" ID="AltitudLabel" CssClass="form-control" disabled="" />
                                        </div>
                                        <label for="PropiedadLabel" class="control-label col-md-2">Propiedad</label>
                                        <div class="col-md-4">
                                            <asp:Label Text='<%# Bind("Propiedad") %>' runat="server" ID="PropiedadLabel" CssClass="form-control" disabled="" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="well">
                                <div class="form-group">
                                    <label for="FechaEventoLabel" class="control-label col-md-4">Fecha del evento</label>
                                    <div class="col-md-8">
                                        <asp:Label Text='<%# Bind("FechaEvento") %>' runat="server" ID="FechaEventoLabel" CssClass="form-control" disabled="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="FechaInhumacionLabel" class="control-label col-md-4">Fecha de inhumación</label>
                                    <div class="col-md-8">
                                        <asp:Label Text='<%# Bind("FechaInhumacion") %>' runat="server" ID="FechaInhumacionLabel" CssClass="form-control" disabled="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Condiciones de la inhumación
                                </div>
                                <div class="panel-body">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label for="AntecedentesLabel" class="control-label col-md-2">Antecedentes</label>
                                            <div class="col-md-10">
                                                <asp:Label Text='<%# Bind("Antecendentes") %>' runat="server" ID="AntecendentesLabel" CssClass="form-control" disabled="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="RelatoAcontecimientosLabel" class="control-label col-md-2">Relato de los acontecimientos</label>
                                            <div class="col-md-10">
                                                <asp:Label Text='<%# Bind("RelatoAcontecimientos") %>' runat="server" ID="RelatoAcontecimientosLabel" CssClass="form-control" disabled="" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="well">
                                            <div class="form-group">
                                                <label for="NumVictimasLabel" class="control-label col-md-6">N° de víctimas</label>
                                                <div class="col-md-6">
                                                    <asp:Label Text='<%# Bind("NumVictimas") %>' runat="server" ID="NumVictimasLabel" CssClass="form-control" disabled="" />
                                                </div>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <asp:CheckBox Checked='<%# Bind("ExhumacionAnterior") %>' runat="server" ID="ExhumacionAnteriorCheckBox" Enabled="false" />
                                                    Enxhumación Anterior
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <asp:CheckBox Checked='<%# Bind("MaterialesAdicionales") %>' runat="server" ID="MaterialesAdicionalesCheckBox" Enabled="false" />
                                                    Materiales adicionales
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="btn-group btn-group-justified">
                            <asp:LinkButton runat="server" Text="Editar sitio" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn btn-default btn-lg" />
                            <asp:LinkButton runat="server" Text="Eliminar sitio" CommandName="Delete" ID="DeleteButton" CausesValidation="False" CssClass="btn btn-danger btn-lg" OnClientClick="if (!confirm('¿Estás seguro de eliminar este sitio?')) return false;" />
                            <asp:LinkButton runat="server" Text="Nuevo" CommandName="New" ID="NewButton" CausesValidation="False" CssClass="btn btn-success btn-lg" Visible="false" />
                        </div>
                        <hr />
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <center>
                        <h3>No hay datos con el código que has buscado</h3>
                    </center>
                    </EmptyDataTemplate>
                </asp:FormView>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Víctimas
                </div>
                <div class="panel-body">
                    <asp:FormView runat="server" ID="AgregarVictima" DataKeyNames="IdVictima" DataSourceID="SqlDataSource_AgregarVictima" DefaultMode="Insert">
                        <InsertItemTemplate>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:TextBox Text='<%# Bind("Nombres") %>' runat="server" ID="NombresTextBox" CssClass="form-control" placeholder="Nombres" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <asp:TextBox Text='<%# Bind("ApellidoPaterno") %>' runat="server" ID="ApellidoPaternoTextBox" CssClass="form-control" placeholder="Apellido Paterno" />
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox Text='<%# Bind("ApellidoMaterno") %>' runat="server" ID="ApellidoMaternoTextBox" CssClass="form-control" placeholder="Apellido Materno" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <asp:DropDownList Text='<%# Bind("Sexo") %>' runat="server" ID="SexoTextBox" CssClass="form-control">
                                            <asp:ListItem Value="" Text="Seleccione un sexo..."></asp:ListItem>
                                            <asp:ListItem Value="F" Text="Femenino"></asp:ListItem>
                                            <asp:ListItem Value="M" Text="Masculino"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox Text='<%# Bind("Edad") %>' runat="server" ID="EdadTextBox" TextMode="Number" CssClass="form-control" placeholder="Edad" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:TextBox Text='<%# Bind("Procedencia") %>' runat="server" ID="ProcedenciaTextBox" CssClass="form-control" placeholder="Procedencia" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:TextBox Text='<%# Bind("Familia") %>' runat="server" ID="FamiliaTextBox" CssClass="form-control" placeholder="Familia" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:TextBox Text='<%# Bind("PresuntaAfiliacion") %>' runat="server" ID="PresuntaAfiliacionTextBox" CssClass="form-control" placeholder="Presunta afiliación" />
                                    </div>
                                </div>
                            </div>
                            <asp:TextBox Text='<%# Bind("CodSitio") %>' runat="server" ID="CodSitioTextBox" Visible="false" />
                            <div class="btn-group btn-group-justified">
                                <asp:LinkButton runat="server" Text="Guardar víctima" CssClass="btn btn-primary" CommandName="Insert" ID="InsertButton" CausesValidation="True" />
                                <asp:LinkButton runat="server" Text="Cancelar" CssClass="btn btn-default" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" data-dismiss="modal" />
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Testigos
                </div>
                <div class="panel-body">
                    <asp:FormView runat="server" ID="AgregarTestigo" DataKeyNames="IdTestigo" DataSourceID="SqlDataSource_AgregarTestigo" DefaultMode="Insert">
                        <InsertItemTemplate>
                            <div class="container">
                                <div class="col-md-4">
                                    <asp:TextBox Text='<%# Bind("Nombres_Test") %>' runat="server" ID="Nombres_TestTextBox" CssClass="form-control" placeholder="Nombres" />
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox Text='<%# Bind("ApellidoPaterno_Tes") %>' runat="server" ID="ApellidoPaterno_TesTextBox" CssClass="form-control" placeholder="Apellido Paterno" />
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox Text='<%# Bind("ApellidoMaterno_Tes") %>' runat="server" ID="ApellidoMaterno_TesTextBox" CssClass="form-control" placeholder="Apellido Materno" />
                                </div>
                                <div class="col-md-2">
                                    <asp:LinkButton runat="server" Text="Guardar" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-primary btn-block" />
                                </div>
                            </div>
                            <asp:TextBox Text='<%# Bind("CodSitio") %>' runat="server" ID="CodSitioTextBox" Visible="false" />
                            <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn btn-default" Visible="false" PostBackUrl="~/Sitios/BusquedaCodigos.aspx" />
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
        <hr />
        <!--Paneles-->
        <asp:GridView runat="server" ID="GridVictimas" AutoGenerateColumns="False" DataKeyNames="IdVictima" DataSourceID="SqlDataSource_Victimas" AllowPaging="True" AllowSorting="True" CssClass="table table-hover table-condensed table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="IdVictima" HeaderText="IdVictima" ReadOnly="True" InsertVisible="False" SortExpression="IdVictima" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres"></asp:BoundField>
                <asp:BoundField DataField="ApellidoPaterno" HeaderText="Apellido Paterno" SortExpression="ApellidoPaterno"></asp:BoundField>
                <asp:BoundField DataField="ApellidoMaterno" HeaderText="Apellido Materno" SortExpression="ApellidoMaterno"></asp:BoundField>
                <asp:BoundField DataField="Sexo" HeaderText="Sexo" SortExpression="Sexo"></asp:BoundField>
                <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad"></asp:BoundField>
                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:GridView runat="server" ID="GridInformantes" AutoGenerateColumns="False" DataKeyNames="IdInformante" DataSourceID="SqlDataSource_Informantes" AllowPaging="True" AllowSorting="True" CssClass="table table-hover table-condensed table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="IdInformante" HeaderText="IdInformante" ReadOnly="True" InsertVisible="False" SortExpression="IdInformante"></asp:BoundField>
                <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres"></asp:BoundField>
                <asp:BoundField DataField="ApellidoPaterno" HeaderText="ApellidoPaterno" SortExpression="ApellidoPaterno"></asp:BoundField>
                <asp:BoundField DataField="ApellidoMaterno" HeaderText="ApellidoMaterno" SortExpression="ApellidoMaterno"></asp:BoundField>
                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
            </Columns>
        </asp:GridView>
        
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Informantes
                </div>
                <div class="panel-body">
                    <asp:FormView runat="server" ID="AgregarInformante" DataKeyNames="IdInformante" DataSourceID="SqlDataSource_AgregarInformante" DefaultMode="Insert">
                        <InsertItemTemplate>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <asp:TextBox Text='<%# Bind("Nombres") %>' runat="server" ID="NombresTextBox" CssClass="form-control" placeholder="Nombres" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <asp:TextBox Text='<%# Bind("ApellidoPaterno") %>' runat="server" ID="ApellidoPaternoTextBox" CssClass="form-control" placeholder="Apellido Paterno" />
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox Text='<%# Bind("ApellidoMaterno") %>' runat="server" ID="ApellidoMaternoTextBox" CssClass="form-control" placeholder="Apellido Materno" />
                                    </div>
                                </div>
                            </div>
                            <asp:TextBox Text='<%# Bind("CodSitio") %>' runat="server" ID="CodSitioTextBox" Visible="false" />
                            <div class="btn-group btn-group-justified">
                                <asp:LinkButton runat="server" Text="Guardar informante" CommandName="Insert" ID="InsertButton" CausesValidation="True" CssClass="btn btn-primary" />
                                <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" CssClass="btn btn-default" data-dismiss="modal" />
                            </div>
                        </InsertItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
        
    </div>

    

    <!--Conexiones de Datos-->
    <asp:SqlDataSource runat="server" ID="SqlDataSource_Sitios" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Sitios] WHERE [CodSitio] = @original_CodSitio AND (([Altitud] = @original_Altitud) OR ([Altitud] IS NULL AND @original_Altitud IS NULL)) AND (([Propiedad] = @original_Propiedad) OR ([Propiedad] IS NULL AND @original_Propiedad IS NULL)) AND (([Antecendentes] = @original_Antecendentes) OR ([Antecendentes] IS NULL AND @original_Antecendentes IS NULL)) AND (([RelatoAcontecimientos] = @original_RelatoAcontecimientos) OR ([RelatoAcontecimientos] IS NULL AND @original_RelatoAcontecimientos IS NULL)) AND (([FechaEvento] = @original_FechaEvento) OR ([FechaEvento] IS NULL AND @original_FechaEvento IS NULL)) AND (([FechaInhumacion] = @original_FechaInhumacion) OR ([FechaInhumacion] IS NULL AND @original_FechaInhumacion IS NULL)) AND (([NumVictimas] = @original_NumVictimas) OR ([NumVictimas] IS NULL AND @original_NumVictimas IS NULL)) AND (([ExhumacionAnterior] = @original_ExhumacionAnterior) OR ([ExhumacionAnterior] IS NULL AND @original_ExhumacionAnterior IS NULL)) AND (([MaterialesAdicionales] = @original_MaterialesAdicionales) OR ([MaterialesAdicionales] IS NULL AND @original_MaterialesAdicionales IS NULL)) AND (([Caja] = @original_Caja) OR ([Caja] IS NULL AND @original_Caja IS NULL)) AND (([CodClasificacion] = @original_CodClasificacion) OR ([CodClasificacion] IS NULL AND @original_CodClasificacion IS NULL)) AND (([Carpeta] = @original_Carpeta) OR ([Carpeta] IS NULL AND @original_Carpeta IS NULL)) AND (([Folios] = @original_Folios) OR ([Folios] IS NULL AND @original_Folios IS NULL))" InsertCommand="INSERT INTO [Sitios] ([CodSitio], [Altitud], [Propiedad], [Antecendentes], [RelatoAcontecimientos], [FechaEvento], [FechaInhumacion], [NumVictimas], [ExhumacionAnterior], [MaterialesAdicionales], [Caja], [CodClasificacion], [Carpeta], [Folios]) VALUES (@CodSitio, @Altitud, @Propiedad, @Antecendentes, @RelatoAcontecimientos, @FechaEvento, @FechaInhumacion, @NumVictimas, @ExhumacionAnterior, @MaterialesAdicionales, @Caja, @CodClasificacion, @Carpeta, @Folios)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Sitios] WHERE ([CodSitio] = @CodSitio)" UpdateCommand="UPDATE [Sitios] SET [Altitud] = @Altitud, [Propiedad] = @Propiedad, [Antecendentes] = @Antecendentes, [RelatoAcontecimientos] = @RelatoAcontecimientos, [FechaEvento] = @FechaEvento, [FechaInhumacion] = @FechaInhumacion, [NumVictimas] = @NumVictimas, [ExhumacionAnterior] = @ExhumacionAnterior, [MaterialesAdicionales] = @MaterialesAdicionales, [Caja] = @Caja, [CodClasificacion] = @CodClasificacion, [Carpeta] = @Carpeta, [Folios] = @Folios WHERE [CodSitio] = @original_CodSitio AND (([Altitud] = @original_Altitud) OR ([Altitud] IS NULL AND @original_Altitud IS NULL)) AND (([Propiedad] = @original_Propiedad) OR ([Propiedad] IS NULL AND @original_Propiedad IS NULL)) AND (([Antecendentes] = @original_Antecendentes) OR ([Antecendentes] IS NULL AND @original_Antecendentes IS NULL)) AND (([RelatoAcontecimientos] = @original_RelatoAcontecimientos) OR ([RelatoAcontecimientos] IS NULL AND @original_RelatoAcontecimientos IS NULL)) AND (([FechaEvento] = @original_FechaEvento) OR ([FechaEvento] IS NULL AND @original_FechaEvento IS NULL)) AND (([FechaInhumacion] = @original_FechaInhumacion) OR ([FechaInhumacion] IS NULL AND @original_FechaInhumacion IS NULL)) AND (([NumVictimas] = @original_NumVictimas) OR ([NumVictimas] IS NULL AND @original_NumVictimas IS NULL)) AND (([ExhumacionAnterior] = @original_ExhumacionAnterior) OR ([ExhumacionAnterior] IS NULL AND @original_ExhumacionAnterior IS NULL)) AND (([MaterialesAdicionales] = @original_MaterialesAdicionales) OR ([MaterialesAdicionales] IS NULL AND @original_MaterialesAdicionales IS NULL)) AND (([Caja] = @original_Caja) OR ([Caja] IS NULL AND @original_Caja IS NULL)) AND (([CodClasificacion] = @original_CodClasificacion) OR ([CodClasificacion] IS NULL AND @original_CodClasificacion IS NULL)) AND (([Carpeta] = @original_Carpeta) OR ([Carpeta] IS NULL AND @original_Carpeta IS NULL)) AND (([Folios] = @original_Folios) OR ([Folios] IS NULL AND @original_Folios IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Altitud" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_Propiedad" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Antecendentes" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_RelatoAcontecimientos" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="original_FechaEvento"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="original_FechaInhumacion"></asp:Parameter>
            <asp:Parameter Name="original_NumVictimas" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_ExhumacionAnterior" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_MaterialesAdicionales" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_Caja" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_CodClasificacion" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Carpeta" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Folios" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="Altitud" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="Propiedad" Type="String"></asp:Parameter>
            <asp:Parameter Name="Antecendentes" Type="String"></asp:Parameter>
            <asp:Parameter Name="RelatoAcontecimientos" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="FechaEvento"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="FechaInhumacion"></asp:Parameter>
            <asp:Parameter Name="NumVictimas" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ExhumacionAnterior" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="MaterialesAdicionales" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Caja" Type="String"></asp:Parameter>
            <asp:Parameter Name="CodClasificacion" Type="String"></asp:Parameter>
            <asp:Parameter Name="Carpeta" Type="String"></asp:Parameter>
            <asp:Parameter Name="Folios" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="CodeSearchBox" PropertyName="Text" DefaultValue="0" Name="CodSitio" Type="String"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Altitud" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="Propiedad" Type="String"></asp:Parameter>
            <asp:Parameter Name="Antecendentes" Type="String"></asp:Parameter>
            <asp:Parameter Name="RelatoAcontecimientos" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="FechaEvento"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="FechaInhumacion"></asp:Parameter>
            <asp:Parameter Name="NumVictimas" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="ExhumacionAnterior" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="MaterialesAdicionales" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Caja" Type="String"></asp:Parameter>
            <asp:Parameter Name="CodClasificacion" Type="String"></asp:Parameter>
            <asp:Parameter Name="Carpeta" Type="String"></asp:Parameter>
            <asp:Parameter Name="Folios" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Altitud" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_Propiedad" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Antecendentes" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_RelatoAcontecimientos" Type="String"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="original_FechaEvento"></asp:Parameter>
            <asp:Parameter DbType="Date" Name="original_FechaInhumacion"></asp:Parameter>
            <asp:Parameter Name="original_NumVictimas" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_ExhumacionAnterior" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_MaterialesAdicionales" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="original_Caja" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_CodClasificacion" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Carpeta" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Folios" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSource_AgregarVictima" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Victimas] WHERE [IdVictima] = @original_IdVictima AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL)) AND (([Sexo] = @original_Sexo) OR ([Sexo] IS NULL AND @original_Sexo IS NULL)) AND (([Edad] = @original_Edad) OR ([Edad] IS NULL AND @original_Edad IS NULL)) AND (([Procedencia] = @original_Procedencia) OR ([Procedencia] IS NULL AND @original_Procedencia IS NULL)) AND (([Familia] = @original_Familia) OR ([Familia] IS NULL AND @original_Familia IS NULL)) AND (([PresuntaAfiliacion] = @original_PresuntaAfiliacion) OR ([PresuntaAfiliacion] IS NULL AND @original_PresuntaAfiliacion IS NULL))" InsertCommand="INSERT INTO [Victimas] ([CodSitio], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Sexo], [Edad], [Procedencia], [Familia], [PresuntaAfiliacion]) VALUES (@CodSitio, @Nombres, @ApellidoPaterno, @ApellidoMaterno, @Sexo, @Edad, @Procedencia, @Familia, @PresuntaAfiliacion)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Victimas] WHERE ([CodSitio] = @CodSitio)" UpdateCommand="UPDATE [Victimas] SET [CodSitio] = @CodSitio, [Nombres] = @Nombres, [ApellidoPaterno] = @ApellidoPaterno, [ApellidoMaterno] = @ApellidoMaterno, [Sexo] = @Sexo, [Edad] = @Edad, [Procedencia] = @Procedencia, [Familia] = @Familia, [PresuntaAfiliacion] = @PresuntaAfiliacion WHERE [IdVictima] = @original_IdVictima AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL)) AND (([Sexo] = @original_Sexo) OR ([Sexo] IS NULL AND @original_Sexo IS NULL)) AND (([Edad] = @original_Edad) OR ([Edad] IS NULL AND @original_Edad IS NULL)) AND (([Procedencia] = @original_Procedencia) OR ([Procedencia] IS NULL AND @original_Procedencia IS NULL)) AND (([Familia] = @original_Familia) OR ([Familia] IS NULL AND @original_Familia IS NULL)) AND (([PresuntaAfiliacion] = @original_PresuntaAfiliacion) OR ([PresuntaAfiliacion] IS NULL AND @original_PresuntaAfiliacion IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdVictima" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Sexo" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Edad" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_Procedencia" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Familia" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_PresuntaAfiliacion" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="Sexo" Type="String"></asp:Parameter>
            <asp:Parameter Name="Edad" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="Procedencia" Type="String"></asp:Parameter>
            <asp:Parameter Name="Familia" Type="String"></asp:Parameter>
            <asp:Parameter Name="PresuntaAfiliacion" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:FormParameter FormField="CodSitioLabel" DefaultValue="" Name="CodSitio" Type="String"></asp:FormParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="Sexo" Type="String"></asp:Parameter>
            <asp:Parameter Name="Edad" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="Procedencia" Type="String"></asp:Parameter>
            <asp:Parameter Name="Familia" Type="String"></asp:Parameter>
            <asp:Parameter Name="PresuntaAfiliacion" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_IdVictima" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Sexo" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Edad" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_Procedencia" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Familia" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_PresuntaAfiliacion" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource_AgregarTestigo" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Testigos] WHERE [IdTestigo] = @original_IdTestigo AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres_Test] = @original_Nombres_Test) OR ([Nombres_Test] IS NULL AND @original_Nombres_Test IS NULL)) AND (([ApellidoPaterno_Tes] = @original_ApellidoPaterno_Tes) OR ([ApellidoPaterno_Tes] IS NULL AND @original_ApellidoPaterno_Tes IS NULL)) AND (([ApellidoMaterno_Tes] = @original_ApellidoMaterno_Tes) OR ([ApellidoMaterno_Tes] IS NULL AND @original_ApellidoMaterno_Tes IS NULL))" InsertCommand="INSERT INTO [Testigos] ([CodSitio], [Nombres_Test], [ApellidoPaterno_Tes], [ApellidoMaterno_Tes]) VALUES (@CodSitio, @Nombres_Test, @ApellidoPaterno_Tes, @ApellidoMaterno_Tes)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Testigos] WHERE ([CodSitio] = @CodSitio)" UpdateCommand="UPDATE [Testigos] SET [CodSitio] = @CodSitio, [Nombres_Test] = @Nombres_Test, [ApellidoPaterno_Tes] = @ApellidoPaterno_Tes, [ApellidoMaterno_Tes] = @ApellidoMaterno_Tes WHERE [IdTestigo] = @original_IdTestigo AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres_Test] = @original_Nombres_Test) OR ([Nombres_Test] IS NULL AND @original_Nombres_Test IS NULL)) AND (([ApellidoPaterno_Tes] = @original_ApellidoPaterno_Tes) OR ([ApellidoPaterno_Tes] IS NULL AND @original_ApellidoPaterno_Tes IS NULL)) AND (([ApellidoMaterno_Tes] = @original_ApellidoMaterno_Tes) OR ([ApellidoMaterno_Tes] IS NULL AND @original_ApellidoMaterno_Tes IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdTestigo" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Nombres_Test" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno_Tes" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno_Tes" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="Nombres_Test" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno_Tes" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno_Tes" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="CodeSearchBox" PropertyName="Text" Name="CodSitio" Type="String"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="Nombres_Test" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno_Tes" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno_Tes" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_IdTestigo" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Nombres_Test" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno_Tes" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno_Tes" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource_AgregarInformante" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Informantes] WHERE [IdInformante] = @original_IdInformante AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL))" InsertCommand="INSERT INTO [Informantes] ([CodSitio], [Nombres], [ApellidoPaterno], [ApellidoMaterno]) VALUES (@CodSitio, @Nombres, @ApellidoPaterno, @ApellidoMaterno)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Informantes] WHERE ([CodSitio] = @CodSitio)" UpdateCommand="UPDATE [Informantes] SET [CodSitio] = @CodSitio, [Nombres] = @Nombres, [ApellidoPaterno] = @ApellidoPaterno, [ApellidoMaterno] = @ApellidoMaterno WHERE [IdInformante] = @original_IdInformante AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdInformante" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="CodeSearchBox" PropertyName="Text" Name="CodSitio" Type="String"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_IdInformante" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_CodSitio" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSource_Victimas" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Victimas] WHERE [IdVictima] = @original_IdVictima AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL)) AND (([Sexo] = @original_Sexo) OR ([Sexo] IS NULL AND @original_Sexo IS NULL)) AND (([Edad] = @original_Edad) OR ([Edad] IS NULL AND @original_Edad IS NULL))" InsertCommand="INSERT INTO [Victimas] ([Nombres], [ApellidoPaterno], [ApellidoMaterno], [Sexo], [Edad]) VALUES (@Nombres, @ApellidoPaterno, @ApellidoMaterno, @Sexo, @Edad)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [IdVictima], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Sexo], [Edad] FROM [Victimas] WHERE ([CodSitio] = @CodSitio)" UpdateCommand="UPDATE [Victimas] SET [Nombres] = @Nombres, [ApellidoPaterno] = @ApellidoPaterno, [ApellidoMaterno] = @ApellidoMaterno, [Sexo] = @Sexo, [Edad] = @Edad WHERE [IdVictima] = @original_IdVictima AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL)) AND (([Sexo] = @original_Sexo) OR ([Sexo] IS NULL AND @original_Sexo IS NULL)) AND (([Edad] = @original_Edad) OR ([Edad] IS NULL AND @original_Edad IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdVictima" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Sexo" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Edad" Type="Decimal"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="Sexo" Type="String"></asp:Parameter>
            <asp:Parameter Name="Edad" Type="Decimal"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="CodeSearchBox" PropertyName="Text" Name="CodSitio" Type="String"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="Sexo" Type="String"></asp:Parameter>
            <asp:Parameter Name="Edad" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="original_IdVictima" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Sexo" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_Edad" Type="Decimal"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource_Testigos" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Testigos] WHERE [IdTestigo] = @original_IdTestigo AND (([Nombres_Test] = @original_Nombres_Test) OR ([Nombres_Test] IS NULL AND @original_Nombres_Test IS NULL)) AND (([ApellidoPaterno_Tes] = @original_ApellidoPaterno_Tes) OR ([ApellidoPaterno_Tes] IS NULL AND @original_ApellidoPaterno_Tes IS NULL)) AND (([ApellidoMaterno_Tes] = @original_ApellidoMaterno_Tes) OR ([ApellidoMaterno_Tes] IS NULL AND @original_ApellidoMaterno_Tes IS NULL))" InsertCommand="INSERT INTO [Testigos] ([Nombres_Test], [ApellidoPaterno_Tes], [ApellidoMaterno_Tes]) VALUES (@Nombres_Test, @ApellidoPaterno_Tes, @ApellidoMaterno_Tes)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [IdTestigo], [Nombres_Test], [ApellidoPaterno_Tes], [ApellidoMaterno_Tes] FROM [Testigos] WHERE ([CodSitio] = @CodSitio)" UpdateCommand="UPDATE [Testigos] SET [Nombres_Test] = @Nombres_Test, [ApellidoPaterno_Tes] = @ApellidoPaterno_Tes, [ApellidoMaterno_Tes] = @ApellidoMaterno_Tes WHERE [IdTestigo] = @original_IdTestigo AND (([Nombres_Test] = @original_Nombres_Test) OR ([Nombres_Test] IS NULL AND @original_Nombres_Test IS NULL)) AND (([ApellidoPaterno_Tes] = @original_ApellidoPaterno_Tes) OR ([ApellidoPaterno_Tes] IS NULL AND @original_ApellidoPaterno_Tes IS NULL)) AND (([ApellidoMaterno_Tes] = @original_ApellidoMaterno_Tes) OR ([ApellidoMaterno_Tes] IS NULL AND @original_ApellidoMaterno_Tes IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdTestigo" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Nombres_Test" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno_Tes" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno_Tes" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombres_Test" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno_Tes" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno_Tes" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="CodeSearchBox" PropertyName="Text" Name="CodSitio" Type="String"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombres_Test" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno_Tes" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno_Tes" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_IdTestigo" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Nombres_Test" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno_Tes" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno_Tes" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="SqlDataSource_Informantes" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Informantes] WHERE [IdInformante] = @original_IdInformante AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL))" InsertCommand="INSERT INTO [Informantes] ([Nombres], [ApellidoPaterno], [ApellidoMaterno]) VALUES (@Nombres, @ApellidoPaterno, @ApellidoMaterno)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [IdInformante], [Nombres], [ApellidoPaterno], [ApellidoMaterno] FROM [Informantes] WHERE ([CodSitio] = @CodSitio)" UpdateCommand="UPDATE [Informantes] SET [Nombres] = @Nombres, [ApellidoPaterno] = @ApellidoPaterno, [ApellidoMaterno] = @ApellidoMaterno WHERE [IdInformante] = @original_IdInformante AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_IdInformante" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="CodeSearchBox" PropertyName="Text" Name="CodSitio" Type="String"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="ApellidoMaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_IdInformante" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="original_Nombres" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoPaterno" Type="String"></asp:Parameter>
            <asp:Parameter Name="original_ApellidoMaterno" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
