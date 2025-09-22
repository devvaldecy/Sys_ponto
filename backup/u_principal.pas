unit u_principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls;

type

  { TFrmPrincipal }

  TFrmPrincipal = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    PnlTop: TPanel;
    Sb: TStatusBar;
    Sp01: TShape;
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

end.

