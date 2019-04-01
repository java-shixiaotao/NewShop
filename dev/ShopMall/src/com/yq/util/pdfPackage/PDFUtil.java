package com.yq.util.pdfPackage;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileOutputStream;
import java.util.List;

public class PDFUtil {

    public static void createPDF(List<String> itemLst,String heChengPDFPath,String fileName){
        try {
            Document document = new Document();
            PdfPTable table = new PdfPTable(1);
            PdfWriter.getInstance(document, new FileOutputStream(heChengPDFPath+ "\\"+fileName+".pdf"));
            document.open();
            for (int i = 0; i < itemLst.size(); i++) {
                Image image = Image.getInstance(itemLst.get(i));
                PdfPCell pdfPCell = new PdfPCell(image, true);
                pdfPCell.setPadding(15);
                pdfPCell.setBorder(PdfPCell.NO_BORDER);
                table.addCell(pdfPCell);
                if(i==itemLst.size()-1 && i%2==0){
                    PdfPCell pdfPCell1 = new PdfPCell();
                    pdfPCell1.setBorder(PdfPCell.NO_BORDER);
                    table.addCell(pdfPCell1);
                }
            }
            document.add(table);
            document.close();
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
