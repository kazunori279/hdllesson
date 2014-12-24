import java.util.EnumSet;

import synthesijer.hdl.HDLModule;
import synthesijer.hdl.HDLPrimitiveType;
import synthesijer.hdl.HDLPort;
import synthesijer.hdl.HDLPort.DIR;

public class WIZ830MJ_Iface extends HDLModule {

	public int address;
	public byte wdata;
	public byte rdata;
	public boolean cs;
	public boolean oe;
	public boolean we;
	public boolean interrupt;
	public boolean module_reset;
	public boolean bready0;
	public boolean bready1;
	public boolean bready2;
	public boolean bready3;

	public WIZ830MJ_Iface(String... args) {
		super("wiz830mj_iface", "clk", "reset");

		// for user logic
		newPort("address", DIR.IN, HDLPrimitiveType.genVectorType(32));
		newPort("wdata", DIR.IN, HDLPrimitiveType.genVectorType(8));
		newPort("rdata", DIR.OUT, HDLPrimitiveType.genVectorType(8));
		newPort("cs", DIR.IN, HDLPrimitiveType.genBitType());
		newPort("oe", DIR.IN, HDLPrimitiveType.genBitType());
		newPort("we", DIR.IN, HDLPrimitiveType.genBitType());
		newPort("interrupt", DIR.OUT, HDLPrimitiveType.genBitType());
		newPort("module_reset", DIR.IN, HDLPrimitiveType.genBitType());
		newPort("bready0", DIR.OUT, HDLPrimitiveType.genBitType());
		newPort("bready1", DIR.OUT, HDLPrimitiveType.genBitType());
		newPort("bready2", DIR.OUT, HDLPrimitiveType.genBitType());
		newPort("bready3", DIR.OUT, HDLPrimitiveType.genBitType());

		// for WIZ830MJ
		newPort("ADDR", DIR.OUT, HDLPrimitiveType.genVectorType(10),
				EnumSet.of(HDLPort.OPTION.EXPORT));
		newPort("DATA", DIR.INOUT, HDLPrimitiveType.genVectorType(8),
				EnumSet.of(HDLPort.OPTION.EXPORT));
		newPort("nCS", DIR.OUT, HDLPrimitiveType.genBitType(),
				EnumSet.of(HDLPort.OPTION.EXPORT));
		newPort("nRD", DIR.OUT, HDLPrimitiveType.genBitType(),
				EnumSet.of(HDLPort.OPTION.EXPORT));
		newPort("nWR", DIR.OUT, HDLPrimitiveType.genBitType(),
				EnumSet.of(HDLPort.OPTION.EXPORT));
		newPort("nINT", DIR.IN, HDLPrimitiveType.genBitType(),
				EnumSet.of(HDLPort.OPTION.EXPORT));
		newPort("nRESET", DIR.OUT, HDLPrimitiveType.genBitType(),
				EnumSet.of(HDLPort.OPTION.EXPORT));
		newPort("BRDY", DIR.IN, HDLPrimitiveType.genVectorType(4),
				EnumSet.of(HDLPort.OPTION.EXPORT));
	}

}
