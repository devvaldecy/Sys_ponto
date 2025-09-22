unit u_principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, Buttons;

type

  { TFrmPrincipal }

  TFrmPrincipal = class(TForm)
    BtnMenus: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    PnlEdquerdo: TPanel;
    PnlTop: TPanel;
    Sb: TStatusBar;
    Sp01: TShape;
    procedure BtnMenusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
procedure TFrmPrincipal.BtnMenusClick(Sender: TObject);
begin
  PnlEdquerdo.Visible:= false;
end;

end.

