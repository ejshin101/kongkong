package com.kongkong.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.kongkong.attach.vo.AttachVO;

@Component //서비스, 컨트롤러, 레포지터리도 아닐 때
public class StudyAttachUtils {
	@Value("#{systemProperties['user.home'].concat('/upload')}")
	private String uploadPath;
	private final Logger logger = LoggerFactory.getLogger(getClass()); //컨트롤러에 무조건 logger
	private static DecimalFormat format = new DecimalFormat("#,##0.00");
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");

	/** MultipartFile에서 VO 설정 및 업로드 파일 처리 후 리턴, 없는 경우 null */
	public AttachVO getAttachByMultipart(MultipartFile multipart, String category) throws IOException {
		if (!multipart.isEmpty()) {
			//저장경로는 카테고리 + 날짜 기반 : category/YYYY/MM
			String path = category + File.separatorChar + LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM"));
			
			//저장할 파일명 : 원본기준, 랜덤, 날짜기반 등
			String fileName = UUID.randomUUID().toString();
			String fileExtension = getFileExtension(multipart.getOriginalFilename());
			fileName = fileName + fileExtension;
			AttachVO vo = new AttachVO();
			vo.setAtchOriginalName(multipart.getOriginalFilename());
			vo.setAtchFileSize(multipart.getSize());
			vo.setAtchContentType(multipart.getContentType());
			vo.setAtchFileName(fileName);
			vo.setAtchCategory(category);
			vo.setAtchPath(path);
			vo.setAtchFancySize(fancySize(multipart.getSize()));
			String filePath = uploadPath +  File.separatorChar + vo.getAtchPath();
			logger.debug("filePath = {}, fileName = {}", filePath, fileName);
			// multipart.transferTo(new File(filePath, fileName));
			FileUtils.copyInputStreamToFile(multipart.getInputStream(), new File(filePath, fileName));
			return vo;
		} else {
			return null;
		}
	}

	/** 다중 MultipartFile에서 VO 설정 및 업로드 파일 처리 후 List 리턴 */
	public List<AttachVO> getAttachListByMultiparts(MultipartFile[] multipartFiles, String category)
			throws IOException {
		List<AttachVO> atchList = new ArrayList<AttachVO>();
		for (int i = 0; i < multipartFiles.length; i++) {
			MultipartFile multipart = multipartFiles[i];
			AttachVO vo = this.getAttachByMultipart(multipart, category);
			if (vo != null) {
				atchList.add(vo);
			}
		}
		return atchList;
	}
	
	public String fancySize(long size) {
		
		if(size < 1024) {
			// 1kb보다 작으면 그대로 byte
			return size + "Bytes";
		}else if(size < (1024 * 1024) ) {
			//1mb보다 작으면 kb
			return format.format(size / 1024.0) + "KB";
		}else if(size < (1024 * 1024 * 1024) ){
			//1gb보다 작으면 mb
			return format.format(size / (1024.0 * 1024.0)) + "MB";
		}else {
			//GB 이상
			return format.format(size / (1024.0 * 1024.0 * 1024.0)) + "GB";
		}
	}
	
	public static String getFileExtension(String fileName) {
		//마지막에 "." 검색, 못찾으면 return ""; 찾으면 .이하 리턴
		int indexExtension = fileName.lastIndexOf(".");
		if(indexExtension == -1) {
			return "";
		}else {
			String extension = fileName.substring(indexExtension);
			return extension;
		}
	}
}
