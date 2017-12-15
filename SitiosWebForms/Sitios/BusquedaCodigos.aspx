<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BusquedaCodigos.aspx.cs" Inherits="SitiosWebForms.Sitios.BusquedaCodigos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:TextBox runat="server" ID="CodeSearchBox" CssClass="form-control input-lg style:text-center" placeholder="XXXXXX-XXXX-XXX" ></asp:TextBox>
        <asp:Button runat="server" ID="CodeSearchBtn" CssClass="btn btn-default btn-lg btn-block" Text="Buscar" />
    </div>
    <hr />
    <div class="form-horizontal">
        <asp:FormView runat="server" ID="SitiosForm" DataKeyNames="CodSitio" DataSourceID="SqlDataSource1" AllowPaging="True" DefaultMode="ReadOnly" CssClass="form-horizontal" Width="100%">
            <EditItemTemplate>
                <div class="well">
                    <center>
                        <h1>
                            <asp:Label Text='<%# Eval("CodSitio") %>' runat="server" ID="CodSitioLabel1" />
                        </h1>
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
                                        <asp:TextBox Text='<%# Bind("Antecendentes") %>' runat="server" ID="AntecendentesTextBox" CssClass="form-control" TextMode="MultiLine" Rows="2"/>
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
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Archivo
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="CajaTextBox" class="control-label col-md-1">Caja</label>
                                <div class="col-md-2">
                                    <asp:TextBox Text='<%# Bind("Caja") %>' runat="server" ID="CajaTextBox" CssClass="form-control" disabled="" />
                                </div>
                                <label for="CodClasificacionTextBox" class="control-label col-md-1">Clasificación</label>
                                <div class="col-md-2">
                                    <asp:TextBox Text='<%# Bind("CodClasificacion") %>' runat="server" ID="CodClasificacionTextBox" CssClass="form-control" disabled="" />
                                </div>
                                <label for="CarpetaTextBox" class="control-label col-md-1">Carpeta</label>
                                <div class="col-md-2">
                                    <asp:TextBox Text='<%# Bind("Carpeta") %>' runat="server" ID="CarpetaTextBox" CssClass="form-control" disabled="" />
                                </div>
                                <label for="FoliosTextBox" class="control-label col-md-1">Folios</label>
                                <div class="col-md-2">
                                    <asp:TextBox Text='<%# Bind("Folios") %>' runat="server" ID="FoliosTextBox" CssClass="form-control" disabled="" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn-group btn-group-justified">
                    <asp:LinkButton runat="server" Text="Guardar cambios" CommandName="Update" ID="UpdateButton" CausesValidation="True" CssClass="btn btn-success btn-lg" />
                    <asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" CssClass="btn btn-danger btn-lg"  OnClientClick="if (!confirm('¿Estás seguro de cancelar la actualización?')) return false;" />
                </div>
            </EditItemTemplate>
            <InsertItemTemplate>
                CodSitio:
                <asp:TextBox Text='<%# Bind("CodSitio") %>' runat="server" ID="CodSitioTextBox" />
                Altitud:
                <asp:TextBox Text='<%# Bind("Altitud") %>' runat="server" ID="AltitudTextBox" />
                Propiedad:
                <asp:TextBox Text='<%# Bind("Propiedad") %>' runat="server" ID="PropiedadTextBox" />
                Antecendentes:
                <asp:TextBox Text='<%# Bind("Antecendentes") %>' runat="server" ID="AntecendentesTextBox" />
                RelatoAcontecimientos:
                <asp:TextBox Text='<%# Bind("RelatoAcontecimientos") %>' runat="server" ID="RelatoAcontecimientosTextBox" />
                FechaEvento:
                <asp:TextBox Text='<%# Bind("FechaEvento") %>' runat="server" ID="FechaEventoTextBox" />
                FechaInhumacion:
                <asp:TextBox Text='<%# Bind("FechaInhumacion") %>' runat="server" ID="FechaInhumacionTextBox" />
                NumVictimas:
                <asp:TextBox Text='<%# Bind("NumVictimas") %>' runat="server" ID="NumVictimasTextBox" />
                ExhumacionAnterior:
                <asp:CheckBox Checked='<%# Bind("ExhumacionAnterior") %>' runat="server" ID="ExhumacionAnteriorCheckBox" />
                MaterialesAdicionales:
                <asp:CheckBox Checked='<%# Bind("MaterialesAdicionales") %>' runat="server" ID="MaterialesAdicionalesCheckBox" />
                Caja:
                <asp:TextBox Text='<%# Bind("Caja") %>' runat="server" ID="CajaTextBox" />
                CodClasificacion:
                <asp:TextBox Text='<%# Bind("CodClasificacion") %>' runat="server" ID="CodClasificacionTextBox" />
                Carpeta:
                <asp:TextBox Text='<%# Bind("Carpeta") %>' runat="server" ID="CarpetaTextBox" />
                Folios:
                <asp:TextBox Text='<%# Bind("Folios") %>' runat="server" ID="FoliosTextBox" />
                <asp:LinkButton runat="server" Text="Insertar" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
            </InsertItemTemplate>
            <ItemTemplate>
                <div class="btn-group btn-group-justified">
                    <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" CssClass="btn btn-primary btn-lg" />
                    <asp:LinkButton runat="server" Text="Eliminar" CommandName="Delete" ID="DeleteButton" CausesValidation="False" CssClass="btn btn-danger btn-lg" OnClientClick="if (!confirm('¿Estás seguro de eliminar este sitio?')) return false;" />
                    <asp:LinkButton runat="server" Text="Nuevo" CommandName="New" ID="NewButton" CausesValidation="False" CssClass="btn btn-success btn-lg" Visible="false" />
                </div>
                <hr />
                <div class="well">
                    <center>
                        <h1>
                            <asp:Label Text='<%# Eval("CodSitio") %>' runat="server" ID="CodSitioLabel"/>
                        </h1>
                    </center>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Ubicación
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="AltitudLabel" class="control-label col-md-2">Altitud</label>
                                <div class="col-md-4">
                                    <asp:Label Text='<%# Bind("Altitud") %>' runat="server" ID="AltitudLabel" CssClass="form-control" />
                                </div>
                                <label for="PropiedadLabel" class="control-label col-md-2">Propiedad</label>
                                <div class="col-md-4">
                                    <asp:Label Text='<%# Bind("Propiedad") %>' runat="server" ID="PropiedadLabel" CssClass="form-control" />
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
                                <asp:Label Text='<%# Bind("FechaEvento") %>' runat="server" ID="FechaEventoLabel" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="FechaInhumacionLabel" class="control-label col-md-4">Fecha de inhumación</label>
                            <div class="col-md-8">
                                <asp:Label Text='<%# Bind("FechaInhumacion") %>' runat="server" ID="FechaInhumacionLabel" CssClass="form-control" />
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
                                        <asp:Label Text='<%# Bind("Antecendentes") %>' runat="server" ID="AntecendentesLabel" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="RelatoAcontecimientosLabel" class="control-label col-md-2">Relato de los acontecimientos</label>
                                    <div class="col-md-10">
                                        <asp:Label Text='<%# Bind("RelatoAcontecimientos") %>' runat="server" ID="RelatoAcontecimientosLabel" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="well">
                                    <div class="form-group">
                                        <label for="NumVictimasLabel" class="control-label col-md-6">N° de víctimas</label>
                                        <div class="col-md-6">
                                            <asp:Label Text='<%# Bind("NumVictimas") %>' runat="server" ID="NumVictimasLabel" CssClass="form-control" />
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
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Archivo
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="CajaLabel" class="control-label col-md-1">Caja</label>
                                <div class="col-md-2">
                                    <asp:Label Text='<%# Bind("Caja") %>' runat="server" ID="CajaLabel" CssClass="form-control" />
                                </div>
                                <label for="CodClasificacionLabel" class="control-label col-md-1">Clasificación</label>
                                <div class="col-md-2">
                                    <asp:Label Text='<%# Bind("CodClasificacion") %>' runat="server" ID="CodClasificacionLabel" CssClass="form-control" />
                                </div>
                                <label for="CarpetaLabel" class="control-label col-md-1">Carpeta</label>
                                <div class="col-md-2">
                                    <asp:Label Text='<%# Bind("Carpeta") %>' runat="server" ID="CarpetaLabel" CssClass="form-control" />
                                </div>
                                <label for="FoliosLabel" class="control-label col-md-1">Folios</label>
                                <div class="col-md-2">
                                    <asp:Label Text='<%# Bind("Folios") %>' runat="server" ID="FoliosLabel" CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#AgregarVictimaModal">Agregar víctimas</button>
                    <a class="btn btn-primary">Agregar testigos</a>
                    <a class="btn btn-primary">Agregar informantes</a>
            </ItemTemplate>
            <EmptyDataTemplate>
                    <center>
                        <h3>No hay datos con el código que has buscado</h3>
                    </center>
            </EmptyDataTemplate>
        </asp:FormView>
        <!-- Modal de víctimas -->
        <div class="modal fade" id="AgregarVictimaModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Agregar víctima</h4>
                    </div>
                    <div class="modal-body">
                        <asp:FormView runat="server" ID="AgregarVictima" DataKeyNames="IdVictima" DataSourceID="SqlDataSource2" DefaultMode="Insert">
                            <EditItemTemplate>
                                CodSitio:
                                <asp:TextBox Text='<%# Bind("CodSitio") %>' runat="server" ID="CodSitioTextBox" /><br />
                                IdVictima:
                                <asp:Label Text='<%# Eval("IdVictima") %>' runat="server" ID="IdVictimaLabel1" /><br />
                                Nombres:
                                <asp:TextBox Text='<%# Bind("Nombres") %>' runat="server" ID="NombresTextBox" /><br />
                                ApellidoPaterno:
                                <asp:TextBox Text='<%# Bind("ApellidoPaterno") %>' runat="server" ID="ApellidoPaternoTextBox" /><br />
                                ApellidoMaterno:
                                <asp:TextBox Text='<%# Bind("ApellidoMaterno") %>' runat="server" ID="ApellidoMaternoTextBox" /><br />
                                Sexo:
                                <asp:TextBox Text='<%# Bind("Sexo") %>' runat="server" ID="SexoTextBox" /><br />
                                Edad:
                                <asp:TextBox Text='<%# Bind("Edad") %>' runat="server" ID="EdadTextBox" /><br />
                                Procedencia:
                                <asp:TextBox Text='<%# Bind("Procedencia") %>' runat="server" ID="ProcedenciaTextBox" /><br />
                                Familia:
                                <asp:TextBox Text='<%# Bind("Familia") %>' runat="server" ID="FamiliaTextBox" /><br />
                                PresuntaAfiliacion:
                                <asp:TextBox Text='<%# Bind("PresuntaAfiliacion") %>' runat="server" ID="PresuntaAfiliacionTextBox" /><br />
                                <asp:LinkButton runat="server" Text="Actualizar" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                CodSitio:
                                <asp:TextBox Text='<%# Bind("CodSitio") %>' runat="server" ID="CodSitioTextBox" /><br />

                                Nombres:
                                <asp:TextBox Text='<%# Bind("Nombres") %>' runat="server" ID="NombresTextBox" /><br />
                                ApellidoPaterno:
                                <asp:TextBox Text='<%# Bind("ApellidoPaterno") %>' runat="server" ID="ApellidoPaternoTextBox" /><br />
                                ApellidoMaterno:
                                <asp:TextBox Text='<%# Bind("ApellidoMaterno") %>' runat="server" ID="ApellidoMaternoTextBox" /><br />
                                Sexo:
                                <asp:TextBox Text='<%# Bind("Sexo") %>' runat="server" ID="SexoTextBox" /><br />
                                Edad:
                                <asp:TextBox Text='<%# Bind("Edad") %>' runat="server" ID="EdadTextBox" /><br />
                                Procedencia:
                                <asp:TextBox Text='<%# Bind("Procedencia") %>' runat="server" ID="ProcedenciaTextBox" /><br />
                                Familia:
                                <asp:TextBox Text='<%# Bind("Familia") %>' runat="server" ID="FamiliaTextBox" /><br />
                                PresuntaAfiliacion:
                                <asp:TextBox Text='<%# Bind("PresuntaAfiliacion") %>' runat="server" ID="PresuntaAfiliacionTextBox" /><br />
                                <asp:LinkButton runat="server" Text="Insertar" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                CodSitio:
                                <asp:Label Text='<%# Bind("CodSitio") %>' runat="server" ID="CodSitioLabel" /><br />
                                IdVictima:
                                <asp:Label Text='<%# Eval("IdVictima") %>' runat="server" ID="IdVictimaLabel" /><br />
                                Nombres:
                                <asp:Label Text='<%# Bind("Nombres") %>' runat="server" ID="NombresLabel" /><br />
                                ApellidoPaterno:
                                <asp:Label Text='<%# Bind("ApellidoPaterno") %>' runat="server" ID="ApellidoPaternoLabel" /><br />
                                ApellidoMaterno:
                                <asp:Label Text='<%# Bind("ApellidoMaterno") %>' runat="server" ID="ApellidoMaternoLabel" /><br />
                                Sexo:
                                <asp:Label Text='<%# Bind("Sexo") %>' runat="server" ID="SexoLabel" /><br />
                                Edad:
                                <asp:Label Text='<%# Bind("Edad") %>' runat="server" ID="EdadLabel" /><br />
                                Procedencia:
                                <asp:Label Text='<%# Bind("Procedencia") %>' runat="server" ID="ProcedenciaLabel" /><br />
                                Familia:
                                <asp:Label Text='<%# Bind("Familia") %>' runat="server" ID="FamiliaLabel" /><br />
                                PresuntaAfiliacion:
                                <asp:Label Text='<%# Bind("PresuntaAfiliacion") %>' runat="server" ID="PresuntaAfiliacionLabel" /><br />
                                <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Eliminar" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />&nbsp;<asp:LinkButton runat="server" Text="Nuevo" CommandName="New" ID="NewButton" CausesValidation="False" />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Victimas] WHERE [IdVictima] = @original_IdVictima AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL)) AND (([Sexo] = @original_Sexo) OR ([Sexo] IS NULL AND @original_Sexo IS NULL)) AND (([Edad] = @original_Edad) OR ([Edad] IS NULL AND @original_Edad IS NULL)) AND (([Procedencia] = @original_Procedencia) OR ([Procedencia] IS NULL AND @original_Procedencia IS NULL)) AND (([Familia] = @original_Familia) OR ([Familia] IS NULL AND @original_Familia IS NULL)) AND (([PresuntaAfiliacion] = @original_PresuntaAfiliacion) OR ([PresuntaAfiliacion] IS NULL AND @original_PresuntaAfiliacion IS NULL))" InsertCommand="INSERT INTO [Victimas] ([CodSitio], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [Sexo], [Edad], [Procedencia], [Familia], [PresuntaAfiliacion]) VALUES (@CodSitio, @Nombres, @ApellidoPaterno, @ApellidoMaterno, @Sexo, @Edad, @Procedencia, @Familia, @PresuntaAfiliacion)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Victimas]" UpdateCommand="UPDATE [Victimas] SET [CodSitio] = @CodSitio, [Nombres] = @Nombres, [ApellidoPaterno] = @ApellidoPaterno, [ApellidoMaterno] = @ApellidoMaterno, [Sexo] = @Sexo, [Edad] = @Edad, [Procedencia] = @Procedencia, [Familia] = @Familia, [PresuntaAfiliacion] = @PresuntaAfiliacion WHERE [IdVictima] = @original_IdVictima AND (([CodSitio] = @original_CodSitio) OR ([CodSitio] IS NULL AND @original_CodSitio IS NULL)) AND (([Nombres] = @original_Nombres) OR ([Nombres] IS NULL AND @original_Nombres IS NULL)) AND (([ApellidoPaterno] = @original_ApellidoPaterno) OR ([ApellidoPaterno] IS NULL AND @original_ApellidoPaterno IS NULL)) AND (([ApellidoMaterno] = @original_ApellidoMaterno) OR ([ApellidoMaterno] IS NULL AND @original_ApellidoMaterno IS NULL)) AND (([Sexo] = @original_Sexo) OR ([Sexo] IS NULL AND @original_Sexo IS NULL)) AND (([Edad] = @original_Edad) OR ([Edad] IS NULL AND @original_Edad IS NULL)) AND (([Procedencia] = @original_Procedencia) OR ([Procedencia] IS NULL AND @original_Procedencia IS NULL)) AND (([Familia] = @original_Familia) OR ([Familia] IS NULL AND @original_Familia IS NULL)) AND (([PresuntaAfiliacion] = @original_PresuntaAfiliacion) OR ([PresuntaAfiliacion] IS NULL AND @original_PresuntaAfiliacion IS NULL))">
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
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [Sitios] WHERE [CodSitio] = @original_CodSitio AND (([Altitud] = @original_Altitud) OR ([Altitud] IS NULL AND @original_Altitud IS NULL)) AND (([Propiedad] = @original_Propiedad) OR ([Propiedad] IS NULL AND @original_Propiedad IS NULL)) AND (([Antecendentes] = @original_Antecendentes) OR ([Antecendentes] IS NULL AND @original_Antecendentes IS NULL)) AND (([RelatoAcontecimientos] = @original_RelatoAcontecimientos) OR ([RelatoAcontecimientos] IS NULL AND @original_RelatoAcontecimientos IS NULL)) AND (([FechaEvento] = @original_FechaEvento) OR ([FechaEvento] IS NULL AND @original_FechaEvento IS NULL)) AND (([FechaInhumacion] = @original_FechaInhumacion) OR ([FechaInhumacion] IS NULL AND @original_FechaInhumacion IS NULL)) AND (([NumVictimas] = @original_NumVictimas) OR ([NumVictimas] IS NULL AND @original_NumVictimas IS NULL)) AND (([ExhumacionAnterior] = @original_ExhumacionAnterior) OR ([ExhumacionAnterior] IS NULL AND @original_ExhumacionAnterior IS NULL)) AND (([MaterialesAdicionales] = @original_MaterialesAdicionales) OR ([MaterialesAdicionales] IS NULL AND @original_MaterialesAdicionales IS NULL)) AND (([Caja] = @original_Caja) OR ([Caja] IS NULL AND @original_Caja IS NULL)) AND (([CodClasificacion] = @original_CodClasificacion) OR ([CodClasificacion] IS NULL AND @original_CodClasificacion IS NULL)) AND (([Carpeta] = @original_Carpeta) OR ([Carpeta] IS NULL AND @original_Carpeta IS NULL)) AND (([Folios] = @original_Folios) OR ([Folios] IS NULL AND @original_Folios IS NULL))" InsertCommand="INSERT INTO [Sitios] ([CodSitio], [Altitud], [Propiedad], [Antecendentes], [RelatoAcontecimientos], [FechaEvento], [FechaInhumacion], [NumVictimas], [ExhumacionAnterior], [MaterialesAdicionales], [Caja], [CodClasificacion], [Carpeta], [Folios]) VALUES (@CodSitio, @Altitud, @Propiedad, @Antecendentes, @RelatoAcontecimientos, @FechaEvento, @FechaInhumacion, @NumVictimas, @ExhumacionAnterior, @MaterialesAdicionales, @Caja, @CodClasificacion, @Carpeta, @Folios)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Sitios] WHERE ([CodSitio] = @CodSitio)" UpdateCommand="UPDATE [Sitios] SET [Altitud] = @Altitud, [Propiedad] = @Propiedad, [Antecendentes] = @Antecendentes, [RelatoAcontecimientos] = @RelatoAcontecimientos, [FechaEvento] = @FechaEvento, [FechaInhumacion] = @FechaInhumacion, [NumVictimas] = @NumVictimas, [ExhumacionAnterior] = @ExhumacionAnterior, [MaterialesAdicionales] = @MaterialesAdicionales, [Caja] = @Caja, [CodClasificacion] = @CodClasificacion, [Carpeta] = @Carpeta, [Folios] = @Folios WHERE [CodSitio] = @original_CodSitio AND (([Altitud] = @original_Altitud) OR ([Altitud] IS NULL AND @original_Altitud IS NULL)) AND (([Propiedad] = @original_Propiedad) OR ([Propiedad] IS NULL AND @original_Propiedad IS NULL)) AND (([Antecendentes] = @original_Antecendentes) OR ([Antecendentes] IS NULL AND @original_Antecendentes IS NULL)) AND (([RelatoAcontecimientos] = @original_RelatoAcontecimientos) OR ([RelatoAcontecimientos] IS NULL AND @original_RelatoAcontecimientos IS NULL)) AND (([FechaEvento] = @original_FechaEvento) OR ([FechaEvento] IS NULL AND @original_FechaEvento IS NULL)) AND (([FechaInhumacion] = @original_FechaInhumacion) OR ([FechaInhumacion] IS NULL AND @original_FechaInhumacion IS NULL)) AND (([NumVictimas] = @original_NumVictimas) OR ([NumVictimas] IS NULL AND @original_NumVictimas IS NULL)) AND (([ExhumacionAnterior] = @original_ExhumacionAnterior) OR ([ExhumacionAnterior] IS NULL AND @original_ExhumacionAnterior IS NULL)) AND (([MaterialesAdicionales] = @original_MaterialesAdicionales) OR ([MaterialesAdicionales] IS NULL AND @original_MaterialesAdicionales IS NULL)) AND (([Caja] = @original_Caja) OR ([Caja] IS NULL AND @original_Caja IS NULL)) AND (([CodClasificacion] = @original_CodClasificacion) OR ([CodClasificacion] IS NULL AND @original_CodClasificacion IS NULL)) AND (([Carpeta] = @original_Carpeta) OR ([Carpeta] IS NULL AND @original_Carpeta IS NULL)) AND (([Folios] = @original_Folios) OR ([Folios] IS NULL AND @original_Folios IS NULL))">
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
    


</asp:Content>
