unit DetalleCita2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Vcl.Imaging.pngimage, uniImage, uniToolBar,
  uniMemo, uniButton, uniBitBtn, uniSpeedButton, uniRadioGroup, uniEdit,
  uniLabel, uniGUIBaseClasses, uniPanel, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON;

type
  TDetalleCitaForm = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel2: TUniLabel;
    TipoDoc: TUniEdit;
    Documento: TUniEdit;
    UniLabel3: TUniLabel;
    Estado: TUniRadioGroup;
    ubGuardar: TUniSpeedButton;
    ubActualizar: TUniSpeedButton;
    Direccion: TUniEdit;
    Telefono: TUniEdit;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    Fecha: TUniEdit;
    UniLabel9: TUniLabel;
    Paciente: TUniEdit;
    UniLabel4: TUniLabel;
    UniLabel11: TUniLabel;
    Medico: TUniEdit;
    UniLabel12: TUniLabel;
    Descripcion: TUniEdit;
    UniLabel13: TUniLabel;
    Observaciones: TUniMemo;
    Hora: TUniEdit;
    UniLabel10: TUniLabel;
    UniToolBar1: TUniToolBar;
    UniImage1: TUniImage;
    UniLabel1: TUniLabel;
    UniLabel14: TUniLabel;
    EPS: TUniEdit;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    ubHistorial: TUniSpeedButton;
    UniLabel15: TUniLabel;
    FechaSolicitud: TUniEdit;
    Codigo: TUniEdit;
    procedure UniFormShow(Sender: TObject);
    procedure ubActualizarClick(Sender: TObject);
    procedure ubGuardarClick(Sender: TObject);
    procedure ubHistorialClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    afape1, afape2, afnom1, afnom2, fechaNacimiento, sexo, correo: string;
    autorizacion, codmedico, tipo, codconsulta, regimen : string;
  end;

function DetalleCitaForm: TDetalleCitaForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, HistorialCitas;

function DetalleCitaForm: TDetalleCitaForm;
begin
  Result := TDetalleCitaForm(UniMainModule.GetFormInstance(TDetalleCitaForm));
end;

procedure TDetalleCitaForm.ubActualizarClick(Sender: TObject);
begin
  Close;
end;

procedure TDetalleCitaForm.ubGuardarClick(Sender: TObject);
var
  id, idApi, consulta, status, opcion, URLAPI, rip, numeroC: string;
  doc, obj: TJSONObject;
