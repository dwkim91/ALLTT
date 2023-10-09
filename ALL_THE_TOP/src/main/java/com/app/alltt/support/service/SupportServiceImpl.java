package com.app.alltt.support.service;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.app.alltt.main.dto.FilteredDTO;
import com.app.alltt.support.dao.SupportDAO;
import com.app.alltt.support.dto.SupportDTO;

import net.coobird.thumbnailator.Thumbnails;

@Service
@PropertySource("classpath:properties/aws.properties")
public class SupportServiceImpl implements SupportService {

	@Autowired
	SupportDAO supportDAO;

	@Override
	public void addInquiry(SupportDTO supportDTO) {
		supportDAO.insertInquiry(supportDTO);
	}

	@Override
	public List<SupportDTO> getInquiryList() {
		return supportDAO.selectInquiryList();
	}

	@Override
	public SupportDTO getInquiryDetail(long supportId) {
		return supportDAO.selectOneInquiry(supportId);
	}

	@Override
	public void registerAnswer(SupportDTO supportDTO) {
		supportDAO.updateAnswer(supportDTO);
	}

	@Override
	public int getDoneCnt() {
		return supportDAO.selectDone();
	}

	@Override
	public int getNewCnt() {
		return supportDAO.selectNew();
	}

	@Override
	public int getInProgressCnt() {
		return supportDAO.selectInProgress();
	}

	@Override
	public List<SupportDTO> getInquiryListByStatus(String status) {
		return supportDAO.selectInquiryListByStatus(status);
	}
	
	@Value("${allott.aws.access.key}")
    private String ACCESS_KEY;
	
	@Value("${allott.aws.secert.key}")
    private String SECRET_KEY;
	
	@Value("${allott.aws.bucket.name}")
    private String BUCKET_NAME;
	
	@Value("${allott.aws.image.path}")
	private String imagePath;
	
	@Override
	public void resizeAndUploadImage() {
		
		ImageResizeAndUploadService imageService = new ImageResizeAndUploadService();
		
	}

	@Override
	public void resizeAndUploaddamagedImage(MultipartFile uploadFile, int contentId) {
		
		try {
			ImageResizeAndUploadService imageService = new ImageResizeAndUploadService();
			
			BufferedImage tempImage = imageService.convertMultipartFileToBufferedImage(uploadFile);
			
			int width = tempImage.getWidth(); // 이미지의 너비(가로 길이)
			int height = tempImage.getHeight(); // 이미지의 높이(세로 길이)
			
			String objectKey = "image/" + contentId + ".jpg";
			
			System.out.println(width + "x" + height);
			
			if (width < height) {
				imageService.uploadImageToS3(imageService.resizeImageFile(tempImage, 480, 700), objectKey);
			}
			else {
				imageService.uploadImageToS3(imageService.newImageFile(tempImage, 340, 700), objectKey);
			}
			
			FilteredDTO tempDTO = new FilteredDTO();
			
			tempDTO.setContentId(contentId);
			tempDTO.setImgUrl(imagePath + contentId + ".jpg");
			
			supportDAO.insertViewImage(tempDTO);
			
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("예외 발생: " + e.getMessage());
		}
	}
	
	public class ImageResizeAndUploadService {
		
