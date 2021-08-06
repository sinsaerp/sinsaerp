unit Citas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, Vcl.Imaging.pngimage, uniImage,
  uniGUIBaseClasses, uniToolBar, uniBasicGrid, uniDBGrid, uniBitBtn,
  uniSpeedButton, uniDateTimePicker, uniMultiItem, uniComboBox, uniButton,
  uniEdit, uniPanel, uniPageControl, uniRadioGroup, Data.DB, uniCalendar,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  uniStringGrid, System.JSON, System.JSON.Types,
  System.JSON.Writers, System.JSON.Builders;

type
  TcitasF = class(TUniForm)
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    educativo: TUniComboBox;
    ValorModeradora: TUniEdit;
    UniLabel24: TUniLabel;
    UniLabel25: TUniLabel;
    UniLabel26: TUniLabel;
    dcprincipal: TUniEdit;
    uiGuardar: TUniButton;
    UniTabSheet4: TUniTabSheet;
    ATAfiliado: TUniEdit;
    Autorizacion: TUniEdit;
    btnBuscarP: TUniButton;
    cantidad_servicios: TUniEdit;
    CEPS: TUniEdit;
    codigoConsulta: TUniEdit;
    Contrato: TUniEdit;
    DatosIngreso: TUniEdit;
    DireccionU: TUniEdit;
    DXP: TUniEdit;
    email: TUniEdit;
    fecha_deseada: TUniDateTimePicker;
    fechaAsignacion: TUniDateTimePicker;
    FechaN: TUniEdit;
    IdentificacionA: TUniEdit;
    Medico: TUniEdit;
    NombreC: TUniEdit;
    Telefono: TUniEdit;
    tipoCita: TUniRadioGroup;
    TipoConsulta: TUniEdit;
    ubBuscarCodigo: TUniButton;
    ubBuscarDiagnostico: TUniButton;
    ubGuardarObs: TUniButton;
    ubQuitar: TUniButton;
    ubValor: TUniButton;
    uiBuscarContrato: TUniButton;
    uiBuscarMedico: TUniButton;
    uiCrearP: TUniButton;
    uiHoras: TUniSpeedButton;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel20: TUniLabel;
    UniLabel21: TUniLabel;
    UniLabel22: TUniLabel;
    UniLabel23: TUniLabel;
    UniLabel27: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniPageControl2: TUniPageControl;
    UniTabSheet2: TUniTabSheet;
    TabAgenda: TUniTabSheet;
    UniLabel28: TUniLabel;
    codigoM: TUniEdit;
    UniLabel29: TUniLabel;
    ubBuscarMedico: TUniSpeedButton;
    UniLabel30: TUniLabel;
    IDMedico: TUniEdit;
    UniLabel31: TUniLabel;
    NombreM: TUniEdit;
    UniLabel32: TUniLabel;
    DireccionM: TUniEdit;
    UniLabel33: TUniLabel;
    RM: TUniEdit;
    UniLabel34: TUniLabel;
    UsuarioM: TUniEdit;
    UniLabel35: TUniLabel;
    ClaveM: TUniEdit;
    UniLabel37: TUniLabel;
    IntervaloM: TUniEdit;
    ubGuardar: TUniSpeedButton;
    UniLabel38: TUniLabel;
    UniLabel39: TUniLabel;
    UniLabel40: TUniLabel;
    UniLabel41: TUniLabel;
    UniLabel42: TUniLabel;
    Turnos: TUniEdit;
    UniLabel43: TUniLabel;
    TurnosMW: TUniEdit;
    UniLabel44: TUniLabel;
    UniLabel45: TUniLabel;
    UniLabel46: TUniLabel;
    ubCrear: TUniSpeedButton;
    ubEliminar: TUniSpeedButton;
    DataSource: TDataSource;
    HoraI: TUniDateTimePicker;
    HoraF: TUniDateTimePicker;
    HoraT1: TUniDateTimePicker;
    HoraT2: TUniDateTimePicker;
    Calendar1: TUniCalendar;
    UniLabel8: TUniLabel;
    TurnosT2: TUniEdit;
    TurnosTW: TUniEdit;
    UniLabel9: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    UniLabel36: TUniLabel;
    MAgenda: TUniComboBox;
    HoraAsignacion: TUniDateTimePicker;
    ubAsignarHoras: TUniSpeedButton;
    ubVerHoras: TUniSpeedButton;
    UniTabSheet5: TUniTabSheet;
    UniLabel48: TUniLabel;
    FechaIncial: TUniDateTimePicker;
    UniLabel49: TUniLabel;
    fechaFinal: TUniDateTimePicker;
    ubConsultar: TUniSpeedButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    UniDBGrid2: TUniDBGrid;
    DataSource1: TDataSource;
    Filtrar: TUniEdit;
    UniLabel50: TUniLabel;
    UniLabel47: TUniLabel;
    UniLabel51: TUniLabel;
    UniLabel52: TUniLabel;
    UniLabel53: TUniLabel;
    UniSpeedButton1: TUniSpeedButton;
    DataSource2: TDataSource;
    etnia: TUniComboBox;
    UniLabel55: TUniLabel;
    poblacion: TUniComboBox;
    UniLabel56: TUniLabel;
    UniTabSheet3: TUniTabSheet;
    btnAgendaMes: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    autorizada: TUniDateTimePicker;
    ubCancelar: TUniSpeedButton;
    UniPanel1: TUniPanel;
    UniImage1: TUniImage;
    UniLabel1: TUniLabel;
    UniLabel54: TUniLabel;
    UniDBGrid3: TUniDBGrid;
    NumeroCita: TUniEdit;
    UniDBGrid4: TUniDBGrid;
    DataSource3: TDataSource;
    ubReprogramar: TUniSpeedButton;
    ubImprimir: TUniSpeedButton;
    UniLabel57: TUniLabel;
    UniLabel58: TUniLabel;
    UniLabel59: TUniLabel;
    Fecha1: TUniDateTimePicker;
    Fecha2: TUniDateTimePicker;
    UniLabel60: TUniLabel;
    PMedico: TUniRadioGroup;
    CMedico: TUniEdit;
    NMedico: TUniEdit;
    UniSpeedButton3: TUniSpeedButton;
    UniSpeedButton4: TUniSpeedButton;
    lblUsuario: TUniLabel;
    ubVerCitas: TUniSpeedButton;

    procedure uiCrearPClick(Sender: TObject);
    procedure ShowCallback(Sender: TComponent; Asresult: Integer);
    procedure uiBuscarMedicoClick(Sender: TObject);
    procedure btnBuscarPClick(Sender: TObject);
    procedure ubBuscarCodigoClick(Sender: TObject);
    procedure TipoConsultaDblClick(Sender: TObject);
    procedure uiBuscarContratoClick(Sender: TObject);
    procedure uiHorasClick(Sender: TObject);
    procedure ubBuscarMedicoClick(Sender: TObject);
    procedure ubGuardarClick(Sender: TObject);
    procedure ubCrearClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure Calendar1Click(Sender: TObject);
    procedure ubEliminarClick(Sender: TObject);
    procedure ubAsignarHorasClick(Sender: TObject);
    procedure ubVerHorasClick(Sender: TObject);
    procedure ubConsultarClick(Sender: TObject);
    procedure FiltrarKeyPress(Sender: TObject; var Key: Char);
    procedure UniDBGrid2DblClick(Sender: TObject);
    procedure TurnosMWKeyPress(Sender: TObject; var Key: Char);
    procedure uiGuardarClick(Sender: TObject);
    procedure ubBuscarDiagnosticoClick(Sender: TObject);
    procedure btnAgendaMesClick(Sender: TObject);

    function verificarHora(med: string; fec: string; hor: string): boolean;
    function contadorCitas(med: string; fec: string): boolean;
    function rutaReporte(): string;

    procedure HoraAsignacionChange(Sender: TObject);
    procedure ubGuardarObsClick(Sender: TObject);
    procedure ubValorClick(Sender: TObject);
    procedure ubCancelarClick(Sender: TObject);
    procedure ubQuitarClick(Sender: TObject);

    procedure NumeroCitaKeyPress(Sender: TObject; var Key: Char);
    procedure UniDBGrid4CellClick(Column: TUniDBGridColumn);
    procedure IdentificacionAKeyPress(Sender: TObject; var Key: Char);
    procedure ubReprogramarClick(Sender: TObject);
    procedure cerrarConsultas();
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure ubImprimirClick(Sender: TObject);
    procedure UniSpeedButton4Click(Sender: TObject);
    procedure ubVerCitasClick(Sender: TObject);

  private
    CodigoMedico, Departamento, Municipio, NombreCom, EPSU, Intervalo: string;
    TurnosM, TurnosT: Integer;
    Estado: string;

  public
    { Public declarations }
  end;

function citasf: TcitasF;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Busqueda, Pacientes, MostrarCitas, HoraDia,
  HorasAsignadasWeb, DetalleCita, DetalleCita2, AgendaMes, ReprogramarCita,
  VentanaReporte, ReporteCitas;

function citasf: TcitasF;
begin
  Result := TcitasF(UniMainModule.GetFormInstance(TcitasF));
end;

procedure TcitasF.btnAgendaMesClick(Sender: TObject);
begin
  if (CodigoMedico <> '') and (Medico.Text <> '') then
  begin
    AgendaMes.FCalendarioAgenda.CodMed.Text := CodigoMedico;
    AgendaMes.FCalendarioAgenda.NombreMed.Text := Medico.Text;
    AgendaMes.FCalendarioAgenda.Fecha.Date := fechaAsignacion.DateTime;
  end;
  AgendaMes.FCalendarioAgenda.ShowModal();
end;

