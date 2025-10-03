unit u_cadpadrao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  Buttons, Menus;

type

  { Tf_cadpadrao }

  Tf_cadpadrao = class(TForm)
    BitBtn6: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnDeletar: TBitBtn;
    BtnNovo: TBitBtn;
    BtnPesquisar: TBitBtn;
    BtnSalvar: TBitBtn;
    PnlLest: TPanel;
    PnlTop: TPanel;
    procedure FormKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  f_cadpadrao: Tf_cadpadrao;

implementation

{$R *.lfm}

{ Tf_cadpadrao }

procedure Tf_cadpadrao.FormKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then begin
  SelectNext(ActiveControl as TWinControl,True,True);
  key:=#0;
  end;
end;

end.

