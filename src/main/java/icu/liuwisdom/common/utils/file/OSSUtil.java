package icu.liuwisdom.common.utils.file;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.CannedAccessControlList;
import com.aliyun.oss.model.CreateBucketRequest;
import com.aliyun.oss.model.GetObjectRequest;
import com.fasterxml.jackson.annotation.JsonProperty;
import icu.liuwisdom.common.utils.ImageFormatValidation;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/*OSS工具类*/
@Component
public class OSSUtil {
    /*连接OSS的基本信息*/
    private static String ENDPOINT = "oss-cn-beijing.aliyuncs.com";//外网访问地域节点
    private static String ACCESSKEYID = "LTAI5tSgVwzBTduNBwSdWZ9m";//访问键
    private static String ACCESSKEYSECRET = "cAe2cIJAjXTGlcxtp9LCMFKDpSk6Ng";//访问密钥
    private static String BUCKETNAME = "lsvvideo";//仓库名
    private static String SUFFER_URL = "http://lsvvideo.oss-cn-beijing.aliyuncs.com/";
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    // 关闭OSSClient。
    //ossClient.shutdown();

    /*获取OSS连接*/
    public static OSS getOSSClient() {
        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(ENDPOINT, ACCESSKEYID, ACCESSKEYSECRET);
        //判断仓库是否存在
        if (ossClient.doesBucketExist(BUCKETNAME)) {
            System.out.println("BUCKET存在");
        } else {
            System.out.println("BUCKET不存在，将自动创建新仓库，名为：" + BUCKETNAME);
            CreateBucketRequest bucketRequest = new CreateBucketRequest(null);
            bucketRequest.setBucketName(BUCKETNAME);
            bucketRequest.setCannedACL(CannedAccessControlList.PublicRead);
            ossClient.createBucket(bucketRequest);
            //ossClient.shutdown();//关闭连接
        }
        return ossClient;
    }


    /*基于OSS实现的文件上传
     * 文件、文件类型
     * */
    public String uploadFile(MultipartFile multipartFile, String fileType) {
        //1、获取OSS连接
        OSS ossClient = this.getOSSClient();
        //2、获取文件的后缀名称
        String ext = multipartFile.getOriginalFilename();
        ext = ext.substring(ext.lastIndexOf("."));
        String date = sdf.format(new Date());//当前日期
        //3、为避免图片重名，使用UUID命名
        String uuid = UUID.randomUUID().toString().replace("-", "");
        //4、组合文件名
        String filename = fileType + "/" + date + "/" + uuid + ext;
        String url = null;
        //5、通过ossClient来获取文件上传后返回的url
        try {
            ossClient.putObject(BUCKETNAME, filename, new ByteArrayInputStream(multipartFile.getBytes()));
            url = SUFFER_URL + filename;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            //释放资源
            ossClient.shutdown();
        }
        return url;
    }

    /*基于OSS实现的文件删除
     * 文件url
     * */
    public void deleteFile(String url) {
        //1、获取OSS连接
        OSS ossClient = this.getOSSClient();
        //2、删除文件
        try {
            ossClient.deleteObject(BUCKETNAME, url);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //释放资源
            ossClient.shutdown();
        }
    }


    /*基于OSS实现的文件下载*/
   /* public void downnloadFile(String url) {
        //1、获取OSS连接
        OSS ossClient = this.getOSSClient();
        //2、下载文件
        try {
            ossClient.getObject(new GetObjectRequest(BUCKETNAME, url), new File("D:\\localpath\\examplefile.txt"));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //释放资源
            ossClient.shutdown();
        }
    }*/
}