procedure TcitasF.btnBuscarPClick(Sender: TObject);
begin
  UniMainModule.i := 0;
  busquedaf.ShowModal(ShowCallback);
end;

procedure TcitasF.Calendar1Click(Sender: TObject);
var
  consulta: string;

begin
  UniMainModule.Query.SQL.Clear;
  consulta :=
    'select fecha, convert(varchar(5), horai1, 108) as horai, convert(varchar(5), horaf1, 108) as horaf, '
    + 'turnos1, convert(varchar(5), horai2, 108) as horati, convert(varchar(5), horaf2, 108) as horatf, turnos2, webm, webt from horariom where medico =:Medico and Fecha =:Fecha ';
  UniMainModule.Query.SQL.Text := consulta;
  UniMainModule.Query.Params.ParamByName('Medico').Value := codigoM.Text;
  UniMainModule.Query.Params.ParamByName('Fecha').Value := Calendar1.Date;
  UniMainModule.Query.Open;
  if not UniMainModule.Query.IsEmpty then
  begin
    HoraI.DateTime := UniMainModule.Query.FieldByName('HoraI').asdatetime;
    HoraF.DateTime := UniMainModule.Query.FieldByName('HoraF').asdatetime;
    Turnos.Text := UniMainModule.Query.FieldByName('Turnos1').AsString;
    HoraT1.DateTime := UniMainModule.Query.FieldByName('HoraTI').asdatetime;
    HoraT2.DateTime := UniMainModule.Query.FieldByName('HoraTF').asdatetime;
    TurnosT2.Text := UniMainModule.Query.FieldByName('Turnos2').AsString;
    TurnosMW.Text := UniMainModule.Query.FieldByName('webm').AsString;
    TurnosTW.Text := UniMainModule.Query.FieldByName('webt').AsString;
  end
  else
  begin
    Turnos.Text := '0';
    TurnosMW.Text := '0';
    TurnosTW.Text := '0';
    TurnosT2.Text := '0';
  end;
end;

procedure TcitasF.NumeroCitaKeyPress(Sender: TObject; var Key: Char);

var
  consulta: string;
