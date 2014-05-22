package com.anshul;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.blobstore.FileInfo;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

@SuppressWarnings("serial")
public class UploadServlet extends HttpServlet {
//    private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String blob_key_string = req.getParameter("blob_key");
        System.out.println("BLOBKEY: " + blob_key_string);
        if (blob_key_string == null) {
            resp.sendRedirect("/music.jsp");
            System.out.println("No blobkey given, redirecting to upload page.");
        }
        else {
            BlobKey blob_key = new BlobKey(blob_key_string);
            BlobstoreServiceFactory.getBlobstoreService().serve(blob_key, resp);
            System.out.println("Blobkey given, sending file.");
        }
    }//end doGet


    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        try {
            Map<String, List<BlobKey>> files_sent = BlobstoreServiceFactory.getBlobstoreService().getUploads(req);
            List<BlobKey> file_keys = files_sent.get(req.getSession().getAttribute("userId").toString());
            
            Map<String, List<FileInfo>> fileInfo = BlobstoreServiceFactory.getBlobstoreService().getFileInfos(req);
            String filename= fileInfo.get(req.getSession().getAttribute("userId").toString()).get(0).getFilename();
            String blobkey=files_sent.get(req.getSession().getAttribute("userId").toString()).get(0).getKeyString();
            
            Entity file = new Entity("Uploads");
		    file.setProperty("userId", req.getSession().getAttribute("userId").toString());
		    file.setProperty("blobKey", blobkey);
		    file.setProperty("filename", filename);
		    
		    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		    datastore.put(file);
		    
		    resp.sendRedirect("/music.jsp");
		    
//		    req.getSession().setAttribute("addedsong", "{ title:\"" + filename +"\", mp3: \"/serve?blob-key=" + blobkey + "\"}");
		    
		   // resp.setContentType("text/html");
		   // resp.setCharacterEncoding("UTF-8");
		   // resp.getWriter().write("{ title:\"" + filename +"\", mp3: \"/serve?blob-key=" + blobkey + "\"}");
			
//            req.getSession().setAttribute("playlist", file_keys);
		    //resp.getWriter().write(blobkey);
            
//            resp.sendRedirect("/upload?blob_key=" + file_keys.get(0).getKeyString());
//            System.out.println("Document successfully POSTED, redirect to doGET");
        }
        catch (Exception e) {
            resp.sendRedirect("/music.jsp");
            System.out.println("Document failed to POST, redirecting back to upload.");
        }
    }//end doPost
}