package cap.stone.design.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import com.coremedia.iso.boxes.Container;
import com.googlecode.mp4parser.authoring.Movie;
import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.authoring.builder.DefaultMp4Builder;
import com.googlecode.mp4parser.authoring.container.mp4.MovieCreator;
import com.googlecode.mp4parser.authoring.tracks.AppendTrack;

@Service
public class MergeVideoService {
	public void mergeVideo(HttpServletRequest request, String fileName, int fileNum) throws Exception {
		// 영상 길이가 너무 짧으면 안되는 오류가 있음
		String directoryPath = request.getServletContext().getRealPath("resources/video/");
		String f1 = directoryPath + fileName + "_" + Integer.toString(fileNum-1) + ".mp4";
		String f2 = directoryPath + fileName + "_" + Integer.toString(fileNum) + ".mp4";
		Movie[] inMovies;
		inMovies = new Movie[] { MovieCreator.build(f1), MovieCreator.build(f2) };
		System.out.println(f1);
		System.out.println(f2);
		List<Track> videoTracks = new LinkedList<Track>();
		List<Track> audioTracks = new LinkedList<Track>();

		for (Movie m : inMovies) {
			for (Track t : m.getTracks()) {
				if (t.getHandler().equals("soun")) {
					audioTracks.add(t);
				}
				if (t.getHandler().equals("vide")) {
					videoTracks.add(t);
				}
			}
		}

		Movie result = new Movie();
		if (videoTracks.size() > 0) {
			result.addTrack(new AppendTrack(videoTracks.toArray(new Track[videoTracks.size()])));
		}

		if (audioTracks.size() > 0) {
			result.addTrack(new AppendTrack(audioTracks.toArray(new Track[audioTracks.size()])));
		}

		Container out = new DefaultMp4Builder().build(result);
		System.out.println("new file : " + directoryPath + fileName + "_" + Integer.toString(fileNum) + ".mp4");
		RandomAccessFile ram = new RandomAccessFile(
				String.format(directoryPath + fileName + "_" + Integer.toString(fileNum) + ".mp4"), "rw");
		FileChannel fc = ram.getChannel();
		out.writeContainer(fc);

		ram.close();
		fc.close();
		System.out.println("deleteFile : " + f1);
		filesBeforeMergeDelete(f1);
		
	}

	public void filesBeforeMergeDelete(String filePath) throws IOException {
		File deletefile = new File(filePath);
		boolean delYn = true;
		if (deletefile.exists()) {
			delYn = deletefile.delete();
			if (delYn) {
				System.out.println("File Delete Success"); // 성공
			} else {
				System.out.println("File Delete Fail"); // 실패
			}
		} else {

			System.out.println("File Not Found"); // 미존재

		}

	}

}
