unit MostrarCitas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, uniButton, uniBitBtn, uniSpeedButton,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniToolBar, uniLabel, uniPanel;

type
  TcitaPacienteF = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    ubVerCita: TUniSpeedButton;
    DataSource1: TDataSource;
    UniLabel1: TUniLabel;
    UniPanel1: TUniPanel;
    procedure UniFormShow(Sender: TObject);
    procedure UniDBGrid1BodyDblClick(Sender: TObject);
    procedure ubVerCitaClick(Sender: TObject);
  private
    { Private declarations }
  public
    paciente: string;
  end;

function citaPacienteF: TcitaPacienteF;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Citas;

function citaPacienteF: TcitaPacienteF;
begin
  Result := TcitaPacienteF(UniMainModule.GetFormInstance(TcitaPacienteF));
end;

procedure TcitaPacienteF.ubVerCitaClick(Sender: TObject);
begin
UniDBGrid1.OnBodyDblClick(Sender);
end;

procedure TcitaPacienteF.UniDBGrid1BodyDblClick(Sender: TObject);
var
key: Char;
begin
key:=#13;
Citas.citasf.NumeroCita.Text:=UniMainModule.Query.FieldByName('rips').AsString;
Citas.citasf.NumeroCitaKeyPress(Sender, key);
Close;
end;

procedure TcitaPacienteF.UniFormShow(Sender: TObject);
begin

  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Add('select m.Nombre, c.Rips, c.Servicio, c.Fecha, CONVERT(VARCHAR(5), c.hora, 108) as hora from CitasServicios as c, medicos as m where c.Medico=m.Codigo and c.paciente=:Paciente order by fecha desc');
  UniMainModule.Query.Params.ParamByName('Paciente').Value:=paciente;
  UniMainModule.Query.Open();

end;

end.
