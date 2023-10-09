package com.app.alltt.support.service;

import java.awt.Graphics2D;
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
	
	@Override
	public void resizeAndUploadImage() {
		
		ImageResizeAndUploadService imageService = new ImageResizeAndUploadService();
		
		int platformId = 2;
		
		if (platformId != 1) {
			imageService.uploadImageToS3(imageService.resizeImage("", 480, 700), "image/image2.jpg");
		}
		else if (platformId == 1) {
			imageService.uploadImageToS3(imageService.newImage("", 340, 700), "image/image2.jpg");
		}
		
	}

	@Override
	public void resizeAndUploaddamagedImage(String tempFilePath, int contentId) {
		
		
	}
	
	public class ImageResizeAndUploadService {
		
		public BufferedImage newImage(String url, int newWidth, int newHeight) {
			
			try {

            BufferedImage originalImage = ImageIO.read(new URL(url));
            
            // 비어진 새로운 이미지 생성
            BufferedImage newImage = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
            Graphics2D g2d = newImage.createGraphics();

            int x = (newWidth - originalImage.getWidth()) / 2;
            int y = (newHeight - originalImage.getHeight()) / 2;
            g2d.drawImage(originalImage, x, y, originalImage.getWidth(), originalImage.getHeight(), null);
            g2d.dispose();
            
            return newImage;
			
			}
			catch (IOException e) {
				e.printStackTrace();
				return null;
			}
			
		}

	    public BufferedImage resizeImage(String imageUrl, int targetWidth, int targetHeight) {
	        try {

	        	BufferedImage originalImage = ImageIO.read(new URL(imageUrl));

	            // 이미지 리사이징
	            BufferedImage resizedImage = Thumbnails.of(originalImage)
	                    .size(targetWidth, targetHeight)
	                    .asBufferedImage();

	            return resizedImage;
	            
	        }
	        catch (IOException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }

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
	    
	}

	@Override
	public List<FilteredDTO> getImageRequiredToBeUploaded() {
		return supportDAO.selectListImageRequiredToBeUploaded();
	}

}
