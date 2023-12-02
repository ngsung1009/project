package com.tistory.pentode.service.impl;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
//import org.jnetpcap.ByteBufferHandler;
//import org.jnetpcap.Pcap;
//import org.jnetpcap.PcapDumper;
//import org.jnetpcap.PcapHeader;
//import org.jnetpcap.PcapIf;
//import org.jnetpcap.packet.PcapPacket;
//import org.jnetpcap.packet.PcapPacketHandler;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.Sheet;
//import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tistory.pentode.service.BoardService;
import com.tistory.pentode.vo.BoardVO;
import java.io.File;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;


@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	/**
	 * 테스트용 주기적으로 실행된 메소드 이다.
	 */
	
	//public void testJobMethod() {
	public void testJobMethod() {
		System.out.println("test job....");
	}

	/**
	 * packet추출
	 */
//	public void packetMethod(String[] args) {
//		System.out.println("test packet....");
//		// pcap.loop(x, dumpHandler, dumper); x 개 패킷
//		// String ofile = "tmp-capture-file.cap"; tmp-capture-file.cap 파일로 저장
//
//		List<PcapIf> allDevs = new ArrayList<PcapIf>(); // Will be filled with
//														// NICs
//		StringBuilder errbuf = new StringBuilder(); // For any error msgs
//
//		/***************************************************************************
//		 * First get a list of devices on this system
//		 **************************************************************************/
//		int r = Pcap.findAllDevs(allDevs, errbuf);
//		if (r == Pcap.NOT_OK || allDevs.isEmpty()) {
//			System.err.printf("Can't read list of devices, error is %s\n", errbuf.toString());
//			return;
//		}
//		int i = 0;
//		for(PcapIf device : allDevs) {//탐색된 장비 출력
//			String description = (device.getDescription() != null) ? 
//					device.getDescription() : "장비에대한 설명이 없음";
//			System.out.printf("[%d번]: %s [%s]\n", ++i, device.getName(),description);
//		}
//		PcapIf device = (PcapIf) allDevs.get(0); // We know we have atleast 1 device
//
//		/***************************************************************************
//		 * Second we open up the selected device
//		 **************************************************************************/
//		int snaplen = 64 * 1024; // 65536Byte 만큼캡쳐 Capture all packets, no trucation
//		int flags = Pcap.MODE_PROMISCUOUS; // capture all packets
//		int timeout = 10 * 1000; // 10 seconds in millis
//		Pcap pcap = Pcap.openLive(device.getName(), snaplen, flags, timeout, errbuf);
//		if (pcap == null) {
//			System.err.printf("Error while opening device for capture: %s\n", errbuf.toString());
//			return;
//		}
//
//		/***************************************************************************
//		 * Third we create a PcapDumper and associate it with the pcap capture
//		 ***************************************************************************/
////		 File file = new File("c://태희/pcap/"); 
////		  
////	        // Making file array which is used 
////	        // to access each file 
////	        // inside the folder one-by-one 
////	    File[] files = file.listFiles(); 
//	    
//	    
//		String ofile = "c://태희/pcap/tmp-capture-file.pcap";
//		final PcapDumper dumper = pcap.dumpOpen(ofile); // output file
//
//		/***************************************************************************
//		 * Fouth we create a packet handler which receives packets and tells the
//		 * dumper to write those packets to its output file
//		 **************************************************************************/
////		ByteBufferHandler<PcapDumper> dumpHandler = new ByteBufferHandler<PcapDumper>() {
////
////			@SuppressWarnings("unused")
////			public void nextPacket(PcapHeader arg0, ByteBuffer arg1, PcapDumper arg2) {
////				// TODO Auto-generated method stub
////				dumper.dump(arg0, arg1);
////			}
////
////		};
//		
//		
////		ByteBufferHandler<PcapDumper> dumpHandler = new ByteBufferHandler<PcapDumper>() {
////
////			@SuppressWarnings("unused")
////			public void nextPacket(PcapHeader arg0, ByteBuffer arg1, PcapDumper arg2) {
////				// TODO Auto-generated method stub
////				dumper.dump(arg0, arg1);
////			}
////
////		};
//		ByteBufferHandler<PcapDumper> dumpHandler = new ByteBufferHandler<PcapDumper>() { 
//			@Override
//			public void nextPacket(PcapHeader arg0, ByteBuffer arg1, PcapDumper arg2) { 
//				// TODO Auto-generated method stub 
//				dumper.dump(arg0, arg1); 
//			}
//		};
//
//
////		ByteBufferHandler dumpHandler = new ByteBufferHandler() { 
////			@SuppressWarnings("unused")
////			public void nextPacket(PcapHeader arg0, ByteBuffer arg1, PcapDumper arg2) { 
////				// TODO Auto-generated method stub 
////				dumper.dump(arg0, arg1); 
////			}
////
////			@Override
////			public void nextPacket(PcapHeader arg0, ByteBuffer arg1, Object arg2) {
////				// TODO Auto-generated method stub
////				
////			}
////
////		};
//
//
//
//
//		/***************************************************************************
//		 * Fifth we enter the loop and tell it to capture 10 packets. We pass in
//		 * the dumper created in step 3
//		 **************************************************************************/
//		pcap.loop(10, dumpHandler, dumper);
//
//		File file = new File(ofile);
//		System.out.printf("%s file has %d bytes in it!\n", ofile, file.length());
//
//		/***************************************************************************
//		 * Last thing to do is close the dumper and pcap handles
//		 **************************************************************************/
//		dumper.close(); // Won't be able to delete without explicit close
//		pcap.close();
//
//		if (file.exists()) {
//			// file.delete(); // Cleanup
//		}	
//	}
	@Override
	@Transactional
	public void selectExcelList(HttpServletResponse response) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession();

		// 메모리에 100개의 행을 유지합니다. 행의 수가 넘으면 디스크에 적습니다.
		//SXSSFWorkbook wb = new SXSSFWorkbook(100);
		//Sheet sheet = wb.createSheet();
		
		try {
			/*
		    sqlSession.select("selectExcelList", "게시물", new ResultHandler<BoardVO>() {
		    	@Override
				public void handleResult(ResultContext<? extends BoardVO> context) { 
				    BoardVO vo = context.getResultObject();
				    Row row = sheet.createRow(context.getResultCount() - 1);
			    	Cell cell = null;
			    	cell = row.createCell(0);
			    	cell.setCellValue(vo.getNum().toString());
			        cell = row.createCell(1);
			        cell.setCellValue(vo.getTitle());
			        cell = row.createCell(2);
			        cell.setCellValue(vo.getContent());
			    }
			    
            });
		
			response.setHeader("Set-Cookie", "fileDownload=true; path=/");
			response.setHeader("Content-Disposition", String.format("attachment; filename=\"test.xlsx\""));
			wb.write(response.getOutputStream());
		*/

		} catch(Exception e) {
			response.setHeader("Set-Cookie", "fileDownload=false; path=/");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Content-Type","text/html; charset=utf-8");
			
			OutputStream out = null;
			try {
				out = response.getOutputStream();
				byte[] data = new String("fail..").getBytes();
				out.write(data, 0, data.length);
			} catch(Exception ignore) {
				
			} finally {
				if(out != null) try { out.close(); } catch(Exception ignore) {}
			}
			
		} finally {
			sqlSession.close();
			
			// 디스크 적었던 임시파일을 제거합니다.
			//wb.dispose();
			
			//try { wb.close(); } catch(Exception ignore) {}
		}
		
	}

	@Override
	public void packetMethod() {
		// TODO Auto-generated method stub
		
	}

}
