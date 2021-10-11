unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  adCpuUsage, Dialogs, ExtCtrls, TeEngine, Series, TeeProcs, Chart;

type
  TForm1 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
  //  $00 DA E4 7E
procedure TForm1.Timer1Timer(Sender: TObject);
var
 i: integer;
begin
 CollectCPUData;
 for i:=0 to GetCPUCount-1 do
  begin
   if Chart1.Series[i].Count>20
   then Chart1.Series[i].Delete(0);
   Chart1.Series[i].AddXY(Time, GetCPUUsage(i)*100,
                Format('%5.2f%%',[GetCPUUsage(i)*100]));
   Form1.Caption:='CPU Usage: '+FloatToStr(Round(GetCPUUsage(i)*100))+'%';
  end;
end;

end.
