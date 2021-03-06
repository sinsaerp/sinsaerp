unit OrdenesMedicas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniMemo, uniEdit, uniLabel,
  Data.DB, uniDBMemo;

type
  TFOrdenesMedicas = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    UniSpeedButton1: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    UniLabel1: TUniLabel;
    lblNumOrd: TUniLabel;
    lblNomPac: TUniLabel;
    ueItem: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    frecHor: TUniNumberEdit;
    detalle: TUniEdit;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    cantidad: TUniNumberEdit;
    ubAgregar: TUniSpeedButton;
    ubQuitar: TUniSpeedButton;
    UniDBGrid2: TUniDBGrid;
    UniLabel6: TUniLabel;
    UniMemo1: TUniMemo;
    UniSpeedButton5: TUniSpeedButton;
    panelResultado: TUniPanel;
    DBResultadoItem: TUniDBGrid;
    DataSource1: TDataSource;
    UniDBMemo1: TUniDBMemo;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    procedure ueItemChange(Sender: TObject);
    procedure DBResultadoItemBodyClick(Sender: TObject);
    procedure ubAgregarClick(Sender: TObject);
    procedure ListarItemsAgregados();
    procedure ObtenerNumOrden();
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure LimpiarCampos();
    procedure ubQuitarClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure mostrarFormulaciones();
    procedure UniSpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    codigoItem,  tipo, tipoItem: string;
  public
    { Public declarations }
    paciente, medico, rips : string;
  end;

function FOrdenesMedicas: TFOrdenesMedicas;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FOrdenesMedicas: TFOrdenesMedicas;
begin
  Result := TFOrdenesMedicas(UniMainModule.GetFormInstance(TFOrdenesMedicas));
end;

procedure TFOrdenesMedicas.DBResultadoItemBodyClick(Sender: TObject);
begin
panelResultado.Visible:=false;
ueItem.Text:=UniMainModule.QueryGrid.FieldByName('descripcion').AsString;
tipo:=UniMainModule.QueryGrid.FieldByName('tipo').AsString;
tipoItem:=UniMainModule.QueryGrid.FieldByName('tipoitems').AsString;
codigoItem:=UniMainModule.QueryGrid.FieldByName('codigo').AsString;
end;

procedure TFOrdenesMedicas.LimpiarCampos;
begin
panelResultado.Visible:=false;
ueItem.Clear;
codigoItem:='';
detalle.Clear;
cantidad.Text:='0';
frecHor.Text:='0';
end;

