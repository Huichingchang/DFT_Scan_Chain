`timescale 1ns/1ps
module tb_scan_chain;

	//宣告testbench所需變數
	reg clk;
	reg rst;
	reg scan_enable;
	reg scan_in;
	reg [3:0] d;
	wire [3:0] q;
	
	//實例化待測模組
	scan_chain uut(
		.clk(clk),
		.rst(rst),
		.scan_enable(scan_able),
		.scan_in(scan_in),
		.d(d),
		.q(q)
	);
	
	//產生時脈:週期10ns
	always #5 clk = ~clk;
	
	//初始化待測流程
	initial begin
		//初始化
		clk = 0;
		rst =1;
		scan_enable =0;
		scan_in =0;
		d =4'b0000;
		
		//重置保持10ns
		#10 rst =0;
		
		//===正常模式寫入資料 d=====
		d =4'b1010; //q預期 = 1010
		#10;
		d =4'b1100; //q預期 = 1100
		#10;
		
		//===進入scan模式============
		scan_enable =1;
		scan_in =1; //開始scan in高位元
		#10 scan_in =0;
		#10 scan_in =1;
		#10 scan_in =1; //預期shift in後 q = 1110
		#10; 
		
		//回到正常模式,再寫一次q=====
		scan_enable =0;
		d =4'b0011;
		#10;
		d =4'b1111;
		#10;
		
		//模擬結束
		$stop;
	end
endmodule
		
		
		
		