begin
  if (Key = #13) then
  begin
    /// /////

    if (NumeroCita.Text = '0') then
    begin
      exit;
    end;

    // i := 20; // para que no me muestra citas

    consulta := 'select * from Citas where consecutivo=' + NumeroCita.Text + '';
    UniMainModule.Query.SQL.Clear;
    UniMainModule.Query.SQL.Add(consulta);
    UniMainModule.Query.Open;

    if (not UniMainModule.Query.IsEmpty) then
    begin

      fechaAsignacion.DateTime := UniMainModule.Query.FieldByName('FechaCita')
        .asdatetime;
      HoraAsignacion.DateTime := UniMainModule.Query.FieldByName('HoraCita')
        .asdatetime;
      Autorizacion.Text := UniMainModule.Query.FieldByName
        ('AutorizacionC').AsString;
      // EveCap.Text :=  UniMainModule.Query.FieldByName('TContrato').AsString;

      IdentificacionA.Text := UniMainModule.Query.FieldByName
        ('Paciente').AsString;
      CodigoMedico := UniMainModule.Query.FieldByName('medico').AsString;
      ValorModeradora.Text := UniMainModule.Query.FieldByName
        ('ValorModeradora').AsString;

      Contrato.Text := UniMainModule.Query.FieldByName('TContrato').AsString;

      ShowMessage('Datos: Usuario =' + UniMainModule.Query.FieldByName
        ('Citadora').AsString + ' Fecha= ' + FormatDateTime('yyyy-mm-dd',
        UniMainModule.Query.FieldByName('Fecha').asdatetime) + ' Hora=' +
        FormatDateTime('hh:mm AM/PM', UniMainModule.Query.FieldByName('Hora')
        .asdatetime));

      consulta := 'select * from Medicos where Codigo=''' + CodigoMedico + '''';
      UniMainModule.Query.SQL.Clear;
      UniMainModule.Query.SQL.Add(consulta);
      UniMainModule.Query.Open;
      Intervalo := UniMainModule.Query.FieldByName('frecuencia').AsString;

      Medico.Text := UniMainModule.Query.Fields[6].AsString;
      // := Query.FieldByName('Especialidad').AsString;

      { Consulta := 'select * from TipoConsulta where Codigo=''' + CodigoConsulta.Text + '''';
        Query.SQL.Clear;
        Query.SQL.Add(Consulta);
        Query.Open;

        TipoConsulta.Text := Query.FieldByName('Descripcion').AsString; }

      consulta := 'select * from Usuarios where AfCodigo=''' +
        IdentificacionA.Text + '''';
      UniMainModule.Query.SQL.Clear;
      UniMainModule.Query.SQL.Add(consulta);
      UniMainModule.Query.Open;

      if not(UniMainModule.Query.IsEmpty) then
      begin
        IdentificacionA.Text := UniMainModule.Query.FieldByName
          ('AfCodigo').AsString;
        ATAfiliado.Text := UniMainModule.Query.FieldByName
          ('TIPAFILIADO').AsString;
        FechaN.Text := UniMainModule.Query.FieldByName
          ('FECHA_NACIMIENTO').AsString;
        NombreC.Text := UniMainModule.Query.FieldByName
          ('NombreCompleto').AsString;
        CEPS.Text := UniMainModule.Query.FieldByName('CODEPS').AsString;
        Telefono.Text := UniMainModule.Query.FieldByName('TELEFONO').AsString;
        DireccionU.Text := UniMainModule.Query.FieldByName('direccion')
          .AsString;
        email.Text := UniMainModule.Query.FieldByName('correoe').AsString;
        educativo.Text := UniMainModule.Query.FieldByName
          ('nivelescolar').AsString;
        etnia.Text := UniMainModule.Query.FieldByName('etnia').AsString;
        poblacion.Text := UniMainModule.Query.FieldByName('poblacion').AsString;

      end;

      consulta := 'select numeroc from CONTRATOSIN where entidad=''' + CEPS.Text
        + ''' and citas=''1'' ';
      UniMainModule.Query.SQL.Clear;
      UniMainModule.Query.SQL.Add(consulta);
      UniMainModule.Query.Open;
      Contrato.Text := UniMainModule.Query.FieldByName('numeroc').AsString;

      consulta := 'select * from DXRIPS  where rips=' + NumeroCita.Text + '';
      UniMainModule.Query.SQL.Clear;
      UniMainModule.Query.SQL.Add(consulta);
      UniMainModule.Query.Open;
      DatosIngreso.Text := UniMainModule.Query.FieldByName
        ('CondicionEntrada').AsString;

      // PaginadeCitas.activepageindex := 1;
      UniMainModule.QueryGrid.SQL.Clear;
      UniMainModule.QueryGrid.SQL.Add
        ('select c.autonumerico, c.codigo, c.Servicio, c.Fecha, c.cantidad, CONVERT(VARCHAR(5), c.hora, 108) as hora, e.especialidad '
        + ' from CitasServicios as c inner join citas ci on ci.consecutivo=c.rips inner join especialidad e on e.codigo=ci.tipoconsulta where c.rips=:Rips order by c.fecha desc');
      UniMainModule.QueryGrid.Params.ParamByName('Rips').Value :=
        NumeroCita.Text;
      UniMainModule.QueryGrid.Open();

    end
    else
      ShowMessage('Verifique no Encontrado....');
  end;
end;

function TcitasF.rutaReporte: string;
begin
  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Add('select * from entidades where codigoe=''1'' ');
  UniMainModule.Query.Open();
  if not UniMainModule.Query.IsEmpty then
  begin
    Result := UniMainModule.Query.FieldByName('reporte').AsString;
  end;
end;

procedure TcitasF.cerrarConsultas;
begin
  UniMainModule.Query.Close;
  UniMainModule.QueryAgenda.Close;
  UniMainModule.QueryGrid.Close;
end;

function TcitasF.contadorCitas(med, fec: string): boolean;
var
  conm, citasm, citast, cont: Integer;
  Hora1, Hora2: TTime;
begin
  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Text :=
    'select CONVERT(VARCHAR(5), HoraI1, 108) AS horai1, CONVERT(VARCHAR(5), Horaf1, 108) AS horaf1, turnos1, turnos2 from horariom where fecha=:Fecha and medico=:Medico ';
  UniMainModule.Query.ParamByName('Fecha').Value := fec;
  UniMainModule.Query.ParamByName('Medico').Value := med;
  UniMainModule.Query.Open;
  if not UniMainModule.Query.IsEmpty then
  begin
    Hora1 := UniMainModule.Query.FieldByName('horaI1').asdatetime;
    Hora2 := UniMainModule.Query.FieldByName('horaF1').asdatetime;
    if (Hora1 >= StrToTime('06:00')) and (Hora2 <= StrToTime('12:00')) then
    begin
      conm := UniMainModule.Query.FieldByName('turnos1').AsInteger;
      UniMainModule.Query.SQL.Text :=
        'SELECT * FROM citas WHERE DATEPART(HOUR, HoraCitaX) BETWEEN ''6'' and ''12'' and medico=:Medico and fechacita=:Fecha';
      UniMainModule.Query.ParamByName('Fecha').Value := fec;
      UniMainModule.Query.ParamByName('Medico').Value := med;
      UniMainModule.Query.Open;
      citasm := UniMainModule.Query.RecordCount;
      if conm <= citasm then
        Result := true;
    end
    else
    begin
      cont := UniMainModule.Query.FieldByName('turnos2').AsInteger;
      UniMainModule.Query.SQL.Text :=
        'SELECT * FROM citas where DATEPART(HOUR, HoraCitaX) BETWEEN ''12'' and ''18'' and medico=:Medico and fechacita=:Fecha';
      UniMainModule.Query.ParamByName('Fecha').Value := fec;
      UniMainModule.Query.ParamByName('Medico').Value := med;
      UniMainModule.Query.Open;
      citast := UniMainModule.Query.RecordCount;
      if cont <= citast then
        Result := true;
    end
  end;

end;

procedure TcitasF.FiltrarKeyPress(Sender: TObject; var Key: Char);
var
  cadena: string;
begin
  UniMainModule.Query.Close;
  UniMainModule.Query.SQL.Clear;
  cadena := 'select c.id, c.nombrec, c.tipidafil, c.afcodigo, c.sexo, c.telefono, c.direccion, c.estado, c.fechaSolicitud, c.idapi, c.fechaCita,'
    + ' convert(varchar(5), c.horacita, 108) as hora ,m.Nombre as medico, e.Nombre as eps, c.descripcion from citasweb c, epssi e, medicos m'
    + ' where c.medico=m.Codigo and c.codeps=e.codigoEps and  c.fechaCita between '''
    + FormatDateTime('yyyymmdd', FechaIncial.DateTime) + ''' and ''' +
    FormatDateTime('yyyymmdd', fechaFinal.DateTime) +
    ''' and c.afcodigo+c.nombrec like ''%' + Filtrar.Text + '%''';
  UniMainModule.Query.SQL.Add(cadena);
  UniMainModule.Query.Open();
end;

procedure TcitasF.HoraAsignacionChange(Sender: TObject);
begin
  if (IdentificacionA.Text = '') then
  begin
    ShowMessage('Debe seleccionar un Paciente');
    exit;
  end;
  if (Medico.Text = '') then
  begin
    ShowMessage('Debe seleccionar un Medico');
    exit;
  end;
  if (fechaAsignacion.Text = '') then
  begin
    ShowMessage('Debe seleccionar una fecha de asignaci�n');
    exit;
  end;

  if not verificarHora(CodigoMedico, fechaAsignacion.Text, HoraAsignacion.Text)
  then
  begin
    ShowMessage('Esta Hora ya se encuentra asignada');
    uiGuardar.Enabled := false;
    exit;
  end
  else
  begin
    uiGuardar.Enabled := true;
  end;

end;

procedure TcitasF.IdentificacionAKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (IdentificacionA.Text <> '') then
  begin
    UniMainModule.Query.SQL.Clear;
    UniMainModule.Query.SQL.Add('Select * from usuarios where afcodigo=''' +
      IdentificacionA.Text + '''');
    UniMainModule.Query.Open;
    if UniMainModule.Query.IsEmpty then
    begin
      UniMainModule.i := 200;
      MessageDlg('No se encuentra el paciente. �Desea crearlo?', mtConfirmation,
        mbYesNoCancel,
        procedure(Sender: TComponent; Ans: Integer)
        begin
          if Ans = mrYes then
          begin
            Pacientes.pacientesf.IdentificacionA.Text := IdentificacionA.Text;
            Pacientes.pacientesf.ShowModal(ShowCallback);
          end;
        end);
      Abort;
    end
    else
    begin
      NombreC.Text := UniMainModule.Query.FieldByName('nombrecompleto')
        .AsString;
      ATAfiliado.Text := UniMainModule.Query.FieldByName('Tipafiliado')
        .AsString;
      FechaN.Text := UniMainModule.Query.FieldByName
        ('fecha_nacimiento').AsString;
      Telefono.Text := UniMainModule.Query.FieldByName('telefono').AsString;
      DireccionU.Text := UniMainModule.Query.FieldByName('direccion').AsString;
      email.Text := UniMainModule.Query.FieldByName('correoe').AsString;
      CEPS.Text := UniMainModule.Query.FieldByName('codeps').AsString;
      educativo.Text := UniMainModule.Query.FieldByName('nivelescolar')
        .AsString;
      etnia.Text := UniMainModule.Query.FieldByName('etnia').AsString;
      poblacion.Text := UniMainModule.Query.FieldByName('poblacion').AsString;
    end;
  end;
end;

procedure TcitasF.ShowCallback(Sender: TComponent; Asresult: Integer);

begin

  if not(UniMainModule.Query.IsEmpty) and (UniMainModule.i = 0) then
  begin
    IdentificacionA.Text := (UniMainModule.Query.FieldByName('Codigo')
      .AsString);
    NombreC.Text := UniMainModule.Query.FieldByName('descripcion').AsString;
    ATAfiliado.Text := UniMainModule.Query.FieldByName('Tipafiliado').AsString;
    FechaN.Text := UniMainModule.Query.FieldByName('fecha_nacimiento').AsString;
    Telefono.Text := UniMainModule.Query.FieldByName('telefono').AsString;
    DireccionU.Text := UniMainModule.Query.FieldByName('direccion').AsString;
    email.Text := UniMainModule.Query.FieldByName('correoe').AsString;
    CEPS.Text := UniMainModule.Query.FieldByName('codeps').AsString;
    educativo.Text := UniMainModule.Query.FieldByName('nivelescolar').AsString;
    etnia.Text := UniMainModule.Query.FieldByName('etnia').AsString;
    poblacion.Text := UniMainModule.Query.FieldByName('poblacion').AsString;
    citaPacienteF.paciente := IdentificacionA.Text;
    citaPacienteF.ShowModal();
    UniMainModule.i := 10;
    busquedaf.ShowModal(ShowCallback);
  end;

  if not(UniMainModule.Query.IsEmpty) and (UniMainModule.i = 25) then
  begin
    Medico.Text := (UniMainModule.Query.FieldByName('Descripcion').AsString);
    CodigoMedico := (UniMainModule.Query.FieldByName('Codigo').AsString);
    UniMainModule.TipoC := (UniMainModule.Query.FieldByName('Servicios')
      .AsString);
    Intervalo := (UniMainModule.Query.FieldByName('frecuencia').AsString);
    UniMainModule.TipoC := UniMainModule.Query.FieldByName
      ('especialidad').AsString;

  end;

  if not(UniMainModule.Query.IsEmpty) and (UniMainModule.i = 1) then
  begin
    codigoConsulta.Text := (UniMainModule.Query.FieldByName('Codigo').AsString);
    TipoConsulta.Text := (UniMainModule.Query.FieldByName('Descripcion')
      .AsString);
  end;

  if not(UniMainModule.Query.IsEmpty) and (UniMainModule.i = 2) then
  begin
    codigoM.Text := (UniMainModule.Query.FieldByName('Codigo').AsString);
    CMedico.Text := (UniMainModule.Query.FieldByName('Codigo').AsString);
    NMedico.Text := (UniMainModule.Query.FieldByName('Descripcion').AsString);

    IDMedico.Text := (UniMainModule.Query.FieldByName('IDentificacion')
      .AsString);
    NombreM.Text := (UniMainModule.Query.FieldByName('Descripcion').AsString);
    DireccionM.Text := (UniMainModule.Query.FieldByName('direccion').AsString);
    RM.Text := (UniMainModule.Query.FieldByName('rm').AsString);
    UsuarioM.Text := (UniMainModule.Query.FieldByName('usuario').AsString);
    ClaveM.Text := (UniMainModule.Query.FieldByName('clave').AsString);
    MAgenda.Text := UniMainModule.Query.FieldByName('Agenda').AsString;
    IntervaloM.Text := UniMainModule.Query.FieldByName('frecuencia').AsString;
    Estado := UniMainModule.Query.FieldByName('web').AsString;
  end;

  if not(UniMainModule.Query.IsEmpty) and (UniMainModule.i = 10) then
  begin
    dcprincipal.Text := (UniMainModule.Query.FieldByName('descripcion')
      .AsString);
    DXP.Text := (UniMainModule.Query.FieldByName('codigo').AsString);
  end;

  if not(UniMainModule.Query.IsEmpty) and (UniMainModule.i = 16) then
  begin
    Contrato.Text := (UniMainModule.Query.FieldByName('descripcion').AsString);
  end;

  if UniMainModule.i = 100 then
  begin
    UniMainModule.QueryAgenda.SQL.Clear;
    UniMainModule.QueryAgenda.SQL.Add('DELETE FROM AgendaTemp WHERE CITADOR='''
      + UniMainModule.citador + '''');
    UniMainModule.QueryAgenda.ExecSQL;
  end;

  if not(UniMainModule.Query.IsEmpty) and (UniMainModule.i = 200) then
  begin
    IdentificacionA.Text := (UniMainModule.Query.FieldByName('Codigo')
      .AsString);
    NombreC.Text := UniMainModule.Query.FieldByName('nombrecompleto').AsString;
    ATAfiliado.Text := UniMainModule.Query.FieldByName('TipCotizante').AsString;
    FechaN.Text := UniMainModule.Query.FieldByName('fecha_nacimiento').AsString;
    Telefono.Text := UniMainModule.Query.FieldByName('telefono').AsString;
    DireccionU.Text := UniMainModule.Query.FieldByName('direccion').AsString;
    email.Text := UniMainModule.Query.FieldByName('correoe').AsString;
    CEPS.Text := UniMainModule.Query.FieldByName('codeps').AsString;
    educativo.Text := UniMainModule.Query.FieldByName('nivelescolar').AsString;
    etnia.Text := UniMainModule.Query.FieldByName('etnia').AsString;
    poblacion.Text := UniMainModule.Query.FieldByName('poblacion').AsString;
    citaPacienteF.paciente := IdentificacionA.Text;
  end;
end;

procedure TcitasF.TipoConsultaDblClick(Sender: TObject);
begin
  if Medico.Text = '' then
    ShowMessage('Debe seleccionar un Medico / Prestador')
  else
  begin
    UniMainModule.i := 1;
    busquedaf.ShowModal(ShowCallback);
  end;
end;

procedure TcitasF.TurnosMWKeyPress(Sender: TObject; var Key: Char);
begin
  if Estado = '' then
  begin
    ShowMessage('Est� Medico no esta sincronizado en la Web');
  end;
end;

procedure TcitasF.ubAsignarHorasClick(Sender: TObject);
var
  horaix, horafx, consulta: string;
begin

  UniMainModule.Query.SQL.Clear;
  consulta := 'select *  from asignacionhorasweb where medico=''' + codigoM.Text
    + ''' and fecha=''' + FormatDateTime('yyyymmdd', Calendar1.Date) +
    ''' and estado=''1'' ';
  UniMainModule.Query.SQL.Add(consulta);
  UniMainModule.Query.Open();
  if UniMainModule.Query.RecordCount > 0 then
  begin
    ShowMessage('El Medico ya tiene horas asignadas a la Web');
  end
  else
  begin
    UniMainModule.i := 101;
    HorasAsignada.X := 0;
    HorasAsignada.fechaAsignacion := Calendar1.Date;
    HorasAsignada.CodigoMedico := codigoM.Text;

    // Fprincipal.TipoC := '';
    UniMainModule.Query.Close;

    UniMainModule.Query.SQL.Clear;
    UniMainModule.Query.SQL.Add('select * from HorarioM where medico=''' +
      codigoM.Text + ''' and Fecha=''' + FormatDateTime('yyyymmdd',
      Calendar1.Date) + ''' ');
    UniMainModule.Query.Open;

    if (UniMainModule.Query.IsEmpty) then
    begin
      ShowMessage('Este Medico no Tiene Agenda Para  esta fecha.......');
      exit;
    end;

    // PaginadeCitas.activepageindex := 1;
    // cantidad_servicios.IntValue := 1;
    HorasAsignada.TurnosM := StrToInt(TurnosMW.Text);
    HorasAsignada.TurnosT := StrToInt(TurnosMW.Text);
    horaix := FormatDateTime('hh:mm', UniMainModule.Query.FieldByName('horaI1')
      .asdatetime);
    horafx := FormatDateTime('hh:mm', UniMainModule.Query.FieldByName('horaF2')
      .asdatetime);

    if UniMainModule.Query.FieldByName('turnos1').AsInteger = 0 then
    begin
      horaix := FormatDateTime('hh:mm',
        UniMainModule.Query.FieldByName('horaI2').asdatetime);
    end;

    if UniMainModule.Query.FieldByName('turnos2').AsInteger = 0 then
    begin
      horafx := FormatDateTime('hh:mm',
        UniMainModule.Query.FieldByName('horaF1').asdatetime);
    end;

    if (codigoM.Text = '') then
    begin
      ShowMessage('Falta  Medico.. Verifique.....');
      exit
    end;

    UniMainModule.Query.SQL.Clear;
    UniMainModule.Query.SQL.Add('Delete From agendatemp where medico =''' +
      codigoM.Text + '''');
    UniMainModule.Query.ExecSQL;

    UniMainModule.Query.SQL.Clear; // FormatDateTime('hh:mm',horaix)
    UniMainModule.Query.SQL.Add
      ('DECLARE @fIni time(0),@fFin time(0), @d tinyint SET @fIni = ''' + horaix
      + ''' SET @fFin = ''' + horafx + ''' SET @d = 0 ' +
      'WHILE @fIni <= @fFin BEGIN INSERT INTO agendatemp(Hora,Fecha,Citador,medico) VALUES(@fIni,'''
      + FormatDateTime('yyyymmdd', Calendar1.Date) + ''',''' +
      UniMainModule.citador + ''',''' + codigoM.Text +
      ''') SET @fIni =   DATEADD(n,' + IntervaloM.Text + ', @fIni)END');

    UniMainModule.Query.ExecSQL;

    UniMainModule.Query.SQL.Clear;
    UniMainModule.Query.SQL.Add
      ('insert into AgendaTemp(Fecha, Hora, Paciente,Nombre,Medico,citador,EstadoT,TurnoT) select FechaCita, HoraCitaX, Paciente, '
      + 'NombreCompleto, Medico,''' + UniMainModule.citador +
      ''', Asistio, Turno from Citas,usuarios where  FechaCita= ''' +
      FormatDateTime('yyyymmdd', Calendar1.Date) + ''' and Medico =''' +
      codigoM.Text + ''' and afcodigo=paciente ');
    UniMainModule.Query.ExecSQL;

    UniMainModule.Query.SQL.Clear;
    UniMainModule.Query.SQL.Add
      ('DELETE FROM AgendaTemp WHERE idx IN (SELECT idx FROM AgendaTemp main WHERE idx < (SELECT min(idx) FROM AgendaTemp WHERE idx <> main.idx '
      + 'AND Hora = main.Hora))');
    UniMainModule.Query.ExecSQL;

    UniMainModule.QueryAgenda.SQL.Clear;
    UniMainModule.QueryAgenda.SQL.Add
      ('select CONVERT(VARCHAR(5), hora, 108) AS hora, Paciente,Nombre, web, case EstadoT when 1 then ''No Asistio'' when 2 then ''Cancelado'' when '
      + '3 then ''Dilatando'' when 4 then ''En Espera'' when 5 then ''Atendido'' end EstadoT,TurnoT,idx,Fecha,medico from agendatemp where Fecha ='''
      + FormatDateTime('yyyymmdd', Calendar1.Date) + ''' and medico =''' +
      codigoM.Text + ''' order by CONVERT(VARCHAR(6), hora, 108)');
    UniMainModule.QueryAgenda.Open;
    HorasAsignada.ShowModal(ShowCallback);
  end;

end;

procedure TcitasF.ubBuscarCodigoClick(Sender: TObject);
begin
  if Medico.Text = '' then
    ShowMessage('Debe seleccionar un Medico / Prestador')
  else
  begin
    UniMainModule.i := 1;
    busquedaf.ShowModal(ShowCallback);
  end;
end;

procedure TcitasF.ubBuscarDiagnosticoClick(Sender: TObject);
begin
  UniMainModule.i := 10;
  busquedaf.ShowModal(ShowCallback);
end;

procedure TcitasF.uiBuscarContratoClick(Sender: TObject);
begin
  if IdentificacionA.Text = '' then
    ShowMessage('Debe seleccionar un Paciente')
  else
  begin
    UniMainModule.i := 16;
    busquedaf.Busqueda.Text := CEPS.Text;
    busquedaf.ShowModal(ShowCallback);
  end;
end;

procedure TcitasF.uiBuscarMedicoClick(Sender: TObject);

begin
  UniMainModule.i := 25;
  busquedaf.tipopres := tipoCita.ItemIndex.ToString;
  busquedaf.ShowModal(ShowCallback);
end;

procedure TcitasF.uiCrearPClick(Sender: TObject);
begin
  pacientesf.Show();
end;

procedure TcitasF.uiGuardarClick(Sender: TObject);
var
  consulta, rip, numeroC: string;
begin
  if (IdentificacionA.Text = '') then
  begin
    ShowMessage('Debe seleccionar un Paciente');
    exit;
  end;

  if (Contrato.Text = '') then
  begin
    ShowMessage('Debe seleccionar un Contrato');
    exit;
  end;

  if (Medico.Text = '') then
  begin
    ShowMessage('Debe seleccionar un Medico');
    exit;
  end;
  if (codigoConsulta.Text = '') then
  begin
    ShowMessage('Debe seleccionar un tipo de consulta');
    exit;
  end;
  if (cantidad_servicios.Text = '') then
  begin
    ShowMessage('Debe Ingresar una cantidad');
    exit;
  end;

  if (StrToInt(cantidad_servicios.Text) <= 0) then
  begin
    ShowMessage('Cantidad no permitida');
  end;

  if (DXP.Text = '') then
  begin
    ShowMessage('Debe seleccionar un Diagnostico');
    exit;
  end;

  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Add('select * from HorarioM where medico=''' +
    CodigoMedico + ''' and Fecha=''' + FormatDateTime('yyyymmdd',
    fechaAsignacion.DateTime) + ''' ');
  UniMainModule.Query.Open;

  if (UniMainModule.Query.IsEmpty) then
  begin
    ShowMessage('Este Medico no Tiene Agenda Para  esta fecha.......');
    exit;
  end;

  if NumeroCita.Text = '0' then
  begin
    if not verificarHora(CodigoMedico, fechaAsignacion.Text, HoraAsignacion.Text)
    then
    begin
      ShowMessage('Esta Hora ya se encuentra asignada');
      exit;
    end;

    if contadorCitas(CodigoMedico, fechaAsignacion.Text) then
    begin
      ShowMessage
        ('Ha llegado al total de citas agendadas para el medico y fecha seleccionada');
      exit;
    end
    else
    begin

    end;
    UniMainModule.FDConnection.StartTransaction;
    try
      // Actualizar
      UniMainModule.Query.SQL.Clear;
      consulta :=
        'UPDATE usuarios SET  telefono=:Telefono, direccion=:Direccion, correoe=:Correo, nivelescolar=:Niv, etnia=:Etnia, poblacion=:Poblacion'
        + ' WHERE afcodigo=:Afcodigo ';
      UniMainModule.Query.SQL.Text := consulta;
      UniMainModule.Query.Params.ParamByName('NiV').Value := educativo.Text;
      UniMainModule.Query.Params.ParamByName('Telefono').Value := Telefono.Text;
      UniMainModule.Query.Params.ParamByName('Direccion').Value :=
        DireccionU.Text;
      UniMainModule.Query.Params.ParamByName('Correo').Value := email.Text;
      UniMainModule.Query.Params.ParamByName('Etnia').Value := etnia.Text;
      UniMainModule.Query.Params.ParamByName('Poblacion').Value :=
        poblacion.Text;
      UniMainModule.Query.Params.ParamByName('Afcodigo').Value :=
        IdentificacionA.Text;
      UniMainModule.Query.ExecSQL;

      // Obtener maximo rips de la tabla ripsg
      UniMainModule.Query.SQL.Clear;
      UniMainModule.Query.SQL.Add('select MAX(rips)+1  as rips from RipsG');
      UniMainModule.Query.Open();
      rip := UniMainModule.Query.FieldByName('rips').AsString;

      // Contrato
      numeroC := Contrato.Text;

      // Registrar Datos en RIPSG
      UniMainModule.Query.SQL.Clear;
      consulta :=
        'INSERT INTO ripsg (rips, identificacion, eps, fechar, usuario, ripsestado, tiporips, dependencia, contratoe, autorizacion)'
        + 'VALUES (:Rips, :Identificacion, :Eps, :FechaR, :Usuario, :RipsEstado, :Tipo, :Dependencia, :Contrato, :Autorizacion) ';
      UniMainModule.Query.SQL.Text := consulta;
      UniMainModule.Query.Params.ParamByName('Rips').Value := rip;
      UniMainModule.Query.Params.ParamByName('Identificacion').Value :=
        IdentificacionA.Text;
      UniMainModule.Query.Params.ParamByName('Eps').Value := CEPS.Text;
      UniMainModule.Query.Params.ParamByName('FechaR').Value := Now;
      UniMainModule.Query.Params.ParamByName('Usuario').Value := '1';
      UniMainModule.Query.Params.ParamByName('RipsEstado').Value := '0';
      UniMainModule.Query.Params.ParamByName('Tipo').Value := 'EVENTO';
      UniMainModule.Query.Params.ParamByName('Dependencia').Value := '0001';
      UniMainModule.Query.Params.ParamByName('Contrato').Value := numeroC;
      UniMainModule.Query.Params.ParamByName('Autorizacion').Value :=
        Autorizacion.Text;
      UniMainModule.Query.ExecSQL;

      // Insertar en DXRIPS
      UniMainModule.Query.SQL.Clear;
      consulta :=
        'INSERT INTO dxrips (rips, dxp, fechai, horai, autorizacion, servicio, centrocosto, medicorecibe)'
        + 'VALUES (:Rips, :Dxp, :Fecha, :Hora, :Autorizacion, :Servicio, :Centro, :Medico) ';
      UniMainModule.Query.SQL.Text := consulta;
      UniMainModule.Query.Params.ParamByName('Rips').Value := rip;
      UniMainModule.Query.Params.ParamByName('Dxp').Value := DXP.Text;
      UniMainModule.Query.Params.ParamByName('Fecha').Value :=
        StrToDate(fechaAsignacion.Text);
      UniMainModule.Query.Params.ParamByName('Hora').Value :=
        StrToTime(HoraAsignacion.Text);
      UniMainModule.Query.Params.ParamByName('Autorizacion').Value :=
        Autorizacion.Text;
      UniMainModule.Query.Params.ParamByName('Servicio').Value :=
        'Consulta Externa';
      UniMainModule.Query.Params.ParamByName('Medico').Value := Medico.Text;
      UniMainModule.Query.Params.ParamByName('Centro').Value := '0001';
      UniMainModule.Query.ExecSQL;

      // Insertar en Citas
      UniMainModule.Query.SQL.Clear;
      consulta :=
        'INSERT INTO citas (paciente, medico, consecutivo, hora, fecha, fechacita, horacita, tipoconsulta, horacitax, autorizacionc, marcar, codigoconsulta)'
        + 'VALUES (:Paciente, :Medico, :Consecutivo, :Hora, :Fecha, :FechaCita, :HoraCita, :Tipo, :HoraX, :Autorizacion, :Marcar, :Codigo) ';
      UniMainModule.Query.SQL.Text := consulta;
      UniMainModule.Query.Params.ParamByName('Paciente').Value :=
        IdentificacionA.Text;
      UniMainModule.Query.Params.ParamByName('Medico').Value := CodigoMedico;
      UniMainModule.Query.Params.ParamByName('Consecutivo').Value := rip;
      UniMainModule.Query.Params.ParamByName('Hora').Value :=
        StrToDateTime(HoraAsignacion.Text);
      UniMainModule.Query.Params.ParamByName('Fecha').Value :=
        StrToDate(fecha_deseada.Text);
      UniMainModule.Query.Params.ParamByName('FechaCita').Value :=
        StrToDate(fechaAsignacion.Text);
      UniMainModule.Query.Params.ParamByName('HoraCita').Value :=
        FormatDateTime('hh:mm AM/PM', HoraAsignacion.DateTime);
      UniMainModule.Query.Params.ParamByName('Tipo').Value :=
        UniMainModule.TipoC;
      UniMainModule.Query.Params.ParamByName('HoraX').Value :=
        StrToDateTime(HoraAsignacion.Text);
      UniMainModule.Query.Params.ParamByName('Autorizacion').Value :=
        Autorizacion.Text;
      UniMainModule.Query.Params.ParamByName('Marcar').Value := '1';
      UniMainModule.Query.Params.ParamByName('Codigo').Value :=
        codigoConsulta.Text;
      UniMainModule.Query.ExecSQL;

      // Insertar en Citas Servicios
      UniMainModule.Query.SQL.Clear;
      consulta :=
        'INSERT INTO citasservicios (paciente, medico, hora, fecha, codigo, servicio, cantidad, rips)'
        + 'VALUES (:Paciente, :Medico, :Hora, :Fecha, :Codigo, :Servicio, :Cantidad, :Rips) ';
      UniMainModule.Query.SQL.Text := consulta;
      UniMainModule.Query.Params.ParamByName('Paciente').Value :=
        IdentificacionA.Text;
      UniMainModule.Query.Params.ParamByName('Medico').Value := CodigoMedico;
      UniMainModule.Query.Params.ParamByName('Hora').Value :=
        FormatDateTime('hh:mm AM/PM', HoraAsignacion.DateTime);
      UniMainModule.Query.Params.ParamByName('Fecha').Value :=
        StrToDate(fechaAsignacion.Text);
      UniMainModule.Query.Params.ParamByName('Codigo').Value :=
        codigoConsulta.Text;
      UniMainModule.Query.Params.ParamByName('Servicio').Value :=
        TipoConsulta.Text;
      UniMainModule.Query.Params.ParamByName('Cantidad').Value :=
        cantidad_servicios.Text;
      UniMainModule.Query.Params.ParamByName('Rips').Value := rip;
      UniMainModule.Query.ExecSQL;

      UniMainModule.FDConnection.Commit;
      ShowMessage('Datos Registrados Exitosamente');
      NumeroCita.Text := rip;

      // Mostrar en la grilla
      UniMainModule.QueryGrid.SQL.Clear;
      UniMainModule.QueryGrid.SQL.Add
        ('select c.autonumerico, c.codigo, c.Servicio, c.Fecha, c.cantidad, CONVERT(VARCHAR(5), c.hora, 108) as hora, e.especialidad '
        + ' from CitasServicios as c inner join citas ci on ci.consecutivo=c.rips inner join especialidad e on e.codigo=ci.tipoconsulta where c.rips=:Rips order by c.fecha desc');
      UniMainModule.QueryGrid.Params.ParamByName('Rips').Value := rip;
      UniMainModule.QueryGrid.Open();

      codigoConsulta.Clear;
      TipoConsulta.Clear;
      dcprincipal.Clear;
      cantidad_servicios.Text := '1';
      DXP.Clear;

    except
      UniMainModule.FDConnection.Rollback;
      ShowMessage('Error en las operaciones');

    end;
  end
  else
  begin
    // Insertar en Citas Servicios
    UniMainModule.Query.SQL.Clear;
    consulta :=
      'INSERT INTO citasservicios (paciente, medico, hora, fecha, codigo, servicio, cantidad, rips)'
      + 'VALUES (:Paciente, :Medico, :Hora, :Fecha, :Codigo, :Servicio, :Cantidad, :Rips) ';
    UniMainModule.Query.SQL.Text := consulta;
    UniMainModule.Query.Params.ParamByName('Paciente').Value :=
      IdentificacionA.Text;
    UniMainModule.Query.Params.ParamByName('Medico').Value := CodigoMedico;
    UniMainModule.Query.Params.ParamByName('Hora').Value :=
      StrToDateTime(HoraAsignacion.Text);
    UniMainModule.Query.Params.ParamByName('Fecha').Value :=
      StrToDate(fechaAsignacion.Text);
    UniMainModule.Query.Params.ParamByName('Codigo').Value :=
      codigoConsulta.Text;
    UniMainModule.Query.Params.ParamByName('Servicio').Value :=
      TipoConsulta.Text;
    UniMainModule.Query.Params.ParamByName('Cantidad').Value :=
      cantidad_servicios.Text;
    UniMainModule.Query.Params.ParamByName('Rips').Value := NumeroCita.Text;
    UniMainModule.Query.ExecSQL;

    // Mostrar en la grilla
    UniMainModule.QueryGrid.SQL.Clear;
    UniMainModule.QueryGrid.SQL.Add
      ('select c.autonumerico, c.codigo, c.Servicio, c.Fecha, c.cantidad, CONVERT(VARCHAR(5), c.hora, 108) as hora, e.especialidad '
      + ' from CitasServicios as c inner join citas ci on ci.consecutivo=c.rips inner join especialidad e on e.codigo=ci.tipoconsulta where c.rips=:Rips order by c.fecha desc');
    UniMainModule.QueryGrid.Params.ParamByName('Rips').Value := NumeroCita.Text;
    UniMainModule.QueryGrid.Open();
  end;
end;

procedure TcitasF.uiHorasClick(Sender: TObject);

var
  horaix, horafx: string;
begin
  UniMainModule.i := 100;
  HorasAsignada.X := 0;
  HorasAsignada.fechaAsignacion := Now;
  HorasAsignada.CodigoMedico := '';

  // Fprincipal.TipoC := '';
  UniMainModule.Query.Close;

  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Add('select * from HorarioM where medico=''' +
    CodigoMedico + ''' and Fecha=''' + FormatDateTime('yyyymmdd',
    fechaAsignacion.DateTime) + ''' ');
  UniMainModule.Query.Open;

  if (UniMainModule.Query.IsEmpty) then
  begin
    ShowMessage('Este Medico no Tiene Agenda Para  esta fecha.......');
    exit;
  end;

  // PaginadeCitas.activepageindex := 1;
  // cantidad_servicios.IntValue := 1;

  horaix := FormatDateTime('hh:mm', UniMainModule.Query.FieldByName('horaI1')
    .asdatetime);
  horafx := FormatDateTime('hh:mm', UniMainModule.Query.FieldByName('horaF2')
    .asdatetime);

  if UniMainModule.Query.FieldByName('turnos1').AsInteger = 0 then
  begin
    horaix := FormatDateTime('hh:mm', UniMainModule.Query.FieldByName('horaI2')
      .asdatetime);
  end;

  if UniMainModule.Query.FieldByName('turnos2').AsInteger = 0 then
  begin
    horafx := FormatDateTime('hh:mm', UniMainModule.Query.FieldByName('horaF1')
      .asdatetime);
  end;

  if (CodigoMedico.Length <= 0) then
  begin
    ShowMessage('Falta  Medico.. Verifique.....');
    exit
  end;

  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Add('Delete From agendatemp where medico =''' +
    CodigoMedico + '''');
  UniMainModule.Query.ExecSQL;

  UniMainModule.Query.SQL.Clear; // FormatDateTime('hh:mm',horaix)
  UniMainModule.Query.SQL.Add
    ('DECLARE @fIni time(0),@fFin time(0), @d tinyint SET @fIni = ''' + horaix +
    ''' SET @fFin = ''' + horafx + ''' SET @d = 0 ' +
    'WHILE @fIni <= @fFin BEGIN INSERT INTO agendatemp(Hora,Fecha,Citador,medico) VALUES(@fIni,'''
    + FormatDateTime('yyyymmdd', fechaAsignacion.DateTime) + ''',''' +
    UniMainModule.citador + ''',''' + CodigoMedico +
    ''') SET @fIni =   DATEADD(n,' + Intervalo + ', @fIni)END');

  UniMainModule.Query.ExecSQL;

  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Add
    ('insert into AgendaTemp(Fecha, Hora, Paciente,Nombre,Medico,citador,EstadoT,TurnoT) select FechaCita, HoraCitaX, Paciente, '
    + 'NombreCompleto, Medico,''' + UniMainModule.citador +
    ''', Asistio, Turno from Citas,usuarios where  FechaCita= ''' +
    FormatDateTime('yyyymmdd', fechaAsignacion.DateTime) + ''' and Medico =''' +
    CodigoMedico + ''' and afcodigo=paciente ');
  UniMainModule.Query.ExecSQL;

  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Add
    ('DELETE FROM AgendaTemp WHERE idx IN (SELECT idx FROM AgendaTemp main WHERE idx < (SELECT min(idx) FROM AgendaTemp WHERE idx <> main.idx '
    + 'AND Hora = main.Hora))');
  UniMainModule.Query.ExecSQL;

  UniMainModule.QueryAgenda.SQL.Clear;
  UniMainModule.QueryAgenda.SQL.Add
    ('select CONVERT(VARCHAR(5), hora, 108) AS hora, Paciente,Nombre, web, case EstadoT when 1 then ''No Asistio'' when 2 then ''Cancelado'' when '
    + '3 then ''Dilatando'' when 4 then ''En Espera'' when 5 then ''Atendido'' end EstadoT,TurnoT,idx,Fecha,medico from agendatemp where Fecha ='''
    + FormatDateTime('yyyymmdd', fechaAsignacion.DateTime) + ''' and medico ='''
    + CodigoMedico + ''' order by CONVERT(VARCHAR(6), hora, 108)');
  UniMainModule.QueryAgenda.Open;
  HorasAsignada.ShowModal(ShowCallback);

end;

procedure TcitasF.UniDBGrid2DblClick(Sender: TObject);
begin
  if UniMainModule.Query.FieldByName('estado').IsNull then
  begin
    DetalleCitaForm.ShowModal();
  end
  else
  begin
    ShowMessage
      ('No se puede realizar ninguna operacion sobre el registro seleccionado');
  end;

end;

procedure TcitasF.UniDBGrid4CellClick(Column: TUniDBGridColumn);
begin
  HoraAsignacion.DateTime := UniMainModule.QueryAgenda.FieldByName('hora')
    .asdatetime;
end;

procedure TcitasF.UniFormShow(Sender: TObject);
begin
  lblUsuario.Text := UniMainModule.usuario;
  UniMainModule.Query.SQL.Clear;
  Calendar1.Date := Now();
  fecha_deseada.DateTime := Now();
  fechaAsignacion.DateTime := Now();
  fechaFinal.DateTime := Now();
  Fecha1.DateTime := Now();
  Fecha2.DateTime := Now();
  FechaIncial.DateTime := Now();

  UniMainModule.Query.Close;
  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Add('select descripcion from etnias');
  UniMainModule.Query.Open;
  etnia.Clear;
  while not UniMainModule.Query.Eof do
  begin
    etnia.Items.Add(UniMainModule.Query.FieldByName('descripcion').AsString);
    UniMainModule.Query.Next;
  end;

  UniMainModule.Query.Close;
  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Add('select descripcion from poblacion');
  UniMainModule.Query.Open;
  poblacion.Clear;
  while not UniMainModule.Query.Eof do
  begin
    poblacion.Items.Add(UniMainModule.Query.FieldByName('descripcion')
      .AsString);
    UniMainModule.Query.Next;
  end;

end;

procedure TcitasF.UniSpeedButton2Click(Sender: TObject);
begin
  cerrarConsultas;
  IdentificacionA.Clear;
  NombreC.Clear;
  ATAfiliado.Clear;
  FechaN.Clear;
  CEPS.Clear;
  Telefono.Clear;
  Contrato.Clear;
  DireccionU.Clear;
  email.Clear;
  etnia.Clear;
  poblacion.Clear;
  educativo.Clear;
  Medico.Clear;
  fecha_deseada.DateTime := Now;
  fechaAsignacion.DateTime := Now;
  Autorizacion.Clear;
  autorizada.DateTime := Now;
  ValorModeradora.Clear;
  codigoConsulta.Clear;
  TipoConsulta.Clear;
  cantidad_servicios.Text := '1';
  dcprincipal.Clear;
  DXP.Clear;
  NumeroCita.Text := '0';

end;

procedure TcitasF.UniSpeedButton4Click(Sender: TObject);
var
  form1: TUniForm1;
  ruta: string;
begin
  if PMedico.Text = '' then
  begin
    ShowMessage('Debe seleccionar una opci�n');
    exit;
  end;
  if (PMedico.Text = 'Prestador') then
    if CMedico.Text = '' then
    begin
      ShowMessage('Debe seleccionar un prestador');
      exit;
    end;
  ruta := rutaReporte() + '\CitasMedico.fr3';
  if (PMedico.Text = 'Todos') then
    ruta := rutaReporte() + '\CitasTodas.fr3';
  if (PMedico.Text = 'Asisti�') then
    ruta := rutaReporte() + '\CitasMedicoA.fr3';
  if (PMedico.Text = 'No Asisti�') then
    ruta := rutaReporte() + '\CitasMedicoN.fr3';

  form1 := TUniForm1.Create(UniApplication);
  form1.frxReport1.LoadFromFile(ruta);

  form1.frxReport1.Variables.Variables['Medico'] := '''' + CMedico.Text + '''';
  form1.frxReport1.Variables.Variables['Fecha1'] :=
    '''' + FormatDateTime('yyyy-mm-dd', Fecha1.DateTime) + '''';
  form1.frxReport1.Variables.Variables['Fecha2'] :=
    '''' + FormatDateTime('yyyy-mm-dd', Fecha2.DateTime) + '''';

  form1.frxReport1.Variables.Variables['UsuarioI'] :=
    '''' + lblUsuario.Text + '''';

  exit;
end;

function TcitasF.verificarHora(med, fec, hor: string): boolean;
begin
  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Text :=
    'select * from citas where fechacita=:Fecha and medico=:Medico and horacita=:Hora';
  UniMainModule.Query.ParamByName('Fecha').Value := fec;
  UniMainModule.Query.ParamByName('Medico').Value := med;
  UniMainModule.Query.ParamByName('Hora').Value := FormatDateTime('hh:mm AM/PM',
    HoraAsignacion.DateTime);
  UniMainModule.Query.Open;
  Result := UniMainModule.Query.IsEmpty;
end;

procedure TcitasF.ubBuscarMedicoClick(Sender: TObject);
begin
  UniMainModule.i := 2;
  busquedaf.ShowModal(ShowCallback);
end;

procedure TcitasF.ubCancelarClick(Sender: TObject);
begin
  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Text :=
    'Select * from citas where paciente=:Paciente and fechacita=:Fecha and horacita=:Hora';
  UniMainModule.Query.ParamByName('Paciente').Value := IdentificacionA.Text;
  UniMainModule.Query.ParamByName('Fecha').Value :=
    FormatDateTime('yyyymmdd', fechaAsignacion.DateTime);
  UniMainModule.Query.ParamByName('Hora').Value := FormatDateTime('hh:mm AM/PM',
    HoraAsignacion.DateTime);
  UniMainModule.Query.Open;
  // ShowMessage(Consulta);
  If (UniMainModule.Query.IsEmpty) Then
    ShowMessage('Cita No Encontrada.....')
  else
  begin

    MessageDlg('�Est� seguro que desea cancelar la cita seleccionada?',
      mtConfirmation, mbYesNoCancel,
      procedure(Sender: TComponent; Ans: Integer)
      begin
        if Ans = mrYes then
        begin
          UniMainModule.Query.SQL.Clear;
          UniMainModule.Query.SQL.Add
            ('Update Citas set Asistio=2 where Consecutivo = ' + NumeroCita.Text
            + '; ' + 'Update ripsg set RipsEstado = 2,Autorizacion='''' where rips = '
            + NumeroCita.Text);
          UniMainModule.Query.ExecSQL;
          ShowMessage('Datos Actualizados exitosamente');
        end;
      end);
    Abort;

  end

