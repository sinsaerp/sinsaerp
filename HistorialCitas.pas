unit HistorialCitas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Data.DB, uniBasicGrid, uniDBGrid, uniLabel,
  Vcl.Imaging.pngimage, uniImage, uniGUIBaseClasses, uniToolBar;

type
  THistorialCitasF = class(TUniForm)
    UniToolBar1: TUniToolBar;
    UniImage1: TUniImage;
    UniLabel1: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    Paciente: TUniLabel;
    DataSource1: TDataSource;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    AfCoidgo, NombreU: string;
    { Public declarations }
  end;

function HistorialCitasF: THistorialCitasF;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function HistorialCitasF: THistorialCitasF;
begin
  Result := THistorialCitasF(UniMainModule.GetFormInstance(THistorialCitasF));
end;

procedure THistorialCitasF.UniFormShow(Sender: TObject);
begin
Paciente.Caption:=NombreU;
UniMainModule.QueryAgenda.Close;
UniMainModule.QueryAgenda.SQL.Text:='select  m.Nombre as medico, c.Fecha, c.Servicio, convert(varchar(5), c.hora, 108) as hora from CitasServicios c, Medicos m'+
' where c.Medico=m.Codigo and c.Paciente=:Codigo order by c.fecha desc';
UniMainModule.QueryAgenda.ParamByName('Codigo').Value:=AfCoidgo;
UniMainModule.QueryAgenda.Open();
if UniMainModule.QueryAgenda.RecordCount = 0 then
begin
  ShowMessage('El Paciente seleccionado no tiene registros en el sistema');
  UniMainModule.QueryAgenda.Close;
end;



end;

end.
