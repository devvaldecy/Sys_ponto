unit u_principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, Buttons;

type

  { TFrmPrincipal }

  TFrmPrincipal = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BtnMenus: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    PnlDados: TPanel;
    PnlEsquerdo: TPanel;
    PnlTop: TPanel;
    Sb: TStatusBar;
    Sp01: TShape;
    SpeedButton1: TSpeedButton;
    procedure BitBtn7Click(Sender: TObject);
    procedure BtnMenusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

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

procedure TFrmPrincipal.BtnMenusClick(Sender: TObject);
begin
  ////PnlEsquerdo.Visible:= false;
  //if PnlEsquerdo.Visible := false
  //then
  //begin
  //  PnlEsquerdo.Visible:= true;
  //end;
end;

procedure TFrmPrincipal.BitBtn7Click(Sender: TObject);
begin
    if MessageDlg ( ' Até breve .......... ' , 'Informação do Sistema ?' , mtConfirmation ,
                 [ mbYes , mbNo ] , 0 )  = mrYes
    then  {Execute resto do programa}
   Application.Terminate;
end;

end.

