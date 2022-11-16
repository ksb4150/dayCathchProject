package com.springboot.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	private static final String USER_IMAGE_FILE_NAME = "C:\\user\\user_image";
	private static final String GOODS_THUMBNAIL_FILE_NAME = "C:\\goods\\goods_Images\\thumbnail";
	private static final String GOODS_IMAGES_FILE_NAME = "C:\\goods\\goods_Images";
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image\\";
	private static final String ARTICLE_THUMBNAIL_FILE_NAME = "C:\\board\\article_image\\thumbnail";
	
	@RequestMapping("/uImgDownload.do")
	protected void uImgDownload(@RequestParam("userImageFileName") String userImageFileName,  
							@RequestParam("uid") String uid,
							HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = USER_IMAGE_FILE_NAME + "\\" + uid + "\\" + userImageFileName;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+ userImageFileName);
	
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();	
	}

	@RequestMapping("/gThumbDownload.do")
	protected void gThumbDownload(@RequestParam("goodsImageFileName") String goodsImageFileName,
							HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = GOODS_THUMBNAIL_FILE_NAME + "\\" + goodsImageFileName;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+ goodsImageFileName);
	
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();	
	}
	
	@RequestMapping("/gImgDownload.do")
	protected void gImgDownload(@RequestParam("orginFileName") String orginFileName,  
							@RequestParam("goodsId") int goodsId,
							HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = GOODS_IMAGES_FILE_NAME + "\\" + goodsId + "\\" + orginFileName;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+ orginFileName);
	
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();	
	}
	
	@RequestMapping(value = "/board/bImgDownload.do", method = { RequestMethod.GET, RequestMethod.POST })
	protected void bImgDownload(@RequestParam("orginFileName") String orginFileName,  
							@RequestParam("articleNO") int articleNO,
							HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + orginFileName;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+ orginFileName);
	
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();	
	}
	
	@RequestMapping("/bThumbDownload.do")
	protected void bThumbDownload(@RequestParam("mainImageFileName") String mainImageFileName,  
							@RequestParam("articleNO") int articleNO,
							HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_THUMBNAIL_FILE_NAME + "\\" + articleNO + "\\" + mainImageFileName;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+ mainImageFileName);
	
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			
			out.write(buffer, 0, count);
		}
		
		in.close();
		out.close();
		
	}
}
