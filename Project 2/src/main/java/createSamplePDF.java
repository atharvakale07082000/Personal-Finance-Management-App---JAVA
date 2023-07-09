import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class createSamplePDF {
	public createSamplePDF(String header[], String body[][]) throws Exception{
	    Document documento = new Document();
	    //Create new File
	    File file = new File("C:/newFileName.pdf");
	    file.createNewFile();
	    FileOutputStream fop = new FileOutputStream(file);
	    PdfWriter.getInstance(documento, fop);
	    documento.open(); 
	    //Fonts
	    Font fontHeader = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
	    Font fontBody = new Font(Font.FontFamily.COURIER, 12, Font.NORMAL);
	    //Table for header
	    PdfPTable cabetabla = new PdfPTable(header.length);
	    for (int j = 0; j < header.length; j++) {
	        Phrase frase = new Phrase(header[j], fontHeader);
	        PdfPCell cell = new PdfPCell(frase);
	        cell.setBackgroundColor(new BaseColor(Color.lightGray.getRGB()));
	        cabetabla.addCell(cell);
	    }
	    documento.add(cabetabla);
	    //Tabla for body
	    PdfPTable tabla = new PdfPTable(header.length);
	    for (int i = 0; i < body.length; i++) {
	        for (int j = 0; j < body[i].length; j++) {
	            tabla.addCell(new Phrase(body[i][j], fontBody));
	        }
	    }
	    documento.add(tabla);
	    documento.close();
	    fop.flush();
	    fop.close();
	}
}
