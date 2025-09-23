unit u_principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, Buttons;

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
    procedure BtnSairClick(Sender: TObject);
    procedure BtnMenusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TmHorariosTimer(Sender: TObject);
  private

  public
    procedure EsconderMenu();
  end;

var
  FrmPrincipal: TFrmPrincipal;
  Escondido: Boolean;

implementation

{$R *.lfm}

{ TFrmPrincipal }

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin

end;

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
    PnlEsquerdo.Width      := 60;
  end else
  begin
    BtnFuncionarios.Caption:= 'Funcionários';
    BtnRegistro.Caption    := 'Registro';
    BtnRelatorios.Caption  := 'Relatórios';
    BtnTeste.Caption       := 'Teste';
    BtnTeste01.Caption     := 'Teste 01';
    BtnConfig.Caption      := 'Config';
    BtnSobre.Caption       := 'Sobre';
    BtnSair.Caption        := 'Sair';
    PnlEsquerdo.Width      := 171;
  end;
end;

procedure TFrmPrincipal.BtnMenusClick(Sender: TObject);
begin
  // Rotina pra esconder e mostra o menu ...
  //BtnFuncionarios.Caption:='';
  //PnlEsquerdo.Visible:= not PnlEsquerdo.Visible;

  //outra rotina
  Escondido := not Escondido;
  EsconderMenu();
end;

procedure TFrmPrincipal.BtnSairClick(Sender: TObject);
begin
    if MessageDlg ( ' Até breve .......... ' , 'Informação do Sistema ?' , mtConfirmation ,
                 [ mbYes , mbNo ] , 0 )  = mrYes
    then  {Execute resto do programa}
   Application.Terminate;
end;

end.