end;

procedure TcitasF.ubConsultarClick(Sender: TObject);
var
  doc, obj: TJSONObject;
  i: Integer;
  JSON: string;
  ClientItem: TJSONValue;
  ClientList: TJSONArray;
  nombre, cadena: string;
begin
  RESTRequest1.Params[0].Value :=
    (FormatDateTime('yyyy-mm-dd', FechaIncial.DateTime));
  RESTRequest1.Params[1].Value :=
    (FormatDateTime('yyyy-mm-dd', fechaFinal.DateTime));
  RESTRequest1.Execute;
  if RESTResponse1.StatusCode = 200 then
  begin
    JSON := RESTResponse1.JSONText;
    ClientList := TJSONObject.ParseJSONValue(JSON) as TJSONArray;
    if Assigned(ClientList) then
      try
        try
          for ClientItem in ClientList do
          begin
            nombre := ClientItem.GetValue<string>('afape1') + ' ' +
              ClientItem.GetValue<string>('afape2') + ' ' +
              ClientItem.GetValue<string>('afnom1') + ' ' +
              ClientItem.GetValue<string>('afnom2');

            UniMainModule.QueryAgenda.Close;
            UniMainModule.QueryAgenda.SQL.Clear;
            UniMainModule.QueryAgenda.SQL.Text :=
              'SELECT id FROM citasweb where idapi=:Id';
            UniMainModule.QueryAgenda.ParamByName('Id').Value :=
              ClientItem.GetValue<string>('id');
            UniMainModule.QueryAgenda.Open();
            if UniMainModule.QueryAgenda.IsEmpty then
            begin
              UniMainModule.Query.SQL.Clear;
              UniMainModule.Query.SQL.Text :=
                'INSERT INTO citasweb (codeps, tipidafil, afcodigo, afape1, afape2, afnom1, afnom2, nombrec, fecha_nacimiento, sexo, email, telefono, direccion, medico, fechaCita, horaCita, descripcion, idapi, codigo, fechaSolicitud, regimen) VALUES '
                + '(:Codeps, :Tipidafil, :Afcodigo, :Afape1, :Afape2, :Afnom1, :Afnom2, :NombreC, :Fecha, :Sexo, :Email, :Telefono, :Direccion, :Medico,  :FechaCita, :HoraCita, :Descripcion, :IdApi, :Codigo, :FechaSolicitud, :Regimen)';
              UniMainModule.Query.ParamByName('Codeps').Value :=
                ClientItem.GetValue<string>('codeps');
              UniMainModule.Query.ParamByName('Tipidafil').Value :=
                ClientItem.GetValue<string>('tipidafil');
              UniMainModule.Query.ParamByName('Afcodigo').Value :=
                ClientItem.GetValue<string>('afcodigo');
              UniMainModule.Query.ParamByName('Afape1').Value :=
                ClientItem.GetValue<string>('afape1');
              UniMainModule.Query.ParamByName('Afape2').Value :=
                ClientItem.GetValue<string>('afape2');
              UniMainModule.Query.ParamByName('Afnom1').Value :=
                ClientItem.GetValue<string>('afnom1');
              UniMainModule.Query.ParamByName('Afnom2').Value :=
                ClientItem.GetValue<string>('afnom2');
              UniMainModule.Query.ParamByName('NombreC').Value := nombre;
              UniMainModule.Query.ParamByName('Fecha').Value :=
                ClientItem.GetValue<string>('fecha_nacimiento');
              UniMainModule.Query.ParamByName('Sexo').Value :=
                ClientItem.GetValue<string>('sexo');
              UniMainModule.Query.ParamByName('Email').Value :=
                ClientItem.GetValue<string>('email');
              UniMainModule.Query.ParamByName('Telefono').Value :=
                ClientItem.GetValue<string>('telefono');
              UniMainModule.Query.ParamByName('Direccion').Value :=
                ClientItem.GetValue<string>('direccion');
              UniMainModule.Query.ParamByName('Medico').Value :=
                ClientItem.GetValue<string>('medico_id');
              UniMainModule.Query.ParamByName('FechaCita').Value :=
                ClientItem.GetValue<string>('fechaCita');
              UniMainModule.Query.ParamByName('HoraCita').Value :=
                ClientItem.GetValue<string>('horaCita');
              UniMainModule.Query.ParamByName('Descripcion').Value :=
                ClientItem.GetValue<string>('descripcion');
              UniMainModule.Query.ParamByName('IdApi').Value :=
                ClientItem.GetValue<string>('id');
              UniMainModule.Query.ParamByName('Codigo').Value :=
                ClientItem.GetValue<string>('codigo');
              UniMainModule.Query.ParamByName('FechaSolicitud').Value :=
                ClientItem.GetValue<string>('fecha');
              UniMainModule.Query.ParamByName('Regimen').Value :=
                ClientItem.GetValue<string>('regimen');
              UniMainModule.Query.ExecSQL;
            end;
          end;
        finally

        end;
      finally
        ClientList.Free;
        UniMainModule.QueryWeb.SQL.Clear;
        cadena := 'select c.codeps, c.id, c.codigo as codconsulta, c.afape1, c.afape2, c.afnom1, c.afnom2, c.nombrec, c.tipidafil, c.afcodigo, c.sexo, c.telefono, c.email, c.fecha_nacimiento,  c.direccion, c.idapi, c.fechaCita, c.fechaSolicitud,'
          + ' convert(varchar(5), c.horacita, 108) as hora ,m.Nombre as medico, m.codigo as codmedico, e.Nombre as eps, c.descripcion, c.estado from citasweb c, epssi e, medicos m'
          + ' where c.medico=m.Codigo and c.codeps=e.codigoEps and  c.fechaCita between '''
          + FormatDateTime('yyyymmdd', FechaIncial.DateTime) + ''' and ''' +
          FormatDateTime('yyyymmdd', fechaFinal.DateTime) + ''' ';
        UniMainModule.QueryWeb.SQL.Add(cadena);
        UniMainModule.QueryWeb.Open();

      end;
  end;
end;

procedure TcitasF.ubCrearClick(Sender: TObject);
var
  consulta: string;
begin
  /// ////

  if (codigoM.Text <> '') then
  begin
    UniMainModule.Query.SQL.Clear;
    consulta := 'select * from HorarioM where medico=''' + codigoM.Text +
      ''' and Fecha=''' + FormatDateTime('yyyymmdd', Calendar1.Date) + ''' ';

    UniMainModule.Query.SQL.Add(consulta);
    UniMainModule.Query.Open;

    if (UniMainModule.Query.IsEmpty) then
    begin
      if Turnos.Text = '' then
      begin
        ShowMessage('Turnos en la ma�ana esta vacio');
        exit;
      end;
      if TurnosT2.Text = '' then
      begin
        ShowMessage('Turnos en la tarde esta vacio');
        exit;
      end;
      if StrToInt(TurnosMW.Text) > StrToInt(Turnos.Text) then
      begin
        ShowMessage
          ('Los turnos web en la jornada ma�ana es mayor a los turnos presenciales');
        exit;
      end;
      if StrToInt(TurnosTW.Text) > StrToInt(TurnosT2.Text) then
      begin
        ShowMessage
          ('Los turnos web en la jornada tarde es mayor a los turnos presenciales');
        exit;
      end;
      consulta :=
        'insert into HorarioM( Medico, Fecha, HoraI1, HoraF1, HoraI2, HoraF2, Turnos1, Turnos2, webm, webt) values('''
        + codigoM.Text + ''',''' + FormatDateTime('yyyymmdd', Calendar1.Date) +
        ''',''' + FormatDateTime('hh:mm', HoraI.DateTime) + ''',''' +
        FormatDateTime('hh:mm', HoraF.DateTime) + ''',''' +
        FormatDateTime('hh:mm', HoraT1.DateTime) + ''',''' +
        FormatDateTime('hh:mm', HoraT2.DateTime) + ''',''' + Turnos.Text +
        ''',''' + TurnosT2.Text + ''', ''' + TurnosMW.Text + ''', ''' +
        TurnosTW.Text + ''')';

      UniMainModule.Query.SQL.Clear;
      UniMainModule.Query.SQL.Add(consulta);
      UniMainModule.Query.ExecSQL;
      ShowMessage('Registro Guardado...ok');
    end
    else
    begin
      MessageDlg('� Este Turno Ya existe Desea Modificarlo?', mtConfirmation,
        mbYesNoCancel,
        procedure(Sender: TComponent; Ans: Integer)
        begin
          if Ans = mrYes then
          begin
            consulta := 'Update HorarioM set HoraI1=''' +
              FormatDateTime('hh:mm', HoraI.DateTime) + ''',HoraF1=''' +
              FormatDateTime('hh:mm', HoraF.DateTime) + ''',HoraI2=''' +
              FormatDateTime('hh:mm', HoraT1.DateTime) + ''',HoraF2=''' +
              FormatDateTime('hh:mm', HoraT2.DateTime) + ''',Turnos1=''' +
              Turnos.Text + ''',Turnos2=''' + TurnosT2.Text + ''', webm=''' +
              TurnosMW.Text + ''',webt=''' + TurnosTW.Text +
              '''  where medico=''' + codigoM.Text + ''' and  Fecha=''' +
              FormatDateTime('yyyymmdd', Calendar1.Date) + ''' ';
            ShowMessage(consulta);
            UniMainModule.Query.SQL.Clear;
            UniMainModule.Query.SQL.Add(consulta);
            UniMainModule.Query.ExecSQL;
            ShowMessage('Datos Actualizados...')
          end;
        end);
      Abort;

    end;
  end
  else
    ShowMessage('Dato del m�dico en Blanco....');

end;

procedure TcitasF.ubEliminarClick(Sender: TObject);
begin
  MessageDlg
    ('�Est� seguro que desea eliminar este registro de horario del m�dicos?',
    mtConfirmation, mbYesNoCancel,
    procedure(Sender: TComponent; Ans: Integer)
    begin
      if Ans = mrYes then
      begin
        UniMainModule.Query.SQL.Clear;
        UniMainModule.Query.SQL.Add('Delete From HorarioM where  medico=''' +
          codigoM.Text + ''' and Fecha=''' + FormatDateTime('yyyymmdd',
          Calendar1.Date) + ''' ');
        UniMainModule.Query.ExecSQL;
        if UniMainModule.Query.IsEmpty then
        begin
          ShowMessage('Registro Eliminado Exitosamente');
        end;
      end;
    end);
  Abort;

end;

procedure TcitasF.ubGuardarClick(Sender: TObject);
begin

  UniMainModule.Query.SQL.Clear;
  UniMainModule.Query.SQL.Add('select * from Medicos where Codigo=''' +
    codigoM.Text + '''');
  UniMainModule.Query.Open;

  if (UniMainModule.Query.IsEmpty) then
  begin;
    ShowMessage('No Exsiste registro con el documento ingresado');
  end
  else
  begin
    UniMainModule.Query.SQL.Clear;
    UniMainModule.Query.SQL.Add('Update Medicos set Nombre=''' + NombreM.Text +
      ''',Direccion=''' + DireccionM.Text + ''',Agenda=''' + MAgenda.Text +
      ''',RM=''' + RM.Text + ''',USUARIO=''' + UsuarioM.Text + ''',CLAVE=''' +
      ClaveM.Text + ''',Frecuencia=' + IntervaloM.Text + ' where Codigo=''' +
      codigoM.Text + '''');
    UniMainModule.Query.ExecSQL;
    ShowMessage('Datos de medico Actualizados...')

  end;

end;

procedure TcitasF.ubGuardarObsClick(Sender: TObject);
begin
  if DatosIngreso.Text <> '' then
  begin
    UniMainModule.Query.SQL.Clear;
    UniMainModule.Query.SQL.Add('update dxrips set condicionentrada = ''' +
      DatosIngreso.Text + ''', autorizacion = ''' + Autorizacion.Text +
      ''' where rips = ' + NumeroCita.Text);
    UniMainModule.Query.ExecSQL;
    ShowMessage('Datos Actualizados exitosamente');
  end;
end;

procedure TcitasF.ubImprimirClick(Sender: TObject);
var
  form1: TUniForm1;
begin
  if NumeroCita.Text <> '0' then
  begin
    form1 := TUniForm1.Create(UniApplication);
    form1.frxReport1.LoadFromFile('D:\Reportes\Cita.fr3');
    form1.frxReport1.Variables.Variables['rips'] :=
      '''' + NumeroCita.Text + '''';
  end;

end;

procedure TcitasF.ubQuitarClick(Sender: TObject);
var
  consulta: string;
begin

  MessageDlg('�Est� seguro que desea eliminar la cita seleccionada?',
    mtConfirmation, mbYesNoCancel,
    procedure(Sender: TComponent; Ans: Integer)
    begin
      if Ans = mrYes then
      begin
        if UniMainModule.QueryGrid.RecordCount = 0 then
          exit;

        if UniMainModule.QueryGrid.FieldByName('Autonumerico').IsNull then
          exit;

        consulta :=
          'update  CitasServicios set eliminado=1 where autonumerico = ' +
          UniMainModule.QueryGrid.FieldByName('Autonumerico').AsString + '';
        UniMainModule.QueryGrid.SQL.Clear;
        UniMainModule.QueryGrid.SQL.Add(consulta);
        UniMainModule.QueryGrid.ExecSQL;

        UniMainModule.QueryGrid.SQL.Clear;
        UniMainModule.QueryGrid.SQL.Add
          ('select * from CitasServicios where rips=' + NumeroCita.Text +
          ' and eliminado=0');
        UniMainModule.QueryGrid.Open;
        if UniMainModule.QueryGrid.IsEmpty then
        begin
          ShowMessage('Registro Eliminado Exitosamente');
        end;
      end;
    end);
  Abort;

end;

procedure TcitasF.ubReprogramarClick(Sender: TObject);
begin
  if (NumeroCita.Text = '') then
  begin
    ShowMessage('Digite el numero de cita o Rips........');
    exit
  end;
  ReprogramarCita.FReprogramar.Intervalo := Intervalo;
  ReprogramarCita.FReprogramar.rips := NumeroCita.Text;
  ReprogramarCita.FReprogramar.CodMedico.Text := CodigoMedico;
  ReprogramarCita.FReprogramar.Medico.Text := Medico.Text;
  ReprogramarCita.FReprogramar.ShowModal();
end;

procedure TcitasF.ubValorClick(Sender: TObject);
var
  fecha_autor, consulta: string;
begin
  ValorModeradora.SetFocus;
  if (autorizada.Text = 'null') OR (autorizada.GetTextLen = 0) OR
    (autorizada.Text = '') then
    fecha_autor := 'null'
  else
    fecha_autor := '''' + FormatDateTime('yyyymmdd',
      autorizada.DateTime) + '''';

  if (Autorizacion.Text <> '') then
  begin
    UniMainModule.Query.SQL.Clear;
    UniMainModule.Query.SQL.Add('select * from RipsG where Autorizacion=''' +
      Autorizacion.Text + '''');
    UniMainModule.Query.Open;

    if not UniMainModule.Query.IsEmpty then
    begin
      if (UniMainModule.Query.FieldByName('rips').AsString <> NumeroCita.Text)
      then
      begin
        ShowMessage('Esta Autorizacion ya Existe en el Rips = ' +
          UniMainModule.Query.FieldByName('Rips').AsString +
          ' , Verifique no se puede ACTUALIZAR.....');
        exit;
      end;
    end;
  end;

  MessageDlg('�Est� seguro que desea actualizar este valor?', mtConfirmation,
    mbYesNoCancel,
    procedure(Sender: TComponent; Ans: Integer)
    begin
      if Ans = mrYes then
      begin
        UniMainModule.Query.SQL.Clear;
        UniMainModule.Query.SQL.Add('Update   Citas set AutorizacionC=''' +
          Autorizacion.Text + ''', ValorModeradora=' + ValorModeradora.Text +
          ', fecha_auto = ' + fecha_autor + ' where Consecutivo=' +
          NumeroCita.Text + '');
        UniMainModule.Query.ExecSQL;

        UniMainModule.Query.SQL.Clear;
        UniMainModule.Query.SQL.Add('Update   ripsg set Autorizacion=''' +
          Autorizacion.Text + ''' where rips=' + NumeroCita.Text + '');
        UniMainModule.Query.ExecSQL;

        UniMainModule.Query.SQL.Clear;
        UniMainModule.Query.SQL.Add('Update   DXRIPS set Autorizacion=''' +
          Autorizacion.Text + ''' where rips=' + NumeroCita.Text + '');
        UniMainModule.Query.ExecSQL;
        ShowMessage('Datos Actualizados...');
      end;
    end);
  Abort;

end;

procedure TcitasF.ubVerCitasClick(Sender: TObject);
begin
if CodigoMedico='' then
begin
 ShowMessage('Debe Seleccionador un prestador');
 exit;
end;
fmedicocistas.CodigoMedico.Text:=CodigoMedico;
fmedicocistas.Medico.Text:=Medico.Text;
fmedicocistas.fechaAsignacion.DateTime:=fechaAsignacion.DateTime;
fmedicocistas.ShowModal();
end;

procedure TcitasF.ubVerHorasClick(Sender: TObject);
var
  consulta: string;
begin
  UniMainModule.Query.Close;
  UniMainModule.Query.SQL.Clear;
  consulta :=
    'select m.codigo, m.Nombre as medico, a.fecha, convert(varchar(5), a.hora, 108) as hora  from asignacionhorasweb as a, Medicos as m '
    + 'where m.Codigo=a.medico and a.fecha=''' + FormatDateTime('yyyymmdd',
    Calendar1.Date) + ''' and a.medico=''' + codigoM.Text +
    ''' order by a.hora asc';
  UniMainModule.Query.SQL.Add(consulta);
  UniMainModule.Query.Open;
  if UniMainModule.Query.RecordCount > 0 then
  begin
    HorasAsignadasWeb.HorasWebAsignadas.ShowModal(ShowCallback);
  end
  else
  begin
    ShowMessage('No existen registro para para el medico y fecha seleccionado');
  end;
end;

end.
