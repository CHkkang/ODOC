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
 * //���ε� ��� ������ �ߺ� ���� if(!StringUtils.isEmpty(fileNm)) { fileNm =
 * fileNm.replaceAll("\\\\", "/"); fileNm = fileNm.replaceAll("//", "/"); }
 * 
 * if ( fileNm.indexOf(path) > -1 ) { // ������ ��ϵ� ���ϵ��� ��ΰ� ���ԵǾ� ����. fullPath =
 * fileNm; } else { fullPath = path + fileNm; }
 * 
 * String fileName = StringUtils.getFilename(fullPath); File file = new
 * File(fullPath);
 * 
 * FileUtils fileUtils = new FileUtils(); fileName =
 * fileUtils.getFileName(fileName, request);
 * 
 * if(StringUtils.isEmpty(fileName)) { // ���� ��� �ӽ� �̹���(�׳� ���) fullPath =
 * FILE_WRONG_IMG_PATH; fileName = StringUtils.getFilename(fullPath); }
 * 
 * if(!StringUtils.isEmpty(fileName)) { model.addAttribute("movieFile",
 * fullPath); mv.setViewName("streamView"); // StreamView ����
 * 
 * } return mv; }
 */