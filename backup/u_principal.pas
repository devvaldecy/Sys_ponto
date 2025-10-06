unit u_principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, Buttons, u_cadpadrao, usobre;

type

  { TFrmPrincipal }

  TFrmPrincipal = class(TForm)
    BtnFuncionarios: TBitBtn;
    BtnConfig: TBitBtn;
    BtnTeste01: TBitBtn;
    BtnTeste: TBitBtn;
    BtnRelatorios: TBitBtn;
    BtnRegistro: TBitBtn;
    BtnSair: TBitBtn;
    BtnSobre: TBitBtn;
    BtnMenus: TBitBtn;
    ImgLogo: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LblHora01: TLabel;
    LblHora2: TLabel;
    llbData: TLabel;
    Lbldata01: TLabel;
    llbHora: TLabel;
    llbHora1: TLabel;
    PnlTopCenter: TPanel;
    PnlLogo: TPanel;
    PnlDados: TPanel;
    PnlEsquerdo: TPanel;
    PnlTop: TPanel;
    Sb: TStatusBar;
    Sp01: TShape;
    SpeedButton1: TSpeedButton;
    TmHorarios: TTimer;
    procedure BtnConfigClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnMenusClick(Sender: TObject);
    procedure BtnSobreClick(Sender: TObject);
    procedure BtnTesteClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TmHorariosTimer(Sender: TObject);
  private

  public
    procedure EsconderMenu();
  end;

var
  FrmPrincipal: TFrmPrincipal;
  Escondido: Boolean;

{$R *.lfm}
implementation
{ TFrmPrincipal }

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.TmHorariosTimer(Sender: TObject);
begin
  // Informa a data e hora no PANEL...
  Lbldata01.Caption := FormatDateTime('DD/MM/YYYY', now);
  LblHora01.Caption := FormatDateTime('HH:MM:SS', now);
end;

procedure TFrmPrincipal.EsconderMenu;
begin
  if Escondido then
  begin
    BtnFuncionarios.Caption:= '';
    BtnRegistro.Caption    := '';
    BtnRelatorios.Caption  := '';
    BtnTeste.Caption       := '';
    BtnTeste01.Caption     := '';
    BtnConfig.Caption      := '';
    BtnSobre.Caption       := '';
    BtnSair.Caption        := '';
    BtnMenus.Caption       := '';
    BtnMenus.Width         := 58;
    PnlEsquerdo.Width      := 58;
  end else
  begin
    BtnFuncionarios.Caption:= 'FUNCIONARIOS';
    BtnRegistro.Caption    := 'REGISTRAR';
    BtnRelatorios.Caption  := 'RELATÓRIOS';
    BtnTeste.Caption       := 'SETOR';
    BtnTeste01.Caption     := 'LOJAS';
    BtnConfig.Caption      := 'CONFIG';
    BtnSobre.Caption       := 'SOBRE';
    BtnSair.Caption        := 'SAIR';
    BtnMenus.Caption       := 'OCULTAR';
    BtnMenus.Width         := 156;
    PnlEsquerdo.Width      := 156;
  end;
end;

procedure TFrmPrincipal.BtnMenusClick(Sender: TObject);
begin
  //outra rotina
  Escondido := not Escondido;
  EsconderMenu();
end;

procedure TFrmPrincipal.BtnSobreClick(Sender: TObject);
begin
  frmSobre := TfrmSobre.Create(Self);
  try
    frmSobre.ShowModal;
  finally
    FreeAndNil(frmSobre);
  end;
end;

procedure TFrmPrincipal.BtnTesteClick(Sender: TObject);
begin
  FrmCadSetor := TFrmCadSetor.Create(Self);
  try
    FrmCadSetor.Showmodal;
  finally
    FreeAndNil(FrmCadSetor);
  end;
end;

procedure TFrmPrincipal.BtnSairClick(Sender: TObject);
begin
    if MessageDlg ( ' Até breve .......... ' , 'Informação do Sistema ?' , mtConfirmation ,
                 [ mbYes , mbNo ] , 0 )  = mrYes
    then  {Execute resto do programa}
   Application.Terminate;
end;

procedure TFrmPrincipal.BtnConfigClick(Sender: TObject);
begin
  frmcadpadrao := Tfrmcadpadrao.Create(Self);
  try
    frmcadpadrao.ShowModal;
  finally
    FreeAndNil(frmcadpadrao);
  end;
end;

end.