begin
  opcion := 'Rechazar';
  if (Estado.ItemIndex = 0) then
  begin
    opcion := 'Confirmar';
  end;
  MessageDlg('�Est� seguro de ' + opcion + ' la cita seleccionada ?',
    mtConfirmation, mbYesNoCancel,
    procedure(Sender: TComponent; Ans: Integer)
    begin
      if Ans = mrYes then
      begin
        URLAPI := 'http://localhost/citas/api/';
        id := UniMainModule.Query.FieldByName('id').AsString;
        idApi := UniMainModule.Query.FieldByName('idapi').AsString;
        consulta :=
          'UPDATE citasweb SET  estado=:Estado, observaciones=:Observaciones WHERE id=:Id';
        UniMainModule.Query.SQL.Text := consulta;
        UniMainModule.Query.Params.ParamByName('Estado').Value :=
          Estado.ItemIndex;
        UniMainModule.Query.Params.ParamByName('observaciones').Value :=
          Observaciones.Text;
        UniMainModule.Query.Params.ParamByName('Id').Value := id;
        UniMainModule.Query.ExecSQL;
        RESTClient1.BaseURL := URLAPI + 'estado/cita';
        RESTRequest1.Params[0].Value := idApi;
        RESTRequest1.Params[1].Value := Estado.ItemIndex.ToString;
        RESTRequest1.Params[2].Value := Observaciones.Text;
        RESTRequest1.Execute;
        if RESTResponse1.StatusCode = 200 then
        begin
          doc := RESTResponse1.JSONValue as TJSONObject;
          status := doc.GetValue('status').Value;
          if status = 'success' then
          begin
             UniMainModule.FDConnection.StartTransaction;
            try
              UniMainModule.Query.SQL.Clear;
            consulta := 'SELECT * FROM usuarios WHERE afcodigo=''' +
              Documento.Text + '''';
            UniMainModule.Query.SQL.Add(consulta);
            UniMainModule.Query.Open();
            if UniMainModule.Query.IsEmpty then
            begin
              // Registar
              ShowMessage('Insertar');
              UniMainModule.Query.SQL.Clear;
              consulta :=
                'INSERT INTO usuarios (codeps, tipideafil, afcodigo, afape1, afape2, afnom1, afnom2, fecha_nacimiento, sexo, tipafiliado, telefono, direccion, nombrecompleto, correoe)'
                + 'VALUES (:Codeps, :Tipideafil, :Afcodigo, :Afape1, :Afape2, :Afnom1, :Afnom2, :Fecha, :Sexo, :Tipafiliado, :Telefono, :Direccion,  :Nombre, :Correo) ';
              UniMainModule.Query.SQL.Text:=consulta;
              UniMainModule.Query.Params.ParamByName('Codeps').Value :=
                Codigo.Text;
              UniMainModule.Query.Params.ParamByName('Tipideafil').Value :=
                TipoDoc.Text;
              UniMainModule.Query.Params.ParamByName('Afcodigo').Value :=
                Documento.Text;
              UniMainModule.Query.Params.ParamByName('Afape1').Value := afape1;
              UniMainModule.Query.Params.ParamByName('Afape2').Value := afape2;
              UniMainModule.Query.Params.ParamByName('Afnom1').Value := afnom1;
              UniMainModule.Query.Params.ParamByName('Afnom2').Value := afnom2;
              UniMainModule.Query.Params.ParamByName('Fecha').Value :=
                fechaNacimiento;
              UniMainModule.Query.Params.ParamByName('Sexo').Value := sexo;
              UniMainModule.Query.Params.ParamByName('Tipafiliado').Value := 'B';
              UniMainModule.Query.Params.ParamByName('Telefono').Value :=
                Telefono.Text;
              UniMainModule.Query.Params.ParamByName('Direccion').Value :=
                Direccion.Text;
              UniMainModule.Query.Params.ParamByName('Nombre').Value :=
                Paciente.Text;
              UniMainModule.Query.Params.ParamByName('Correo').Value := correo;
              UniMainModule.Query.ExecSQL;
            end
            else
            begin
             // Actualizar
              UniMainModule.Query.SQL.Clear;
              consulta :=
                'UPDATE usuarios SET codeps=:Codeps, tipideafil=:Tipideafil, afape1=:Afape1, afape2=:Afape2, afnom1=:Afnom1, afnom2=:Afnom2, fecha_nacimiento=:Fecha, sexo=:Sexo,'
                +' tipafiliado=:Tipafiliado, telefono=:Telefono, direccion=:Direccion, nombrecompleto=:Nombre, correoe=:Correo'
                + ' WHERE afcodigo=:Afcodigo ';
              UniMainModule.Query.SQL.Text := consulta;
              UniMainModule.Query.Params.ParamByName('Codeps').Value :=
                Codigo.Text;
              UniMainModule.Query.Params.ParamByName('Tipideafil').Value :=
                TipoDoc.Text;
              UniMainModule.Query.Params.ParamByName('Afcodigo').Value :=
                Documento.Text;
              UniMainModule.Query.Params.ParamByName('Afape1').Value := afape1;
              UniMainModule.Query.Params.ParamByName('Afape2').Value := afape2;
              UniMainModule.Query.Params.ParamByName('Afnom1').Value := afnom1;
              UniMainModule.Query.Params.ParamByName('Afnom2').Value := afnom2;
              UniMainModule.Query.Params.ParamByName('Fecha').Value :=
                fechaNacimiento;
              UniMainModule.Query.Params.ParamByName('Sexo').Value := sexo;
              UniMainModule.Query.Params.ParamByName('Tipafiliado')
                .Value := 'B';
              UniMainModule.Query.Params.ParamByName('Telefono').Value :=
                Telefono.Text;
              UniMainModule.Query.Params.ParamByName('Direccion').Value :=
                Direccion.Text;
              UniMainModule.Query.Params.ParamByName('Nombre').Value :=
                Paciente.Text;
              UniMainModule.Query.Params.ParamByName('Correo').Value := correo;
              UniMainModule.Query.ExecSQL;
            end;

            //Obtener maximo rips de la tabla ripsg
              UniMainModule.Query.SQL.Clear;
              UniMainModule.Query.SQL.Add('select MAX(rips)+1  as rips from RipsG');
              UniMainModule.Query.Open();
              rip:=UniMainModule.Query.FieldByName('rips').AsString;


              //Obtener numero de contrato segun la eps del usuario
              UniMainModule.Query.SQL.Clear;
              UniMainModule.Query.SQL.Add('select numeroc from contratosin where estado=''ACTIVO'' AND citas=''1'' and entidad='''+Codigo.Text+'''');
              UniMainModule.Query.Open();
              numeroC:=UniMainModule.Query.FieldByName('numeroc').AsString;



              //Registrar Datos en RIPSG
              UniMainModule.Query.SQL.Clear;
              consulta :=
                'INSERT INTO ripsg (rips, identificacion, eps, fechar, usuario, ripsestado, tiporips, dependencia, contratoe, autorizacion)'
                + 'VALUES (:Rips, :Identificacion, :Eps, :FechaR, :Usuario, :RipsEstado, :Tipo, :Dependencia, :Contrato, :Autorizacion) ';
              UniMainModule.Query.SQL.Text := consulta;
              UniMainModule.Query.Params.ParamByName('Rips').Value :=
               rip;
              UniMainModule.Query.Params.ParamByName('Identificacion').Value :=
                Documento.Text;
              UniMainModule.Query.Params.ParamByName('Eps').Value :=
                Codigo.Text;
              UniMainModule.Query.Params.ParamByName('FechaR').Value := Now;
              UniMainModule.Query.Params.ParamByName('Usuario').Value := '1';
              UniMainModule.Query.Params.ParamByName('RipsEstado').Value := '0';
              UniMainModule.Query.Params.ParamByName('Tipo').Value := 'EVENTO';
              UniMainModule.Query.Params.ParamByName('Dependencia').Value := '0001';
              UniMainModule.Query.Params.ParamByName('Contrato').Value :=
                numeroC;
              UniMainModule.Query.Params.ParamByName('Autorizacion').Value := autorizacion;
              UniMainModule.Query.ExecSQL;

              //Insertar en DXRIPS
              UniMainModule.Query.SQL.Clear;
              consulta :=
                'INSERT INTO dxrips (rips, fechai, horai, autorizacion, servicio, centrocosto, medicorecibe)'
                + 'VALUES (:Rips, :Fecha, :Hora, :Autorizacion, :Servicio, :Centro, :Medico) ';
              UniMainModule.Query.SQL.Text := consulta;
              UniMainModule.Query.Params.ParamByName('Rips').Value :=
               rip;
              UniMainModule.Query.Params.ParamByName('Fecha').Value :=
              StrToDate(Fecha.Text);
              UniMainModule.Query.Params.ParamByName('Hora').Value :=
               StrToTime(Hora.Text);
              UniMainModule.Query.Params.ParamByName('Autorizacion').Value := autorizacion;
              UniMainModule.Query.Params.ParamByName('Servicio').Value := 'Consulta Externa';
              UniMainModule.Query.Params.ParamByName('Medico').Value := codmedico;
              UniMainModule.Query.Params.ParamByName('Centro').Value := '0001';
              UniMainModule.Query.ExecSQL;

              //Insertar en Citas
              UniMainModule.Query.SQL.Clear;
              consulta :=
                'INSERT INTO citas (paciente, medico, consecutivo, hora, fecha, fechacita, horacita, tipoconsulta, horacitax, autorizacionc, marcar, codigoconsulta)'
                + 'VALUES (:Paciente, :Medico, :Consecutivo, :Hora, :Fecha, :FechaCita, :HoraCita, :Tipo, :HoraX, :Autorizacion, :Marcar, :Codigo) ';
              UniMainModule.Query.SQL.Text := consulta;
              UniMainModule.Query.Params.ParamByName('Paciente').Value :=
               Documento.Text;
              UniMainModule.Query.Params.ParamByName('Medico').Value :=
               codmedico;
               UniMainModule.Query.Params.ParamByName('Consecutivo').Value :=
               rip;
              UniMainModule.Query.Params.ParamByName('Hora').Value :=
               StrToDateTime( Hora.Text);
              UniMainModule.Query.Params.ParamByName('Fecha').Value :=
                StrToDate(FechaSolicitud.Text);
              UniMainModule.Query.Params.ParamByName('FechaCita').Value := StrToDate(Fecha.Text);
              UniMainModule.Query.Params.ParamByName('HoraCita').Value := (Hora.Text);
              UniMainModule.Query.Params.ParamByName('Tipo').Value := tipo;
               UniMainModule.Query.Params.ParamByName('HoraX').Value := StrToDateTime(hora.Text);
              UniMainModule.Query.Params.ParamByName('Autorizacion').Value := autorizacion;
              UniMainModule.Query.Params.ParamByName('Marcar').Value := '1';
              UniMainModule.Query.Params.ParamByName('Codigo').Value := codconsulta;
              UniMainModule.Query.ExecSQL;

              //Insertar en Citas Servicios
              UniMainModule.Query.SQL.Clear;
              consulta :=
                'INSERT INTO citasservicios (paciente, medico, hora, fecha, codigo, servicio, cantidad, rips)'
                + 'VALUES (:Paciente, :Medico, :Hora, :Fecha, :Codigo, :Servicio, :Cantidad, :Rips) ';
              UniMainModule.Query.SQL.Text := consulta;
              UniMainModule.Query.Params.ParamByName('Paciente').Value :=
               Documento.Text;
              UniMainModule.Query.Params.ParamByName('Medico').Value :=
               codmedico;
              UniMainModule.Query.Params.ParamByName('Hora').Value :=
               StrToDateTime( Hora.Text);
              UniMainModule.Query.Params.ParamByName('Fecha').Value :=
                StrToDate(Fecha.Text);
              UniMainModule.Query.Params.ParamByName('Codigo').Value := codconsulta;
              UniMainModule.Query.Params.ParamByName('Servicio').Value := Descripcion.Text;
              UniMainModule.Query.Params.ParamByName('Cantidad').Value := '1';
              UniMainModule.Query.Params.ParamByName('Rips').Value := rip;
              UniMainModule.Query.ExecSQL;

              UniMainModule.FDConnection.Commit;
            ShowMessage('Informaci�n Registrada Exitosamente');
            Close;
            except
               UniMainModule.FDConnection.Rollback;
               ShowMessage('No re gistro la informaci�n en SINSA ERP');
            end;



          end
          end;
      end;
    end);
  Abort;

end;

procedure TDetalleCitaForm.ubHistorialClick(Sender: TObject);
begin
  if Documento.Text = '' then
  begin
    ShowMessage('Debe seleccionar un paciente');
  end
  else
  begin
    HistorialCitasF.AfCoidgo := Documento.Text;
    HistorialCitasF.NombreU := Paciente.Text;
    HistorialCitasF.ShowModal();
  end;
end;

procedure TDetalleCitaForm.UniFormShow(Sender: TObject);
begin
  if not UniMainModule.Query.IsEmpty then
  begin

    Paciente.Text := UniMainModule.Query.FieldByName('nombrec').AsString;
    TipoDoc.Text := UniMainModule.Query.FieldByName('tipidafil').AsString;
    Documento.Text := UniMainModule.Query.FieldByName('afcodigo').AsString;
    Telefono.Text := UniMainModule.Query.FieldByName('telefono').AsString;
    Direccion.Text := UniMainModule.Query.FieldByName('direccion').AsString;
    EPS.Text := UniMainModule.Query.FieldByName('eps').AsString;
    Fecha.Text := UniMainModule.Query.FieldByName('fechaCita').AsString;
    FechaSolicitud.Text := UniMainModule.Query.FieldByName
      ('fechaSolicitud').AsString;
    Medico.Text := UniMainModule.Query.FieldByName('medico').AsString;
    Hora.Text := UniMainModule.Query.FieldByName('hora').AsString;
    Descripcion.Text := UniMainModule.Query.FieldByName('descripcion').AsString;
    Codigo.Text := UniMainModule.Query.FieldByName('codeps').AsString;
    afape1 := UniMainModule.Query.FieldByName('afape1').AsString;
    afape2 := UniMainModule.Query.FieldByName('afape2').AsString;
    afnom1 := UniMainModule.Query.FieldByName('afnom1').AsString;
    afnom2 := UniMainModule.Query.FieldByName('afnom2').AsString;
    fechaNacimiento := UniMainModule.Query.FieldByName
      ('fecha_nacimiento').AsString;
    sexo := UniMainModule.Query.FieldByName('sexo').AsString;
    correo := UniMainModule.Query.FieldByName('email').AsString;
    codmedico := UniMainModule.Query.FieldByName('codmedico').AsString;
    codconsulta := UniMainModule.Query.FieldByName('codconsulta').AsString;


  end;
end;

end.
