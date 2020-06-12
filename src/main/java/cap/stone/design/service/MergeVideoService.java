package cap.stone.design.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.coremedia.iso.boxes.Container;
import com.googlecode.mp4parser.BasicContainer;
import com.googlecode.mp4parser.FileDataSourceImpl;
import com.googlecode.mp4parser.authoring.Movie;
import com.googlecode.mp4parser.authoring.Track;
import com.googlecode.mp4parser.authoring.builder.DefaultMp4Builder;
import com.googlecode.mp4parser.authoring.container.mp4.MovieCreator;
import com.googlecode.mp4parser.authoring.tracks.AppendTrack;
import com.googlecode.mp4parser.authoring.tracks.h264.H264TrackImpl;

@Service
public class MergeVideoService {
	public void mergeVideo(String path, String fileName, int fileNum) throws Exception {
		// 영상 길이가 너무 짧으면 안되는 오류가 있음
		// 덮어 씌우면 오류나네 시발
		String f1;
		String f2;
		String f3;
		String directoryPath = path;
		if (fileNum == 2) {
			f1 = directoryPath + fileName + Integer.toString(fileNum - 1) + ".mp4";
			f2 = directoryPath + fileName + Integer.toString(fileNum) + ".mp4";
			f3 = directoryPath + "new" + fileName + Integer.toString(fileNum) + ".mp4";
		} else {
			f1 = directoryPath + "new" + fileName + Integer.toString(fileNum - 1) + ".mp4";
			f2 = directoryPath + fileName + Integer.toString(fileNum) + ".mp4";
			f3 = directoryPath + "new" + fileName + Integer.toString(fileNum) + ".mp4";
		}
		Movie[] inMovies = new Movie[2];
		inMovies = new Movie[] { MovieCreator.build(f1), MovieCreator.build(f2) };
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

		BasicContainer out = (BasicContainer) new DefaultMp4Builder().build(result);

		@SuppressWarnings("resource")
		FileChannel fc = new RandomAccessFile(String.format(f3), "rw").getChannel();

		out.writeContainer(fc);
		
		System.out.println("file1 : " + f1);
		System.out.println("file2 : " + f2);
		System.out.println("Mergefile : " + f3);

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