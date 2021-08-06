unit ReporteCitas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Vcl.ExtCtrls, uniButton, uniBitBtn, uniSpeedButton,
  uniDateTimePicker, uniEdit, uniLabel, uniBasicGrid, uniDBGrid, uniPanel,
  uniPageControl, uniGUIBaseClasses, Data.DB;

type
  Tfmedicocistas = class(TUniForm)
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    UniLabel1: TUniLabel;
    Medico: TUniEdit;
    UniLabel2: TUniLabel;
    fechaAsignacion: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    TotalAgenda: TUniEdit;
    UniLabel4: TUniLabel;
    Total: TUniEdit;
    UniLabel5: TUniLabel;
    Disponibles: TUniEdit;
    UniSpeedButton1: TUniSpeedButton;
    Cancelado: TUniEdit;
    Suspendido: TUniEdit;
    EnEspera: TUniEdit;
    UniEdit7: TUniEdit;
    CodigoMedico: TUniEdit;
    DataSource: TDataSource;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    NoAsistio: TUniEdit;
    usuario__: string;
    color1, color2, color3, color4, color5: TColor;
  end;

function fmedicocistas: Tfmedicocistas;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Citas;

function fmedicocistas: Tfmedicocistas;
begin
  Result := Tfmedicocistas(UniMainModule.GetFormInstance(Tfmedicocistas));
end;

procedure Tfmedicocistas.UniFormShow(Sender: TObject);
 var
 keyx: Char;
begin
keyx:=#13;
 if (CodigoMedico.Text = '') then
  begin
    ShowMessage('Falta Codigo Medico.. Verifique');
    exit
  end;



    UniMainModule.QueryReporte.SQL.Clear;
    UniMainModule.QueryReporte.SQL.Add('select * from HorarioM where medico=''' + CodigoMedico.Text + ''' and Fecha=''' + FormatDateTime('yyyymmdd',
      FechaAsignacion.DateTime) + ''' ');
    UniMainModule.QueryReporte.Open;



  if (UniMainModule.QueryReporte.IsEmpty) then
  begin
    ShowMessage('Este Medico no Tiene Agenda Para  esta fecha.......');
  end
  else
  begin

    TotalAgenda.Text := IntToStr(UniMainModule.QueryReporte.FieldByName('Turnos1').AsInteger + UniMainModule.QueryReporte.FieldByName('Turnos2').AsInteger);
    UniMainModule.QueryReporte.SQL.Clear;
    UniMainModule.QueryReporte.SQL.Add('select c.Consecutivo, c.HoraCita as horas, u.NombreCompleto, u.CODEPS, c.Asistio, c.CodigoConsulta, e.Nombre, u.AfCodigo, ' +
      'tc.Descripcion, u.TELEFONO, c.Turno, DATEDIFF(yy, u.FECHA_NACIMIENTO, GETDATE()) AS Edad, c.AutorizacionC, c.Medico from Citas c, Usuarios ' +
      'u , TipoConsulta tc, epssi e,ripsg r where c.Medico=''' + CodigoMedico.Text + ''' and c.FechaCita = ''' + FormatDateTime('yyyymmdd',
      FechaAsignacion.DateTime) + ''' and e.codigoEps=r.Eps and r.Rips=c.Consecutivo and r.Identificacion=u.AfCodigo and u.AfCodigo = c.Paciente and ' +
      'tc.Codigo = c.CodigoConsulta and c.Asistio <> 2 order by c.Turno, c.HoraCitaX');

    // ShowMessage(query.SQL.Text);
    UniMainModule.QueryReporte.Open;

    fmedicocistas.Total.Text := IntToStr(UniMainModule.QueryReporte.RecordCount);

    fmedicocistas.Disponibles.Text := IntToStr(StrtoInt(TotalAgenda.Text) - UniMainModule.QueryReporte.RecordCount);

    fmedicocistas.Medico.Text := Medico.Text;
    FechaAsignacion.DateTime := FechaAsignacion.DateTime;

    UniMainModule.Query.SQL.Clear;
    UniMainModule.Query.SQL.Add('select * from ColoresEstado');
    UniMainModule.Query.Open;

    UniMainModule.Query.First;
    color1 := Stringtocolor(UniMainModule.Query.FieldByName('Color').AsString);

    NoAsistio.Color := Stringtocolor(UniMainModule.Query.FieldByName('Color').AsString);
    NoAsistio.Caption := UniMainModule.Query.FieldByName('Estado').AsString;

    UniMainModule.Query.Next;
    color2 := Stringtocolor(UniMainModule.Query.FieldByName('Color').AsString);
    Cancelado.Color := Stringtocolor(UniMainModule.Query.FieldByName('Color').AsString);
    Cancelado.Caption := UniMainModule.Query.FieldByName('Estado').AsString;

    UniMainModule.Query.Next;
    color3 := Stringtocolor(UniMainModule.Query.FieldByName('Color').AsString);
    Suspendido.Color := Stringtocolor(UniMainModule.Query.FieldByName('Color').AsString);
    Suspendido.Caption := UniMainModule.Query.FieldByName('Estado').AsString;

    UniMainModule.Query.Next;
    color4 := Stringtocolor(UniMainModule.Query.FieldByName('Color').AsString);
    EnEspera.Color := Stringtocolor(UniMainModule.Query.FieldByName('Color').AsString);
    EnEspera.Caption := UniMainModule.Query.FieldByName('Estado').AsString;

    UniMainModule.Query.Next;
    color5 := Stringtocolor(UniMainModule.Query.FieldByName('Color').AsString);
    UniEdit7.Color := Stringtocolor(UniMainModule.Query.FieldByName('Color').AsString);
    UniEdit7.Caption := UniMainModule.Query.FieldByName('Estado').AsString;
    usuario__ := CodigoMedico.Text;
    if (fmedicocistas.ShowModal = mrok) then
      citasF.NumeroCitaKeyPress(Sender, keyx);
  end;
end;

end.
