<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="mdmjava.*"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<title>MDM PROGRESS</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- JavaScript -->
<script src="js/formverify.js"></script>

</head>
<body>


	<%


				//Check that we have a file upload request
				boolean isMultipart = ServletFileUpload.isMultipartContent(request);
				if (isMultipart) {
					String saveDirectory = application.getRealPath(Common.UPLOAD_FILE_ANDROID_MANAGE_CONTENT_PATH);

					// Create a factory for disk-based file items
					FileItemFactory factory = new DiskFileItemFactory();
					// Create a new file upload handler
					ServletFileUpload upload = new ServletFileUpload(factory);
					// Parse the request
					@SuppressWarnings("unchecked")
					List<FileItem> items = upload.parseRequest(request);

					// Process the uploaded items
					Iterator<FileItem> iter = items.iterator();
					HashMap<String, String> mapData = new HashMap<String, String>();
					FileItem itemUploadFile = null;

					while (iter.hasNext()) {
						FileItem item = (FileItem) iter.next();
						if (item.isFormField()) {
							String strName = item.getFieldName();
							String strValue = item.getString();
							strValue = new String(strValue.getBytes("ISO-8859-1"), "UTF-8");
							mapData.put(strName.trim(), strValue.trim());
						} else {
							itemUploadFile = item;
						}
					} // while

					long timeNow = System.currentTimeMillis();
					String strContentId = String.valueOf(timeNow);

					if (null != itemUploadFile) {
						// Process a file upload
						String fieldName = itemUploadFile.getFieldName();
						String fileName = itemUploadFile.getName();
						String contentType = itemUploadFile.getContentType();
						//boolean isInMemory = itemUploadFile.isInMemory();
						long sizeInBytes = itemUploadFile.getSize();

						if (fileName != null && !"".equals(fileName) && 0 < sizeInBytes) {
							String strPath = saveDirectory + "/" + mapData.get(Common.USER_ID) + "/"
									+ mapData.get(Common.GROUP_ID);
							String strFileName = null;
							if (contentType.trim().equals("image/png")) {
								strFileName = strContentId + ".png";
							}
							if (contentType.trim().equals("image/jpeg")) {
								strFileName = strContentId + ".jpg";
							}
							if (contentType.trim().equals("image/bmp")) {
								strFileName = strContentId + ".bmp";
							}
							if (null != strFileName) {
								new File(strPath).mkdirs();
								File uploadedFile = new File(strPath, strFileName);
								itemUploadFile.write(uploadedFile);
								mapData.put(Common.APP_ICON,
										Common.UPLOAD_FILE_ANDROID_MANAGE_CONTENT_PATH + "/" + mapData.get(Common.USER_ID)
												+ "/" + mapData.get(Common.GROUP_ID) + "/" + strFileName);
							}
						}
					}
					/*
					for (Object key : mapData.keySet()) {
						out.println(key + " : " + mapData.get(key) + "<br/>");
					}
					*/
					final String strUserId = mapData.get(Common.USER_ID);
					final String strGroupId = mapData.get(Common.GROUP_ID);

					Mdm mdm = new Mdm();

					if (!mdm.conTypeDB(0)) {
						response.sendRedirect("error.html"); //insert error page 
						return;
					}
					mapData.put(Common.CONTENT_ID, strContentId);

					mdm.closeTypeDB(0);
					mdm = null;
	%>





	<form action="group_management.jsp" method="post" name="FormHome"
		id="FormHome">
		<input name="<%=Common.GROUP_ID%>" type="hidden"
			value="<%=strGroupId%>" />
	</form>

	<script>
		formSubmit('FormHome');
	</script>

	<%
	    return;
	    }
	    response.sendRedirect("index.jsp");
	%>
</body>
</html>