	    public BufferedImage resizeImage(String imageUrl, int targetWidth, int targetHeight) {
	        try {
	            BufferedImage originalImage = ImageIO.read(new URL(imageUrl));

	            // 이미지 리사이징 (WebP, PNG, JPG 모두 지원)
	            BufferedImage resizedImage = Thumbnails.of(originalImage)
	                    .size(targetWidth, targetHeight)
	                    .outputFormat("jpg")
	                    .asBufferedImage();

	            return resizedImage;

	        } catch (IOException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
	    
	    public BufferedImage resizeImageFile(BufferedImage tempImage, int targetWidth, int targetHeight) {
	        try {

	            // 이미지 리사이징 (WebP, PNG, JPG 모두 지원)
	            BufferedImage resizedImage = Thumbnails.of(tempImage)
	                    .size(targetWidth, targetHeight)
	                    .outputFormat("jpg")
	                    .asBufferedImage();

	            return resizedImage;

	        } catch (IOException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
		
		// 이미지 URL을 BufferedImage으로 변환
	    public BufferedImage newImage(String url, int newWidth, int newHeight) {
	        try {
	            URL imageUrl = new URL(url);

	            // WebP 이미지를 BufferedImage로 읽습니다.
	            BufferedImage tempImage = ImageIO.read(imageUrl);

	            // 새로운 WebP 이미지를 생성합니다.
	            BufferedImage newImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
	            Graphics2D g2d = newImage.createGraphics();

	            // 원본 이미지를 새 이미지의 중앙에 그립니다.
	            int x = (newWidth - tempImage.getWidth()) / 2;
	            int y = (newHeight - tempImage.getHeight()) / 2;
	            g2d.drawImage(tempImage, x, y, tempImage.getWidth(), tempImage.getHeight(), null);
	            g2d.dispose();

	            return newImage;

	        } catch (IOException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
		
		// 새이미지에 리사이징된 이미지파일 덮어쓰기
	    public BufferedImage newImageFile(BufferedImage tempImage, int newWidth, int newHeight) {
            // 새로운 WebP 이미지를 생성합니다.
            BufferedImage newImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
            Graphics2D g2d = newImage.createGraphics();

            // 원본 이미지를 새 이미지의 중앙에 그립니다.
            int x = (newWidth - tempImage.getWidth()) / 2;
            int y = (newHeight - tempImage.getHeight()) / 2;
            g2d.drawImage(tempImage, x, y, tempImage.getWidth(), tempImage.getHeight(), null);
            g2d.dispose();

            return newImage;
	    }
		
		// AWS S3 업로드
	    public void uploadImageToS3(BufferedImage resizedImage, String objectKey) {
	        try {
	            // 이미지를 바이트 배열로 변환
	            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	            // 이미지 형식을 JPEG로 변환
	            ImageIO.write(resizedImage, "jpg", outputStream);
	            byte[] resizedImageBytes = outputStream.toByteArray();

	            // AWS S3 연결 설정
	            BasicAWSCredentials awsCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
	            AmazonS3 s3Client = AmazonS3Client.builder()
	                    .withRegion("ap-northeast-2") // 원하는 AWS 리전 선택
	                    .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
	                    .build();

	            // 이미지를 AWS S3에 업로드
	            ObjectMetadata metadata = new ObjectMetadata();
	            metadata.setContentLength(resizedImageBytes.length);
	            metadata.setContentType("image/jpeg");
	            metadata.setContentDisposition("inline");

	            s3Client.putObject(new PutObjectRequest(BUCKET_NAME, objectKey, new ByteArrayInputStream(resizedImageBytes), metadata));
	        } catch (IOException | AmazonServiceException e) {
	            // 예외 처리
	            e.printStackTrace();
	        }
	    }
	    
	    // MultipartFile to BufferedImage
	    public BufferedImage convertMultipartFileToBufferedImage(MultipartFile multipartFile) throws IOException {
	        // MultipartFile을 바이트 배열로 읽어옴
	        byte[] bytes = multipartFile.getBytes();
	        
	        // 바이트 배열을 ByteArrayInputStream으로 변환
	        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
	        
	        // ByteArrayInputStream을 사용하여 BufferedImage로 읽어옴
	        BufferedImage bufferedImage = ImageIO.read(byteArrayInputStream);
	        
	        // BufferedImage 반환
	        return bufferedImage;
	    }
	    
	}

	@Override
	public List<FilteredDTO> getImageRequiredToBeUploaded() {
		return supportDAO.selectListImageRequiredToBeUploaded();
	}

}
