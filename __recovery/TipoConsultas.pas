unit TipoConsultas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniRadioGroup, uniButton, uniBitBtn,
  uniSpeedButton, uniEdit, uniPanel, uniLabel, Vcl.Imaging.pngimage, uniImage,
  uniGUIBaseClasses, uniToolBar, Vcl.Buttons;

type
  TtipoconsultaForm = class(TUniForm)
    UniPanel1: TUniPanel;
    UniLabel2: TUniLabel;
    Estado: TUniRadioGroup;
    ubNuevo: TUniSpeedButton;
    ubActualizar: TUniSpeedButton;
    ubCancelar: TUniSpeedButton;
    Nombre: TUniEdit;
    UniSpeedButton1: TUniSpeedButton;
    UniToolBar1: TUniToolBar;
    UniImage1: TUniImage;
    UniLabel1: TUniLabel;
    UniLabel3: TUniLabel;
    Especialidad: TUniEdit;
    UniSpeedButton2: TUniSpeedButton;

    procedure Limpiar();
    procedure ShowCallback(Sender: TComponent; Asresult: Integer);
    procedure ubActualizarClick(Sender: TObject);
    procedure ubCancelarClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
  private
    codigo: string;
    codigoEspecialidad: string;
  public
    { Public declarations }
  end;

function tipoconsultaForm: TtipoconsultaForm;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Busqueda;

function tipoconsultaForm: TtipoconsultaForm;
begin
  Result := TtipoconsultaForm(UniMainModule.GetFormInstance(TtipoconsultaForm));
end;

procedure TtipoconsultaForm.Limpiar;
begin
  Nombre.Text := '';
  Especialidad.Text := '';
  codigoEspecialidad:='';
  codigo:='';
  Estado.ItemIndex := 0;
end;

procedure TtipoconsultaForm.ShowCallback(Sender: TComponent; Asresult: Integer);
begin
  if not(UniMainModule.Query.IsEmpty) and (UniMainModule.i = 7) then
  begin
    codigo := (UniMainModule.Query.FieldByName('Codigo').AsString);
    Nombre.Text := (UniMainModule.Query.FieldByName('Descripcion').AsString);
    Estado.ItemIndex := UniMainModule.Query.FieldByName('web').AsInteger;
  end;
  if not(UniMainModule.Query.IsEmpty) and (UniMainModule.i = 9) then
  begin
    codigoEspecialidad := (UniMainModule.Query.FieldByName('Codigo').AsString);
    Especialidad.Text := (UniMainModule.Query.FieldByName('Descripcion').AsString);
  end;
end;

procedure TtipoconsultaForm.ubActualizarClick(Sender: TObject);
var
  consulta: string;
begin
  if Nombre.Text = '' then
  begin
    ShowMessage('Debe seleccionar un tipo de consulta');
    Exit
  end;
  UniMainModule.Query.SQL.Clear;
  consulta := 'SELECT * from tipoconsulta where codigo=:Codigo';
  UniMainModule.Query.SQL.Text := consulta;
  UniMainModule.Query.Params.ParamByName('Codigo').Value := codigo;
  UniMainModule.Query.Open;
  if (UniMainModule.Query.IsEmpty) then
  begin
    ShowMessage('No existen registro para el codigo de consulta seleccionado');
  end
  else
  begin
    // Actualizar
    consulta := 'UPDATE tipoconsulta SET  web=:Web WHERE codigo=:Codigo';
    UniMainModule.Query.SQL.Text := consulta;
    UniMainModule.Query.Params.ParamByName('Web').Value := Estado.ItemIndex;
    UniMainModule.Query.ExecSQL;
    Limpiar();
    ShowMessage('Datos Actualizados exitosamente');
  end;
end;

procedure TtipoconsultaForm.ubCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TtipoconsultaForm.UniSpeedButton1Click(Sender: TObject);
begin
  UniMainModule.i := 7;
  if codigoEspecialidad.IsEmpty then
  begin
    ShowMessage('Debe seleccionar una especialidad');
    Exit;
  end;
  busquedaf.Especialidad := codigoEspecialidad;
  busquedaf.ShowModal(ShowCallback);
end;

procedure TtipoconsultaForm.UniSpeedButton2Click(Sender: TObject);
begin
  UniMainModule.i := 9;
  busquedaf.ShowModal(ShowCallback);
end;

end.
