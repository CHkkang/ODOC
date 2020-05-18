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

import org.springframework.stereotype.Service;

import com.coremedia.iso.boxes.Container;
import com.googlecode.mp4parser.authoring.Movie;
import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.authoring.builder.DefaultMp4Builder;
import com.googlecode.mp4parser.authoring.container.mp4.MovieCreator;
import com.googlecode.mp4parser.authoring.tracks.AppendTrack;

public class MergeVideoService {
	public static void main(String []args) throws Exception {
		int videoNum = 1;
		String directoryPath =  "C:\\dev\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\fpSpringMVC\\resource\\video\\";
		mergeVideo(directoryPath, "aaCCTV_", videoNum);
	}
	public static void mergeVideo(String directoryPath, String fileName, int fileNum) throws Exception {
		// 영상 길이가 너무 짧으면 안되는 오류가 있음
		String f1 = directoryPath + fileName + Integer.toString(fileNum) + ".mp4";
		String f2 = directoryPath + fileName + Integer.toString(++fileNum) + ".mp4";
		Movie[] inMovies;

		inMovies = new Movie[] { MovieCreator.build(f1), MovieCreator.build(f2)};
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

		RandomAccessFile ram = new RandomAccessFile(
				String.format(directoryPath + fileName + Integer.toString(++fileNum) + ".mp4"), "rw");
		FileChannel fc = ram.getChannel();
		out.writeContainer(fc);
		
		ram.close();
		fc.close();
		filesBeforeMergeDelete(f1);
	}

	private static void filesBeforeMergeDelete(String filePath) throws IOException {
		File deletefile = new File(filePath);
		System.out.println("실행권한 : "+ deletefile.canExecute());
		System.out.println("읽기권한 : "+ deletefile.canRead());
		System.out.println("쓰기권한 : "+ deletefile.canWrite());
		
		if (deletefile.exists()) {
			System.gc();
			System.out.println("삭제 여부 : "+deletefile.delete());
			System.out.println("delete Success");
		} else {
			System.out.println("delete fail");
		}
	}

}