procedure TFOrdenesMedicas.ListarItemsAgregados;
begin
UniMainModule.QueryReporte.SQL.Clear;
UniMainModule.QueryReporte.SQL.Add('select autonumerico, tipo, codigo, medicamento, cantidad, dosificasion, fr_uso, CONVERT(varchar,fecha,23) as fecha, CONVERT(VARCHAR(5), hora, 108) as hora,'
+' servicio from formulacion where numero='''+lblNumOrd.Text+'''');
UniMainModule.QueryReporte.Open;
end;

procedure TFOrdenesMedicas.mostrarFormulaciones;
begin
UniMainModule.QueryGrid.Close;
UniMainModule.QueryGrid.SQL.Clear;
UniMainModule.QueryGrid.SQL.Add('select f.fecha, f.numero, f.Rips, f.servicio, f.Medico, m.nombre nom_med from formulacion f, medicos m where ' +
    'f.medico = m.codigo and f.paciente = ''' + paciente + ''' and f.numero > 0 and f.rips > 0 group by f.fecha, f.numero, f.Rips, ' +
    'f.servicio, f.Medico, m.nombre order by f.fecha desc, f.servicio, numero desc ');
UniMainModule.QueryGrid.Open;
end;

procedure TFOrdenesMedicas.ObtenerNumOrden;
begin
     UniMainModule.Query.SQL.Clear;
     UniMainModule.Query.SQL.Add('select numero from consecutivos_sinsa where documento=''ORDENES'' ');
     UniMainModule.Query.Open();
     lblNumOrd.Text:=IntToStr(UniMainModule.Query.FieldByName('numero').AsInteger+1);
     UniMainModule.Query.Close;
end;

procedure TFOrdenesMedicas.ubAgregarClick(Sender: TObject);
begin
panelResultado.Visible:=false;
UniMainModule.QueryGrid.Close;
if codigoItem='' then
begin
  ShowMessage('Debe seleccionar un item');
  exit;
end;

if ueItem.Text='' then
begin
  ShowMessage('Debe seleccionar un item');
  exit;
end;

if cantidad.Text='' then
begin
  ShowMessage('Debe ingresar una cantidad');
  exit;
end;

if lblNumOrd.Text='0' then
begin
   UniMainModule.Query.SQL.Clear;
UniMainModule.Query.SQL.Add('DECLARE @resultado TABLE(nume int); update consecutivos_sinsa set numero = numero + 1 OUTPUT INSERTED.numero ' +
      'INTO @resultado where documento = ''ORDENES''; SELECT * FROM @resultado');
UniMainModule.Query.ExecSQL;
ObtenerNumOrden;
end;

UniMainModule.Query.SQL.Clear;
UniMainModule.Query.SQL.Text:='INSERT INTO formulacion (paciente, medico, fecha, codigo, medicamento, cantidad, dosificasion, numero, rips, tipo, pos, hora, fr_uso, servicio) '+
'VALUES (:Pac, :Med, :Fec, :Cod, :Medic, :Can, :Dos, :Num, :Rips, :Tip, :Pos, :Hor, :For, :Ser)';
UniMainModule.Query.ParamByName('Pac').Value:=paciente;
UniMainModule.Query.ParamByName('Med').value:=medico;
UniMainModule.Query.ParamByName('Fec').value:=Now;
UniMainModule.Query.ParamByName('Cod').value:=codigoItem;
UniMainModule.Query.ParamByName('Medic').value:=ueItem.Text;
UniMainModule.Query.ParamByName('Can').value:=cantidad.Text;
UniMainModule.Query.ParamByName('Dos').value:=detalle.Text;
UniMainModule.Query.ParamByName('Num').value:=lblNumOrd.Text;
UniMainModule.Query.ParamByName('Rips').value:=rips;
UniMainModule.Query.ParamByName('Tip').value:=tipoItem;
UniMainModule.Query.ParamByName('Pos').value:=tipo;
UniMainModule.Query.ParamByName('Hor').value:=Now;
UniMainModule.Query.ParamByName('For').value:=frecHor.Text;
UniMainModule.Query.ParamByName('Ser').value:='Consulta Externa';
UniMainModule.Query.ExecSQL;

LimpiarCampos;
ListarItemsAgregados;



end;

procedure TFOrdenesMedicas.ubQuitarClick(Sender: TObject);
var
autonumerico : string;
begin
    autonumerico:=UniMainModule.QueryReporte.FieldByName('autonumerico').AsString;
    UniMainModule.Query.SQL.Clear;
    UniMainModule.Query.SQL.Add('update formulacion set numero=numero*-1, paciente=''0'', rips=rips*-1 where autonumerico='''+autonumerico+'''');
    UniMainModule.Query.ExecSQL;
    LimpiarCampos;
    ListarItemsAgregados;

end;

procedure TFOrdenesMedicas.ueItemChange(Sender: TObject);
begin
UniMainModule.QueryGrid.SQL.Clear;
  UniMainModule.QueryGrid.SQL.Add
  ('select i.*, ISNULL(c.Descripcion, ''No clasificado'') clasificacion from items i left join clase_items c ' +
      'on c.codigo = i.tipoitems where upper(i.codigo + i.descripcion) like ''%' + ueItem.Text + '%'' and i.ordenes = 1 order by i.descripcion' );
  UniMainModule.QueryGrid.Open;
  UniDBMemo1.DataField := 'descripcion';
  if not UniMainModule.QueryGrid.IsEmpty then
  begin
    panelResultado.Visible := true;
  end;
end;

procedure TFOrdenesMedicas.UniFormBeforeShow(Sender: TObject);
begin
  panelResultado.Visible := false;

end;

procedure TFOrdenesMedicas.UniFormShow(Sender: TObject);
begin
medico:=UniMainModule.codigoM;
panelResultado.Visible := false;
lblNumOrd.Text:='0';

UniMainModule.Query.Close;
UniMainModule.QueryGrid.Close;
UniMainModule.QueryReporte.Close;
mostrarFormulaciones;
end;

procedure TFOrdenesMedicas.UniSpeedButton1Click(Sender: TObject);
begin
OnShow(Sender);
LimpiarCampos;
end;

procedure TFOrdenesMedicas.UniSpeedButton2Click(Sender: TObject);
begin
mostrarFormulaciones;
end;

end.
