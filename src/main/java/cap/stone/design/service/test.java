package cap.stone.design.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.BasicFileAttributes;
import java.nio.file.attribute.DosFileAttributes;
import java.nio.file.attribute.FileTime;
import java.nio.file.attribute.PosixFileAttributes;
import java.time.Instant;
import java.util.Map;

public class test {

	public static void main(String[] args) throws IOException {
		Path path = Paths.get("C:\\dev\\fpSpringMVC\\src\\main\\webapp\\resources\\video\\aaCCTV1.mp4.mp4");

		/*
		 * System.out.println("-- creationTime before --"); Map<String, Object>
		 * attributes = Files.readAttributes(path, "creationTime");
		 * System.out.println(attributes);
		 * 
		 * Files.setAttribute(path, "creationTime", FileTime.from(Instant.now()
		 * .minusSeconds(10000 * 24 * 60 * 60)));
		 * 
		 * System.out.println("-- creationTime after --"); attributes =
		 * Files.readAttributes(path, "creationTime"); System.out.println(attributes);
		 */

		try {
			BasicFileAttributes attributes = Files.readAttributes(path, BasicFileAttributes.class);
			printBasicAttributes(attributes);
		} catch (Exception e) {
		}
		try {
			// it will throw not supported exception on windows
			PosixFileAttributes attributes = Files.readAttributes(path, PosixFileAttributes.class);
			// printPosixFileAttributes(attributes)

		} catch (Exception e) {
		}
		try {
			DosFileAttributes attributes = Files.readAttributes(path, DosFileAttributes.class);
			printDosAttributes(attributes);
		} catch (Exception e) {
		}
	}

	private static void printBasicAttributes(BasicFileAttributes attributes) throws Exception {
		System.out.println("-- Some BasicFileAttributes --");
		System.out.printf("creationTime     = %s%n", attributes.creationTime());
		System.out.printf("lastAccessTime   = %s%n", attributes.lastAccessTime());
		System.out.printf("lastModifiedTime = %s%n", attributes.lastModifiedTime());
		System.out.printf("size             = %s%n", attributes.size());
		System.out.printf("directory        = %s%n", attributes.isDirectory());

	}

	private static void printDosAttributes(DosFileAttributes attributes) {
		System.out.println("-- Some DosFileAttributes --");
		System.out.printf("archive  = %s%n", attributes.isArchive());
		System.out.printf("readOnly = %s%n", attributes.isReadOnly());
		System.out.printf("hidden   = %s%n", attributes.isHidden());
	}
}
