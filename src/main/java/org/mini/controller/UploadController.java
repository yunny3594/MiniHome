package org.mini.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.mini.model.AttachFileVO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {

	}

	@RequestMapping(value = "/uploadFormAction", method = RequestMethod.POST)
	public void uploadFormPost(MultipartFile[] uploadFile) {

		String uploadFolder = "D:\\upload";

		for (MultipartFile multiparFile : uploadFile) {
			System.out.println(multiparFile.getOriginalFilename());
			System.out.println(multiparFile.getSize());

			File saveFile = new File(uploadFolder, multiparFile.getOriginalFilename());

			try {
				multiparFile.transferTo(saveFile);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}
	}

	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {

	}

	private String getFolder() {

		Date date = new Date();
		// Thu Aug 24 09:23:12 KST 2022 -> 2022-08-24
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		String str = sdf.format(date); // 2022-08-24
		// 2022-08-24 - >2022\08\24
		return str.replace("-", "\\");
	}

	private boolean checkImageType(File file) {
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			System.out.println("contentType=" + contentType);

			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@RequestMapping(value = "/uploadAjaxAction", method = RequestMethod.POST)
	public ResponseEntity<ArrayList<AttachFileVO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		ArrayList<AttachFileVO> list = new ArrayList<>();

		String uploadFolder = "D:\\upload";
		File uploadPath = new File(uploadFolder, getFolder());

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		for (MultipartFile multipartFile : uploadFile) {

			AttachFileVO attachvo = new AttachFileVO();

			System.out.println(multipartFile.getOriginalFilename());
			System.out.println(multipartFile.getSize());

			UUID uuid = UUID.randomUUID();
			System.out.println("UUID : " + uuid.toString());

			attachvo.setUploadPath(getFolder());

			attachvo.setFileName(multipartFile.getOriginalFilename());

			attachvo.setUuid(uuid.toString());

			File saveFile = new File(uploadPath, uuid.toString() + "_" + multipartFile.getOriginalFilename());

			try {
				multipartFile.transferTo(saveFile);

				if (checkImageType(saveFile)) {

					attachvo.setImage(true);
					FileOutputStream thumnail = new FileOutputStream(
							new File(uploadPath, "s_" + uuid.toString() + "_" + multipartFile.getOriginalFilename()));

					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumnail, 100, 100);
					thumnail.close();
				}

				list.add(attachvo);

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName) {

		File file = new File("D:\\upload\\" + fileName); 

		ResponseEntity<byte[]> result = null;

		HttpHeaders headers = new HttpHeaders();

		try {
			headers.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ResponseEntity<Resource> downloadFile(String fileName) {

		Resource resource = new FileSystemResource("D:\\upload\\" + fileName);

		String resourceName = resource.getFilename();

		HttpHeaders headers = new HttpHeaders();

		try {
			headers.add("Content-Disposition",
					"attachment;filename=" + new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(resource, headers, HttpStatus.OK);
	}

}
