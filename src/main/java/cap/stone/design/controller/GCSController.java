package cap.stone.design.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Controller;

import com.google.api.gax.paging.Page;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.storage.Blob;
import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.common.collect.Lists;

@Controller
public class GCSController {
	private static String jsonPath = "detectingvideo-2ce7cd962c44.json";
	   public static void main(String[] args) throws IOException {
	      authExplicit(jsonPath);
	      downloadMp4(jsonPath);
	      System.out.println("Á¾·á");
	   }

	   static void authExplicit(String jsonPath) throws IOException {
	      // You can specify a credential file by providing a path to GoogleCredentials.
	      // Otherwise credentials are read from the GOOGLE_APPLICATION_CREDENTIALS
	      // environment variable.
	      GoogleCredentials credentials = GoogleCredentials.fromStream(new FileInputStream(jsonPath))
	            .createScoped(Lists.newArrayList("https://www.googleapis.com/auth/cloud-platform"));
	      Storage storage = StorageOptions.newBuilder().setCredentials(credentials).build().getService();

	      System.out.println("Buckets:");
	      Page<Bucket> buckets = storage.list();
	      for (Bucket bucket : buckets.iterateAll()) {
	         System.out.println(bucket.toString());
	      }
	   }

	   static void downloadMp4(String jsonPath) throws FileNotFoundException, IOException {
	      // The name of the bucket to access
	      String bucketName = "first_penguin1";

	      // The name of the remote file to download
	      String srcFilename = "test.mp4";

	      // The path to which the file should be downloaded
	      Path destFilePath = Paths.get("c://mp4//test.mp4");

	      // Instantiate a Google Cloud Storage client
	      GoogleCredentials credentials = GoogleCredentials.fromStream(new FileInputStream(jsonPath))
	            .createScoped(Lists.newArrayList("https://www.googleapis.com/auth/cloud-platform"));
	      Storage storage = StorageOptions.newBuilder().setCredentials(credentials).build().getService();
	      // Get specific file from specified bucket
	      Blob blob = storage.get(BlobId.of(bucketName, srcFilename));

	      // Download file to specified path
	      blob.downloadTo(destFilePath);
	   }
}