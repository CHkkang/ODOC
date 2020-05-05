/*
 * package cap.stone.design.controller;
 * 
 * 
 * @RequestMapping(value="/common/loadMov.do", method = RequestMethod.GET)
 * public class ModelAndViewController loadMov(@RequestParam("arg1") String
 * fileNm, HttpServletRequest request, HttpServletResponse response, Model
 * model) throws Exception {
 * 
 * ModelAndView mv = new ModelAndView();
 * 
 * String path = CommonUtils.concatStringArray( CommConstants.GC_PATH_SEPARATOR,
 * FILE_BASE_FILE_PATH, CommConstants.GC_EDITOR_MOV_PATH); path =
 * path.replaceAll("\\\\", "/"); path = path.replaceAll("//", "/");
 * 
 * String fullPath = "";
 * 
 * //업로드 경로 구분자 중복 제거 if(!StringUtils.isEmpty(fileNm)) { fileNm =
 * fileNm.replaceAll("\\\\", "/"); fileNm = fileNm.replaceAll("//", "/"); }
 * 
 * if ( fileNm.indexOf(path) > -1 ) { // 이전에 등록된 파일들은 경로가 포함되어 있음. fullPath =
 * fileNm; } else { fullPath = path + fileNm; }
 * 
 * String fileName = StringUtils.getFilename(fullPath); File file = new
 * File(fullPath);
 * 
 * FileUtils fileUtils = new FileUtils(); fileName =
 * fileUtils.getFileName(fileName, request);
 * 
 * if(StringUtils.isEmpty(fileName)) { // 엑박 대신 임시 이미지(그냥 흰색) fullPath =
 * FILE_WRONG_IMG_PATH; fileName = StringUtils.getFilename(fullPath); }
 * 
 * if(!StringUtils.isEmpty(fileName)) { model.addAttribute("movieFile",
 * fullPath); mv.setViewName("streamView"); // StreamView 실행
 * 
 * } return mv; }
 */